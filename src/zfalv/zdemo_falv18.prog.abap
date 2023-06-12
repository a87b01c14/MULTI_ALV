"! done by Lukasz Pegiel for http://abapblog.com
report zdemo_falv18.

data: sflight type standard table of sflight.


start-of-selection.

  select * up to 100 rows
  into corresponding fields of table @sflight
  from sflight. "#EC CI_NOWHERE

  data(falv) =  zcl_falv=>create( changing ct_table = sflight ).


  falv->column( 'SEATSMAX' )->set_hotspot( abap_true )->set_color( falv->color-light_blue_itensified ).
  falv->layout->set_cwidth_opt( abap_true )->set_no_toolbar( abap_true ).

  falv->display( ).
