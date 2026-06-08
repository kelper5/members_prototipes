var express = require("express");
var router = express.Router();

var capturaController = require("../controllers/capturaController");

router.get("/ultimas/:idArduino", function (req, res) {
    capturaController.buscarUltimasCapturas(req, res);
});

router.get("/tempo-real/:idArduino", function (req, res) {
    capturaController.buscarCapturasEmTempoReal(req, res);
})

router.get("/tempo-real-original/:idArduino", function (req, res) {
    capturaController.buscarCapturasEmTempoRealOriginal(req, res);
})

router.get("/ultimosViveiro/:idArduino", function (req, res) {
    capturaController.buscarCapturasParaTelaViveiros(req, res);
})

module.exports = router;