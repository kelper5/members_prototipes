var database = require("../database/config");

function buscarArduinoPorViveiro(fk_viveiro) {

  var instrucaoSql = `SELECT * FROM arduino WHERE fk_viveiro = ${fk_viveiro}`;

  console.log("Executando a instrução SQL: \n" + instrucaoSql);
  return database.executar(instrucaoSql);
}

function cadastrar(fk_viveiro) {
  
  var instrucaoSql = `INSERT INTO arduino (fk_viveiro) VALUES (${fk_viveiro})`;

  console.log("Executando a instrução SQL: \n" + instrucaoSql);
  return database.executar(instrucaoSql);
}


module.exports = {
  buscarArduinoPorViveiro,
  cadastrar
}
