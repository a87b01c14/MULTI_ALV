CLASS zcl_alv_multi DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    TYPES:
      "隐藏列
      BEGIN OF ty_hide,
        fieldname TYPE lvc_fname,
      END OF ty_hide,
      tt_hide TYPE HASHED TABLE OF ty_hide WITH UNIQUE KEY fieldname,
      "列描述
      BEGIN OF ty_text,
        fieldname TYPE lvc_fname,
        text      TYPE string,
      END OF ty_text,
      tt_text TYPE HASHED TABLE OF ty_text WITH UNIQUE KEY fieldname,
      "多ALV参数
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
      END OF ty_alvs,
      tt_alvs TYPE STANDARD TABLE OF ty_alvs.

    TYPES: BEGIN OF ENUM ty_alv_mode STRUCTURE alv_mode,
             horizontal,"水平平铺
             vertical,"垂直
           END OF ENUM ty_alv_mode STRUCTURE alv_mode .

    DATA mv_popup TYPE abap_bool .
    DATA mv_mode TYPE ty_alv_mode .
    DATA mv_title TYPE lvc_title .
    DATA mt_alvs TYPE tt_alvs .
    DATA cb_before_show_alv TYPE slis_formname VALUE 'FRM_BEFORE_SHOW_ALV'.

    CONSTANTS:
      BEGIN OF events,
        before_show_alv TYPE slis_formname VALUE 'BEFORE_SHOW_ALV',
      END OF events.

    METHODS constructor
      IMPORTING
        VALUE(iv_popup)              TYPE abap_bool OPTIONAL
        VALUE(iv_title)              TYPE lvc_title OPTIONAL
        VALUE(iv_cb_before_show_alv) TYPE na_ronam OPTIONAL
        VALUE(iv_mode)               TYPE ty_alv_mode DEFAULT alv_mode-horizontal
        VALUE(it_events)             TYPE slis_t_event OPTIONAL
        VALUE(it_alvs)               TYPE tt_alvs .
    METHODS display
      IMPORTING
        VALUE(iv_start_row)    TYPE i OPTIONAL
        VALUE(iv_start_column) TYPE i OPTIONAL
        VALUE(iv_end_row)      TYPE i OPTIONAL
        VALUE(iv_end_column)   TYPE i OPTIONAL .
    METHODS on_before_show_alv
      IMPORTING
        VALUE(is_alvs) TYPE ty_alvs .
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
    IF iv_cb_before_show_alv IS SUPPLIED.
      cb_before_show_alv = iv_cb_before_show_alv.
    ELSEIF it_events IS SUPPLIED.
      READ TABLE it_events INTO DATA(ls_events) WITH KEY name = events-before_show_alv.
      IF sy-subrc = 0.
        cb_before_show_alv = ls_events-form.
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
        io_alv          = me
        iv_popup        = mv_popup
        iv_title        = mv_title
        iv_mode         = mv_mode
        it_events       = mt_events
        iv_start_row    = iv_start_row
        iv_start_column = iv_start_column
        iv_end_row      = iv_end_row
        iv_end_column   = iv_end_column.
  ENDMETHOD.
ENDCLASS.
