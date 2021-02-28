//
'use strict'

const express = require('express'),
    bodyParser = require('body-parser'),
    pug = require('pug'),
    restFul = require('method-override')('_method'),
    config = require('./config'),
    cookieSession = require("cookie-session"),
    Index = require('./controllers/index'),
    User_router = require('./routes/usuario'),
    Sucursal_router = require('./routes/sucursal'),
    Tecnica_router = require('./routes/tecnica'),
    Category_router = require('./routes/categoria'),
    Router_product = require('./routes/producto'),
    Almacen_router = require('./routes/almacen'),
    Consumo_router = require('./routes/consumo'),
    Basico_router = require('./routes/basico'),
    Router_historial = require('./routes/historial'),
    session_admin = require('./middleware/session-admin'),
    session_general_admin = require('./middleware/session-general-admin'),
    session_active = require('./middleware/session-active'),
    session_active_sucursal = require('./middleware/session-active-sucursal'),
    app = express()

app
    // configuracion app
    .set("view engine","pug")
    .set('views', config.VIEWS)
    .set('port',config.PORT)
    // ejecutando middleware
    .use( config.PUBLIC, express.static('public') )
    // parse application/json
    .use( bodyParser.json())
    // parse applicaction/x-www-form-urlencoded
    .use( bodyParser.urlencoded({extended:false}) )
    // para put y delete
    .use( restFul )
    .use(cookieSession({
        name: "session",
        keys: ["Comercial","JC"]
    }))
// ComercialJC/
app
    .get('/', Index.index )
    .get('/login', Index.loginGet )
    .post('/login', Index.loginPost )
    .get('/logout', Index.logout )
// ComercialJC/almacen
app
    .use("/almacen",session_active)
    .use("/almacen",Almacen_router)
// ComercialJC/consumos
app
    .use("/consumos",session_active)
    .use("/consumos",Consumo_router)
// ComercialJC/basicos
app
    .use("/basicos",session_active_sucursal)
    .use("/basicos",Basico_router)
// ComercialJC/users
app
    .use("/users", session_admin )
    .use('/users', User_router )
// ComercialJC/tecnicas
app
    .use("/tecnicas", session_admin )
    .use('/tecnicas', Tecnica_router )
// ComercialJC/sucursales
app
    .use("/sucursales", session_general_admin )
    .use('/sucursales', Sucursal_router )
// ComercialJC/categories
app
    .use("/categories", session_general_admin )
    .use('/categories', Category_router )
// ComercialJC/products
app
    .use("/products",session_general_admin)
    .use("/products",Router_product)
// ComercialJC/historial
app
    .use("/historial",session_admin)
    .use("/historial",Router_historial)
    // para error 404
    .use( Index.error404 )

module.exports = app