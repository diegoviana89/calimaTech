const express = require('express');
let router = express.Router();
const user = require('../controllers/user');
let md_auth = require('../middlewares/authenticate');

router.get('/test',(req,res)=>{
    res.status(200).send({message:'test server'});
})

router.get('/login',user.userAuthenticate);

module.exports = router;





