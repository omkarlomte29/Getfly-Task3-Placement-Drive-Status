import express from "express";
import cors from "cors"
import bodyParser from 'body-parser';
import forumRoute from "./routes/forum.js"
import dotenv from "dotenv"
import { connection } from "./config/dbConfig.js";

import AnnouncementRoute from "./routes/announcemet.js"

import drivestatusRoute from "./routes/DriveStatus.js"
const app =express()


const port = 8081;

app.use(cors())
app.use(express.json());
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));


app.use("/api/admin/forum",forumRoute);
app.use("/api/admin/announcement",AnnouncementRoute);
app.use("/drivestatus",drivestatusRoute)
app.listen(port, () => {
    console.log("Server is Running on PORT :", port);
  });
  