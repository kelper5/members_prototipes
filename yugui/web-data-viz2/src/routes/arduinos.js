var express = require("express");
var router = express.Router();

var arduinoController = require("../controllers/arduinoController");

//Recebendo os dados do html e direcionando para a função cadastrar de usuarioController.js
router.post("/cadastrar", function (req, res) {
    arduinoController.cadastrar(req, res);
})

module.exports = router;