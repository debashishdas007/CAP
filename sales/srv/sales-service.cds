// https://github.com/SAP-samples/cloud-cap-hana-swapi/blob/main/cap/db/schema.cds
using {API_SALES_ORDER_SRV as so} from './external/API_SALES_ORDER_SRV.csn';

service SalesService {

    //@odata.draft.enabled
    // entity A_SalesOrder : so.A_SalesOrder {
    //     criticality : Integer
    // } 

    entity A_SalesOrder              as projection on so.A_SalesOrder {
        key SalesOrder          as SalesOrder,
            SalesOrderType      as SalesOrderType,
            SalesOrganization   as SalesOrganization,
            DistributionChannel as DistributionChannel,
            SalesGroup          as SalesGroup,
            SalesDistrict       as SalesDistrict,
            SoldToParty         as SoldToParty,
            CreationDate        as CreationDate,
            CreatedByUser       as CreatedByUser,
            SalesOrderDate      as SalesOrderDate,
            TotalNetAmount      as TotalNetAmount,
            ShippingType        as ShippingType,
            //criticality,
            to_Item             as to_Item    : redirected to A_SalesOrderItem,
            to_Partner          as to_Partner : redirected to A_SalesOrderHeaderPartner,
    }

    //@odata.draft.enabled
    entity A_SalesOrderItem          as projection on so.A_SalesOrderItem {
        key SalesOrder,
        key SalesOrderItem,
            SalesOrderItemCategory,
            PurchaseOrderByCustomer,
            Material,
            RequestedQuantity,
            NetAmount,
    }

    entity A_SalesOrderHeaderPartner as projection on so.A_SalesOrderHeaderPartner {
        key SalesOrder,
        key PartnerFunction,
            Customer,
            Supplier,
            AddressID,
            to_Address : redirected to so.A_SalesOrderPartnerAddress

    }
}

using from './annotations';
using from './common';
