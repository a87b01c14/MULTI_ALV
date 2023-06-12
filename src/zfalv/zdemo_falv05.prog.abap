"! This is demo for FALV grid button adding, deleting, enabling, disabling
"! done by Lukasz Pegiel for http://abapblog.com
report zdemo_falv05.


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
        me->enable_button( me->mc_fc_print_back ).
      when zcl_falv_dynamic_status=>b_02.
        me->disable_button( me->mc_fc_print_back ).
        me->add_button(
          exporting
            iv_function  = zcl_falv_dynamic_status=>b_03
             iv_icon      = icon_alarm
        ).
      when zcl_falv_dynamic_status=>b_03.
        me->delete_button( zcl_falv_dynamic_status=>b_03 ).
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
  falv->title_v1 = 'ZDEMO_FALV05'.

  "Set Gui status to fully dynamic (no standard buttons of ALV Grid)
  falv->gui_status->fully_dynamic = abap_true.

  "Add button into GUI status at for function F01 (in partial dynamic GUI Status we can have up to 19 buttons)
  falv->gui_status->add_button(
    exporting
      iv_button              = zcl_falv_dynamic_status=>b_01
      iv_text                = 'Enable Print'
      iv_icon                = icon_activate
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
      iv_text                = 'Disable Print'
      iv_icon                = icon_active_inactive
*      iv_qinfo               =
*      iv_allowed             = ABAP_TRUE
    exceptions
      button_already_filled  = 0
      button_does_not_exists = 0
      icon_and_text_empty    = 0
      others                 = 0
  ).

  "In default when we use full screen FALV, Grid toolbar is switched off, we must turn it on )
  falv->layout->set_no_toolbar( abap_false ).

  "we Add buttons to ALV grid toolbar, I'll use same function like in GUI status
  falv->add_button(
    exporting
      iv_function  = zcl_falv_dynamic_status=>b_01
      iv_icon      = icon_activate
*      iv_quickinfo =
*      iv_butn_type =
*      iv_disabled  =
       iv_text      = 'Enable Print'
*      iv_checked   =
  ).
  "we Add buttons to ALV grid toolbar, I'll use same function like in GUI status
  falv->add_button(
    exporting
      iv_function  = zcl_falv_dynamic_status=>b_02
      iv_icon      = icon_active_inactive
*      iv_quickinfo =
*      iv_butn_type =
*      iv_disabled  =
       iv_text      = 'Disable Print'
*      iv_checked   =
  ).

  "remove button "Details" & "Info" from standard Grid functions
  falv->delete_button( falv->mc_fc_detail ).
  falv->delete_button( falv->mc_fc_info ).
  "Display full screen grid
  falv->display( ).
