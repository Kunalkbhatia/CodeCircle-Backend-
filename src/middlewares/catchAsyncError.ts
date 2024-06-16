import { NextFunction, Request, Response } from "express";
import { controllerType } from "../types/types.js";

export const catchAsyncError = ((theFunc:controllerType) => {
    return (req:Request,res:Response,next:NextFunction) => {
        return Promise.resolve(theFunc(req,res,next)).catch(next);
    }
})