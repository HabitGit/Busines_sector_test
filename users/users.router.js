import { Router } from 'express';
import { usersService } from './users.service.js';
import { usersMiddleware } from './users.middleware.js';
import multer from 'multer';
import * as uuid from 'uuid';

const storage = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, 'files/');
  },
  filename: function (req, file, cb) {
    cb(null, uuid.v4() + '.jpg');
  },
});

const upload = multer({ storage: storage });

export const usersRouter = new Router();

usersRouter.put(
  '/profile/:id',
  [usersMiddleware, upload.single('photo')],
  usersService.updateUser,
);
usersRouter.get('/profile/:id', usersService.getUserById);
usersRouter.get('/profiles', usersService.getUsers);