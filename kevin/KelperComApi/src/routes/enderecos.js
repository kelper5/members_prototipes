var express = require("express");
var router = express.Router();

var enderecoController = require("../controllers/enderecoController");

//Recebendo os dados do html e direcionando para a função cadastrar de usuarioController.js
router.post("/cadastrar", function (req, res) {
    enderecoController.cadastrar(req, res);
})

router.get("/buscar/:id", function (req, res) {
  enderecoController.buscarPorId(req, res);
});

module.exports = router;