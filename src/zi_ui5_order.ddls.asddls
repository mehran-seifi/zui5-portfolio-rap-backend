
@EndUserText.label: 'Portfolio Order Interface'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.ignorePropagatedAnnotations: true

define root view entity ZI_UI5_ORDER
  as select from zui5_order
{
  key order_uuid             as OrderUUID,
      order_id               as OrderID,
      customer_name          as CustomerName,
      order_status           as OrderStatus,

    amount as Amount,

      currency_code          as CurrencyCode,
      created_by             as CreatedBy,
      created_at             as CreatedAt,
      last_changed_by        as LastChangedBy,
      last_changed_at        as LastChangedAt,
      local_last_changed_at  as LocalLastChangedAt
}
