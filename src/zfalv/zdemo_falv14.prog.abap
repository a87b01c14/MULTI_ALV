"! This is demo for FALV standard fast call of pppup
"! done by Lukasz Pegiel for http://abapblog.com
report zdemo_falv14.

data: sflight type standard table of sflight.


parameters: p_defau  radiobutton group gr1 default 'X',
            p_set    radiobutton group gr1,
            p_rowst  type i,
            p_rowend type i,
            p_colst  type i,
            p_colend type i.

start-of-selection.


  select * up to 100 rows
  into corresponding fields of table @sflight
  from sflight.

  "FALV creation with only table passed
  data(falv) = zcl_falv=>create( exporting i_popup = abap_true changing ct_table = sflight ).

  "Add title variable
  falv->title_v1 = 'ZDEMO_FALV14'.

  if p_defau eq abap_true.
    "Display popup with default size
    falv->display( ).
  else.
    "display popup with customized size
    falv->display(
        iv_start_row    = p_rowst
        iv_start_column = p_colst
        iv_end_row      = p_rowend
        iv_end_column   = p_colend
    ).
  endif.
