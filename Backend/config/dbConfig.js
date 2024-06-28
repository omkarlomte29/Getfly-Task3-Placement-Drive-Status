import mysql from "mysql"
import dotenv from "dotenv"
dotenv.config();

//Database Connection
export const connection = mysql.createConnection({
  host: process.env.DB_HOST,
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD,
  database: process.env.DB_NAME,
});

connection.connect((err) => {
  if (err) {
    console.error("Error Connecting to the database :", err);
    return;
  }
  console.log("Successfully connected to MySql");
});

