import { Sequelize } from 'sequelize';

export const db = new Sequelize('busines_sector', 'root', 'admin', {
  host: 'localhost',
  dialect: 'mysql',
  port: 3306,
})


