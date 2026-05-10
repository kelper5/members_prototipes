var sensorModel = require("../models/sensorModel");

function buscarPorId(req, res) {
  var id = req.params.id;

  sensorModel.buscarPorId(id).then((resultado) => {
    res.status(200).json(resultado);
  });
}

function cadastrar(req, res) {
    var idViveiro = req.body.idViveiroServer;
    sensorModel.cadastrar(idViveiro)
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