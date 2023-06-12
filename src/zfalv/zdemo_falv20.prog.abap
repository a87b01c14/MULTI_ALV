"! This is demo for FALV full screen with partly dynamic GUI STATUS
"! and excel save button
"! done by Lukasz Pegiel for http://abapblog.com
report zdemo_falv20.

data: sflight type standard table of sflight.

class lcl_test definition inheriting from zcl_falv.
  public section.

  protected section.
    methods evf_user_command redefinition.
  private section.

endclass.

class lcl_test implementation.

  method evf_user_command.
    case e_ucomm.
      when zcl_falv_dynamic_status=>b_01.
        save_excel_localy( ).
      when others.
        super->evf_user_command( e_ucomm ).
    endcase.
  endmethod.
endclass.

start-of-selection.


  select * up to 100 rows
  into corresponding fields of table @sflight
  from sflight. "#EC CI_NOWHERE


  data falv type ref to lcl_test.
  falv ?= lcl_test=>create( changing ct_table = sflight ) .


  falv->title_v1 = 'ZDEMO_FALV20'.

  "Add button into GUI status at for function F01 (in partial dynamic GUI Status we can have up to 19 buttons)
  falv->gui_status->add_button(
    exporting
      iv_button              = zcl_falv_dynamic_status=>b_01
      iv_text                = 'Save localy'
      iv_icon                = icon_xls
  ).

  falv->display( ).
