var arduinoModel = require("../models/arduinoModel");

function buscarPorId(req, res) {
  var id = req.params.id;

  arduinoModel.buscarPorId(id).then((resultado) => {
    res.status(200).json(resultado);
  });
}

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
  buscarPorId,
  cadastrar
};