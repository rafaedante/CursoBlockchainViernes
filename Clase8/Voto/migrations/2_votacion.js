const Votacion = artifacts.require("Votacion");

module.exports = function(deployer) {
    deployer.deploy(Votacion);
};