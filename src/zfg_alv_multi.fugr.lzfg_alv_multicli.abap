*&---------------------------------------------------------------------*
*& 包含               LZFG_ALV_MULTICLI
*&---------------------------------------------------------------------*


CLASS lcl_abstract_dialog IMPLEMENTATION.


  METHOD clear_message.
    CLEAR gs_message.
  ENDMETHOD.




  METHOD collect_message.
    IF gs_message-msgty IS INITIAL.
      gs_message-msgty = sy-msgty.
      gs_message-msgid = sy-msgid.
      gs_message-msgno = sy-msgno.
      gs_message-msgv1 = sy-msgv1.
      gs_message-msgv2 = sy-msgv2.
      gs_message-msgv3 = sy-msgv3.
      gs_message-msgv4 = sy-msgv4.
    ENDIF.
  ENDMETHOD.

  METHOD show_message.
    IF NOT gs_message-msgty IS INITIAL.
      MESSAGE ID     gs_message-msgid
              TYPE  'S'
              NUMBER gs_message-msgno
              WITH   gs_message-msgv1
                     gs_message-msgv2
                     gs_message-msgv3
                     gs_message-msgv4.
    ELSE.

    ENDIF.
  ENDMETHOD.
ENDCLASS.



CLASS lcl_application IMPLEMENTATION.


  METHOD start_from_transaction.

    DATA lv_application TYPE REF TO lcl_application.


    CREATE OBJECT lv_application.
    CALL METHOD lv_application->start( ).
  ENDMETHOD.                    "lcl_application


  METHOD constructor.
*   Local data.
    DATA ls_area TYPE bus_screen-area.

    CALL METHOD super->constructor.



    CASE gv_mode.
      WHEN zcl_alv_multi=>alv_mode-horizontal."水平布局
        CALL METHOD cl_bus_abstract_screen=>get_screen
          EXPORTING
            iv_program_name  = gc_program_name
            iv_dynpro_number = gc_dynnr_9000
          IMPORTING
            ev_screen        = go_screen_9000.
*   Register the event handlers.
        SET HANDLER on_process_after_input FOR go_screen_9000.
      WHEN zcl_alv_multi=>alv_mode-vertical."垂直布局
        CALL METHOD cl_bus_abstract_screen=>get_screen
          EXPORTING
            iv_program_name  = gc_program_name
            iv_dynpro_number = gc_dynnr_9010
          IMPORTING
            ev_screen        = go_screen_9010.
*   Register the event handlers.
        SET HANDLER on_process_after_input FOR go_screen_9010.

    ENDCASE.



  ENDMETHOD.                    "lcl_application


  METHOD start.

    CASE gv_mode.
      WHEN zcl_alv_multi=>alv_mode-horizontal."水平布局
        go_screen_9000->set_title( gv_title ).
        IF gv_popup = abap_true.
          CALL METHOD go_screen_9000->show_as_popup(
              iv_xstart = gv_start_row
              iv_ystart = gv_start_column
              iv_width  = gv_end_column
              iv_height = gv_end_row ).
        ELSE."// 非弹出
          CALL METHOD go_screen_9000->show( ).
        ENDIF.
      WHEN zcl_alv_multi=>alv_mode-vertical.
        go_screen_9010->set_title( gv_title ).
        IF gv_popup = abap_true.
          CALL METHOD go_screen_9010->show_as_popup(
              iv_xstart = gv_start_row
              iv_ystart = gv_start_column
              iv_width  = gv_end_column
              iv_height = gv_end_row ).
        ELSE."// 非弹出
          CALL METHOD go_screen_9010->show( ).
        ENDIF.
    ENDCASE.

  ENDMETHOD.                    "lcl_application


  METHOD end.
  ENDMETHOD.                    "lcl_application



  METHOD dispatch.

    DATA lv_return_code TYPE i.
    DATA lv_dispatched  TYPE bus_locator-boolean.
    DATA lv_seq TYPE i.

    CALL METHOD cl_gui_cfw=>dispatch
      IMPORTING
        return_code = lv_return_code.
    IF lv_return_code NE cl_gui_cfw=>rc_noevent.
      ev_dispatched = abap_true.
      EXIT.
    ENDIF.



    CASE iv_function_code.
      WHEN cl_bus_abstract_main_screen=>gc_function_code_back
        OR cl_bus_abstract_main_screen=>gc_function_code_cancel
        OR cl_bus_abstract_main_screen=>gc_function_code_exit
        OR 'BACK' OR 'CANC' OR 'EXIT' OR 'CANCEL'.
        IF go_screen_9000 IS BOUND.
          go_screen_9000->go_container->free( ).
          go_screen_9000->free( ).
        ENDIF.

        IF go_screen_9010 IS BOUND.
          go_screen_9010->go_splitter->free( ).
          go_screen_9010->go_container->free( ).
          go_screen_9010->free( ).
        ENDIF.

        cl_bus_abstract_main_screen=>gv_current_main_screen->leave( ).
      WHEN OTHERS.
        """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        IF iv_function_code(12) = 'SCREEN_9000_'.
          go_current_falv->set_visible( abap_false ).
          lv_seq = iv_function_code+16(2).
          READ TABLE go_alv->mt_alvs ASSIGNING FIELD-SYMBOL(<fs_alv>) INDEX lv_seq.
          IF sy-subrc = 0.
            go_current_falv = <fs_alv>-falv.
            CHECK go_current_falv IS NOT INITIAL.
            go_current_falv->set_visible( abap_true ).
            IF <fs_alv>-is_showed = abap_false.
              go_current_falv->display( ).
              <fs_alv>-is_showed = abap_true.
            ELSE.
              go_current_falv->refresh_table_display( EXPORTING is_stable = VALUE #( row = 'X' col = 'X' ) ).
            ENDIF.
          ENDIF.
          go_screen_9000->mr_tabstrip->dispatch( EXPORTING iv_function_code = iv_function_code
                                                 IMPORTING ev_dispatched    = lv_dispatched ).
          go_screen_9000->pbo_begin( ).
        ENDIF.
    ENDCASE.

  ENDMETHOD.                    "lcl_application

  METHOD on_process_after_input.

    DATA lv_dispatched TYPE bu_boolean.


    CALL METHOD clear_message.

    CALL METHOD dispatch
      EXPORTING
        iv_function_code = iv_function_code
      IMPORTING
        ev_dispatched    = lv_dispatched.

    IF lv_dispatched IS INITIAL.
    ENDIF.


    CALL METHOD show_message.
  ENDMETHOD.                    "lcl_application

ENDCLASS.                    "lcl_application IMPLEMENTATION



CLASS lcl_screen_9000 IMPLEMENTATION.
  METHOD call_screen.
    CALL SCREEN iv_dynpro_number.
  ENDMETHOD.
  METHOD call_screen_starting_at.
    CALL SCREEN iv_dynpro_number STARTING AT iv_xstart iv_ystart
      ENDING AT iv_xend iv_yend.
  ENDMETHOD.

  METHOD pbo_begin.
    DATA lr_tab TYPE REF TO cl_bus_tabstrip_tab.
    DATA ls_area TYPE bus_screen_area.
    DATA lv_counter TYPE i.
    FIELD-SYMBOLS:<fs_table> TYPE ANY TABLE.
    IF mr_tabstrip IS NOT BOUND.
      me->add_tabstrip(
        EXPORTING
          iv_field_name_prefix    = 'GS_SCREEN_9000-TABSTRIP'
          iv_function_code_prefix = 'SCREEN_9000'
        IMPORTING
          ev_tabstrip             = mr_tabstrip
        CHANGING
          cs_tabstrip_control     = gs_screen_9000_tabstrip
          cs_tabstrip_fields      = gs_screen_9000-tabstrip ).



      ls_area-program_name = gc_program_name.
      ls_area-dynpro_number = gc_dynnr_9001.
      IF go_container IS NOT BOUND.
        CREATE OBJECT go_container
          EXPORTING
            container_name = CONV char100( gc_cont_name_9001 ).
      ENDIF.

      LOOP AT go_alv->mt_alvs ASSIGNING FIELD-SYMBOL(<fs_alv>).
        lv_counter += 1.
        <fs_alv>-index = lv_counter.
        mr_tabstrip->add_tab( IMPORTING ev_tab = lr_tab ).
        lr_tab->set_area( ls_area ).

        lr_tab->set_caption( iv_caption = |{ COND string( WHEN <fs_alv>-title IS NOT INITIAL
                                                          THEN <fs_alv>-title
                                                          ELSE |Tab { lv_counter }|  ) }| ).

        ASSIGN <fs_alv>-table->* TO <fs_table>.
        <fs_alv>-falv = zcl_falv=>create( EXPORTING i_parent  = go_container
                                                    i_repid   = sy-cprog
                                                    it_events = gt_events
                                          CHANGING  ct_table  = <fs_table> ).
        LOOP AT <fs_alv>-it_hide INTO DATA(ls_hide).
          <fs_alv>-falv->column( ls_hide-fieldname )->set_tech( abap_true ).
        ENDLOOP.
        LOOP AT <fs_alv>-it_text INTO DATA(ls_text).
          <fs_alv>-falv->column( ls_text-fieldname )->set_text( ls_text-text ).
        ENDLOOP.
        <fs_alv>-falv->layout->set_zebra( abap_true ).
        <fs_alv>-falv->layout->set_cwidth_opt( abap_true ).
        "Set Gui status to fully dynamic (no standard buttons of ALV Grid)
        <fs_alv>-falv->gui_status->fully_dynamic = abap_true.
        <fs_alv>-falv->layout->set_no_toolbar( abap_false ).
        go_alv->on_before_show_alv( <fs_alv> ).
        IF lv_counter = 1.
          go_current_falv = <fs_alv>-falv.
          <fs_alv>-is_showed = abap_true.
          <fs_alv>-falv->display( ).
          mr_tabstrip->set_active_tab( lr_tab ).
        ENDIF.
      ENDLOOP.

    ENDIF. "
    super->pbo_begin( ).
  ENDMETHOD.

  METHOD remove_tabstrip_tabs.
    IF me->mr_tabstrip IS BOUND.
      me->mr_tabstrip->remove_all_tabs( ).
      TRY.
          me->go_container->free( ).
          FREE me->go_container.
        CATCH cx_root INTO DATA(lo_error).
      ENDTRY.
    ENDIF.
  ENDMETHOD.

ENDCLASS.


CLASS lcl_screen_9010 IMPLEMENTATION.

  METHOD call_screen.
    CALL SCREEN iv_dynpro_number.
  ENDMETHOD.
  METHOD call_screen_starting_at.
    CALL SCREEN iv_dynpro_number STARTING AT iv_xstart iv_ystart
      ENDING AT iv_xend iv_yend.
  ENDMETHOD.

  METHOD pbo_begin.
    DATA lv_counter TYPE i.
    DATA: lv_height     TYPE i,
          lv_height_sum TYPE i.
    FIELD-SYMBOLS:<fs_table> TYPE ANY TABLE.
    IF go_container IS NOT BOUND.
      CREATE OBJECT go_container
        EXPORTING
          container_name = CONV char100( gc_cont_name_9010 ).

      """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
      "垂直布局ALV，需要splitter container
      IF go_splitter IS NOT BOUND.
        CREATE OBJECT go_splitter
          EXPORTING
            parent  = go_container
            rows    = lines( go_alv->mt_alvs )
            columns = 1.
      ENDIF.

      lv_height = 100 / lines( go_alv->mt_alvs ).
      LOOP AT go_alv->mt_alvs ASSIGNING FIELD-SYMBOL(<fs_alv>).
        AT LAST.
          lv_height = 100 - lv_height_sum.
        ENDAT.
        lv_counter += 1.
        <fs_alv>-index = lv_counter.
        lv_height_sum += lv_height.
        go_splitter->set_row_height( id = lv_counter height = lv_height ).

        ASSIGN <fs_alv>-table->* TO <fs_table>.
        <fs_alv>-falv = zcl_falv=>create( EXPORTING i_parent = go_splitter->get_container( row = lv_counter column = 1 )
                                                    i_repid = sy-cprog
                                                    it_events = gt_events
                                          CHANGING ct_table = <fs_table> ).
        LOOP AT <fs_alv>-it_hide INTO DATA(ls_hide).
          <fs_alv>-falv->column( ls_hide-fieldname )->set_tech( abap_true ).
        ENDLOOP.
        LOOP AT <fs_alv>-it_text INTO DATA(ls_text).
          <fs_alv>-falv->column( ls_text-fieldname )->set_text( ls_text-text ).
        ENDLOOP.
        <fs_alv>-falv->layout->set_zebra( abap_true ).
        <fs_alv>-falv->layout->set_cwidth_opt( abap_true ).
        "Set Gui status to fully dynamic (no standard buttons of ALV Grid)
        <fs_alv>-falv->gui_status->fully_dynamic = abap_true.
        <fs_alv>-falv->layout->set_no_toolbar( abap_false ).
        <fs_alv>-falv->layout->set_grid_title( <fs_alv>-title ).
        go_alv->on_before_show_alv( <fs_alv> ).
        <fs_alv>-falv->display( ).
      ENDLOOP.
    ENDIF.
    super->pbo_begin( ).
  ENDMETHOD.
ENDCLASS.

**********************************************************************
* 下面这个FORM会被BUS框架调用
**********************************************************************
FORM bus_screen_create USING iv_program_name TYPE bus_screen-program_name
                             iv_dynpro_number TYPE bus_screen-dynpro_number
                       CHANGING ev_screen TYPE any.         "#EC CALLED
  CASE iv_dynpro_number.
    WHEN gc_dynnr_9000.
      CREATE OBJECT ev_screen TYPE lcl_screen_9000
        EXPORTING
          iv_program_name  = iv_program_name
          iv_dynpro_number = iv_dynpro_number.
    WHEN gc_dynnr_9010.
      CREATE OBJECT ev_screen TYPE lcl_screen_9010
        EXPORTING
          iv_program_name  = iv_program_name
          iv_dynpro_number = iv_dynpro_number.
  ENDCASE.
ENDFORM.
