const express = require('express');
const router = express.Router();
const lessonControler = require('../controllers/lesson');
const md_auth = require('../middlewares/authenticate');


router.get('/',md_auth.tokenValidator,lessonControler.getListLessonsByUser);
router.get('/list',md_auth.tokenValidator,lessonControler.getLessonsAvailables);
router.post('/',md_auth.tokenValidator,lessonControler.addNote);
router.get('/:id_lesson/:email',md_auth.tokenValidator, lessonControler.getListOfNotes);
router.delete('/',md_auth.tokenValidator,lessonControler.deleteNote);
router.post('/:id_lesson/:email',md_auth.tokenValidator,lessonControler.updateLessonStatus);

module.exports = router;