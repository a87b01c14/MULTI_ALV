*&---------------------------------------------------------------------*
*& Report zdemo_falv24
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zdemo_falv24.

TYPES: BEGIN OF t_output,
         price    TYPE sflight-price,
         currency TYPE sflight-currency,
       END OF t_output.

DATA: output TYPE STANDARD TABLE OF t_output.

SELECT price, currency UP TO 10000 ROWS
      INTO CORRESPONDING FIELDS OF TABLE @output
      FROM sflight.


data(falv) = zcl_falv=>create(
               CHANGING
                 ct_table          = output
             ).

falv->column( 'PRICE'  )->set_cfieldname( 'CURRENCY' ).

falv->display( ).
