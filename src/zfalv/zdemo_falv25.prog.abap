*&---------------------------------------------------------------------*
*& Report zdemo_falv25
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zdemo_falv25.



DATA: sflight TYPE STANDARD TABLE OF sflight.


CLASS lcl_test DEFINITION INHERITING FROM zcl_falv.
  PUBLIC SECTION.

  PROTECTED SECTION.
    "redefinition of event handler
    METHODS evf_ondrag REDEFINITION.
    METHODS evf_ondrop REDEFINITION.
  PRIVATE SECTION.

ENDCLASS.

CLASS lcl_test IMPLEMENTATION.


  METHOD evf_ondrag.
    CALL FUNCTION 'POPUP_DISPLAY_MESSAGE'
      EXPORTING
        titel = 'Drag'   " Title
        msgid = '00'
        msgty = 'I'
        msgno = '001'
        msgv1 = 'Yupi!'.
  ENDMETHOD.

  METHOD evf_ondrop.

    CALL FUNCTION 'POPUP_DISPLAY_MESSAGE'
      EXPORTING
        titel = 'Drop'   " Title
        msgid = '00'
        msgty = 'I'
        msgno = '001'
        msgv1 = 'Yupi!'.

  ENDMETHOD.

ENDCLASS.

START-OF-SELECTION.

  SELECT * UP TO 100 ROWS
  INTO CORRESPONDING FIELDS OF TABLE @sflight
  FROM sflight.                                         "#EC CI_NOWHERE

  "creation of falv with local redefinition
  DATA falv TYPE REF TO lcl_test.
  falv ?=  lcl_test=>create( CHANGING ct_table = sflight ).


  DATA(drag_object) = NEW cl_dragdrop( ).
  drag_object->add( EXPORTING flavor = 'Line'
                               dragsrc = abap_true
                               droptarget = abap_true
                               effect = cl_dragdrop=>copy
                     EXCEPTIONS already_defined = 1
                                obj_invalid = 2
                                OTHERS = 3 ).
  IF sy-subrc = 0.
    drag_object->get_handle( IMPORTING  handle = DATA(handle)
                              EXCEPTIONS obj_invalid = 1
                                         OTHERS      = 2  ).
    IF sy-subrc = 0.
      falv->layout->set_s_dragdrop( VALUE #( row_ddid = handle cntr_ddid = handle  ) ).
    ELSE.
    ENDIF.
  ENDIF.

  "Enable top_of_page and display Grid on full screen
  falv->show_top_of_page( )->display( ).
