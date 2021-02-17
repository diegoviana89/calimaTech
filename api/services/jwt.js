const jwt = require('jwt-simple');
const moment = require('moment');
const secret = 'CalimaTech2021*.$mdl'

function createToken(user){
    let payload = {
        email:user.email,
        iat:moment().unix(),
        exp:moment().add(5,'minutes').unix() 
    }

    return jwt.encode(payload,secret);
}

module.exports={
    createToken
}