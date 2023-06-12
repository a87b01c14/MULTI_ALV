FUNCTION Z_FALV_MASS_REPLACE.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     REFERENCE(IO_GRID) TYPE REF TO  CL_GUI_ALV_GRID
*"  CHANGING
*"     REFERENCE(CT_OUTTAB) TYPE  STANDARD TABLE
*"----------------------------------------------------------------------
  data: ft_rsparams type rsparams_tt.
  data: f_lines type i.
  data: f_num(2) type n.
  data: f_index type i.
  data: f_field type string.
  data: f_changed type flag.
  data: f_tabix type i.
  data: f_space like line of ft_rsparams.

  field-symbols: <paramsf> like line of ft_rsparams.
  field-symbols: <paramst> like line of ft_rsparams.
  field-symbols: <paramsc> like line of ft_rsparams.
  field-symbols: <params_save> like line of ft_rsparams.
  field-symbols: <outtab> type any table.
  field-symbols: <outtab_ref> type any table.
  field-symbols: <outp> type any.
  field-symbols: <value> type lvc_s_modi-value.
  field-symbols: <out_line> type lvc_t_styl.
  field-symbols: <style> type lvc_s_styl.
  field-symbols: <any> type any.
  if io_grid->is_ready_for_input( ) eq 0.
    message s001(00) display like 'W' with 'Grid should be in edit mode in order to use this function!'(E01).
    return.
  endif.

  io_grid->get_frontend_layout(
    importing
      es_layout = data(layout)
  ).

  io_grid->get_frontend_fieldcatalog(
  importing
    et_fieldcatalog = data(fcat)
    ).

  io_grid->get_filtered_entries(
      importing
        et_filtered_entries = data(filtered)
     ).

  io_grid->get_selected_rows(
      importing
        et_row_no     =  data(selected_rows)
    ).

  io_grid->get_selected_columns(
  importing
    et_index_columns = data(selected_cols)
    ).

  sort selected_rows by row_id.

  "remove not editable fields
  if layout-edit eq abap_false. "full grid editable
    delete fcat where edit eq abap_false.
    if fcat is initial.
      message s001(00) display like 'W' with 'No editable fields in the grid'(E02).
      return.
    endif.
  endif.
  sort fcat by fieldname.
  loop at selected_cols assigning field-symbol(<col>).
    data(tabix) = sy-tabix.
    read table fcat with key fieldname = <col>-fieldname transporting no fields binary search.
    if sy-subrc ne 0.
      delete selected_cols index tabix.
    endif.
  endloop.
  if sy-subrc eq 0.
    if selected_cols[] is initial.
      message s001(00) display like 'W' with 'Please select editable fields only'(E03).
      return.
    endif.
  endif.

  if selected_cols[] is initial.
    message s001(00) display like 'W' with 'Please select at least one column!'(E04).
    return.
  endif.

  if lines( selected_cols ) gt 10.
    message s001(00) display like 'W' with 'Maximum number of columns in mass change function is 10'(E05).
    return.
  endif.

  loop at selected_cols assigning <col>.
    data(fieldname) = |G_{ <col>-fieldname }|.
    assign (fieldname) to <any>.
    if sy-subrc eq 0.
      <any> = 'X'.
      read table fcat with key fieldname = <col>-fieldname assigning field-symbol(<fcat>) binary search.
      if sy-subrc eq 0.
        fieldname = |PD{ <col>-fieldname }|.
        assign (fieldname) to <any>.
        if sy-subrc eq 0.
          <any> = <fcat>-scrtext_s.
        endif.
      endif.
    endif.
  endloop.

  if <out> is not assigned. "can happen when not called from Full Screen FALV
    data(output) = new lcl_output( cast #( io_grid ) ).
    assign output to <out>.
  endif.
  refresh <out>->mass_repl_params .
  sort fcat by col_pos.

  data: act_sessions type sta_cntre,
        max_sessions type sta_cntre.

  call function 'TH_USER_INFO'
    importing
      act_sessions = act_sessions
      max_sessions = max_sessions.

  if max_sessions - act_sessions gt 0.
    <out>->wait_for_mass_repl = abap_true.
    call function 'Z_FALV_CALL_MASS_SS'
      destination 'NONE'
      starting new task 'ZFALVMASSR'
      calling <out>->end_of_ss1001 on end of task
      exporting
        it_mass_sel_columns = selected_cols
        it_fcat_mass        = fcat.
  else.
    message s001(00) display like 'W' with 'No more free sessions. Close one window.'(E06).
    return.
  endif.
  wait until <out>->wait_for_mass_repl eq abap_false.

  sort <out>->mass_repl_params by selname.
  clear f_num.
  data: f_row type i.
  data: ft_delta type lvc_t_modi.
  data: fs_delta type lvc_s_modi.
  ft_rsparams[] = <out>->mass_repl_params[].
  sort ft_rsparams by selname.
  clear f_num.
  loop at fcat assigning <fcat>.
    read table selected_cols[] with key fieldname = <fcat>-fieldname transporting no fields." binary search.
    " if sy-subrc eq 0. " ATC: Maximum nesting depth is 9 => exceeds limit 8
    IF sy-subrc <> 0.
      CONTINUE.
    ENDIF.

      add 1 to f_num.
      concatenate 'P_PARC' f_num into f_field.
      read table ft_rsparams assigning <paramsc> with key selname = f_field binary search.
      if sy-subrc ne 0.
        assign f_space to <paramsc>.
      endif.
      concatenate 'P_PARF' f_num into f_field.
      read table ft_rsparams assigning <paramsf> with key selname = f_field binary search.
      if sy-subrc eq 0.
        concatenate 'P_PART' f_num into f_field.
        read table ft_rsparams assigning <paramst> with key selname = f_field binary search.
        if sy-subrc eq 0 and ( <paramsf>-low ne <paramst>-low  or <paramsc>-low eq abap_true ).
          loop at ct_outtab assigning <outp>.
            f_row = sy-tabix.
            if filtered[] is not initial.
              read table filtered with key table_line = f_row transporting no fields.
              if sy-subrc eq 0.
                continue.
              endif.
            endif.
            if selected_rows[] is not initial.
              read table selected_rows with key row_id = f_row transporting no fields binary search.
              if sy-subrc ne 0. "only selected rows can be changed.
                continue.
              endif.
            endif.
            assign component <fcat>-fieldname of structure <outp> to <any>.
            if sy-subrc eq 0 and ( <any> eq <paramsf>-low or <paramsc>-low eq abap_true ).
              "check if field is not disabled in row :)
              if layout-stylefname is not initial.
                assign component layout-stylefname of structure <outp> to <out_line>.
                if sy-subrc eq 0.
                  read table <out_line> with key fieldname = <fcat>-fieldname assigning <style>.
                  if sy-subrc eq 0 and <style>-style eq cl_gui_alv_grid=>mc_style_disabled.
                    "do not change that cell as it's not editable.
                    continue.
                  endif.
                endif.
              endif.

              "<any> = <paramst>-low. "direct assignment not needed and may be dangerous if some
                                      "rules are set in the events like data_change
              clear fs_delta.
              fs_delta-fieldname = <fcat>-fieldname.
              fs_delta-row_id    = f_row.
              fs_delta-value = <paramst>-low.
              append fs_delta to ft_delta.

              f_changed = abap_true.
            endif.
          endloop.
        endif.
      endif.
    " endif.
  endloop.

  if f_changed eq abap_true.
    sy-ucomm = 'MASSREPL'.
    "<outtab_ref> = <outtab>.
    io_grid->set_delta_cells(
      exporting
        it_delta_cells  = ft_delta    " Delta Table
        i_modified      = abap_true    " Modified
        i_frontend_only = abap_true   " Update only at Frontend
    ).
    sy-ucomm = space.
    io_grid->check_changed_data( ).
  endif.





ENDFUNCTION.
