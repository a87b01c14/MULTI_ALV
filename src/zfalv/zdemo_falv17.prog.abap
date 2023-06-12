"! done by Lukasz Pegiel for http://abapblog.com
report zdemo_falv17.

data: sflight type standard table of sflight.


parameters: p_class radiobutton group gr1,
            p_fm    radiobutton group gr1,
            p_prog  radiobutton group gr1 default 'X'.

start-of-selection.

  select * up to 100 rows
  into corresponding fields of table @sflight
  from sflight.


  if p_class eq abap_true.
    zcl_falv_inheritance_demo=>class_call_test(
      changing
        c_tab = sflight
                                               ).
  elseif p_fm eq abap_true.

    call function 'Z_FALV_INHERITANCE_DEMO'
      tables
        c_tab = sflight
      .

  else.
  "creation of falv with global class redefinition and without passing subclass type
  data falv type ref to zcl_falv_inheritance_demo.

  falv ?=  zcl_falv_inheritance_demo=>create( changing ct_table = sflight ).


  falv->column( 'SEATSMAX' )->set_hotspot( abap_true ).
  falv->title_v1 = 'ZDEMO_FALV17'.

  falv->top_of_page_height = 100. "absolute size
  falv->show_top_of_page( ).

  falv->display( ).

  endif.
