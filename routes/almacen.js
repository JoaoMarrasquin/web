//
'use strict'

const express = require("express"),
    AlmacenController = require('../controllers/almacen'),
    almacen = express.Router()

// ComercialJC/almacen
almacen
    .route("/")
    .get(  AlmacenController.almacenGet )
    .post( AlmacenController.almacenPost )
// ComercialJC/almacen/:idAlmacen/add
almacen.put('/:idAlmacen/add' , AlmacenController.almacenIdAlmacenAddPut )
// ComercialJC/almacen/:idAlmacen/sub
almacen.put('/:idAlmacen/sub' , AlmacenController.almacenIdAlmacenSubPut )
 
module.exports = almacen