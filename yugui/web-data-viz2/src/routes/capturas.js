var express = require("express");
var router = express.Router();

var capturaController = require("../controllers/capturaController");

router.get("/ultimas/:fk_viveiro", function (req, res) {
    capturaController.buscarUltimasCapturas(req, res);
});

router.get("/tempo-real/:fk_viveiro", function (req, res) {
    capturaController.buscarCapturasEmTempoReal(req, res);
})

router.get("/ultimosViveiro/:idArduino", function (req, res) {
    capturaController.buscarCapturasParaTelaViveiros(req, res);
})

module.exports = router;