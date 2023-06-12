"! This is demo for FALV full screen with partly dynamic GUI STATUS
"! done by Lukasz Pegiel for http://abapblog.com
REPORT zdemo_falv03.

DATA: sflight TYPE STANDARD TABLE OF sflight.

CLASS lcl_test DEFINITION INHERITING FROM zcl_falv.
  PUBLIC SECTION.

  PROTECTED SECTION.
    "redefinition of event handler
    METHODS evf_user_command REDEFINITION.
  PRIVATE SECTION.

ENDCLASS.

CLASS lcl_test IMPLEMENTATION.

  METHOD evf_user_command.
    CASE e_ucomm.
      WHEN zcl_falv_dynamic_status=>b_01.
        CALL FUNCTION 'POPUP_DISPLAY_MESSAGE'
          EXPORTING
            titel = 'Popup'   " Title
            msgid = '00'
            msgty = 'S'
            msgno = '001'
            msgv1 = 'Button 1 clicked'.
      WHEN zcl_falv_dynamic_status=>b_02.
        CALL FUNCTION 'POPUP_DISPLAY_MESSAGE'
          EXPORTING
            titel = 'Popup'   " Title
            msgid = '00'
            msgty = 'S'
            msgno = '001'
            msgv1 = 'Button 2 clicked'.
      WHEN OTHERS.
        super->evf_user_command( e_ucomm ).
    ENDCASE.
  ENDMETHOD.
ENDCLASS.

START-OF-SELECTION.


  SELECT * UP TO 100 ROWS
  INTO CORRESPONDING FIELDS OF TABLE @sflight
  FROM sflight.                                         "#EC CI_NOWHERE

  "creation of falv with local redefinition
  DATA falv TYPE REF TO lcl_test.
  falv ?= lcl_test=>create( CHANGING ct_table = sflight ) .

  "Add title variable
  falv->title_v1 = 'ZDEMO_FALV03'.

  "Add button into GUI status at for function F01 (in partial dynamic GUI Status we can have up to 19 buttons)
  falv->gui_status->add_button(
    EXPORTING
      iv_button              = zcl_falv_dynamic_status=>b_01
      iv_text                = 'POPUP 01'
      iv_icon                = icon_abc
  )->add_button(
    EXPORTING
      iv_button              = zcl_falv_dynamic_status=>b_02
      iv_text                = 'POPUP 02'
      iv_icon                = icon_address
  ).

  "Display full screen grid
  falv->display( ).
