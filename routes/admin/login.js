var express = require('express');
var router = express.Router();

var usuariosModel = require('./../../models/usuariosModel');

/* GET home page. LOGIN/LOGOUT */
router.get('/', function(req, res, next) {
  res.render('admin/login', {
    layout:'admin/layout'
  }); //pasar el layout de la carpeta admin en views
});

router.get('/logout', function(req, res, next) {
  req.session.destroy(); //destruye variable de sesion
  res.render('admin/login', { 
    layout:'admin/layout'
  }); 
});


router.post('/', async (req,res, next) => {
  try {
    var usuario = req.body.usuario; //almacena nombre de usuario
    var password = req.body.password; //almacena contraseña

    var data = await usuariosModel.getUserByUsernameAndPassword(usuario, password);

    if(data != undefined) { 
      req.session.id_usuario = data.id; //guardar en variable de  session
      req.session.nombre = data.usuario; //guardar el usuario para usarlo en las paginas
      res.redirect('/admin/novedades');
    } else {
      res.render('admin/login', {
        layout: 'admin/layout',
        error: true,
      }); 
    }
  } catch(error) {
    
    console.log(error);
   
  }
});


module.exports = router;