var express = require('express');
var router = express.Router();
var novedadesModel = require('./../../models/novedadesModel');
var util = require('util');
var cloudinary = require('cloudinary').v2;
const uploader = util.promisify(cloudinary.uploader.upload);
const destroy = util.promisify(cloudinary.uploader.destroy);

/* traer novedades de la base de datos */
router.get('/', async function(req, res, next) {
  var novedades = await novedadesModel.getNovedades();

  novedades = novedades.map(novedad => { //traer novedad con imagen si es que hay una
    if(novedad.img_id) {
      const imagen = cloudinary.image(novedad.img_id, {
       width: 300,
       height: 260,
       crop: 'fill',
      });
      return {
        ...novedad,
        imagen
      }
    } else {
      return {
        ...novedad,
        imagen: ''
      }
    }
  });
  res.render('admin/novedades', {
    layout:'admin/layout',
    usuario: req.session.nombre, //almacena el nombre de usuario
    novedades
  }); 
});

/* agregar novedades a la bd*/
router.get('/agregar', (req, res, next) => {
  res.render('admin/agregar', {
    layout: 'admin/layout'
  });
});

/* que reciba y procese las nuevas novedades*/
router.post('/agregar', async (req, res, next) => {
  try {
    var img_id = '';
    if(req.files && Object.keys(req.files).length> 0) { //si se cargo un archivo y su nombre es mayor a 0 se reemplaza la imagen vacia
      imagen = req.files.imagen;
      img_id = (await uploader(imagen.tempFilePath)).public_id;
    }
    if(req.body.titulo != "" && req.body.subtitulo != "" && req.body.cuerpo != "") {
     // await novedadesModel.insertNovedad(req.body);
     await novedadesModel.insertNovedad({
       ...req.body,
       img_id
     })
      res.redirect('/admin/novedades')
    } else {
      res.render('admin/agregar', {
        layout: 'admin/layout',
        error: true,
        message: 'Todos los campos son obligatorios'
      })
    }
  } catch(error) {
    console.log(error)
    res.render('admin/agregar', {
      layout: 'admin/layout',
      error: true,
      message: 'No se cargó la novedad'
    });
  }
});

/*Eliminar novedades*/
router.get('/eliminar/:id', async (req, res, next) => {
  var id = req.params.id;

  let novedad = await novedadesModel.getNovedadById(id);
  if (novedad.img_id) {
    await (destroy(novedad.img_id));
  }

  await novedadesModel.deleteNovedadesById(id);
  res.redirect('/admin/novedades')
});

/*Listar 1 novedad por id */
router.get('/modificar/:id', async (req, res, next) => {
  var id = req.params.id;
  console.log(req.params.id);
  var novedad = await novedadesModel.getNovedadById(id);
  res.render('admin/modificar', {
    layout: 'admin/layout',
    novedad
  });
});

/*modificar la novedad*/
router.post('/modificar', async (req, res, next) => {
  try {
    let img_id = req.body.img_original;
    let borrar_img_vieja = false;
    if(req.body.img_delete === "1") {
      img_id = null;
      borrar_img_vieja = true;
    } else {
      if(req.files && Object.keys(req.files).length > 0){
        imagen = req.files.imagen;
        img_id = (await uploader(imagen.tempFilePath)).public_id;
          borrar_img_vieja = true;
      }
    }
    if(borrar_img_vieja && req.body.img_original){
      await (destroy(req.body.img_original));
    }
    
    var obj = {
      titulo: req.body.titulo,
      subtitulo: req.body.subtitulo,
      cuerpo: req.body.cuerpo,
      img_id
    }
    //console.log(obj)
    //console.log(req.body.id)

    await novedadesModel.modificarNovedadById(obj, req.body.id);
    res.redirect('/admin/novedades');
  } catch (error) {
    console.log(error)
    res.render('admin/modificar', {
      layout: 'admin/layout',
      error: true,
      message: 'No se modificó la novedad'
    })
  }
})

module.exports = router;