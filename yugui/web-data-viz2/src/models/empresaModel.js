var database = require("../database/config");

function buscarPorId(id) {
  var instrucaoSql = `SELECT * FROM empresa WHERE id = '${id}'`;

  return database.executar(instrucaoSql);
}

function listar() {
  var instrucaoSql = `SELECT id, razao_social, cnpj, email, codigo_ativacao, fk_matriz FROM empresa`;

  return database.executar(instrucaoSql);
}

function buscarPorCnpj(cnpj) {
  var instrucaoSql = `SELECT * FROM empresa WHERE cnpj = '${cnpj}'`;

  return database.executar(instrucaoSql);
}

function cadastrar(razao_social, cnpj, email, senha, fk_matriz) {
  const matriz = fk_matriz ? fk_matriz : "NULL";
  var instrucaoSql = `INSERT INTO empresa (razao_social, cnpj, email, senha, fk_matriz) VALUES ('${razao_social}', '${cnpj}', '${email}', '${senha}', ${matriz})`;

  return database.executar(instrucaoSql);
}

module.exports = { buscarPorCnpj, buscarPorId, cadastrar, listar };
