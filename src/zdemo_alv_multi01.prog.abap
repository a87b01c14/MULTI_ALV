*&---------------------------------------------------------------------*
*& Report ZDEMO_ALV_MULTI
*&---------------------------------------------------------------------*
*& Horizontal TAB Layout
*&---------------------------------------------------------------------*
REPORT zdemo_alv_multi01.

START-OF-SELECTION.
  SELECT * FROM usr21 INTO TABLE @DATA(lt_usr21) UP TO 100 ROWS.
  SELECT * FROM adrc INTO TABLE @DATA(lt_adrc) UP TO 100 ROWS.
  SELECT * FROM kna1 INTO TABLE @DATA(lt_kna1) UP TO 100 ROWS.
  NEW zcl_alv_multi( iv_mode = zcl_alv_multi=>alv_mode-horizontal
    iv_title = 'MULTI ALV DEMO01'
    it_alvs = VALUE #(
    ( title = 'USR21' table = REF #( lt_usr21 ) )
    ( title = 'ADRC' table = REF #( lt_adrc ) )
    ( title = 'KNA1' table = REF #( lt_kna1 ) )
    ) )->display( ).
