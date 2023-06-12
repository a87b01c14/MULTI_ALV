"! This is demo for FALV full screen with fieldcatalog update
"! done by Lukasz Pegiel for http://abapblog.com

report zdemo_falv07.

data: sflight type standard table of sflight.


start-of-selection.


  select * up to 10000 rows
  into corresponding fields of table @sflight
  from sflight.

  "FALV creation with only table passed
  data(falv) = zcl_falv=>create( changing ct_table = sflight ).

  "Add title variable
  falv->title_v1 = 'ZDEMO_FALV07'.


  "Changing some of field catalog settings
  falv->column( 'SEATSMAX' )->set_hotspot( abap_true ).
  falv->column( 'SEATSMAX' )->set_color( 'C700' ).

  falv->column( 'PLANETYPE' )->set_color( 'C300' ).
  falv->column( 'PLANETYPE' )->set_no_merging( abap_true ).

  falv->column( 'PAYMENTSUM' )->set_no_zero( abap_true ).
  "or

  data(price) = falv->column( 'PRICE' ).
  price->set_no_out( abap_true ).
  price->set_cfieldname( 'CURRENCY' ).
  data(occup) = falv->column( 'SEATSOCC' ).
  occup->set_no_zero( abap_true ).
  occup->set_no_merging( abap_true  ).



  "Display full screen grid
  falv->display( ).
