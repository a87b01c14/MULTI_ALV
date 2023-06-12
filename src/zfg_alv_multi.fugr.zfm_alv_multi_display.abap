FUNCTION zfm_alv_multi_display.
*"----------------------------------------------------------------------
*"*"Local Interface:
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
*"----------------------------------------------------------------------

  go_alv = io_alv.gv_popup = iv_popup.gv_mode = iv_mode.
  gv_start_row = iv_start_row.gv_start_column = iv_start_column.
  gv_end_row = iv_end_row.gv_end_column = iv_end_column.
  gv_title = iv_title.
  gt_events = it_events.
  IF lines( go_alv->mt_alvs ) > 20."水平ALV最多只能显示20个
    gv_mode = zcl_alv_multi=>alv_mode-vertical.
  ENDIF.

  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  lcl_application=>start_from_transaction( ).
  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""





ENDFUNCTION.
