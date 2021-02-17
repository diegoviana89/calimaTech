module.exports={
    getUser(email,password){
        let query = `SELECT email FROM tbl_user WHERE email='${email}' AND password='${password}'`;
        return query;
     },
    getLessonsList(){
        let query = `SELECT * FROM tbl_lesson`;
        return query;
    },
    getLessonListByUser(email){
        let query = `SELECT * FROM tbl_user_lessons WHERE email_user = '${email}'`;
        return query;
    },
    addNote(email, id, note){
        let query = `INSERT INTO tbl_user_notes (id_lesson,email_user,note) VALUES('${id}','${email}','${note}')`;
        return query;
    },
    getNotes(email,id_lesson){
        let query = `SELECT * FROM tbl_user_notes WHERE email_user='${email}' AND id_lesson='${id_lesson}'`;
        return query;

    },
    getNoteById(id){
        let query=`SELECT * FROM tbl_user_notes WHERE id_note = '${id}'`;
        return query;
    },
    deleteNote(id_note){
        let query = `DELETE fROM tbl_user_notes WHERE id_note='${id_note}'`;
        return query;
    },
    getLessonById(id,email){
        let query = `SELECT * FROM tbl_user_lessons WHERE id_lesson = '${id}' AND email_user='${email}'`;
        return query;
    },
    updateLessonStatus(email,id_lesson,newStat){
        let query = `UPDATE tbl_user_lessons SET status='${newStat}' WHERE email_user='${email}' AND id_lesson='${id_lesson}'`;
        return query;
    }
}