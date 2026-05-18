var database = require("../database/config");

function buscarViveirosPorEmpresa(fk_empresa) {

  var instrucaoSql = `SELECT * FROM viveiro WHERE fk_empresa = ${fk_empresa}`;

  console.log("Executando a instrução SQL: \n" + instrucaoSql);
  return database.executar(instrucaoSql);
}

function cadastrar(nome, biomassa, fk_empresa) {
  
  var instrucaoSql = `INSERT INTO viveiro (nome, biomassa_media, fk_empresa) 
  VALUES ('${nome}', ${biomassa}, ${fk_empresa})`;

  console.log("Executando a instrução SQL: \n" + instrucaoSql);
  return database.executar(instrucaoSql);
}


module.exports = {
  buscarViveirosPorEmpresa,
  cadastrar
}
