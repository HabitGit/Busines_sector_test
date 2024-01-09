import { Profiles } from '../database/models/profiles.model.js';
import { Users } from '../database/models/users.model.js';

class UsersService {
  /**
   * Так как я сделал сущность юзеров для авторизации, то не буду добавлять в данную функцию
   * возможность изменения email. Правильнее всего будет вынести изменение email в отдельную функцию.
   * Но, если бы я менял email тут, то это был бы следущий код:
   * await Users.update({ email }, { where: { id: userId } });
   */
  async updateUser(req, res) {
    try {
      const { filename, originalname, size } = req.file;
      if (originalname.split('.')[1] !== 'jpg' && originalname.split('.')[1] !== 'png') {
        return res.status(400).json('Неверный формат картинки')
      }
      if (size > 1e+7) {
        return res.status(400).json('Большой объем картинки')
      }
      console.log('file: ', req.file);
      const { firstName, lastName, sex } = req.body;
      const currentUserData = req.user;
      const userId = req.params.id;
      if (currentUserData.id !== +userId) return res.json('Вы не можете изменить чужой аккаунт');
      const isProfile = await Profiles.findOne({ where: { userId } });
      if (!isProfile) return res.status(400).json('Такого пользователя нет');
      isProfile.update({
        firstName,
        lastName,
        sex,
        photo: filename,
      });
      return res.json(isProfile);
    } catch (e) {
      console.log(e);
    }
  }

  async getUserById(req, res) {
    try {
      const userId = req.params.id;
      const isUser = await Users.findOne({
        attributes: ['email', ['createdAt', 'register_date']],
        where: { id: userId },
        include: {
          model: Profiles,
          attributes: ['firstName', 'lastName', 'sex', 'photo'],
        },
      })
      return res.json(isUser.get({plain: true}))
    } catch (e) {
      console.log(e);
    }
  }

  async getUsers(req, res){
    try {
      const {page} = req.query;
      const users = await Users.findAll({
        limit: 10,
        offset: page ? page * 10 : 0,
        distinct: true,
        order: ['createdAt'],
      })
      return res.json(users);
    } catch (e) {
      console.log(e);
    }
  }
}

export const usersService = new UsersService();
