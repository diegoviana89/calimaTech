const client = require('../utils/dbConnection');
const query = require('../config/querys');
const jwt = require('../services/jwt');

function userAuthenticate(req, res) {

    let email = req.body.email;
    let password = req.body.password;
    let getToken = req.body.getToken;

    if (email != null && email != '' && password != null && password != '') {

        client.query(query.getUser(email, password))
            .then(result => {
                if (result) {
                    if (getToken) {
                        res.status(200).send({ token: jwt.createToken(result.rows[0]) });
                    } else {
                        if (result.rows.length > 0) {
                            res.status(200).send({ message: 'user authorized' })
                        } else {
                            res.status(403).send({ message: 'user unauthorized' })
                        }
                    }
                } else {
                    res.status(404).send({ message: 'user not found' })
                }
            })
            .catch(err => {
                res.status(404).send({ message: 'user not found' })
            })
    } else {
        res.status(404).send({ message: 'request is not valid' })
    }
}

module.exports = {
    userAuthenticate
}