const express = require('express');
const app = express();
const userRouter = require('./routes/user');
const lessonRouter = require('./routes/lesson');

app.use(express.json());

app.use('/test',userRouter);
app.use('/calimatech/corp/v1.0/users',userRouter);
app.use('/calimatech/corp/v1.0/lessons',lessonRouter);


module.exports = app;