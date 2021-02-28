'use strict'

const mysql = require('mysql');
const myConnection = mysql.createConnection({
    host     : 'localhost',
    user     : 'root',
    password : '',
    database : 'inventario'
});
myConnection.connect((error)=>{
    if (error) {
      console.error('El error de conexión es: ' + error);
      return;
    }
    console.log('¡Conectado a la Base de Datos!');
  });
module.exports = myConnection