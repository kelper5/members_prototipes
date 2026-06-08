var database = require("../database/config");

function buscarPorId(id) {
  var instrucaoSql = `SELECT * FROM empresa WHERE id = '${id}'`;

  return database.executar(instrucaoSql);
}

function listar() {
  var instrucaoSql = `SELECT * FROM vw_empresas;`;
  // var instrucaoSql = `SELECT id, razao_social, cnpj, codigo_ativacao, fk_matriz FROM empresa`;

  return database.executar(instrucaoSql);
}

function buscarPorCnpj(cnpj) {
  var instrucaoSql = `SELECT * FROM empresa WHERE cnpj = '${cnpj}'`;

  return database.executar(instrucaoSql);
}

function cadastrar(razao_social, cnpj, codigo_ativacao, fk_matriz,
   fk_endereco, complemento_imovel) {
  const matriz = fk_matriz ? fk_matriz : "NULL";
  var instrucaoSql = `INSERT INTO empresa (razao_social, cnpj, codigo_ativacao, fk_matriz, fk_endereco, complemento_imovel) 
  VALUES ('${razao_social}', '${cnpj}', '${codigo_ativacao}', ${matriz}, ${fk_endereco}, '${complemento_imovel}')`;

  return database.executar(instrucaoSql);
}

module.exports = { buscarPorCnpj, buscarPorId, cadastrar, listar };
