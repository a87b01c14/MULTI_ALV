"! This is demo for FALV with mass replace function
"! done by Lukasz Pegiel for http://abapblog.com
report zdemo_falv08.

data: sflight type standard table of sflight.


start-of-selection.


  select * up to 100 rows
  into corresponding fields of table @sflight
  from sflight.

  "FALV creation with only table passed
  data(falv) = zcl_falv=>create( changing ct_table = sflight ).

  "Add title variable
  falv->title_v1 = 'ZDEMO_FALV08'.

  "set whole grid editable
  falv->layout->set_edit( abap_true ).
  falv->set_editable( iv_modify = abap_true ).

  "show default grid toolbar
  falv->layout->set_no_toolbar( abap_false ).

  "Add mass replace function to grid toolbar (can be also added to GUI STATUS as well )
  falv->add_button(
    exporting
      iv_function  = falv->fc_mass_replace
       iv_icon      = icon_replace
*      iv_quickinfo =
*      iv_butn_type =
*      iv_disabled  =
       iv_text      = 'Mass replace'
*      iv_checked   =
  ).

  "Display full screen grid
  falv->display( ).
