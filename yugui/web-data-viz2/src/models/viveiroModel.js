var database = require("../database/config");

function buscarViveirosPorEmpresa(fk_empresa) {

  var instrucaoSql = `
  SELECT v.id idViveiro, a.id idArduino, v.nome, v.biomassa_media, v.fk_empresa, v.criado_em, a.status_arduino 
  FROM viveiro v 
  JOIN arduino a ON v.id = a.fk_viveiro  
  WHERE fk_empresa = ${fk_empresa};
  `;

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
