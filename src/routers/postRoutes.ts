import express from "express";
import { authMiddleware } from "../middlewares/authMiddleware.js";
import { createGeneralPost, deleteGeneralPost, getUserGeneralPosts, updateGeneralPost } from "../controllers/postController.js";
import { createQueryPost, deleteQueryPost, getUserQueryPosts, updateQueryPost } from "../controllers/queryPostController.js";


const router = express.Router();

router.route("/create/general").post(authMiddleware,createGeneralPost);
router.route("/general").get(authMiddleware,getUserGeneralPosts);
router.route("/update/general/:id").put(authMiddleware,updateGeneralPost);
router.route("/delete/general/:id").delete(authMiddleware,deleteGeneralPost);



router.route("/create/query").post(authMiddleware,createQueryPost);
router.route("/query").get(authMiddleware,getUserQueryPosts);
router.route("/update/query/:id").put(authMiddleware,updateQueryPost);
router.route("/delete/query/:id").delete(authMiddleware,deleteQueryPost);




export default router