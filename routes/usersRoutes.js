const userRouter = require('express').Router()


const { getAllUsers } = require("../contorllers/usersController")
userRouter.get('/', getAllUsers);

module.exports = userRouter