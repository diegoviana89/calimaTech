const app = require('./app');
const dbConn = require('./utils/dbConnection');


dbConn.connect()
.then(result=>{
    console.log(`connection to database is successful`);

    app.listen(9596,()=>{
        console.log('connection to server is successful');
    });
})
.catch(err=>{
    console.log(`error connecting to databse caused by: ${err}`);
})