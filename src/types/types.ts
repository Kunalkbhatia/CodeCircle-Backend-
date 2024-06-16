import { NextFunction, Request, Response } from "express";
import { UserResponseType } from "./resTypes.js";

export interface UserType {
  id:string
  firstName: string;
  lastName?: string;
  email: string;
  password: string;
  age: number;
  collage: string;
  graduationYear: number;
  title:string,
  bio:string
  company?: string;
  experience?: number;
  techStack?: string;
  socialHandles?: socialHandles;
  posts?: GeneralPost[];
  queryPosts?: QueryPost[];
}

export interface socialHandles{
  id:string
  userId: string
  twitter?: string
  instagram?: string
  linkedIn?: string
  github?: string
  other?: string
  portfolio?:string
}

export interface GeneralPost{
  id:string
  userId: string
  description:string
  likes?:number
  comments: Comment[]
}
export interface QueryPost{
  id:string
  userId: string
  title: string
  description:string
  likes?:number
  solved?: boolean
  comments: Comment[]
}
export interface comment{
  id:string
  generalPostId?: string
  queryPostId?: string
  likes?:number
}


export interface UserLoginType{
  email: string
  password: string
}

export type controllerType = (req: Request, res: Response, next: NextFunction) => Promise<void>

export interface JwtPayload {
  id: string;
}


export type UserRequest = UserType & Request


