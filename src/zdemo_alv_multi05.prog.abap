*&---------------------------------------------------------------------*
*& Report ZDEMO_ALV_MULTI
*&---------------------------------------------------------------------*
*& 弹窗显示
*&---------------------------------------------------------------------*
REPORT zdemo_alv_multi05.
DATA: lo_alv_multi TYPE REF TO zcl_alv_multi,
      lo_falv      TYPE REF TO zcl_falv.

START-OF-SELECTION.
  SELECT * FROM adrc UP TO 100 ROWS INTO TABLE @DATA(lt_table).
  SELECT * FROM usr01 UP TO 100 ROWS INTO TABLE @DATA(lt_usr01).
  SELECT * FROM usr21 UP TO 100 ROWS INTO TABLE @DATA(lt_usr21).
  lo_alv_multi = NEW zcl_alv_multi(
    iv_mode  = zcl_alv_multi=>alv_mode-horizontal
    iv_popup = abap_true
*   iv_before_show_alv_callback = 'FRM_BEFORE_SHOW_ALV'
    iv_title = 'MULTI ALV DEMO05'
    it_alvs  = VALUE #( ( title = 'ADRC' table = REF #( lt_table ) )
                        ( title = 'USR01' table = REF #( lt_usr01 ) )
                        ( title = 'USR21' table = REF #( lt_usr21 ) ) ) ).
  lo_alv_multi->display( ).

FORM frm_before_show_alv USING is_alvs TYPE zcl_alv_multi=>ty_alvs.
  TRY.
      CASE is_alvs-index.
        WHEN 1.
          is_alvs-falv->column( 'CLIENT' )->set_tech( abap_true ).
          is_alvs-falv->column( 'NATION' )->set_tech( abap_true ).
          is_alvs-falv->column( 'ADDRNUMBER' )->set_text( '地址' ).
          is_alvs-falv->layout->set_no_toolbar( abap_true ).
        WHEN 2.
          is_alvs-falv->column( 'MANDT' )->set_tech( abap_true ).
        WHEN 3.
          is_alvs-falv->column( 'MANDT' )->set_tech( abap_true ).
      ENDCASE.
    CATCH cx_root.
  ENDTRY.
ENDFORM.
