"! This is demo for FALV standard fast call
"! done by Lukasz Pegiel for http://abapblog.com
report zdemo_falv01.

data: sflight type standard table of sflight.


start-of-selection.


  select * up to 100 rows
  into corresponding fields of table @sflight
  from sflight.

  "FALV creation with only table passed
  data(falv) = zcl_falv=>create( changing ct_table = sflight ).

  "Add title variable
  falv->title_v1 = 'ZDEMO_FALV01'.

  "Display full screen grid
  falv->display( ).
