"! This is demo for FALV full screen with fully dynamic GUI STATUS
"! done by Lukasz Pegiel for http://abapblog.com
report zdemo_falv04.

data: sflight type standard table of sflight.

class lcl_test definition inheriting from zcl_falv.
  public section.

  protected section.
    "redefinition of event handler
    methods evf_user_command redefinition.
  private section.

endclass.

class lcl_test implementation.

  method evf_user_command.
    case e_ucomm.
      when zcl_falv_dynamic_status=>b_01.
        call function 'POPUP_DISPLAY_MESSAGE'
          exporting
            titel = 'Popup'   " Title
            msgid = '00'
            msgty = 'S'
            msgno = '001'
            msgv1 = 'Button 1 clicked'.
      when zcl_falv_dynamic_status=>b_02.
        call function 'POPUP_DISPLAY_MESSAGE'
          exporting
            titel = 'Popup'   " Title
            msgid = '00'
            msgty = 'S'
            msgno = '001'
            msgv1 = 'Button 2 clicked'.
      when others.
        super->evf_user_command( e_ucomm ).
    endcase.
  endmethod.

endclass.

start-of-selection.


  select * up to 100 rows
  into corresponding fields of table @sflight
  from sflight. "#EC CI_NOWHERE

  "creation of falv with local redefinition
  data falv type ref to lcl_test.
  falv ?= lcl_test=>create( exporting  i_subclass = cl_abap_classdescr=>describe_by_name( p_name = 'LCL_TEST' )
                              changing ct_table = sflight    ) .

  "Add title variable
  falv->title_v1 = 'ZDEMO_FALV04'.

  "Set Gui status to fully dynamic (no standard buttons of ALV Grid)
  falv->gui_status->fully_dynamic = abap_true.

  "Add button into GUI status at for function F01 (in full dynamic GUI Status we can have up to 35 buttons)
  falv->gui_status->add_button(
    exporting
      iv_button              = zcl_falv_dynamic_status=>b_01
      iv_text                = 'POPUP 01'
      iv_icon                = icon_abc
*      iv_qinfo               =
*      iv_allowed             = ABAP_TRUE
    exceptions
      button_already_filled  = 0
      button_does_not_exists = 0
      icon_and_text_empty    = 0
      others                 = 0
  ).

  "Add button into GUI status at for function F02
  falv->gui_status->add_button(
    exporting
      iv_button              = zcl_falv_dynamic_status=>b_02
      iv_text                = 'POPUP 02'
      iv_icon                = icon_address
*      iv_qinfo               =
*      iv_allowed             = ABAP_TRUE
    exceptions
      button_already_filled  = 0
      button_does_not_exists = 0
      icon_and_text_empty    = 0
      others                 = 0
  ).

  "Display full screen grid
  falv->display( ).
