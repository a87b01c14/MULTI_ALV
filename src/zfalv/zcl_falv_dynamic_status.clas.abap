class zcl_falv_dynamic_status definition
  public
  final
  create public .

  public section.

    interfaces if_os_clone .

    types:
      begin of t_buttons,
        f01 type rsfunc_txt,
        f02 type rsfunc_txt,
        f03 type rsfunc_txt,
        f04 type rsfunc_txt,
        f05 type rsfunc_txt,
        f06 type rsfunc_txt,
        f07 type rsfunc_txt,
        f08 type rsfunc_txt,
        f09 type rsfunc_txt,
        f10 type rsfunc_txt,
        f11 type rsfunc_txt,
        f12 type rsfunc_txt,
        f13 type rsfunc_txt,
        f14 type rsfunc_txt,
        f15 type rsfunc_txt,
        f16 type rsfunc_txt,
        f17 type rsfunc_txt,
        f18 type rsfunc_txt,
        f19 type rsfunc_txt,
        f20 type rsfunc_txt,
        f21 type rsfunc_txt,
        f22 type rsfunc_txt,
        f23 type rsfunc_txt,
        f24 type rsfunc_txt,
        f25 type rsfunc_txt,
        f26 type rsfunc_txt,
        f27 type rsfunc_txt,
        f28 type rsfunc_txt,
        f29 type rsfunc_txt,
        f30 type rsfunc_txt,
        f31 type rsfunc_txt,
        f32 type rsfunc_txt,
        f33 type rsfunc_txt,
        f34 type rsfunc_txt,
        f35 type rsfunc_txt,
      end of t_buttons .
    types:
      begin of t_allowed_but,
        function type sy-ucomm,
      end of t_allowed_but .
    types:
      tt_excluded_but type standard table of sy-ucomm .
    types:
      tt_allowed_but type standard table of t_allowed_but .

    constants b_01 type sy-ucomm value 'F01' ##NO_TEXT.
    constants b_02 type sy-ucomm value 'F02' ##NO_TEXT.
    constants b_03 type sy-ucomm value 'F03' ##NO_TEXT.
    constants b_04 type sy-ucomm value 'F04' ##NO_TEXT.
    constants b_05 type sy-ucomm value 'F05' ##NO_TEXT.
    constants b_06 type sy-ucomm value 'F06' ##NO_TEXT.
    constants b_07 type sy-ucomm value 'F07' ##NO_TEXT.
    constants b_08 type sy-ucomm value 'F08' ##NO_TEXT.
    constants b_09 type sy-ucomm value 'F09' ##NO_TEXT.
    constants b_10 type sy-ucomm value 'F10' ##NO_TEXT.
    constants b_11 type sy-ucomm value 'F11' ##NO_TEXT.
    constants b_12 type sy-ucomm value 'F12' ##NO_TEXT.
    constants b_13 type sy-ucomm value 'F13' ##NO_TEXT.
    constants b_14 type sy-ucomm value 'F14' ##NO_TEXT.
    constants b_15 type sy-ucomm value 'F15' ##NO_TEXT.
    constants b_16 type sy-ucomm value 'F16' ##NO_TEXT.
    constants b_17 type sy-ucomm value 'F17' ##NO_TEXT.
    constants b_18 type sy-ucomm value 'F18' ##NO_TEXT.
    constants b_19 type sy-ucomm value 'F19' ##NO_TEXT.
    constants b_20 type sy-ucomm value 'F20' ##NO_TEXT.
    constants b_21 type sy-ucomm value 'F21' ##NO_TEXT.
    constants b_22 type sy-ucomm value 'F22' ##NO_TEXT.
    constants b_23 type sy-ucomm value 'F23' ##NO_TEXT.
    constants b_24 type sy-ucomm value 'F24' ##NO_TEXT.
    constants b_25 type sy-ucomm value 'F25' ##NO_TEXT.
    constants b_26 type sy-ucomm value 'F26' ##NO_TEXT.
    constants b_27 type sy-ucomm value 'F27' ##NO_TEXT.
    constants b_28 type sy-ucomm value 'F28' ##NO_TEXT.
    constants b_29 type sy-ucomm value 'F29' ##NO_TEXT.
    constants b_30 type sy-ucomm value 'F30' ##NO_TEXT.
    constants b_31 type sy-ucomm value 'F31' ##NO_TEXT.
    constants b_32 type sy-ucomm value 'F32' ##NO_TEXT.
    constants b_33 type sy-ucomm value 'F33' ##NO_TEXT.
    constants b_34 type sy-ucomm value 'F34' ##NO_TEXT.
    constants b_35 type sy-ucomm value 'F35' ##NO_TEXT.
    data fully_dynamic type abap_bool .
    data excluded_buttons type tt_excluded_but .
    data buttons type t_buttons .

    methods constructor .
    methods add_button
      importing
        value(iv_button)  type sy-ucomm
        value(iv_text)    type smp_dyntxt-text optional
        value(iv_icon)    type smp_dyntxt-icon_id optional
        value(iv_qinfo)   type smp_dyntxt-quickinfo optional
        value(iv_allowed) type abap_bool default abap_true
      RETURNING
        VALUE(r_status) TYPE REF TO zcl_falv_dynamic_status
      exceptions
        button_already_filled
        button_does_not_exists
        icon_and_text_empty .
    methods hide_button
      importing
        value(iv_button) type sy-ucomm
      RETURNING
        VALUE(r_status) TYPE REF TO zcl_falv_dynamic_status .
    methods show_button
      importing
        value(iv_button) type sy-ucomm
      RETURNING
        VALUE(r_status) TYPE REF TO zcl_falv_dynamic_status .
    methods get_toolbar
      exporting
        !e_toolbar type t_buttons .
    methods add_separator
      importing
        value(iv_button) type sy-ucomm
      RETURNING
        VALUE(r_status) TYPE REF TO zcl_falv_dynamic_status .
    methods show_title
      importing
        value(iv_text1) type string
        value(iv_text2) type string optional
        value(iv_text3) type string optional
        value(iv_text4) type string optional
        value(iv_text5) type string optional .
    methods show_gui_status .
  protected section.

    data allowed_buttons type tt_allowed_but .
  private section.
endclass.



class zcl_falv_dynamic_status implementation.


  method add_button.
    r_status = me.
    data button type smp_dyntxt.
    check iv_button is not initial.

    if iv_text is initial and iv_icon is initial.
      raise icon_and_text_empty.
      return.
    endif.

    button-icon_id = iv_icon.
    button-icon_text = iv_text.
    button-text      = iv_text.
    button-quickinfo = iv_qinfo.

    assign component iv_button of structure buttons to field-symbol(<bt>).
    if <bt> is assigned.
      if <bt> is initial.
        <bt> = button.
        if iv_allowed eq abap_true.
          show_button( iv_button = iv_button ).
        endif.
      else.
        raise button_already_filled.
      endif.
    else.
      raise button_does_not_exists.
    endif.
  endmethod.


  method add_separator.
    r_status = me.
    add_button(
      exporting
        iv_button              = iv_button
        iv_text                = |{ cl_abap_char_utilities=>minchar }|
         iv_allowed             = abap_true
      exceptions
        others                 = 0
    ).
  endmethod.


  method constructor.
    excluded_buttons = value #( ( b_01 ) ( b_02 ) ( b_03 ) ( b_04 ) ( b_05 ) ( b_06 ) ( b_07 ) ( b_08 ) ( b_09 )
                                ( b_10 ) ( b_11 ) ( b_12 ) ( b_13 ) ( b_14 ) ( b_15 ) ( b_16 ) ( b_17 ) ( b_18 ) ( b_19 )
                                ( b_20 ) ( b_21 ) ( b_22 ) ( b_23 ) ( b_24 ) ( b_25 ) ( b_26 ) ( b_27 ) ( b_28 ) ( b_29 )
                                ( b_30 ) ( b_31 ) ( b_32 ) ( b_33 ) ( b_34 ) ( b_35 )
                                ( zcl_falv=>mc_fc_data_save ) ( zcl_falv=>fc_first_page )
                                ( zcl_falv=>fc_last_page ) ( zcl_falv=>fc_next_page ) ( zcl_falv=>fc_previous_page ) ( zcl_falv=>fc_print ) ).
  endmethod.


  method get_toolbar.
    e_toolbar = buttons.
  endmethod.


  method hide_button.
    r_status = me.
    check iv_button is not initial.

    delete allowed_buttons where function = iv_button.
    append iv_button to excluded_buttons.

  endmethod.


  method if_os_clone~clone.
    system-call objmgr clone me to result.
  endmethod.


  method show_button.
    r_status = me.
    check iv_button is not initial.
    if not line_exists( allowed_buttons[ function = iv_button ] ).
      data(allowed) = value t_allowed_but( function = iv_button ).
      append allowed to allowed_buttons.
      delete excluded_buttons where table_line eq iv_button.
    endif.
  endmethod.


  method show_gui_status.
    if sy-dynnr eq zcl_falv=>c_screen_full and fully_dynamic eq abap_true.
      set pf-status 'DYNAMIC_STATUS' of program zcl_falv=>c_fscr_repid excluding excluded_buttons.
    elseif sy-dynnr eq zcl_falv=>c_screen_full.
      set pf-status 'DYNAMIC_STATUS_PART' of program zcl_falv=>c_fscr_repid excluding excluded_buttons.
    else.
      set pf-status 'STATUS_0200' of program zcl_falv=>c_fscr_repid excluding excluded_buttons.
    endif.
  endmethod.


  method show_title.
    set titlebar 'TITLE' of program zcl_falv=>c_fscr_repid with iv_text1 iv_text2 iv_text3 iv_text4 iv_text5.
  endmethod.
endclass.
