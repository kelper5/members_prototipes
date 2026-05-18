var database = require("../database/config");

function buscarPorId(id) {
  var instrucaoSql = `SELECT * FROM endereco WHERE id = '${id}'`;

  return database.executar(instrucaoSql);
}

function listar() {
  var instrucaoSql = `SELECT cep FROM endereco`;

  return database.executar(instrucaoSql);
}

function cadastrar(cep) {
  var instrucaoSql = `INSERT INTO endereco (cep) VALUES ('${cep}')`;

  return database.executar(instrucaoSql);
}

module.exports = { buscarPorId, cadastrar};