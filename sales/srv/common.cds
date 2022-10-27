using {SalesService} from './sales-service';

// A_SalesOrder
annotate SalesService.A_SalesOrder with {
    SalesOrder          @(Common.Label : 'Sales Order');
    SalesOrderType      @(Common.Label : 'Sales Order Type');
    SoldToParty         @(Common.Label : 'Sold To Party');
    SalesOrganization   @(Common.Label : 'Sales Organization');
    DistributionChannel @(Common.Label : 'Distribution Channel');
    TotalNetAmount      @(Common.Label : 'Total Net Amount');
}
// Sales Order Value Help
annotate SalesService.A_SalesOrder with {
    SalesOrder @(
        title                           : 'Sales Order',
        //Common.ValueListWithFixedValues : false,
        Common.ValueList                : {
            CollectionPath : 'A_SalesOrder',
            Parameters     : [{
                $Type             : 'Common.ValueListParameterInOut',
                LocalDataProperty : 'SalesOrder',
                ValueListProperty : 'SalesOrder'
            },
            {
                $Type             : 'Common.ValueListParameterOut',
                LocalDataProperty : 'SalesOrder',
                ValueListProperty : 'SalesOrderType'
            }],

        }
    )
};
// Sales Order Item Value Help, Not Working

// annotate SalesService.A_SalesOrder with {
//     to_Item @(
//         title : 'Items',
//         Common.ValueList: {
//             CollectionPath: 'A_SalesOrderItem',
//             Parameters: [{
//                 $Type : 'Common.ValueListParameterInOut',
//                 LocalDataProperty : 'to_Item/SalesOrderItem',
//                 ValueListProperty : 'SalesOrderItem'
//             }]
//         }
//     )
// } ;

annotate SalesService.A_SalesOrderItem with {
    SalesOrderItem @(
        title : 'Items',
        Common.ValueList: {
            CollectionPath: 'A_SalesOrderItem',
            Parameters: [{
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : 'SalesOrderItem',
                ValueListProperty : 'SalesOrderItem'
            },
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : 'SalesOrderItem',
                ValueListProperty : 'Material'
            }]
        }
    )
} ;



// Sales Order Partner Value Help
annotate SalesService.A_SalesOrder with {
    SoldToParty @(
        title                           : 'Partner',
        Common.ValueListWithFixedValues : false,
        Common.ValueList                : {
            CollectionPath : 'A_SalesOrderHeaderPartner',
            Parameters     : [{
                $Type             : 'Common.ValueListParameterOut',
                LocalDataProperty : 'SalesOrder',
                ValueListProperty : 'Customer'
            },
            {
                $Type             : 'Common.ValueListParameterOut',
                LocalDataProperty : 'SoldToParty',
                ValueListProperty : 'PartnerFunction',
            }
            ],

        }
    )
};


// A_SalesOrderHeaderPartner
annotate SalesService.A_SalesOrderHeaderPartner with {
    SalesOrder      @(Common.Label : 'Sales Order');
    PartnerFunction @(Common.Label : 'Partner Function');
    Customer        @(Common.Label : 'Customer');
    Supplier        @(Common.Label : 'Supplier');
    AddressID       @(Common.Label : 'AddressID');
}
