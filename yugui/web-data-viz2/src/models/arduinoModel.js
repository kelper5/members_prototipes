var database = require("../database/config");

function cadastrar(idViveiro) {
  
  var instrucaoSql = `INSERT INTO arduino (fk_viveiro) VALUES (${idViveiro})`;

  console.log("Executando a instrução SQL: \n" + instrucaoSql);
  return database.executar(instrucaoSql);
}


module.exports = {
  cadastrar
}
