FUNCTION Z_FALV_INHERITANCE_DEMO.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  TABLES
*"      C_TAB STRUCTURE  SFLIGHT
*"----------------------------------------------------------------------
  "creation of falv with global class redefinition and without passing subclass type
  data falv type ref to zcl_falv_inheritance_demo.

  falv ?=  zcl_falv_inheritance_demo=>create( changing ct_table = c_tab[] ).


  falv->column( 'SEATSMAX' )->set_hotspot( abap_true ).
  falv->title_v1 = 'ZDEMO_FALV17'.

  falv->top_of_page_height = 100. "absolute size
  falv->show_top_of_page( ).

  falv->display( ).

endfunction.
