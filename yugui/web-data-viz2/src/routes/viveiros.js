var express = require("express");
var router = express.Router();

var viveiroController = require("../controllers/viveiroController");

router.get("/:fk_empresa", function (req, res) {
  viveiroController.buscarViveirosPorEmpresa(req, res);
});

router.post("/cadastrar", function (req, res) {
  viveiroController.cadastrar(req, res);
})

module.exports = router;