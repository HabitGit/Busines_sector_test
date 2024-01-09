import { db } from '../database.js';
import { DataTypes } from 'sequelize';
import { Profiles } from './profiles.model.js';

export const Users = db.define('users', {
  id: {
    type: DataTypes.BIGINT,
    unique: true,
    autoIncrement: true,
    primaryKey: true,
  },
  email: {
    type: DataTypes.STRING,
    allowNull: false,
    unique: true,
  },
  password: {
    type: DataTypes.STRING,
    allowNull: false,
  },
})
Users.hasOne(Profiles)
Profiles.belongsTo(Users);
