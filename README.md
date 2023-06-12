# MULTI_ALV

![screenshot](https://github.com/a87b01c14/MULTI_ALV/blob/main/WX20230612-132659%402x.png)

![screenshot](https://github.com/a87b01c14/MULTI_ALV/blob/main/WX20230612-132808%402x.png)

![screenshot](https://github.com/a87b01c14/MULTI_ALV/blob/main/WX20230612-132848%402x.png)


easy to use

horizontal layout
```ABAP
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
```
    
    
vertical layout
```ABAP
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
 ```
    
