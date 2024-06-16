import jwt from "jsonwebtoken";

export const getToken = (userId:string):string => {
    const secret_key = process.env.SECRET_KEY!
    return jwt.sign({id:userId},secret_key);
    
}
