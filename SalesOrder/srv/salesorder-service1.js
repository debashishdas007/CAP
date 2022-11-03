const cds = require('@sap/cds');

module.exports = cds.service.impl(async function(){
    const connect = await cds.connect.to('API_SALES_ORDER_SRV'); 
    this.on('READ',['A_SalesOrder','A_SalesOrderItem','A_SalesOrderPartnerAddress','A_SalesOrderItemPartner'], async req => {
        return connect.run(req.query)
    });
});