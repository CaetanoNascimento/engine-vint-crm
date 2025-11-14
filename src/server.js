import 'dotenv/config';
import app from './app.js';
import { pool } from './db.js';

import http from 'http';  

const server = http.createServer(app)

const port = process.env.PORT || 3000;

async function start() {
  try {
    await pool.query('SELECT 1');
    server.listen(port, () => {
      console.log(`API online em http://localhost:${port}`);
    });
  } catch (e) {
    console.error('Falha ao iniciar:', e.message);
    process.exit(1);
  }
}
start();
