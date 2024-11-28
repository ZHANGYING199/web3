const { buildModule } = require("@nomicfoundation/hardhat-ignition/modules"); 
module.exports = buildModule("ShippingModule", (m) => { 
const shipping = m.contract("Shipping", []); 
m.call(shipping, "Status", []);
return { shipping }; 
}); 