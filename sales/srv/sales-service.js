const cds = require('@sap/cds');
module.exports = cds.service.impl(async function() {
    const bp = await cds.connect.to('API_SALES_ORDER_SRV');    
    // this.on('READ', 'A_SalesOrder', async req => {        
    //     return bp.run(req.query);       
    // });

    // this.on('READ', 'A_SalesOrderItem', async req => {        
    //     return bp.run(req.query);       
    // });

    this.on('READ', ['A_SalesOrder', 'A_SalesOrderItem', 'A_SalesOrderHeaderPartner'], req => {
        return bp.run(req.query);
    });
});