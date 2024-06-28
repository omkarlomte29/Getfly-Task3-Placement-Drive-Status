import { connection as db } from "../config/dbConfig.js";

export const getallanouncement = (req, res) => {
    const query = `select a.an_id,c.name,c.id a.announcement,a.createdAt from announcement as a inner join job_postings as j on a.post_id=j.id inner join companies as c on j.id =c.id`;
    db.query(query, (error, results) => {
      if (error) {
        return res.status(500).json({ error: error.message });
      }
      res.json(results);
    });
  };


  export const insertanouncement = (req, res) => {

    const query = `INSERT INTO announcement (post_id, announcement,createdAt)VALUES ( ?, ?, ?)`;
   
   
    const post =req.body.postid;
    const msg =req.body.msg;
    const time = new Date()

    const values =[ post,msg,time];

    db.query(query, values, (error, results) => {
      if (error) {
        return res.status(500).json({ error: error.message });
      }
      res.status(200).json("annoucement inserted");
    });
  };


  export const updateanouncement = (req, res) => {
    
    const query = `UPDATE  announcement SET post_id = ?, announcement = ? ,createdAt = ? where an_id= ?`;
   
    const id =req.params.id;
    const post =req.body.postid;
    const msg =req.body.msg;
    const time = new Date()

    const values =[ post,msg,time,id];

    db.query(query, values, (error, results) => {
      if (error) {
        return res.status(500).json({ error: error.message });
      }
      res.status(200).json("annoucement updated");
    });
  };


  
  export const deleteanouncement = (req, res) => {
    
    const query = `delete  announcement  where an_id= ?`;
   
    const id =req.params.id;


    db.query(query, id, (error, results) => {
      if (error) {
        return res.status(500).json({ error: error.message });
      }
      res.status(200).json("annoucement deleted");
    });
  };


  export const compaanouncement = (req, res) => {
    
    const query = `select j.id , j.companyId ,c.name ,j.job_description from job_postings as j inner join companies as c on j.id=c.id`;

    db.query(query, id, (error, results) => {
      if (error) {
        return res.status(500).json({ error: error.message });
      }
      res.status(200).json("annoucement deleted");
    });
  };

  