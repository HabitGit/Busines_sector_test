# Busines_sector_test


#### POST /user/register - регистрация
```json
{
"email": "email",
"password": "password",
"firstName": "name"
}
```
#### POST /user/login - авторизация
```json
{
"email": "email",
"password": "password"
}
```
Отдается jwt access token, refresh не делал.
#### PUT /profile/:id - Редактирование пользователя (исключил изменение email, в функции есть заметка почему)
Изменить можно только профиль в который выполнен логин.
1. по эндпоинту login получить токен.
2. установить в headers как **authorization : Bearer \<your token\>**
```json
   {
   "firstName": "set name",
   "lastName": "set last name",
   "sex": "male",
   "photo": "your photo"
   }
```
#### GET /profile/:id - получить пользователя по юзер айди
#### GET /profiles?page=0 - пагинация пользователей начинается с 0 страницы, лимит стоит 10. Сортировка по дате создания (регистрации);

#### Статика раздется через эндпоинт /static

- я сделал 2 сущности: users и profile.
- Сделал минимальную валидацию на регистрацию.
- ORM - Sequelize
- хеш паролей - bcypt

