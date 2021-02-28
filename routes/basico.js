//
'use strict'

const express = require("express"),
    BasicoController = require('../controllers/basico'),
    basico = express.Router()

// ComercialJC/basicos
basico
    .route("/")
    .get( BasicoController.basicosGet )
    .put( BasicoController.basicosPut )
    .delete( BasicoController.basicosDelete )

module.exports = basico