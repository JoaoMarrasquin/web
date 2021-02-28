//
'use strict'

const express = require("express"),
    HistorialController = require('../controllers/historial'),
    historial = express.Router()

// ComercialJC/historial/movimientos
historial
    .route('/movimientos')
    .get( HistorialController.historialMovimientosGet )
    .post( HistorialController.historialMovimientosPost )
// ComercialJC/historial/bajas
historial
    .route('/bajas')
    .get( HistorialController.historialBajasGet )
    .post( HistorialController.historialBajasPost )
// ComercialJC/historial/general
// Metodo GET
historial.get("/general", HistorialController.historialGeneralGet )
// ComercialJC/historial/sucursal
// Metodo GET
historial.get("/sucursal", HistorialController.historialSucursalGet )
// ComercialJC/historial/sucursaltop
// Metodo POST
historial.post("/sucursaltop", HistorialController.historialSucursalTopPost )
// ComercialJC/historial/sucursalbasicos
// Metodo POST
historial.post("/sucursalbas", HistorialController.historialSucursalBasicosPost )
// ComercialJC/historial/generaltop
// Metodo POST
historial.post("/generaltop", HistorialController.historialGeneralTopPost )
// ComercialJC/historial/generalbas
// Metodo POST
historial.post("/generalbas", HistorialController.historialGeneralBasicosPost )

module.exports = historial;