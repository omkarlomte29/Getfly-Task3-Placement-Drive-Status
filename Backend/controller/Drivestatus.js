import { connection as db } from "../config/dbConfig.js";

// export const driveresult = (req,res)=>{
   
//         const query = `SELECT 
//     CONCAT(s.first_name, " ", s.middle_name, " ", s.last_name) AS full_name,
//     s.tpo_id as student_id,
//     s.clg_id,
//     s.mobile,
//     s.branch,
//     d.round1,
//     d.round2,
//     d.round3,
//     d.round4,
//     d.placedStudent,
//     c.name AS company_name,
//     c.id AS company_id,
//     j.id AS job_posting_id
// FROM 
//     student_details AS s
// INNER JOIN 
//     drive_status AS d ON s.id = d.s_id
// INNER JOIN 
//     job_postings AS j ON d.p_id = j.id
// INNER JOIN 
//     companies AS c ON j.companyId = c.id`;
//         db.query(query, (error, results) => {
//           if (error) {
//             return res.status(500).json({ error: error.message });
//           }
//           res.json(results);
//         });

// }


export const selecteddrive = (req,res)=>{
   
    const jid=req.params.companyId;
    const query = `SELECT 
    CONCAT(s.first_name, " ", s.middle_name, " ", s.last_name) AS full_name,
    d.d_id AS driveid,
    s.tpo_id,
    s.clg_id,
    s.mobile,
    s.branch,
    d.round1,
    d.round2,
    d.round3,
    d.round4,
    d.placedStudent,
    c.name AS company_name,
    c.id AS company_id,
    j.id AS job_posting_id
FROM 
    student_details AS s
INNER JOIN 
    drive_status AS d ON s.id = d.s_id
INNER JOIN 
    job_postings AS j ON d.p_id = j.id
INNER JOIN 
    companies AS c ON j.companyId = c.id
WHERE  
    d.round1 = 1 AND j.id = ?`;
    db.query(query,jid,(error, results) => {
      if (error) {
        return res.status(500).json({ error: error.message });
      }
      res.status(200).json(results);
    });



}


export const selectedcompanylist = (req,res)=>{
  // const  cname=req.body.cname;
  // const  academic_year=req.body.academic_year;
  // const  visited =req.body.visited;
  //const query = `select j.id, c.name,c.academic_year,c.visited,j.job_description from job_postings as j inner join companies as c on j.companyId = c.id WHERE c.name = ? and c.academic_year = ? and c.visited = ?;`;
  const query = `select j.id, c.name,c.academic_year,c.visited,j.job_description from job_postings as j inner join companies as c on j.companyId = c.id`;
  //const values =[ cname,academic_year,visited]
    db.query(query,(error, results) => {
      if (error) {
        return res.status(500).json({ error: error.message });
      }
      res.status(200).json(results);
    });
}

// export const companylist = (req,res)=>{
//    const query = `select j.id, c.name ,c.academic_year,c.visited,j.job_description from job_postings as j inner join companies as c on j.companyId = c.id`;
//       db.query(query, (error, results) => {
//         if (error) {
//           return res.status(500).json({ error: error.message });
//         }
//         res.json(results);
//       });
  
//   }


  export const companyname = (req,res)=>{
    const query = `SELECT DISTINCT name FROM companies;`;
       db.query(query, (error, results) => {
         if (error) {
           return res.status(500).json({ error: error.message });
         }
         res.status(200).json(results);
       });
   
   }

  export const companyacyear = (req,res)=>{
    const query = `SELECT DISTINCT academic_year FROM companies;`;
       db.query(query, (error, results) => {
         if (error) {
           return res.status(500).json({ error: error.message });
         }
         res.status(200).json(results);
       });
   
   }

  export const companyvisited = (req,res)=>{
    const query = `SELECT  DISTINCT visited FROM companies;`;
       db.query(query, (error, results) => {
         if (error) {
           return res.status(500).json({ error: error.message });
         }
         res.status(200).json(results);
       });
   
   }

 export const driveresultround2 = (req,res)=>{
  const jid=req.params.companyId;
    const query = `SELECT 
    CONCAT(s.first_name, " ", s.middle_name, " ", s.last_name) AS full_name,
    d.d_id as driveid,
    s.tpo_id,
    s.clg_id,
    s.mobile,
    s.branch,
    d.round1,
    d.round2,
    d.round3,
    d.round4,
    d.placedStudent,
    c.name AS company_name,
    c.id AS company_id,
    j.id AS job_posting_id
    FROM 
    student_details AS s
    INNER JOIN 
    drive_status AS d ON s.id = d.s_id
    INNER JOIN 
    job_postings AS j ON d.p_id = j.id
    INNER JOIN  
companies AS c ON j.companyId = c.id where round2=1 and j.id=? `; // `;
    db.query(query,jid, (error, results) => {
      if (error) {
        return res.status(500).json({ error: error.message });
      }
      res.status(200).json(results);
    });

}


export const driveresultround3 = (req,res)=>{
  const jid=req.params.companyId;
    const query = `SELECT CONCAT(s.first_name, " ", s.middle_name, " ", s.last_name) AS full_name,
    d.d_id as driveid,
    s.tpo_id,
    s.clg_id,
    s.mobile,
    s.branch,
    d.round1,
    d.round2,
    d.round3,
    d.round4,
    d.placedStudent,
    c.name AS company_name,
    c.id AS company_id,
    j.id AS job_posting_id
    FROM 
    student_details AS s
    INNER JOIN 
    drive_status AS d ON s.id = d.s_id
    INNER JOIN 
    job_postings AS j ON d.p_id = j.id
    INNER JOIN  
    companies AS c ON j.companyId = c.id where round3=1 and j.id=?`;// and j.id=?`;
    db.query(query,jid, (error, results) => {
      if (error) {
        return res.status(500).json({ error: error.message });
      }
      res.status(200).json(results);
    });

}

export const driveresultround4 = (req,res)=>{
  const jid=req.params.companyId;
    const query = `SELECT 
CONCAT(s.first_name, " ", s.middle_name, " ", s.last_name) AS full_name,
d.d_id as driveid,
s.tpo_id,
s.clg_id,
s.mobile,
s.branch,
d.round1,
d.round2,
d.round3,
d.round4,
d.placedStudent,
c.name AS company_name,
c.id AS company_id,
j.id AS job_posting_id
FROM 
student_details AS s
INNER JOIN 
drive_status AS d ON s.id = d.s_id
INNER JOIN 
job_postings AS j ON d.p_id = j.id
INNER JOIN  
companies AS c ON j.companyId = c.id where round4=1 and j.id = ?`;// and  j.id = ?`;
    db.query(query,jid, (error, results) => {
      if (error) {
        return res.status(500).json({ error: error.message });
      }
      res.status(200).json(results);
    });

}

export const driveresultplaced = (req,res)=>{
    const id = req.params.companyId;
    const query = `SELECT 
    CONCAT(s.first_name, " ", s.middle_name, " ", s.last_name) AS full_name,
    d.d_id as driveid,
    s.tpo_id,
    s.clg_id,
    s.mobile,
    s.branch,
    d.round1,
    d.round2,
    d.round3,
    d.round4,
    d.placedStudent,
    c.name AS company_name,
    c.id AS company_id,
    j.id AS job_posting_id
    FROM 
    student_details AS s
    INNER JOIN 
    drive_status AS d ON s.id = d.s_id
    INNER JOIN 
    job_postings AS j ON d.p_id = j.id
    INNER JOIN  
    companies AS c ON j.companyId = c.id where placedStudent=1 and j.id = ? `;// and j.id = ?`;
    db.query(query,id, (error, results) => {
      if (error) {
        return res.status(500).json({ error: error.message });
      }
      res.status(200).json(results);
    });

}


export const update = (req,res) => {
    const id = req.params.id;
    const { round } = req.body; // round can be 1, 2, 3, or 4
    let updateQuery = '';
  
    switch(round) {
      case 1:
        updateQuery = 'UPDATE drive_status SET round1 = 1, round2 = 0, round3 = 0, round4 = 0 WHERE d_id = ?';
        break;
      case 2:
        updateQuery = 'UPDATE drive_status SET round1 = 1, round2 = 1, round3 = 0, round4 = 0 WHERE d_id = ?';
        break;
      case 3:
        updateQuery = 'UPDATE drive_status SET round1 = 1, round2 = 1, round3 = 1, round4 = 0 WHERE d_id = ?';
        break;
      case 4:
        updateQuery = 'UPDATE drive_status SET round1 = 1, round2 = 1, round3 = 1, round4 = 1 WHERE d_id = ?';
        break;
      default:
        res.status(400).json({ error: 'Invalid round value' });
        return;
    }
    db.query(updateQuery, [id], (err, results) => {
      if (err) {
        console.error('Error executing query:', err);
        res.status(500).json({ error: 'Error updating round statuses' });
        return;
      }
      if (results.affectedRows === 0) {
        res.status(404).json({ message: 'No student found with the provided id' });
        return;
      }
      res.status(200).json({ message: 'Round statuses updated successfully' });
    });
  };



 export const updateplaced = (req,res) => {
    const id = req.params.id;
    const { placed_students } = req.body;
    const sql = 'UPDATE drive_status SET placedStudent = 1 WHERE d_id IN (?)';
    //console.log(req.body,"data added to placed students");
    db.query(sql, [id], (err, results) => {
      if (err) {
        console.error('Error executing query:', err);
        res.status(500).json({ error: 'Error updating placed statuses' });
        return;
      }
      if (results.affectedRows === 0) {
        res.status(404).json({ message: 'No student found with the provided id' });
        return;
      }
      res.status(200).json({ message: 'Placed statuses updated successfully' });
    }); 
  };


  export const deleteplaced = (req,res) => {
    const id = req.params.id;
    const { placed_students } = req.body;
    const sql = 'UPDATE drive_status SET placedStudent = 0 WHERE d_id IN (?)';
    //console.log(req.body,"data added to placed students");
    db.query(sql, [id], (err, results) => {
      if (err) {
        console.error('Error executing query:', err);
        res.status(500).json({ error: 'Error updating placed statuses' });
        return;
      }
      if (results.affectedRows === 0) {
        res.status(404).json({ message: 'No student found with the provided id' });
        return;
      }
      res.status(200).json({ message: 'Placed statuses updated successfully' });
    }); 
  };


  export const driveround2ids = (req, res) => {
    const jid=req.params.companyId;
    const query = 'SELECT d_id as driveid FROM drive_status WHERE round2 = 1 and p_id=?';
    db.query(query,jid, (err, results) => {
      if (err) {
        console.error('Error executing query:', err);
        res.status(500).json({ error: 'Error retrieving students' });
        return;
      }
      res.json(results);
    });
  };

  export const driveround3ids = (req, res) => {
    const jid=req.params.companyId;
    const query = 'SELECT d_id as driveid FROM drive_status WHERE round3 = 1 and p_id=?';
    db.query(query,jid, (err, results) => {
      if (err) {
        console.error('Error executing query:', err);
        res.status(500).json({ error: 'Error retrieving students' });
        return;
      }
      res.json(results);
    });
  };

  export const driveround4ids = (req, res) => {
    const jid=req.params.companyId;
    const query = 'SELECT d_id as driveid FROM drive_status WHERE round4 = 1 and p_id=?';
    db.query(query,jid, (err, results) => {
      if (err) {
        console.error('Error executing query:', err);
        res.status(500).json({ error: 'Error retrieving students' });
        return;
      }
      res.json(results);
    });
  };

  export const driveplacedids = (req, res) => {
    const jid=req.params.companyId;
    const query = 'SELECT d_id as driveid FROM drive_status WHERE placedStudent = 1 and p_id=?';
    db.query(query,jid, (err, results) => {
      if (err) {
        console.error('Error executing query:', err);
        res.status(500).json({ error: 'Error retrieving students' });
        return;
      }
      res.json(results);
    });
  };
