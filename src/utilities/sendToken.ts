import jwt from "jsonwebtoken";
import { JwtPayload, UserType } from "../types/types.js";
import { Response } from "express";
import { exclude } from "./excludeField.js";
import { UserResponseType } from "../types/resTypes.js";

export const sendToken = (user:UserResponseType,statusCode:number,res:Response) => {
    const payLoad: JwtPayload = {
        id:user.id
    }
    const token = jwt.sign(payLoad,process.env.SECRET_KEY!);
    const userPasswordRemoved = exclude(user,['password']);
    res.status(statusCode).cookie("token",token).json({
        success:true,
        user:userPasswordRemoved,
        token
    });

    
}


