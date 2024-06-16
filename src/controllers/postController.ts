import { NextFunction, Request, Response } from "express";
import { catchAsyncError } from "../middlewares/catchAsyncError.js";
import { GeneralPost } from "@prisma/client";
import prisma from "../lib/d.js";
import ErrorHandler from "../utilities/errorHandler.js";



export const createGeneralPost = catchAsyncError(async(req:Request<{},{},GeneralPost>,res:Response,next:NextFunction) => {
    const {description} = req.body;
    if(!description)return next(new ErrorHandler("Please provide the description",400));
    const generalPost = await prisma.generalPost.create({
        data:{
            description,
            userId:req.user?.id!
        }
    });
    res.status(200).json({
        success:true,
        post:generalPost
    })
})


export const updateGeneralPost = catchAsyncError(async(req:Request,res:Response,next:NextFunction) => {
    const id = req.params.id;
    const {description} = req.body;
    const updatedPost = await prisma.generalPost.update({
        where:{
            id:id,
            userId:req.user?.id
        },
        data:{
            description
        }
    });
    
    res.status(200).json({
        success:true,
        post:updatedPost
    })
})


export const deleteGeneralPost = catchAsyncError(async(req:Request,res:Response,next:NextFunction)=> {
    const id = req.params.id
    await prisma.generalPost.delete({
        where:{
            id:id,
            userId:req.user?.id
        }
    })

    res.status(200).json({
        success:true
    })
});



export const getUserGeneralPosts = catchAsyncError(async(req:Request,res:Response,next:NextFunction)=> {
    const posts = await prisma.generalPost.findMany({
        where:{
            userId:req.user?.id
        },
        include:{
            comments:{
                select:{
                    userId:true,
                    likes:true,
                    user:{
                        select:{
                            firstName:true
                        }
                    }
                }
            }
        }
    })

    res.status(200).json({
        success:true,
        posts
    })
});