import jwt from 'jsonwebtoken';
import { JWT_SECRET } from '../config.js';
export function usersMiddleware (req, res, next) {
  if (req.method === 'OPTIONS') next();
  try {
    const token = req.headers.authorization.split(' ')[1];
    if (!token) return res.status(403).json({ message: 'Пользователь не авторизован' });
    req.user = jwt.verify(token, JWT_SECRET);
    next()
  } catch (e) {
    console.log(e);
    return res.status(403).json({ message: 'Пользователь не авторизован' });
  }
}