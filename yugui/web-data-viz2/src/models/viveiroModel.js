var database = require("../database/config");

function buscarViveirosPorEmpresa(fk_empresa) {

  var instrucaoSql = `SELECT * FROM viveiro WHERE fk_empresa = ${fk_empresa}`;

  console.log("Executando a instrução SQL: \n" + instrucaoSql);
  return database.executar(instrucaoSql);
}

function cadastrar(biomassa, fk_empresa) {
  
  var instrucaoSql = `INSERT INTO viveiro (biomassa, fk_empresa) VALUES (${biomassa}, ${fk_empresa})`;

  console.log("Executando a instrução SQL: \n" + instrucaoSql);
  return database.executar(instrucaoSql);
}


module.exports = {
  buscarViveirosPorEmpresa,
  cadastrar
}
