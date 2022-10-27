using {SalesService} from './sales-service';

// List and Object Page
annotate SalesService.A_SalesOrder with @(UI : {
    HeaderInfo                           : {
        $Type          : 'UI.HeaderInfoType',
        TypeName       : 'Sale Order',
        TypeNamePlural : 'Sales Order'
    },
    SelectionFields                      : [
        SalesOrder,
        SalesOrderType,
        SoldToParty,
        to_Item.SalesOrderItem
    ],
    LineItem                             : [
        {
            $Type : 'UI.DataField',
            Value : SalesOrder
        },
        {Value : SalesOrderType},
        {Value : SoldToParty},
        {Value : SalesOrganization},
        {Value : DistributionChannel},
        {Value : TotalNetAmount},
    ],

    HeaderFacets                         : [{
        $Type  : 'UI.ReferenceFacet',
        Target : '@UI.FieldGroup#HeaderGeneralInformation'
    }, ],

    Facets                               : [
        {
            $Type  : 'UI.CollectionFacet',
            Label  : 'Item Information',
            Facets : [
                {
                    $Type  : 'UI.ReferenceFacet',
                    Target : '@UI.FieldGroup#Item',
                    Label  : 'Item No.',
                },
                {
                    $Type  : 'UI.ReferenceFacet',
                    Target : '@UI.FieldGroup#Material',
                    Label  : 'Material',
                },
                {
                    $Type  : 'UI.ReferenceFacet',
                    Target : '@UI.FieldGroup#PurchaseOrderByCustomer',
                    Label  : 'PurchaseOrderByCustomer',
                }
            ],
        },
        {
            $Type  : 'UI.ReferenceFacet',
            Target : 'to_Partner/@UI.LineItem',
            Label  : 'Partner'
        }
    ],

    FieldGroup #HeaderGeneralInformation : {
        $Type : 'UI.FieldGroupType',
        Data  : [
            {Value : SalesOrder},
            {Value : SalesOrderType},
            {Value : SoldToParty},

        ],
    },

    FieldGroup #Item                     : {Data : [{
        Value : to_Item.SalesOrderItem,
        Label : 'Sales Order Item'
    }, ], },

    FieldGroup #Material                 : {Data : [{
        Value : to_Item.Material,
        Label : 'Material'
    }, ], },
    FieldGroup #PurchaseOrderByCustomer  : {Data : [{
        Value : to_Item.PurchaseOrderByCustomer,
        Label : 'Purchase Order By Customer'
    }, ], },
}, );

// Object Page
annotate SalesService.A_SalesOrderHeaderPartner with @(UI : {
    HeaderInfo      : {
        $Type          : 'UI.HeaderInfoType',
        TypeName       : 'Partner',
        TypeNamePlural : 'Partners'
    },
    SelectionFields : [
        SalesOrder,
        PartnerFunction,
        Customer
    ],
    LineItem        : [
        {
            $Type : 'UI.DataField',
            Value : SalesOrder
        },
        {Value : PartnerFunction},
        {Value : Customer},
        {Value : Supplier},
        {Value : AddressID}
    ]
}, );

// annotate SalesService.A_SalesOrderItem with @(UI : {
//     SelectionFields : [
//         SalesOrder,
//         SalesOrderItem
//     ],
// });

