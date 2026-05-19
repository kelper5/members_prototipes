const viveiroModel = require("../models/viveiroModel");

function buscarViveirosPorEmpresa(req, res) {
  const fk_empresa = req.params.fk_empresa;

  viveiroModel.buscarViveirosPorEmpresa(fk_empresa).then((resultado) => {
    if (resultado.length > 0) {
      res.status(200).json(resultado);
    } else {
      res.status(204).json([]);
    }
  }).catch(function (erro) {
    console.log(erro);
    console.log("Houve um erro ao buscar os viveiros: ", erro.sqlMessage);
    res.status(500).json(erro.sqlMessage);
  });
}


function cadastrar(req, res) {
  const nome = req.body.nomeServer;
  const biomassa = req.body.biomassaServer;
  const fk_empresa = req.body.fkEmpresaServer;

  if (biomassa == undefined) {
    res.status(400).send("biomassa está undefined!");
  } else if (fk_empresa == undefined) {
    res.status(400).send("fk_empresa está undefined!");
  } else if (nome == undefined) {
    res.status(400).send("nome está undefined!"); 
  } else {


    viveiroModel.cadastrar(nome, biomassa, fk_empresa)
      .then((resultado) => {
        res.status(201).json(resultado);
      }
      ).catch((erro) => {
        console.log(erro);
        console.log(
          "\nHouve um erro ao realizar o cadastro! Erro: ",
          erro.sqlMessage
        );
        res.status(500).json(erro.sqlMessage);
      });
  }
}

module.exports = {
  buscarViveirosPorEmpresa,
  cadastrar
}