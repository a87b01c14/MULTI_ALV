report zdemo_falv16.


data: spfli       type standard table of spfli,
      sflight     type standard table of sflight,
      falv_first  type ref to zcl_falv,
      falv_second type ref to zcl_falv,
      splitter    type ref to cl_gui_splitter_container.

constants: custom_container_name type char30 value 'MAIN'.


initialization.

  select * up to 50 rows into corresponding fields of table @spfli
    from spfli. "#EC CI_NOWHERE

  select * up to 100 rows into corresponding fields of table @sflight
    from sflight. "#EC CI_NOWHERE


  call screen 0100.

module pbo output.
  set pf-status 'DYNAMIC_STATUS' of program 'SAPLZFALV'.

  if splitter is initial.
    splitter = new cl_gui_splitter_container( columns = 1
                                              rows = 2
                                              parent = new cl_gui_custom_container( container_name = custom_container_name )
                                             ).
    falv_first = zcl_falv=>create( exporting i_parent =  splitter->get_container(
                                                                                row       = 1
                                                                                column    = 1
                                                                            )
                                   changing ct_table = spfli ).

    falv_second = zcl_falv=>create( exporting i_parent = splitter->get_container(
                                                                                row       = 2
                                                                                column    = 1
                                                                            )
                                   changing ct_table = sflight ).

    falv_first->column( 'CONNID' )->set_editable( ).
    falv_first->set_editable(
            iv_modify = abap_true
                        ).

    falv_first->add_button(
        exporting
        iv_function  = zcl_falv=>fc_mass_replace
        iv_icon      = icon_replace
        ).

    falv_first->display( ).
    falv_second->display( ).
  endif.
endmodule.

module pai input.

  case sy-ucomm.
    when 'BACK' or 'UP' or 'EXIT'.
      leave to screen 0.
  endcase.

endmodule.
