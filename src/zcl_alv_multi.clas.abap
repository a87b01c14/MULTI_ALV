class ZCL_ALV_MULTI definition
  public
  final
  create public .

public section.

  types:
    BEGIN OF ty_hide,
        fieldname TYPE lvc_fname,
      END OF ty_hide .
  types:
    tt_hide TYPE HASHED TABLE OF ty_hide WITH UNIQUE KEY fieldname .
  types:
    BEGIN OF ty_text,
        fieldname TYPE lvc_fname,
        text      TYPE string,
      END OF ty_text .
  types:
    tt_text TYPE HASHED TABLE OF ty_text WITH UNIQUE KEY fieldname .
  types:
    BEGIN OF ty_alvs,
        title     TYPE lvc_title,      "标题
        handle    TYPE slis_handl,     "句柄 布局用
        repid     TYPE sy-repid,       "程序ID
        it_hide   TYPE tt_hide,         "隐藏列
        it_text   TYPE tt_text,         "列描述
        table     TYPE REF TO data,    "存放ALV内表数据
        falv      TYPE REF TO zcl_falv, "FALV
        is_showed TYPE abap_bool,    "是否已经显示过，显示过的话后续用刷新显示
        index     TYPE i,    "当前是第几个ALV
      END OF ty_alvs .
  types:
    tt_alvs TYPE STANDARD TABLE OF ty_alvs .
  types:
    BEGIN OF ENUM ty_alv_mode STRUCTURE alv_mode,
        horizontal,"水平平铺
        vertical,"垂直
      END OF ENUM ty_alv_mode STRUCTURE alv_mode .
  types:
    BEGIN OF ty_function_enabled,
        enabled       TYPE bus_screen-boolean,
        function_code TYPE bus_screen-function_code,
      END OF ty_function_enabled .
  types:
    tt_function_enabled TYPE STANDARD TABLE OF ty_function_enabled .

  constants GC_FUNCTION_CODE_SAVE type BUS_SCREEN-FUNCTION_CODE value 'BUS_MAIN_SAVE' ##NO_TEXT.
  data MV_POPUP type ABAP_BOOL .
  data MV_MODE type TY_ALV_MODE .
  data MV_TITLE type LVC_TITLE .
  data MT_ALVS type TT_ALVS .
  data MV_SAVE_ENABLED type ABAP_BOOL .
  data MV_STATUS_PROGRAM type BUS_SCREEN-PROGRAM_NAME .
  data MV_STATUS_KEY type BUS_SCREEN-STATUS_KEY .
  data MT_FUNCTION type TT_FUNCTION_ENABLED .
  data CB_PROCESS_AFTER_INPUT type SLIS_FORMNAME value 'FRM_PROCESS_AFTER_INPUT' ##NO_TEXT.
  data CB_BEFORE_SHOW_ALV type SLIS_FORMNAME value 'FRM_BEFORE_SHOW_ALV' ##NO_TEXT.
  constants:
    BEGIN OF events,
        before_show_alv     TYPE slis_formname VALUE 'BEFORE_SHOW_ALV',
        process_after_input TYPE slis_formname VALUE 'PROCESS_AFTER_INPUT',
      END OF events .

  methods CONSTRUCTOR
    importing
      value(IV_POPUP) type ABAP_BOOL optional
      value(IV_TITLE) type LVC_TITLE optional
      value(IV_CB_BEFORE_SHOW_ALV) type NA_RONAM optional
      value(IV_CB_PROCESS_AFTER_INPUT) type NA_RONAM optional
      value(IV_MODE) type TY_ALV_MODE default ALV_MODE-HORIZONTAL
      value(IT_EVENTS) type SLIS_T_EVENT optional
      value(IT_ALVS) type TT_ALVS
      value(IV_SAVE_ENABLED) type ABAP_BOOL default ABAP_FALSE
      value(IV_STATUS_PROGRAM) type BUS_SCREEN-PROGRAM_NAME optional
      value(IV_STATUS_KEY) type BUS_SCREEN-STATUS_KEY optional
      value(IT_FUNCTION) type TT_FUNCTION_ENABLED optional .
  methods DISPLAY
    importing
      value(IV_START_ROW) type I optional
      value(IV_START_COLUMN) type I optional
      value(IV_END_ROW) type I optional
      value(IV_END_COLUMN) type I optional .
  methods ON_PROCESS_AFTER_INPUT
    importing
      value(IV_FUNCTION_CODE) type BUS_SCREEN-FUNCTION_CODE .
  methods ON_BEFORE_SHOW_ALV
    importing
      value(IS_ALVS) type TY_ALVS .
  methods GET_ALV_INDEX
    importing
      value(IO_FALV) type ref to ZCL_FALV
    returning
      value(RV_INDEX) type I .
  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA mt_events TYPE slis_t_event.
ENDCLASS.



CLASS ZCL_ALV_MULTI IMPLEMENTATION.


  METHOD constructor.
    mt_alvs = it_alvs.
    mv_popup = iv_popup.
    mv_mode = iv_mode.
    mv_title = iv_title.
    mt_events = it_events.
    mv_save_enabled = iv_save_enabled.
    mv_status_program = iv_status_program.
    mv_status_key = iv_status_key.
    mt_function = it_function.
    IF iv_cb_before_show_alv IS SUPPLIED.
      cb_before_show_alv = iv_cb_before_show_alv.
    ELSEIF it_events IS SUPPLIED.
      READ TABLE it_events INTO DATA(ls_events) WITH KEY name = events-before_show_alv.
      IF sy-subrc = 0.
        cb_before_show_alv = ls_events-form.
      ENDIF.
    ENDIF.
    IF iv_cb_process_after_input IS SUPPLIED.
      cb_process_after_input = iv_cb_process_after_input.
    ELSEIF it_events IS SUPPLIED.
      READ TABLE it_events INTO ls_events WITH KEY name = events-process_after_input.
      IF sy-subrc = 0.
        cb_process_after_input = ls_events-form.
      ENDIF.
    ENDIF.
  ENDMETHOD.


  METHOD on_before_show_alv.
    PERFORM (cb_before_show_alv) IN PROGRAM (sy-cprog) IF FOUND USING is_alvs .
  ENDMETHOD.


  METHOD display.
    IF mv_popup = abap_true AND iv_start_row IS INITIAL
                            AND iv_start_column IS INITIAL
                            AND iv_end_row IS INITIAL
                            AND iv_end_column IS INITIAL.

      iv_start_row = 1.
      iv_start_column = 1.
      iv_end_row = 20.
      iv_end_column = 150.
    ENDIF.
    CALL FUNCTION 'ZFM_ALV_MULTI_DISPLAY'
      EXPORTING
        io_alv            = me
        iv_popup          = mv_popup
        iv_title          = mv_title
        iv_mode           = mv_mode
        it_events         = mt_events
        it_function       = mt_function
        iv_save_enabled   = mv_save_enabled
        iv_status_program = mv_status_program
        iv_status_key     = mv_status_key
        iv_start_row      = iv_start_row
        iv_start_column   = iv_start_column
        iv_end_row        = iv_end_row
        iv_end_column     = iv_end_column.
  ENDMETHOD.


  METHOD get_alv_index.
    LOOP AT mt_alvs INTO DATA(ls_alv).
      IF ls_alv-falv = io_falv.
        rv_index = ls_alv-index.
        RETURN.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.


  METHOD on_process_after_input.
    PERFORM (cb_process_after_input) IN PROGRAM (sy-cprog) IF FOUND USING iv_function_code . "TYPE BUS_SCREEN-FUNCTION_CODE
  ENDMETHOD.
ENDCLASS.
