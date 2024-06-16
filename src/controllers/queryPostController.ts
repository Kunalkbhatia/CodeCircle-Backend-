import { NextFunction, Request, Response } from "express";
import { catchAsyncError } from "../middlewares/catchAsyncError.js";
import { QueryPost } from "@prisma/client";
import prisma from "../lib/d.js";
import ErrorHandler from "../utilities/errorHandler.js";



// create a fresh post 
export const createQueryPost = catchAsyncError(async(req:Request<{},{},QueryPost>,res:Response,next:NextFunction) => {
    const {description,title} = req.body;
    if(!description || !title)return next(new ErrorHandler("Please provide the description and title",400));
    const queryPost = await prisma.queryPost.create({
        data:{
            description,
            title,
            userId:req.user?.id!
        }
    });
    res.status(200).json({
        success:true,
        queryPost
    })
})

// update the post with postId: id of the user userId:id
export const updateQueryPost = catchAsyncError(async(req:Request,res:Response,next:NextFunction) => {
    const id = req.params.id;
    const {description,title,solved} = req.body;
    const updatedPost = await prisma.queryPost.update({
        where:{
            id:id,
            userId:req.user?.id
        },
        data:{
            description,
            title,
            solved
        }
    });
    
    res.status(200).json({
        success:true,
        post:updatedPost
    })
})


// delete a post with postId : id 
export const deleteQueryPost = catchAsyncError(async(req:Request,res:Response,next:NextFunction)=> {
    const id = req.params.id
    await prisma.queryPost.delete({
        where:{
            id:id,
            userId:req.user?.id
        }
    })

    res.status(200).json({
        success:true
    })
});


//  get all the post of a specific user
export const getUserQueryPosts = catchAsyncError(async(req:Request,res:Response,next:NextFunction)=> {
    const posts = await prisma.queryPost.findMany({
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