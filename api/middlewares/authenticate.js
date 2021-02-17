let jwt = require('jwt-simple');
let moment = require('moment');
let secret = 'CalimaTech2021*.$mdl';

function tokenValidator(req,res,next){
    
    if(!req.headers.authorization){
        return res.status(403).send({message:'user unauthorized, please login and generate one token'});
    }

    let token = req.headers.authorization.replace(/['"]+/g,'');
    let payload;
    try {
        payload = jwt.decode(token, secret,true);
        if(payload.exp <= moment().unix()){
            return res.status(404).send({message:'Token expired'}); 
        }
    } catch (err) {
        return res.status(500).send(err);
    }

    req.user = payload;

    next();
}

module.exports={
    tokenValidator
}