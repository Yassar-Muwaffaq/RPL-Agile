const { Pool } = require("pg");

const pool = new Pool({
  user: "postgres",
  host: "localhost",
  database: "RPL",
  password: "",
  port: 5432,
});

module.exports = pool;