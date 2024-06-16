import express from "express";
import user from "./routers/userRoutes.js"
import { errorMiddleware } from "./middlewares/errorMiddleware.js";
import cookieParser from 'cookie-parser';
import { PrismaClient } from "@prisma/client";

import { main } from "./utilities/script.js";
export const prisma = new PrismaClient();
const app = express();
app.use(express.json())
app.use(cookieParser());


app.use("/api/v1/user",user)



app.use(errorMiddleware)
// app.use(main)




export default app;