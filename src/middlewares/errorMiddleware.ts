import { NextFunction, Request, Response } from "express";
import ErrorHandler from "../utilities/errorHandler.js";
import { PrismaClientKnownRequestError } from "@prisma/client/runtime/library";

export const errorMiddleware = (error:ErrorHandler,req:Request,res:Response,next:NextFunction) => {
    let message = error.message || "Internal Server Error";
    const statusCode = error.statusCode || 500;
    const errorCode = error.code || "UNDEFINED"
    if(errorCode === "P2025"){
        message = "Operation Failed";
    }

    return res.status(statusCode).json({
        success:false,
        message
    })
}

