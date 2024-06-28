import express, { Router } from "express";
const router = express.Router();
import { getallanouncement,updateanouncement,deleteanouncement,insertanouncement,compaanouncement } from "../controller/annoucements.js";

router.get("/",getallanouncement);
router.get("/add/:id",insertanouncement);
router.get("/delete/:id",deleteanouncement);
router.get("/update/:id",updateanouncement);
router.get("/company",compaanouncement)


export default router;