FUNCTION zfm_alv_multi_display.
*"----------------------------------------------------------------------
*"*"本地接口：
*"  IMPORTING
*"     REFERENCE(IO_ALV) TYPE REF TO  ZCL_ALV_MULTI
*"     REFERENCE(IV_POPUP) TYPE  ABAP_BOOL OPTIONAL
*"     REFERENCE(IV_TITLE) TYPE  LVC_TITLE OPTIONAL
*"     REFERENCE(IV_MODE) TYPE  ZCL_ALV_MULTI=>TY_ALV_MODE
*"     REFERENCE(IT_EVENTS) TYPE  SLIS_T_EVENT OPTIONAL
*"     REFERENCE(IV_START_ROW) TYPE  I
*"     REFERENCE(IV_START_COLUMN) TYPE  I
*"     REFERENCE(IV_END_ROW) TYPE  I
*"     REFERENCE(IV_END_COLUMN) TYPE  I
*"     REFERENCE(IV_SAVE_ENABLED) TYPE  ABAP_BOOL DEFAULT ABAP_FALSE
*"     REFERENCE(IV_STATUS_PROGRAM) TYPE  BUS_SCREEN-PROGRAM_NAME
*"       DEFAULT 'SAPLZFG_ALV_MULTI'
*"     REFERENCE(IV_STATUS_KEY) TYPE  BUS_SCREEN-STATUS_KEY DEFAULT
*"       'BUS_MAIN_SCREEN'
*"     REFERENCE(IT_FUNCTION) TYPE  ZCL_ALV_MULTI=>TT_FUNCTION_ENABLED
*"       OPTIONAL
*"----------------------------------------------------------------------

  go_alv = io_alv.gv_popup = iv_popup.gv_mode = iv_mode.
  gv_start_row = iv_start_row.gv_start_column = iv_start_column.
  gv_end_row = iv_end_row.gv_end_column = iv_end_column.
  gv_title = iv_title.
  gt_events = it_events.
  gv_save_enabled = iv_save_enabled.
  gv_status_program = iv_status_program.
  gv_status_key = iv_status_key.
  gt_function = it_function.
  IF gv_status_program IS NOT INITIAL AND gv_status_key IS NOT INITIAL.
    gv_no_toolbar = abap_false.
  ELSE.
    gv_no_toolbar = abap_true.
    IF gv_save_enabled = abap_true.
      gv_status_program = gc_program_name.
      gv_status_key = gc_status_key.
    ENDIF.
  ENDIF.
  IF lines( go_alv->mt_alvs ) > 20."水平ALV最多只能显示20个
    gv_mode = zcl_alv_multi=>alv_mode-vertical.
  ENDIF.

  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  lcl_application=>start_from_transaction( ).
  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""





ENDFUNCTION.
