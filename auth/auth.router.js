import { Router } from 'express';
import { registrationMiddleware } from './auth.midleweare.js';
import { authService } from './auth.service.js';

export const authRouter = new Router();


authRouter.post('/register', registrationMiddleware, authService.registration)
authRouter.post('/login', authService.login)
