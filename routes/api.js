var express = require('express');
var router = express.Router();
var novedadesModel = require('./../models/novedadesModel');
var cloudinary = require('cloudinary').v2;
var nodemailer = require('nodemailer');

//NOVEDADES
router.get('/novedades', async function(req, res, next) {
    let novedades = await novedadesModel.getNovedades();

    novedades = novedades.map(novedades => {
        if (novedades.img_id) {
            const imagen = cloudinary.url(novedades.img_id, {
                width: 300,
                height: 240,
                crop: 'fill'
            });
            return {
                ...novedades,
                imagen
            }
        } else {
            return {
                ...novedades,
                imagen: ''
            }
        }
    });
    res.json(novedades);
});

//CONTACTO
router.post('/contacto', async (req, res) => {
    const mail = {
        to: 'gonzalezsaritaines@gmail.com',
        subject: 'Contacto Web',
        html: `${req.body.nombre} se contacto a traves de la web y quiere más información 
        a este correo: ${req.body.email} <br> Además, hizo el siguiente comentario: ${req.body.mensaje} <br>
        Su teléfono es: ${req.body.telefono}`
    }
    const transport = nodemailer.createTransport({
        host: process.env.SMTP_HOST,
        port: process.env.SMTP_PORT,
        auth: {
          user: process.env.SMTP_USER,
          pass: process.env.SMTP_PASS
        }
      });
    
    if (req.body.nombre!='' && req.body.telefono!='' && req.body.email!='' && req.body.mensaje!='') {
        await transport.sendMail(mail)
    

      res.status(201).json({
          error: false,
          message: 'Tu mensaje ha sido enviado'
      })
     } else {
         res.status(201).json({
            //  layout: '/api/contacto',
             error: true,
             message: 'Todos los campos son obligatorios'
         })
     }
});

module.exports = router;