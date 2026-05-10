var database = require("../database/config");

function buscarPorId(id) {
  var instrucaoSql = `SELECT * FROM empresa WHERE id = '${id}'`;

  return database.executar(instrucaoSql);
}

function listar() {
  var instrucaoSql = `SELECT id, razaoSocial, cnpj, codigo FROM empresa`;

  return database.executar(instrucaoSql);
}

function buscarPorCnpj(cnpj) {
  var instrucaoSql = `SELECT * FROM empresa WHERE cnpj = '${cnpj}'`;

  return database.executar(instrucaoSql);
}

function cadastrar(razaoSocial, cnpj, fkMatriz, fkEndereco, numero, codigo) {
  var instrucaoSql = `INSERT INTO empresa (razaoSocial, cnpj, fkMatriz, fkEndereco, numero, codigo) VALUES ('${razaoSocial}', ${cnpj},${fkMatriz},${fkEndereco},${numero}, '${codigo}')`;

  return database.executar(instrucaoSql);
}

module.exports = { buscarPorCnpj, buscarPorId, cadastrar, listar };
