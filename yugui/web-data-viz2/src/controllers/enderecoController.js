var enderecoModel = require("../models/enderecoModel");

function buscarPorId(req, res) {
  var id = req.params.id;

  enderecoModel.buscarPorId(id).then((resultado) => {
    res.status(200).json(resultado);
  });
}

function listar(req, res) {
  enderecoModel.listar().then((resultado) => {
    res.status(200).json(resultado);
  });
}

function cadastrar(req, res) {
    var cep = req.body.cepServer;
    enderecoModel.cadastrar(cep)
        .then((resultado) => {
            res.status(201).json(resultado);
        }).catch((erro) => {
            console.log(erro);
            res.status(500).json(erro);
        });
}

module.exports = {
  buscarPorId,
  listar,
  cadastrar
};