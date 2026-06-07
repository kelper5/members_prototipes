var database = require("../database/config");

function buscarUltimasCapturas(idArduino, limite_linhas) {

    var instrucaoSql = `SELECT 
        temperatura, 
        luminosidade,
        criado_em,
        DATE_FORMAT(criado_em,'%H:%i:%s') as momento_grafico
                    FROM captura
                    WHERE fk_arduino = ${idArduino}
                    ORDER BY id DESC LIMIT ${limite_linhas}`;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function buscarCapturasEmTempoReal(idArduino) {

    var instrucaoSql = `
        SELECT
            ROUND(AVG(temperatura), 2) AS temperatura,
            ROUND(AVG(luminosidade), 2) AS luminosidade
        FROM (
            SELECT
                temperatura,
                luminosidade
            FROM captura
            WHERE fk_arduino = ${idArduino}
            ORDER BY id DESC
            LIMIT 168
        ) AS ultimas_capturas;
    `;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function buscarCapturasParaTelaViveiros(idArduino) {
    var instrucaoSql = `
    SELECT v.id AS id_viveiro, a.id AS id_arduino, c.id AS id_captura, c.temperatura, c.luminosidade, a.status_arduino
    FROM arduino a
    JOIN viveiro v 
    ON a.fk_viveiro = v.id
    LEFT JOIN captura c 
    ON a.id = c.fk_arduino
    WHERE a.id = ${idArduino}
    ORDER BY c.criado_em DESC
    LIMIT 1;
    `
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

module.exports = {
    buscarUltimasCapturas,
    buscarCapturasEmTempoReal,
    buscarCapturasParaTelaViveiros
}
