var arduinoModel = require("../models/arduinoModel");

function cadastrar(req, res) {
    var idViveiro = req.body.idViveiroServer;
    arduinoModel.cadastrar(idViveiro)
        .then((resultado) => {
            res.status(201).json(resultado);
        }).catch((erro) => {
            console.log(erro);
            res.status(500).json(erro);
        });
}

module.exports = {
  cadastrar
};