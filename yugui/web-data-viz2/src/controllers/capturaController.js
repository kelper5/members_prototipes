const capturaModel = require("../models/capturaModel");

function buscarUltimasCapturas(req, res) {

    const limite_linhas = 7;

    const idArduino = req.params.idArduino;

    console.log(`Recuperando as ultimas ${limite_linhas} medidas`);

    capturaModel.buscarUltimasCapturas(idArduino, limite_linhas).then(function (resultado) {
        if (resultado.length > 0) {
            res.status(200).json(resultado);
        } else {
            res.status(204).send("Nenhum resultado encontrado!")
        }
    }).catch(function (erro) {
        console.log(erro);
        console.log("Houve um erro ao buscar as ultimas capturas.", erro.sqlMessage);
        res.status(500).json(erro.sqlMessage);
    });
}


function buscarCapturasEmTempoRealOriginal(req, res) {

    const idArduino = req.params.idArduino;

    console.log(`Recuperando capturas em tempo real`);

    capturaModel.buscarCapturasEmTempoRealOriginal(idArduino).then(function (resultado) {
        if (resultado.length > 0) {
            res.status(200).json(resultado);
        } else {
            res.status(204).send("Nenhum resultado encontrado!")
        }
    }).catch(function (erro) {
        console.log(erro);
        console.log("Houve um erro ao buscar as ultimas capturas.", erro.sqlMessage);
        res.status(500).json(erro.sqlMessage);
    });
}

function buscarCapturasEmTempoReal(req, res) {

    const idArduino = req.params.idArduino;

    console.log(`Recuperando capturas em tempo real`);

    capturaModel.buscarCapturasEmTempoReal(idArduino).then(function (resultado) {
        if (resultado.length > 0) {
            res.status(200).json(resultado);
        } else {
            res.status(204).send("Nenhum resultado encontrado!")
        }
    }).catch(function (erro) {
        console.log(erro);
        console.log("Houve um erro ao buscar as ultimas capturas.", erro.sqlMessage);
        res.status(500).json(erro.sqlMessage);
    });
}

function buscarCapturasParaTelaViveiros(req, res) {

    const idArduino = req.params.idArduino;

    console.log(`Recuperando capturas em tempo real`);

    capturaModel.buscarCapturasParaTelaViveiros(idArduino).then(function (resultado) {
        if (resultado.length > 0) {
            res.status(200).json(resultado);
        } else {
            res.status(204).send("Nenhum resultado encontrado!")
        }
    }).catch(function (erro) {
        console.log(erro);
        console.log("Houve um erro ao buscar as ultimas capturas.", erro.sqlMessage);
        res.status(500).json(erro.sqlMessage);
    });
}

module.exports = {
    buscarUltimasCapturas,
    buscarCapturasEmTempoReal,
    buscarCapturasParaTelaViveiros,
    buscarCapturasEmTempoRealOriginal
}