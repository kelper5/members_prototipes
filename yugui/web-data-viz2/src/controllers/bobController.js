 var bobModel = require("../models/bobModel");

 var express = require("express");
 var router = express.Router();
 var app = express();

//  app.post("/perguntar", async (req, res) => {
//      const pergunta = req.body.pergunta;

//      try {
//          const resultado = await gerarResposta(pergunta);
//          res.json({ resultado });
//      } catch (error) {
//          res.status(500).json({ error: 'Erro interno do servidor' });
//      }

//  });

 function gerarResposta(req, res) {
   var pergunta = req.body.pergunta;
   console.log(req.body);
 
   bobModel.gerarResposta(pergunta).then((resultado) => {
     res.status(200).json(resultado);
   });
 }

 module.exports = {
    gerarResposta
}
