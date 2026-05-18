var database = require("../database/config");

function buscarUltimasCapturas(fk_arduino, limite_linhas) {

    var instrucaoSql = `SELECT 
        temperatura, 
        luminosidade,
        criado_em,
        DATE_FORMAT(criado_em,'%H:%i:%s') as momento_grafico
                    FROM captura
                    WHERE fk_arduino = ${fk_arduino}
                    ORDER BY id DESC LIMIT ${limite_linhas}`;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function buscarCapturasEmTempoReal(fk_arduino) {

    var instrucaoSql = `SELECT 
        temperatura, 
        luminosidade,
        criado_em,
        DATE_FORMAT(criado_em,'%H:%i:%s') as momento_grafico
                    FROM captura
                    WHERE fk_arduino = ${fk_arduino} 
                    ORDER BY id DESC LIMIT 1`;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

module.exports = {
    buscarUltimasCapturas,
    buscarCapturasEmTempoReal
}
