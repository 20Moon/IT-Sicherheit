import mysql from 'mysql2';
import dotenv from 'dotenv';

dotenv.config();
const pool = mysql.createPool({
    host: process.env.MYSQL_HOST,
    user: process.env.MYSQL_USER,
    password: process.env.MYSQL_PASSWORD,
    database: process.env.MYSQL_DB
}).promise();

export async function login(name, password) {
    // Datenbank auswählen
    await pool.query(`USE ${process.env.MYSQL_DB}`);
    console.log(`Name entered: ${name} and password entered: ${password}`);
    console.log(`SELECT * FROM customers WHERE first_name = '${name}' AND password = '${password}'`);

    const [rows] = await pool.query("SELECT * FROM customers WHERE first_name = ? AND password = ?", [name, password]);
    /*const [rows] = await pool.query(`SELECT * FROM customers WHERE first_name = '${name}' AND password = '${password}'`);*/

    return rows;
}
/*
* Tautology based SQL Injection:
' OR '1'='1

* Union based SQL Injection:
' UNION SELECT * from customers --

* Error based SQL Injection:
'; SELECT @@version --
*

* Piggybacked SQL Injection:
'; drop database mySQLIDatabase --

*/
