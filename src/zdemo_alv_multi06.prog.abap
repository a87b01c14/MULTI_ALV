*&---------------------------------------------------------------------*
*& Report ZDEMO_ALV_MULTI06
*&---------------------------------------------------------------------*
*& active save button
*&---------------------------------------------------------------------*
REPORT zdemo_alv_multi06.
DATA: lo_alv_multi TYPE REF TO zcl_alv_multi,
      lo_falv      TYPE REF TO zcl_falv.
DATA: gt_adrc TYPE STANDARD TABLE OF adrc.
DATA: gt_usr01 TYPE STANDARD TABLE OF usr01.
DATA: gt_usr21 TYPE STANDARD TABLE OF usr21.

START-OF-SELECTION.
  SELECT * FROM adrc UP TO 100 ROWS INTO TABLE @gt_adrc.
  SELECT * FROM usr01 UP TO 100 ROWS INTO TABLE @gt_usr01.
  SELECT * FROM usr21 UP TO 100 ROWS INTO TABLE @gt_usr21.
  lo_alv_multi = NEW zcl_alv_multi(
    iv_mode   = zcl_alv_multi=>alv_mode-vertical
    iv_title  = 'MULTI ALV DEMO06'
    iv_save_enabled = abap_true
    it_alvs   = VALUE #( ( title = 'ADRC' table = REF #( gt_adrc ) )
                         ( title = 'USR01' table = REF #( gt_usr01 ) )
                         ( title = 'USR21' table = REF #( gt_usr21 ) ) ) ).
  lo_alv_multi->display( ).

FORM frm_before_show_alv USING is_alvs TYPE zcl_alv_multi=>ty_alvs.
  TRY.
      CASE is_alvs-index.
        WHEN 1.
          is_alvs-falv->column( 'CLIENT' )->set_tech( abap_true ).
          is_alvs-falv->column( 'NATION' )->set_tech( abap_true ).
          is_alvs-falv->column( 'ADDRNUMBER' )->set_text( 'ADDRESS' )->set_hotspot( abap_true ).
          is_alvs-falv->layout->set_sel_mode( 'A' ).
          is_alvs-falv->add_button(
            EXPORTING
              iv_function = 'POST'
              iv_icon     = icon_checked
*             IV_QUICKINFO =
*             IV_BUTN_TYPE =
*             IV_DISABLED =
              iv_text     = 'POST'
*             IV_CHECKED  =
          ).
        WHEN 2.
          is_alvs-falv->column( 'MANDT' )->set_tech( abap_true ).
          is_alvs-falv->column( 'BNAME' )->set_hotspot( abap_true ).
        WHEN 3.
          is_alvs-falv->column( 'MANDT' )->set_tech( abap_true ).
          is_alvs-falv->column( 'BNAME' )->set_hotspot( abap_true ).
      ENDCASE.
    CATCH cx_root.
  ENDTRY.
ENDFORM.

FORM frm_user_command USING sender TYPE REF TO zcl_falv
                            p_ucomm TYPE sy-ucomm.
  DATA: lt_rows TYPE lvc_t_row.
  CASE p_ucomm.
    WHEN 'POST'.
      sender->get_selected_rows( IMPORTING et_index_rows = lt_rows ).
      IF lt_rows[] IS INITIAL.
        MESSAGE 'NO SELECTED ROWS' TYPE 'S' DISPLAY LIKE 'E'.
      ELSE.
        READ TABLE lt_rows INTO DATA(l_row) INDEX 1.
        READ TABLE gt_adrc INTO DATA(ls_adrc) INDEX l_row.
        MESSAGE |POST-{ ls_adrc-addrnumber }-{ ls_adrc-date_from  }| TYPE 'I'.
      ENDIF.
  ENDCASE.
ENDFORM.

FORM frm_hotspot_click USING sender TYPE REF TO zcl_falv
                             e_row_id TYPE lvc_s_row
                             e_column_id TYPE lvc_s_col
                             es_row_no TYPE lvc_s_roid.
  TRY.
      CASE lo_alv_multi->get_alv_index( sender ).
        WHEN 1.
          READ TABLE gt_adrc INTO DATA(gs_adrc) INDEX e_row_id-index.
          CHECK sy-subrc = 0.
          CASE e_column_id-fieldname .
            WHEN 'ADDRNUMBER' .
              MESSAGE |CLICK ROW { e_row_id-index }-{ gs_adrc-addrnumber }| TYPE 'I'.
          ENDCASE.
        WHEN 2.
          READ TABLE gt_usr01 INTO DATA(gs_usr01) INDEX e_row_id.
          CHECK sy-subrc = 0.
          CASE e_column_id-fieldname .
            WHEN 'BNAME' .
              MESSAGE |CLICK ROW { e_row_id-index }-{ gs_usr01-bname }| TYPE 'I'.
          ENDCASE.
        WHEN 3.
          READ TABLE gt_usr21 INTO DATA(gs_usr21) INDEX e_row_id.
          CHECK sy-subrc = 0.
          CASE e_column_id-fieldname .
            WHEN 'BNAME' .
              MESSAGE |CLICK ROW { e_row_id-index }-{ gs_usr21-bname }| TYPE 'I'.
          ENDCASE.
      ENDCASE.
    CATCH cx_root.
  ENDTRY.
ENDFORM.

FORM frm_process_after_input USING p_ucomm TYPE bus_screen-function_code.
  CASE p_ucomm.
    WHEN zcl_alv_multi=>gc_function_code_save.
      MESSAGE |Click { p_ucomm }| TYPE 'I'.
  ENDCASE.
ENDFORM.
