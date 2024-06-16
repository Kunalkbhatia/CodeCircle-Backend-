import express from "express";
import user from "./routers/userRoutes.js"
import post from "./routers/postRoutes.js"
import { errorMiddleware } from "./middlewares/errorMiddleware.js";
import cookieParser from 'cookie-parser';
import { main } from "./utilities/script.js";

const app = express();
app.use(express.json())
app.use(cookieParser());


app.use("/api/v1/user",user)
app.use("/api/v1/post",post)



app.use(errorMiddleware)
// app.use(main)




export default app;