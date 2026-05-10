var database = require("../database/config");

function buscarPorId(id) {
  var instrucaoSql = `SELECT * FROM sensor WHERE id = '${id}'`;

  return database.executar(instrucaoSql);
}

function cadastrar(fkViveiro) {
  var instrucaoSql = `INSERT INTO sensor (fkViveiro) VALUES (${fkViveiro})`;

  return database.executar(instrucaoSql);
}

module.exports = { buscarPorId, cadastrar};