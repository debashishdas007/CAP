const cds = require('@sap/cds');
const { A_SalesOrder } = cds.entities

module.exports = cds.service.impl (srv =>{
    srv.after("READ", 'A_SalesOrder', each => each.TotalNetAmount > 50 && _addDiscount(each,1))    

    // srv.on("CREATE", 'A_SalesOrder', async req => {

    // });

})

function _addDiscount(each,discount){
    //each.TotalNetAmount = each.TotalNetAmount + discount
}


// module.exports = cds.service.impl (function(){
//     const { A_SalesOrder } = cds.entities;
//     this.on('READ',['A_SalesOrder'], async req => {
//         console.log("On")        
//     });
//     this.before ('READ', 'A_SalesOrder', async req => {   
//         const  tx = cds.transaction(req);
//         console.log(tx);
//         console.log(req.query);
//         tx.run(req.query);
//         //console.log(req.query);
//         //cds.run(req.query)
//         //console.log(req)
//       })
// });
