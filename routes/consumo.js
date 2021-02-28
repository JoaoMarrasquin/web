//
'use strict'

const express = require("express"),
    ConsumoController = require('../controllers/consumo'),
    consumo = express.Router()

// ComercialJC/consumos
consumo.get("/", ConsumoController.consumosGet )
// ComercialJC/categoria/categoria/get
consumo.post('/', ConsumoController.consumoPost )
// ComercialJC/consumos/:idConsumo
consumo.put("/:idConsumo", ConsumoController.consumosIdConsumoPut )

module.exports = consumo