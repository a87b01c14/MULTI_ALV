"!F4 event handling.
REPORT zdemo_falv23.

DATA: sflight TYPE STANDARD TABLE OF sflight.


CLASS lcl_test DEFINITION INHERITING FROM zcl_falv.
  PUBLIC SECTION.

  PROTECTED SECTION.
    METHODS evf_onf4 REDEFINITION.
  PRIVATE SECTION.

ENDCLASS.

CLASS lcl_test IMPLEMENTATION.

  METHOD evf_onf4.
    BREAK-POINT.
  ENDMETHOD.

ENDCLASS.

START-OF-SELECTION.

  SELECT * UP TO 100 ROWS
  INTO CORRESPONDING FIELDS OF TABLE @sflight
  FROM sflight.                                         "#EC CI_NOWHERE


  DATA falv TYPE REF TO lcl_test.

  falv ?=  lcl_test=>create( CHANGING ct_table = sflight ).

  falv->register_f4_for_fields( VALUE #( (  fieldname = 'PLANETYPE' register = 'X' getbefore = 'X' ) ) ).
  falv->display(  ).
