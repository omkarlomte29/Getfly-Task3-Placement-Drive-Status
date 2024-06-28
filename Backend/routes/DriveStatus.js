import express, { Router } from "express";
import { update,deleteplaced,driveresultplaced,driveresultround2,driveresultround3,driveresultround4,selectedcompanylist,updateplaced, companyvisited, companyname, companyacyear, selecteddrive, driveround2ids,driveround3ids,driveround4ids, driveplacedids } from "../controller/Drivestatus.js";

const router = express.Router();



router.get("/getvisited",companyvisited);
router.get("/getcompany",companyname);
router.get("/getyear",companyacyear);
router.get("/getselectedcomp",selectedcompanylist);


// router.get("/getstudents/:id",selecteddrive);
router.get("/getstudents/:companyId",selecteddrive);
router.get("/getround2students/:companyId",driveresultround2);
router.get("/getround3students/:companyId",driveresultround3);
router.get("/getround4students/:companyId",driveresultround4);
router.get("/getplacedstudents/:companyId",driveresultplaced);
router.get("/getround2ids/:companyId", driveround2ids);
router.get("/getround3ids/:companyId",driveround3ids);
router.get("/getround4ids/:companyId",driveround4ids);
router.get("/getplacedids/:companyId",driveplacedids);

router.put("/updatetooneround/:id",update);
router.put("/addtoplaced/:id",updateplaced);
router.put("/deletefromplaced/:id",deleteplaced);

export default router;