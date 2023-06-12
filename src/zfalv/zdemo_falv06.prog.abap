"! This is demo for FALV full screen with layout changes
"! done by Lukasz Pegiel for http://abapblog.com
report zdemo_falv06.

types: begin of t_sflight,
         mark type bcselect.
        include type sflight.
types: end of t_sflight.

data: sflight type standard table of t_sflight.


parameter: p_usemar as checkbox.

start-of-selection.


  select * up to 100 rows
  into corresponding fields of table @sflight
  from sflight.

  "FALV creation with only table passed
  data(falv) = zcl_falv=>create( changing ct_table = sflight ).

  "Add title variable
  falv->title_v1 = 'ZDEMO_FALV06'.

  "All layout settings have set method in layout object of FALV
  "it can be udated before output or during runtime of program
  falv->layout->set_zebra( abap_true  ).
  falv->layout->set_no_merging( abap_true ).

  "additionally there is a attribute mark field which when is set
  "then fcat for it is changed so it's checkbox field and
  "when you'll use standard select all/deselect all functions then
  "it will check/uncheck checkbox instead of selecting/deselecting rows
  if p_usemar eq abap_true.
    falv->set_mark_field( 'MARK' ).
  endif.

  "user Layout option save changed to user-specific only
  falv->layout_save = 'U'.
  "Display full screen grid
  falv->display( ).
