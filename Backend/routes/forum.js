import express, { Router } from "express";
import { getallforum, getallforumuser, updateforumuser } from "../controller/forum.js";
const router = express.Router();




router.get("/",getallforum);
router.post("/:postid",getallforumuser);
router.put("/:postid",updateforumuser);

export default router;