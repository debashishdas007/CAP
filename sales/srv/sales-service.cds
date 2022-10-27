// https://github.com/SAP-samples/cloud-cap-hana-swapi/blob/main/cap/db/schema.cds
using {API_SALES_ORDER_SRV as so} from './external/API_SALES_ORDER_SRV.csn';

service SalesService {
    entity A_SalesOrder              as projection on so.A_SalesOrder {
        key SalesOrder,
            SalesOrderType,
            SalesOrganization,
            DistributionChannel,
            SalesGroup,
            SalesDistrict,
            SoldToParty,
            CreationDate,
            CreatedByUser,
            SalesOrderDate,
            TotalNetAmount,
            ShippingType,
            //to_Item    : Association to so.A_SalesOrder,
            to_Item   : redirected to A_SalesOrderItem,
            to_Partner : redirected to A_SalesOrderHeaderPartner
    }
    //@odata.draft.enabled
    entity A_SalesOrderItem          as projection on so.A_SalesOrderItem {
        key SalesOrder,
            key SalesOrderItem,
            //SalesOrderItem : Association to many A_SalesOrder
            //                     on SalesOrderItem.to_Item = $self,
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
