"! This is demo for FALV full screen with color settings
"! done by Lukasz Pegiel for http://abapblog.com

report zdemo_falv10.

types: begin of t_sflight.
        include type sflight.
types:  cell_color type lvc_t_scol,
        row_color  type char4,
        end of t_sflight.

data: sflight type standard table of t_sflight.

start-of-selection.


  select * up to 100 rows
  into corresponding fields of table @sflight
  from sflight.

  "FALV creation with only table passed
  data(falv) = zcl_falv=>create( changing ct_table = sflight ).

  "Add title variable
  falv->title_v1 = 'ZDEMO_FALV10'.


  "Changing some of field catalog settings for column colors
  falv->column( 'SEATSMAX' )->set_color( 'C700' ).

  "setting of color fields -> this must be done before calling
  "set_row_colors or set_cell_color
  falv->layout->set_ctab_fname( 'CELL_COLOR' ).
  falv->layout->set_info_fname( 'ROW_COLOR'  ).

  "change some row colors
  do 10 times.
    falv->set_row_color(
      exporting
        iv_color = 'C300'
        iv_row   = 2 * sy-index
    ).
  enddo.

  "change some cell colors.
  do 10 times.
    falv->set_cell_color(
      exporting
        iv_fieldname = 'PLANETYPE'
        iv_color     = value #( col = 5 int = 0 inv = 0  )
        iv_row       = 3 * sy-index
    ).

  enddo.



  "Display full screen grid
  falv->display( ).
