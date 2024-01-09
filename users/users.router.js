import { Router } from 'express';
import { usersService } from './users.service.js';
import { usersMiddleware } from './users.middleware.js';

export const usersRouter = new Router();

usersRouter.put('/profile/:id', usersMiddleware, usersService.updateUser);
usersRouter.get('/profile/:id', usersService.getUserById);
usersRouter.get('/profiles', usersService.getUsers);