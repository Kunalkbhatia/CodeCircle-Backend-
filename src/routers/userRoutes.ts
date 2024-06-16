import express, { Router } from "express";
import { deleteUser, getUser, loginUser, logout, registerUser, updateUser } from "../controllers/userControllers.js";
import { authMiddleware } from "../middlewares/authMiddleware.js";
const router:Router = express.Router();

router.route("/register").post(registerUser);
router.route("/login").post(loginUser);
router.route("/logout").post(logout);
router.route("/delete").delete(deleteUser)
router.route("/:id").get(authMiddleware,getUser);
router.route("/update/:id").put(authMiddleware,updateUser)


export default router