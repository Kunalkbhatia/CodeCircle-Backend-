import { prisma } from "../app.js";
import { NextFunction, Request, Response } from "express";
import { catchAsyncError } from "../middlewares/catchAsyncError.js";
import { UserLoginType, UserType } from "../types/types.js";
import ErrorHandler from "../utilities/errorHandler.js";
import { sendToken } from "../utilities/sendToken.js";
import { exclude } from "../utilities/excludeField.js";



export const registerUser = catchAsyncError(
  async (req: Request<{}, {}, UserType>, res: Response, next: NextFunction) => {
    const {firstName,lastName,email,password,age,collage,title,bio,
      graduationYear,company,experience,techStack,socialHandles,} = req.body;

    if (!email || !password || !firstName || !age || !collage || !graduationYear) {
      next(new ErrorHandler("Please fill the mandatory the Details", 400));
    }
    const existedUser = await prisma.user.findUnique({
      where: {
        email,
      },
    });
    if (existedUser) {
      next(new ErrorHandler("User with same Email already existed", 400));
    }

    const user = await prisma.user.create({
      data: {
        firstName,
        lastName,
        email,
        password,
        age,
        collage,
        title,
        bio,
        graduationYear,
        company,
        experience,
        techStack,
        socialHandles: { create: socialHandles },
      },
      include:{
        socialHandles:true,
      }

    });
    sendToken(user, 200, res);
  }
);

export const loginUser = catchAsyncError(async (req: Request<{}, {}, UserLoginType>,res: Response,next: NextFunction) => {
    const { email, password } = req.body;
    if (!email || !password) {
      next(new ErrorHandler("Please Enter your credentials", 400));
    }
    const user = await prisma.user.findUnique({
      where: {
        email,
        password,
      },
      include:{
        socialHandles:true,
      }
    });
    if (!user) {
      return next(
        new ErrorHandler("User with given credentials doesn't exist", 401)
      );
    }
    sendToken(user, 200, res);
  }
);

export const getUser = catchAsyncError(
  async (req: Request, res: Response, next: NextFunction) => {
    const user = await prisma.user.findUnique({
      where: {
        id: req.params.id,
      },
      include:{
        socialHandles:true
      }
    });
    if (!user) {
      next(new ErrorHandler("User not found", 404));
    }
    const userPasswordRemoved = exclude(user!, ["password"]);
    res.status(200).json({
      success: true,
      user:userPasswordRemoved,
    });
  }
);


export const deleteUser = catchAsyncError(
  async (req: Request, res: Response, next: NextFunction) => {
    const user = await prisma.user.delete({
      where: {
        id: req.user?.id,
      },
      
    });
    
    res.status(200).json({
      success: true,
    });
  }
);

export const logout = catchAsyncError(
  async (req: Request, res: Response, next: NextFunction) => {
    res.cookie("token", null, {
      expires: new Date(Date.now()),
      httpOnly: true,
    });
    res.status(200).json({
      success: true,
    });
  }
);

export const updateUser = catchAsyncError(
  async (
    req: Request<{}, {}, UserType>,
    res: Response,
    next: NextFunction
  ) => {
    const {
      firstName,
      lastName,
      email,
      password,
      age,
      collage,
      graduationYear,
      title,
      bio,
      company,
      experience,
      techStack,
      socialHandles
    } = req.body;
    const user = await prisma.user.update({
      where: {
        id: req.user?.id,
      },
      data: {
        firstName,
        lastName,
        email,
        password,
        age,
        collage,
        graduationYear,
        title,
        bio,
        company,
        experience,
        techStack,
        socialHandles:{
          update:socialHandles
        }
      },
      include:{
        socialHandles:true,
      }
    });
    const userPasswordRemoved = exclude(user,['password']);
    res.json({ success:true,user:userPasswordRemoved, });
  }
);
