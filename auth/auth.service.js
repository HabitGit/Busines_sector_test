import { validationResult } from 'express-validator';
import { Users } from '../database/models/users.model.js';
import bcrypt from 'bcrypt';
import { Profiles } from '../database/models/profiles.model.js';
import { jwtService } from './jwt.service.js';

class AuthService {
  async registration(req, res) {
    try {
      const errors = validationResult(req);
      if (!errors.isEmpty()) return res.status(400).json({message: 'Ошибка при регистрации', errors})
      const { email, password, firstName } = req.body;
      const isUser = await Users.findOne({ where: { email: email } });
      if (isUser) return res.status(400).json('Вы уже зарегистрированы');
      const hashPassword = bcrypt.hashSync(password, 7);
      const newUser = await Users.create({
        email,
        password: hashPassword,
      });
      await Profiles.create({
        firstName,
        userId: newUser.id,
      });
      return res.json('Регистрация прошла успешно');
    } catch (e) {
      console.log(e);
      res.status(400).json({message: 'Registration error'})
    }
  }

  async login(req, res) {
    try {
      const { email, password } = req.body;
      const isUser = await Users.findOne({ where: { email: email } });
      if (!isUser) return res.status(400).json('Вы не зарегистрированны');
      const validatePassword = bcrypt.compareSync(password, isUser.password);
      if (!validatePassword) return res.status(400).json('Неверный пароль');
      const token = jwtService.generateAccessToken(isUser.id);
      return res.json({ token })
    } catch (e) {
      console.log(e);
      res.status(400).json({message: 'Login error'})
    }
  }
}

export const authService = new AuthService();
