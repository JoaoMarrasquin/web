//
'use strict'

const express = require("express"),
    ProductoController = require('../controllers/producto'),
    producto = express.Router()
// ComercialJC/products
producto
    .route('/')
    .get(  ProductoController.productsGet)
    .post( ProductoController.productsPost)
// ComercialJC/products/new
producto
    .route("/new")
    // Metodo GET
    .get( ProductoController.productsNewGet )
    // Metodo POST
    .post( ProductoController.productsNewPost )
// ComercialJC/products/new
producto
    .route("/new/excel")
    // Metodo GET
    .get( ProductoController.excelGet )
    // Metodo POST
    .post( ProductoController.excelPost )
// ComercialJC/products/:idProducto
producto
    .route("/:idProducto")
    // Metodo GET
    .get( ProductoController.productsIdProductoGet )
    // Metodo PUT
    .put( ProductoController.productsIdProductoPut )
    // Metodo DELETE
    .delete( ProductoController.productsIdProductoDelete )

module.exports = producto