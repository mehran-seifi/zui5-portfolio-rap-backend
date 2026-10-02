
CLASS zcl_ui5_order_cleanup DEFINITION
  PUBLIC FINAL CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

ENDCLASS.


CLASS zcl_ui5_order_cleanup IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    DELETE FROM zui5_order
      WHERE order_uuid = '00000000000000000000000000000000'
        AND order_id = ''.

    IF sy-subrc = 0.
      out->write( 'Cleanup executed.' ).
    ELSE.
      out->write( 'No matching record found.' ).
    ENDIF.

  ENDMETHOD.

ENDCLASS.

