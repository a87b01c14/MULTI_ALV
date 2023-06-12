"! This is demo for FALV with error log
"! done by Lukasz Pegiel for http://abapblog.com
report zdemo_falv12.

data: sflight type standard table of sflight.


parameters: p_embeed radiobutton group gr1 default 'X',
            p_notemb radiobutton group gr1.


start-of-selection.


  select * up to 100 rows
  into corresponding fields of table @sflight
  from sflight.

  "FALV creation with only table passed

  if p_embeed eq abap_true.
   data(falv) = zcl_falv=>create( exporting i_applog_embedded = abap_true  changing ct_table = sflight ).
  else.
   falv = zcl_falv=>create( changing ct_table = sflight ).
  endif.
  "Add title variable
  falv->title_v1 = 'ZDEMO_FALV12'.

    "set whole grid editable
   falv->layout->set_edit( abap_true ).
    "Change grid to edit mode
  falv->set_editable( iv_modify = abap_true ).

  "Display full screen grid
  falv->display( ).
