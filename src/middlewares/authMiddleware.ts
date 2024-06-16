import { NextFunction, Request, Response } from "express";
import { catchAsyncError } from "./catchAsyncError.js";
import jwt from "jsonwebtoken";
import prisma from "../lib/d.js";
import { JwtPayload, UserRequest, UserType } from "../types/types.js";
import ErrorHandler from "../utilities/errorHandler.js";


export const authMiddleware = catchAsyncError(async(req:Request,res:Response,next:NextFunction) => {
    const token:string = req.cookies.token
    if(!token)return next(new ErrorHandler("Login to access the resources",401));
    const decodedData = jwt.verify(token,process.env.SECRET_KEY!) as JwtPayload;
    const user = await prisma.user.findUnique({
        where:{
            id:decodedData.id
        }
    });
    if(!user)return next(new ErrorHandler("Please register to access the resources",401));
    if(user)req.user = user;
    next();
})