CLASS zcl_ui5_order_seed DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.


CLASS zcl_ui5_order_seed IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    DATA orders TYPE TABLE OF zui5_order.

    orders = VALUE #(
      (
        order_uuid    = '00505600000000000000000000000001'
        order_id      = 'SO-1001'
        customer_name = 'Acme Corporation'
        order_status  = 'Open'
        amount        = '1250.00'
        currency_code = 'EUR'
      )
      (
        order_uuid    = '00505600000000000000000000000002'
        order_id      = 'SO-1002'
        customer_name = 'Global Retail GmbH'
        order_status  = 'Completed'
        amount        = '3480.00'
        currency_code = 'EUR'
      )
      (
        order_uuid    = '00505600000000000000000000000003'
        order_id      = 'SO-1003'
        customer_name = 'Tech Solutions AG'
        order_status  = 'In Progress'
        amount        = '920.00'
        currency_code = 'EUR'
      )
    ).

    LOOP AT orders ASSIGNING FIELD-SYMBOL(<order>).
      <order>-client = sy-mandt.
    ENDLOOP.

    INSERT zui5_order FROM TABLE @orders.

    IF sy-subrc = 0.
      COMMIT WORK.
      out->write( 'Test orders inserted successfully.' ).
    ELSE.
      out->write( 'Insert failed. Check existing keys and table constraints.' ).
    ENDIF.

  ENDMETHOD.

ENDCLASS.
