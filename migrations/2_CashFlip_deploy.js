const CashFlip = artifacts.require("CashFlip");

module.exports = function(deployer) {
  deployer.deploy(CashFlip);
};
