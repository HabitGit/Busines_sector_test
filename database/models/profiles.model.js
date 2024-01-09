import { db } from '../database.js';
import { DataTypes } from 'sequelize';

export const Profiles = db.define('profiles', {
  id: {
    type: DataTypes.BIGINT,
    unique: true,
    autoIncrement: true,
    primaryKey: true,
  },
  firstName: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  lastName: {
    type: DataTypes.STRING,
  },
  sex: {
    type: DataTypes.STRING
  },
  photo: {
    type: DataTypes.STRING
  },
})
