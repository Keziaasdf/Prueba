const express = require('express');
const router = express.Router();

const indexController = require('../controllers/indexController');

router.get('/', indexController.list);
router.post('/add' ,indexController.save);
router.get('/delete/:id', indexController.delete);
router.get('/update/:id', indexController.edit );
router.post('/update/:id', indexController.update );

module.exports = router;


