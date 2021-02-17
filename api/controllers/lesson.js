const client = require('../utils/dbConnection');
const querys = require('../config/querys');


function getLessonsAvailables(req,res){

    client.query(querys.getLessonsList())
    .then(result=>{
        if(result){
            res.status(200).send(result.rows);
        }else{
            res.status(404).send({ message: 'no registers found' });
        }
    })
    .catch(err=>{
        res.status(500).send({ message: err });
    })
}

function getListLessonsByUser(req, res) {

    let email = req.query.email;

    if (email) {
        client.query(querys.getLessonListByUser(email))
            .then(result => {
                if (result.rows.length > 0) {
                    res.status(200).send(result.rows);
                } else {
                    res.status(404).send({ message: 'no registers found' });
                }
            })
            .catch(err => {
                res.status(500).send({ message: err });
            })
    } else {
        res.status(400).send({ message: 'invalid request' });
    }

}

function addNote(req, res) {
    let email = req.body.email;
    let id_lesson = req.body.id_lesson;
    let note = req.body.note;

    client.query(querys.addNote(email, id_lesson, note))
        .then(result => {
            if (result) {
                res.status(200).send({ message: 'note was inserted' });
            }
        })
        .catch(err => {
            res.status(500).send({ message: err });
        })
}

function getListOfNotes(req,res){

    let id = req.params.id_lesson;
    let email = req.params.email;

    client.query(querys.getNotes(email, id))
        .then(result => {
            if (result.rows.length > 0) {
                res.status(200).send(result.rows);
            } else {
                res.status(404).send({ message: 'no register found' });
            }
        })
        .catch(err => {
            res.status(500).send({ message: err });
        })
}



function deleteNote(req, res) {
    let id_note = req.query.id_note;

    client.query(querys.getNoteById(id_note))
        .then(result => {
            if (result.rows.length > 0) {
                client.query(querys.deleteNote(id_note))
                    .then(result => {
                        if (result) {
                            res.status(200).send({ message: 'note was deleted' });
                        }
                    })
                    .catch(err => {
                        res.status(500).send({ message: err });
                    })
            }else{
                res.status(404).send({ message: 'no register found' });
            }
        })
        .catch(err=>{
            res.status(500).send({ message: err });
        })
}

function updateLessonStatus(req,res){
    let status = req.body.status;
    let id_lesson =req.params.id_lesson;
    let email = req.params.email;

    client.query(querys.getLessonById(id_lesson,email))
    .then(result=>{
        if(result){
            client.query(querys.updateLessonStatus(result.rows[0].email_user,result.rows[0].id_lesson,status))
            .then(result=>{
                res.status(200).send({message:'lesson status was updated'});
            })
            .catch(err=>{
                res.status(500).send({message:err});
            })
        }
    })
    .catch(err=>{
        res.status(500).send({message:err});
    })
}

module.exports = {
    getLessonsAvailables,
    getListLessonsByUser,
    addNote,
    getListOfNotes,
    deleteNote,
    updateLessonStatus
}