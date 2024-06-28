import asyncHand from "express-async-handler";
import { connection as db } from "../config/dbConfig.js";

export const getallforum = (req, res) => {
    const query = `select j.id, c.name, c.location , j.job_description,j.package_details,j.roles,j.createdAt from companies as c inner join job_postings as j on c.id = j.id`;
    db.query(query, (error, results) => {
      if (error) {
        return res.status(500).json({ error: error.message });
      }
      res.json(results);
    });
  };

  export const getallforumuser = (req, res) => {
    const post =req.params.postid;
    const query = `SELECT  CONCAT(s.first_name, ' ', s.middle_name, ' ', s.last_name) AS full_name ,s.email_id,f.question,f.question_time,f.answer,f.answer_time, f.forum_id FROM student_details as s inner join forum as f on f.forum_id=s.id where f.post_id= ?;`;
    db.query(query,post, (error, results) => {
      if (error) {
        return res.status(500).json({ error: error.message });
      }

      if(results.length==0){
        return res.status(404).json("data not found");
      }
      res.json(results);
    });
  };


  export const updateforumuser = (req, res) => {
    const post =req.params.postid;
    const answer=req.body.answer
    const answer_date = new Date()
    console.log(answer_date)
    const values = [
      answer,answer_date,post
    ];
    const query = `update forum set answer = ? , answer_time = ?  where forum_id = ? `;
    db.query(query,values, (error, results) => {
      if (error) {
        console.log(error)
        return res.status(500).json({ error: error.message });
      }

      if(results.length==0){
        return res.status(404).json("data not found");
      }
      res.json(results);
    });
  };