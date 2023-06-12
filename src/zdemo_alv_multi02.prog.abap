*&---------------------------------------------------------------------*
*& Report ZDEMO_ALV_MULTI
*&---------------------------------------------------------------------*
*& 垂直布局
*&---------------------------------------------------------------------*
REPORT zdemo_alv_multi02.

START-OF-SELECTION.
  SELECT * FROM adrc UP TO 100 ROWS INTO TABLE @DATA(lt_table).
  SELECT * FROM usr01 UP TO 100 ROWS INTO TABLE @DATA(lt_usr01).
  SELECT * FROM usr21 UP TO 100 ROWS INTO TABLE @DATA(lt_usr21).
  NEW zcl_alv_multi( iv_mode = zcl_alv_multi=>alv_mode-vertical
    iv_title = 'MULTI ALV DEMO02'
    it_alvs = VALUE #( ( title = 'ADRC' table = REF #( lt_table ) )
    ( title = 'USR01' table = REF #( lt_usr01 ) )
    ( title = 'USR21' table = REF #( lt_usr21 ) ) ) )->display( ).
