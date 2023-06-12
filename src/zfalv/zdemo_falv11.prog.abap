"! This is demo for FALV with edit settings
"! done by Lukasz Pegiel for http://abapblog.com
report zdemo_falv11.

types: begin of t_sflight.
        include type sflight.
types:  styles type lvc_t_styl,
        end of t_sflight.

data: sflight type standard table of t_sflight.


parameters: p_whole  radiobutton group gr1 default 'X',
            p_column radiobutton group gr1,
            p_cell   radiobutton group gr1.


start-of-selection.


  select * up to 100 rows
  into corresponding fields of table @sflight
  from sflight.

  "FALV creation with only table passed
  data(falv) = zcl_falv=>create( changing ct_table = sflight ).

  "Add title variable
  falv->title_v1 = 'ZDEMO_FALV11'.

  if p_whole eq abap_true.
    "set whole grid editable
    falv->layout->set_edit( abap_true ).
  elseif p_column eq abap_true.
    falv->column( 'SEATSMAX' )->set_edit( abap_true ).
    falv->column( 'PLANETYPE' )->set_edit( abap_true ).
  else.
    "Set style column name
    falv->layout->set_stylefname( 'STYLES' ).
    do 20 times.
      falv->set_cell_enabled(
        exporting
          iv_fieldname = 'FLDATE'
          iv_row       = 2 * sy-index
          ).
    enddo.
  endif.

  "Change grid to edit mode
  falv->set_editable( iv_modify = abap_true ).

  "Display full screen grid
  falv->display( ).
