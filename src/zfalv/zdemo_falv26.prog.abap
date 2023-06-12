*&---------------------------------------------------------------------*
*& Report zdemo_falv26
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zdemo_falv26.



data: sflight type standard table of sflight.

class lcl_falv DEFINITION INHERITING FROM zcl_falv.

    PROTECTED SECTION.
        methods: evf_data_changed_finished REDEFINITION.

ENDCLASS.

CLASs lcl_falv IMPLEMENTATION.

  METHOD evf_data_changed_finished.
    me->soft_refresh( ).
  ENDMETHOD.

ENDCLASS.


start-of-selection.


 define test.
    break-point.
    call FUNCTION 'CONVERSION_EXIT_ZFALV_OUTPUT'
      EXPORTING
        input  = &1
      .
 end-of-DEFINITION.

  PERFORM test2.

  select * up to 10000 rows
  into corresponding fields of table @sflight
  from sflight.

  "FALV creation with only table passed
  data(falv) = lcl_falv=>create( changing ct_table = sflight ).

  "Add title variable
  falv->title_v1 = 'ZDEMO_FALV26'.


  data(currency) = falv->column( 'CURRENCY' )->set_editable( )->set_drdn_hndl( '1' )->set_drdn_alias( 'X' )->set_convexit( 'ZFALV'  )->set_edit_mask( '==ZFALV' ).
  currency->set_ref_field( space )->set_ref_table( space )->set_checktable( space )->set_domname( space )->set_dd_roll( space  )->set_tech_form( '7').

  falv->set_drop_down_table(
  it_drop_down_alias = value #( handle = '1' ( value = 'EUR Euro' int_value = 'EUR' )
                                             ( value = 'PLN Zloty' int_value = 'PLN' )
                                    )  ).

  falv->set_editable(
      iv_modify = abap_true
  ).
  "Display full screen grid
  falv->display( ).




  form test2.

  data(test1) = 'ABC'.
  test test1.

  ENDFORM.
