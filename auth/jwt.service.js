import jwt from 'jsonwebtoken';
import { JWT_SECRET } from '../config.js';

class JwtService {
  generateAccessToken(id) {
    const payload = {
      id
    };
    return jwt.sign(payload, JWT_SECRET, { expiresIn: '24h' })
  }
}

export const jwtService = new JwtService();
