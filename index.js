import express from 'express';
import { db } from './database/database.js';
import { authRouter } from './auth/auth.router.js';
import { usersRouter } from './users/users.router.js';
const PORT = process.env.PORT || 5000;

const app = express()

app.use(express.json())
app.use(usersRouter)
app.use('/user', authRouter)
app.use('/static', express.static('files'))

const start = async () => {
  try {
    await db.authenticate();
    await db.sync();
    app.listen(PORT, () => console.log(`Server was started on ${PORT} port...`))
  } catch (e) {
    console.log(e);
  }
}

start();
