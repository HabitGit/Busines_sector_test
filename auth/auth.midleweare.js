import { check } from 'express-validator';

export const registrationMiddleware = [
  check('email', 'Эмеил не может быть пустым').notEmpty(),
  check('password', 'Пароль должен быть больше 4 и меньше 10').isLength({min: 4, max: 10}),
  check('firstName', 'Имя не может быть пустым').notEmpty(),
]