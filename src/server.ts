import app from "./app.js";
import { configDotenv }  from "dotenv";

configDotenv({path:"server/.env"})


const port = process.env.PORT || 3000;


app.listen(port, ()=> {
    console.log(`server is listening on port: ${port}`);
})
