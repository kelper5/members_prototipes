var database = require("../database/config");

function buscarUltimasCapturas(fk_viveiro, limite_linhas) {

    var instrucaoSql = `SELECT 
        temperatura, 
        luminosidade,
        momento,
        DATE_FORMAT(momento,'%H:%i:%s') as momento_grafico
        status_arduino,
                    FROM captura
                    WHERE fk_viveiro = ${fk_viveiro}
                    ORDER BY id DESC LIMIT ${limite_linhas}`;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function buscarCapturasEmTempoReal(fk_viveiro) {

    var instrucaoSql = `SELECT 
        temperatura, 
        luminosidade,
        momento,
        DATE_FORMAT(momento,'%H:%i:%s') as momento_grafico
        status_arduino,
                    FROM captura
                    WHERE fk_viveiro = ${fk_viveiro} 
                    ORDER BY id DESC LIMIT 1`;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

module.exports = {
    buscarUltimasCapturas,
    buscarCapturasEmTempoReal
}
