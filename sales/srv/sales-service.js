const cds = require('@sap/cds');
const { A_SalesOrder } =  cds.entities 
module.exports = cds.service.impl(async function() {
    const bp = await cds.connect.to('API_SALES_ORDER_SRV'); 
    // this.on('READ', 'A_SalesOrder', async req => {        
    //     return bp.run(req.query);       
    // });

    // this.on('READ', 'A_SalesOrderItem', async req => {        
    //     return bp.run(req.query);       
    // });

    this.on('READ', ['A_SalesOrder','A_SalesOrderItem', 'A_SalesOrderHeaderPartner'], req => {
        console.log("ON Read "+ req.query);
        console.log("ON Read "+ req);
        
        return bp.run(req.query);
    });

    this.before('READ', 'A_SalesOrder', req => {
        console.log("Before Read "+ req);
    });
    // this.after('READ', 'A_SalesOrder', req => {
    //     console.log(req);
    //     const totals = Array.isArray(req) ? req : [TotalNetAmount];
    //     totals.forEach(total => {
    //         if (total.criticality >= 100) {
    //             total.criticality = 1;
    //         } else {
    //             total.criticality = 2;
    //         }
    //     });
    // });
});