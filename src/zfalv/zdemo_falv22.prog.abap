*&---------------------------------------------------------------------*
*& Report zdemo_falv22
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
report zdemo_falv22.

TYPES:
  ty_t_sflight TYPE STANDARD TABLE OF sflight.

CLASS lcl_demo DEFINITION INHERITING FROM zcl_falv.

  PUBLIC SECTION.
    METHODS:
      get_data,
      display_data.

  PROTECTED SECTION.
    METHODS:
      evf_double_click REDEFINITION.

  PRIVATE SECTION.
    DATA:
      mt_flights TYPE ty_t_sflight.

ENDCLASS.

CLASS lcl_demo IMPLEMENTATION.

  METHOD get_data.

    SELECT *
        UP TO 100 ROWS
      INTO TABLE @me->mt_flights
      FROM sflight.

  ENDMETHOD.

  METHOD display_data.

    me->set_output_table( CHANGING ct_table = me->mt_flights ).
    me->title_v1 = 'Demo create_by_type'.
    me->display( ).

  ENDMETHOD.

  METHOD evf_double_click.

    CALL FUNCTION 'POPUP_TO_INFORM'
      EXPORTING
        titel = 'Popup'
        txt1  = 'Flight doubleclicked'
        txt2  = space.

  ENDMETHOD.

ENDCLASS.


START-OF-SELECTION.
  DATA:
    gr_class TYPE REF TO lcl_demo.

  gr_class ?= lcl_demo=>create_by_type( i_type = cl_abap_typedescr=>describe_by_name( 'TY_T_SFLIGHT' ) ).
  gr_class->get_data( ).
  gr_class->display_data( ).
