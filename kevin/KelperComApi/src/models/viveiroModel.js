var database = require("../database/config");

function buscarViveirosPorEmpresa(empresaId) {

  var instrucaoSql = `SELECT * FROM viveiro a WHERE fkEmpresa = ${empresaId}`;

  console.log("Executando a instrução SQL: \n" + instrucaoSql);
  return database.executar(instrucaoSql);
}

function cadastrar(
    nome, biomassa, empresaId
) {

    var instrucaoSql = `
        INSERT INTO viveiro (nome, biomassa, fkEmpresa) VALUES ('${nome}', '${biomassa}', '${empresaId}');`;
    console.log( "Executando a instrução SQL: \n" + instrucaoSql);

    return database.executar(instrucaoSql);
}


module.exports = {
  buscarViveirosPorEmpresa,
  cadastrar
}
