import express from 'express';
const PORT = process.env.PORT || 5000;

const app = express()

const start = () => {
  try {
    app.listen(PORT, () => console.log(`Server was started on ${PORT} port...`))
  } catch (e) {
    console.log(e);
  }
}

start();
