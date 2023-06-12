FUNCTION Z_FALV_CALL_MASS_SS.
*"--------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     VALUE(IT_MASS_SEL_COLUMNS) TYPE  LVC_T_COL
*"     VALUE(IT_FCAT_MASS) TYPE  LVC_T_FCAT
*"  EXPORTING
*"     VALUE(ET_RSPARAMS) TYPE  RSPARAMS_TT
*"--------------------------------------------------------------------
field-symbols: <col> like line of it_mass_sel_columns.
  data: ft_mass_sel_columns like it_mass_sel_columns.
  data: f_num(2) type n.


  ft_mass_sel_columns = it_mass_sel_columns.
  loop at it_fcat_mass assigning <fcat>.
    read table ft_mass_sel_columns[] with key fieldname = <fcat>-fieldname transporting no fields.
    if sy-subrc eq 0.
      add 1 to f_num.
      add_param_descr: f_num <fcat>-scrtext_s.
      change_parametr_type: f_num <fcat>-ref_table <fcat>-ref_field.
    endif.
  endloop.

  call selection-screen 1001 starting at 1 1.

  call function 'RS_REFRESH_FROM_SELECTOPTIONS'
    exporting
      curr_report           = sy-repid
* IMPORTING
*   SP                    = SP
    tables
      selection_table       = et_rsparams
   exceptions
     not_found             = 1
     no_report             = 2
     others                = 3
            .
  if sy-subrc <> 0.
* MESSAGE ID SY-MSGID TYPE SY-MSGTY NUMBER SY-MSGNO
*         WITH SY-MSGV1 SY-MSGV2 SY-MSGV3 SY-MSGV4.
  endif.





ENDFUNCTION.
