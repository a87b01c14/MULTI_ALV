*&---------------------------------------------------------------------*
*& Report ZDEMO_ALV_MULTI
*&---------------------------------------------------------------------*
*& 添加按钮
*&---------------------------------------------------------------------*
REPORT zdemo_alv_multi04.
DATA: lo_alv_multi TYPE REF TO zcl_alv_multi,
      lo_falv      TYPE REF TO zcl_falv.

START-OF-SELECTION.
  SELECT * FROM adrc UP TO 100 ROWS INTO TABLE @DATA(lt_table).
  SELECT * FROM usr01 UP TO 100 ROWS INTO TABLE @DATA(lt_usr01).
  SELECT * FROM usr21 UP TO 100 ROWS INTO TABLE @DATA(lt_usr21).
  lo_alv_multi = NEW zcl_alv_multi(
    iv_mode   = zcl_alv_multi=>alv_mode-vertical
*   iv_before_show_alv_callback = 'FRM_BEFORE_SHOW_ALV1'
    iv_title  = 'MULTI ALV DEMO04'
    it_events = VALUE #( ( name = zcl_alv_multi=>events-before_show_alv form = 'FRM_BEFORE_SHOW_ALV1' )
                         ( name = zcl_falv=>events-user_command form = 'FRM_USER_COMMAND1' ) )
    it_alvs   = VALUE #( ( title = 'ADRC' table = REF #( lt_table ) )
                         ( title = 'USR01' table = REF #( lt_usr01 ) )
                         ( title = 'USR21' table = REF #( lt_usr21 ) ) ) ).
  lo_alv_multi->display( ).

FORM frm_before_show_alv1 USING is_alvs TYPE zcl_alv_multi=>ty_alvs.
  TRY.
      CASE is_alvs-index.
        WHEN 1.
          is_alvs-falv->column( 'CLIENT' )->set_tech( abap_true ).
          is_alvs-falv->column( 'NATION' )->set_tech( abap_true ).
          is_alvs-falv->column( 'ADDRNUMBER' )->set_text( '地址' ).
          is_alvs-falv->add_button(
            EXPORTING
              iv_function = 'POST'
              iv_icon     = icon_checked
*             IV_QUICKINFO =
*             IV_BUTN_TYPE =
*             IV_DISABLED =
              iv_text     = '过账'
*             IV_CHECKED  =
          ).
        WHEN 2.
          is_alvs-falv->column( 'MANDT' )->set_tech( abap_true ).
        WHEN 3.
          is_alvs-falv->column( 'MANDT' )->set_tech( abap_true ).
      ENDCASE.
    CATCH cx_root.
  ENDTRY.
ENDFORM.

FORM frm_user_command1 USING sender TYPE REF TO zcl_falv
                            p_ucomm TYPE sy-ucomm.
  CASE p_ucomm.
    WHEN 'POST'.
      MESSAGE 'post' TYPE 'S' DISPLAY LIKE 'E'.
  ENDCASE.
ENDFORM.
