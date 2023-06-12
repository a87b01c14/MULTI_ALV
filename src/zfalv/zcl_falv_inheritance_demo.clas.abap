class zcl_falv_inheritance_demo definition
  public
  inheriting from zcl_falv.

  public section.
    class-methods: class_call_test changing c_tab type standard table.
  protected section.
    methods evf_hotspot_click redefinition.
    methods evf_top_of_page redefinition.
  private section.
endclass.



class zcl_falv_inheritance_demo implementation.

  method evf_hotspot_click.
    case e_column_id-fieldname.
      when 'SEATSMAX'.
        call function 'POPUP_DISPLAY_MESSAGE'
          exporting
            titel = 'Hotspot is working'   " Title
            msgid = '00'
            msgty = 'I'
            msgno = '001'
            msgv1 = 'Yupi!'.
    endcase.
  endmethod.

  method evf_top_of_page.

    e_dyndoc_id->add_text( text = 'Top Of Page' sap_style = cl_dd_area=>heading ).

    e_dyndoc_id->new_line( repeat = 1 ).

    e_dyndoc_id->add_link(
      exporting
        name                   =  'ABAPBLOG.com'   " Name (You Can Use Any Name You Choose)
        url                    =   'http://abapblog.com'  " URL
        tooltip                =  'ABAPBLOG.com'   " Tool Tip
        text                   =  'ABAPBLOG.com'    " Text
    ).


  endmethod.
  method class_call_test.
    "creation of falv with global class redefinition and without passing subclass type
    data falv type ref to zcl_falv_inheritance_demo.

    falv ?=  zcl_falv_inheritance_demo=>create( changing ct_table = c_tab ).


    falv->column( 'SEATSMAX' )->set_hotspot( abap_true ).
    falv->title_v1 = 'ZDEMO_FALV17'.

    falv->top_of_page_height = 100. "absolute size
    falv->show_top_of_page( ).

    falv->display( ).
  endmethod.

endclass.
