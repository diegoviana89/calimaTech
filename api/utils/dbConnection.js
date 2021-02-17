const pg = require('pg');
const dbprops = require('../config/db_properties.json');

const client = new pg.Client(dbprops['connectionString ']);

module.exports=client;