CLASS zcl_falv DEFINITION
  PUBLIC
  INHERITING FROM cl_gui_alv_grid
  CREATE PUBLIC

  GLOBAL FRIENDS zcl_falv_layout .

  PUBLIC SECTION.

    INTERFACES if_alv_rm_grid_friend .

    TYPES:
      BEGIN OF t_subcl_call,
        progname TYPE progname,
        line     TYPE i,
        column   TYPE i,
        class    TYPE string,
      END OF t_subcl_call .
    TYPES:
      tt_subcl_call TYPE SORTED TABLE OF t_subcl_call WITH UNIQUE KEY progname line column .
    TYPES:
      BEGIN OF t_email,
        smtp_addr  TYPE ad_smtpadr,
        express    TYPE os_boolean,
        copy       TYPE os_boolean,
        blind_copy TYPE os_boolean,
      END OF t_email .
    TYPES:
      tt_email TYPE TABLE OF t_email .
    TYPES t_column TYPE REF TO zcl_falv_column .
    TYPES:
      t_columns TYPE SORTED TABLE OF t_column WITH UNIQUE KEY table_line .

    CONSTANTS:
      BEGIN OF color,
        blue                         TYPE char4 VALUE 'C100',
        blue_intensified             TYPE char4 VALUE 'C110',
        blue_intensified_inversed    TYPE char4 VALUE 'C111',
        blue_inversed                TYPE char4 VALUE 'C101',
        gray                         TYPE char4 VALUE 'C200',
        gray_itensified              TYPE char4 VALUE 'C210',
        gray_intesified_invers       TYPE char4 VALUE 'C211',
        gray_inversed                TYPE char4 VALUE 'C201',
        yellow                       TYPE char4 VALUE 'C300',
        yellow_intensified           TYPE char4 VALUE 'C310',
        yellow_intensified_inversed  TYPE char4 VALUE 'C311',
        yellow_inversed              TYPE char4 VALUE 'C301',
        light_blue                   TYPE char4 VALUE 'C400',
        light_blue_itensified        TYPE char4 VALUE 'C410',
        light_blue_intesified_invers TYPE char4 VALUE 'C411',
        light_blue_inversed          TYPE char4 VALUE 'C401',
        green                        TYPE char4 VALUE 'C500',
        green_intensified            TYPE char4 VALUE 'C510',
        green_intensified_inversed   TYPE char4 VALUE 'C511',
        green_inversed               TYPE char4 VALUE 'C501',
        red                          TYPE char4 VALUE 'C600',
        red_intensified              TYPE char4 VALUE 'C610',
        red_intensified_inversed     TYPE char4 VALUE 'C611',
        red_inversed                 TYPE char4 VALUE 'C601',
        orange                       TYPE char4 VALUE 'C700',
        orange_intensified           TYPE char4 VALUE 'C710',
        orange_intensified_inversed  TYPE char4 VALUE 'C711',
        orange_inversed              TYPE char4 VALUE 'C701',
      END OF color .
    CONSTANTS version TYPE string VALUE '740.1.0.19' ##NO_TEXT.
    CONSTANTS cc_name TYPE char30 VALUE 'CC_GRID' ##NO_TEXT.
    CONSTANTS c_screen_popup TYPE sy-dynnr VALUE '0200' ##NO_TEXT.
    CONSTANTS c_screen_full TYPE sy-dynnr VALUE '0100' ##NO_TEXT.
    CONSTANTS c_fscr_repid TYPE sy-repid VALUE 'SAPLZFALV' ##NO_TEXT.
    DATA result TYPE i READ-ONLY .
    DATA splitter_row_1_height TYPE i READ-ONLY .
    DATA splitter_row_2_height TYPE i READ-ONLY .
    DATA splitter_row_3_height TYPE i READ-ONLY .
    CONSTANTS fc_back TYPE sy-ucomm VALUE 'BACK' ##NO_TEXT.
    CONSTANTS fc_up TYPE sy-ucomm VALUE 'UP' ##NO_TEXT.
    CONSTANTS fc_exit TYPE sy-ucomm VALUE 'EXIT' ##NO_TEXT.
    CONSTANTS fc_cancel TYPE sy-ucomm VALUE 'CANCEL' ##NO_TEXT.
    CONSTANTS fc_mass_replace TYPE sy-ucomm VALUE 'MASS_REPL' ##NO_TEXT.
    CONSTANTS fc_save TYPE sy-ucomm VALUE '&DATA_SAVE' ##NO_TEXT.
    CONSTANTS fc_print TYPE sy-ucomm VALUE 'PRINT' ##NO_TEXT.
    CONSTANTS fc_find TYPE sy-ucomm VALUE 'FIND' ##NO_TEXT.
    CONSTANTS fc_find_next TYPE sy-ucomm VALUE 'FINDNEXT' ##NO_TEXT.
    CONSTANTS fc_first_page TYPE sy-ucomm VALUE 'PGHOME' ##NO_TEXT.
    CONSTANTS fc_last_page TYPE sy-ucomm VALUE 'PGEND' ##NO_TEXT.
    CONSTANTS fc_previous_page TYPE sy-ucomm VALUE 'PGUP' ##NO_TEXT.
    CONSTANTS fc_next_page TYPE sy-ucomm VALUE 'PGDOWN' ##NO_TEXT.
    CONSTANTS button_normal TYPE tb_btype VALUE '0' ##NO_TEXT.
    CONSTANTS button_menu_default TYPE tb_btype VALUE '1' ##NO_TEXT.
    CONSTANTS button_menu TYPE tb_btype VALUE '2' ##NO_TEXT.
    CONSTANTS button_separator TYPE tb_btype VALUE '3' ##NO_TEXT.
    CONSTANTS button_radiobutton TYPE tb_btype VALUE '4' ##NO_TEXT.
    CONSTANTS button_checkbox TYPE tb_btype VALUE '5' ##NO_TEXT.
    CONSTANTS button_menu_entry TYPE tb_btype VALUE '6' ##NO_TEXT.
    CONSTANTS:
      BEGIN OF symbol,
        empty_space        TYPE char01 VALUE ' ',
        plus_box           TYPE char01 VALUE '!',
        minus_box          TYPE char01 VALUE '"',
        plus_circle        TYPE char01 VALUE '#',
        minus_circle       TYPE char01 VALUE '$',
        filled_square      TYPE char01 VALUE '%',
        half_filled_square TYPE char01 VALUE '&',
        square             TYPE char01 VALUE `'`,
        filled_circle      TYPE char01 VALUE '(',
        half_filled_circle TYPE char01 VALUE ')',
        circle             TYPE char01 VALUE '*',
        filled_diamond     TYPE char01 VALUE '+',
        diamond            TYPE char01 VALUE ',',
        bold_x             TYPE char01 VALUE '.',
        note               TYPE char01 VALUE '/',
        document           TYPE char01 VALUE '0',
        checked_document   TYPE char01 VALUE '1',
        documents          TYPE char01 VALUE '2',
        folder             TYPE char01 VALUE '3',
        plus_folder        TYPE char01 VALUE '4',
        minus_folder       TYPE char01 VALUE '5',
        open_folder        TYPE char01 VALUE '6',
        bold_minus         TYPE char01 VALUE '7',
        bold_plus          TYPE char01 VALUE '8',
        checkbox           TYPE char01 VALUE '9',
        radiobutton        TYPE char01 VALUE  ':',
        left_triangle      TYPE char01 VALUE  ';',
        right_triangle     TYPE char01 VALUE  '<',
        up_triangle        TYPE char01 VALUE  '=',
        down_triangle      TYPE char01 VALUE  '>',
        left_hand          TYPE char01 VALUE  '?',
        left_arrow         TYPE char01 VALUE  'A',
        right_arrow        TYPE char01 VALUE  'B',
        up_arrow           TYPE char01 VALUE  'C',
        down_arrow         TYPE char01 VALUE  'D',
        check_mark         TYPE char01 VALUE  'E',
        pencil             TYPE char01 VALUE  'F',
        glasses            TYPE char01 VALUE  'G',
        locked             TYPE char01 VALUE  'H',
        unlocked           TYPE char01 VALUE  'I',
        phone              TYPE char01 VALUE  'J',
        printer            TYPE char01 VALUE  'K',
        fax                TYPE char01 VALUE  'L',
        asterisk           TYPE char01 VALUE  'M',
        right_hand         TYPE char01 VALUE  'N',
        sorted_up          TYPE char01 VALUE  'O',
        sorted_down        TYPE char01 VALUE  'P',
        cumulated          TYPE char01 VALUE  'Q',
        delete             TYPE char01 VALUE  'R',
        executable         TYPE char01 VALUE  'S',
        workflow_item      TYPE char01 VALUE  'T',
        caution            TYPE char01 VALUE  'U',
        flash              TYPE char01 VALUE  'V',
        large_square       TYPE char01 VALUE  'W',
        ellipsis           TYPE char01 VALUE  'X',
      END OF symbol .
    DATA main_container TYPE REF TO cl_gui_container READ-ONLY .
    DATA split_container TYPE REF TO cl_gui_splitter_container .
    DATA main_split_container TYPE REF TO cl_gui_splitter_container .
    DATA top_of_page_container TYPE REF TO cl_gui_container .
    DATA variant TYPE disvariant .
    DATA layout_save TYPE char01 .
    DATA exclude_functions TYPE ui_functions .
    DATA fcat TYPE lvc_t_fcat .
    DATA sort TYPE lvc_t_sort .
    DATA filter TYPE lvc_t_filt .
    DATA lvc_layout TYPE lvc_s_layo READ-ONLY .
    DATA layout TYPE REF TO zcl_falv_layout .
    DATA gui_status TYPE REF TO zcl_falv_dynamic_status .
    DATA screen TYPE sy-dynnr READ-ONLY .
    DATA outtab TYPE REF TO data .
    DATA title_v1 TYPE string .
    DATA title_v2 TYPE string .
    DATA title_v3 TYPE string .
    DATA title_v4 TYPE string .
    DATA title_v5 TYPE string .
    DATA delay_move_current_cell TYPE i READ-ONLY VALUE 20 ##NO_TEXT.
    DATA delay_change_selection TYPE i READ-ONLY VALUE 20 ##NO_TEXT.
    DATA top_of_page_height TYPE i VALUE 150 ##NO_TEXT.
    DATA error_log_height TYPE i VALUE 100 ##NO_TEXT.
    DATA grid TYPE REF TO cl_gui_alv_grid .
    DATA built_in_screen TYPE abap_bool READ-ONLY .
    DATA buffering_active TYPE abap_bool VALUE abap_true ##NO_TEXT.
    DATA bypassing_buffer TYPE abap_bool VALUE abap_false ##NO_TEXT.

* add by yu.xiaosan 20230525 events callback form begin
    CONSTANTS:
      BEGIN OF events,
        after_refresh              TYPE slis_formname VALUE 'AFTER_REFRESH',
        after_user_command         TYPE slis_formname VALUE 'AFTER_USER_COMMAND',
        before_ucommand_internal   TYPE slis_formname VALUE 'BEFORE_UCOMMAND_INTERNAL',
        before_user_command        TYPE slis_formname VALUE 'BEFORE_USER_COMMAND',
        btn_click                  TYPE slis_formname VALUE 'BTN_CLICK',
        data_changed               TYPE slis_formname VALUE 'DATA_CHANGED',
        data_changed_internal      TYPE slis_formname VALUE 'DATA_CHANGED_INTERNAL',
        data_changed_finished      TYPE slis_formname VALUE 'DATA_CHANGED_FINISHED',
        double_click               TYPE slis_formname VALUE 'DOUBLE_CLICK',
        hotspot_click              TYPE slis_formname VALUE 'HOTSPOT_CLICK',
        menu_button                TYPE slis_formname VALUE 'MENU_BUTTON',
        onf1                       TYPE slis_formname VALUE 'ONF1',
        onf4                       TYPE slis_formname VALUE 'ONF4',
        subtotal_text              TYPE slis_formname VALUE 'SUBTOTAL_TEXT',
        toolbar_internal           TYPE slis_formname VALUE 'TOOLBAR_INTERNAL',
        toolbar                    TYPE slis_formname VALUE 'TOOLBAR',
        user_command               TYPE slis_formname VALUE 'USER_COMMAND',
        at_set_pf_status           TYPE slis_formname VALUE 'AT_SET_PF_STATUS',
        at_set_title               TYPE slis_formname VALUE 'AT_SET_TITLE',
        top_of_page                TYPE slis_formname VALUE 'TOP_OF_PAGE',
        delayed_callback           TYPE slis_formname VALUE 'DELAYED_CALLBACK',
        delayed_changed_sel_call   TYPE slis_formname VALUE 'DELAYED_CHANGED_SEL_CALL',
        ondrag                     TYPE slis_formname VALUE 'ONDRAG',
        ondrop                     TYPE slis_formname VALUE 'ONDROP',
        ondropcomplete             TYPE slis_formname VALUE 'ONDROPCOMPLETE',
        ondropgetflavor            TYPE slis_formname VALUE 'ONDROPGETFLAVOR',
        drop_external_file         TYPE slis_formname VALUE 'DROP_EXTERNAL_FILE',
        toolbar_menubutton_click   TYPE slis_formname VALUE 'TOOLBAR_MENUBUTTON_CLICK',
        click_col_header           TYPE slis_formname VALUE 'CLICK_COL_HEADER',
        delayed_move_current_cell  TYPE slis_formname VALUE 'DELAYED_MOVE_CURRENT_CELL',
        f1                         TYPE slis_formname VALUE 'F1',
        dblclick_row_col           TYPE slis_formname VALUE 'DBLCLICK_ROW_COL',
        click_row_col              TYPE slis_formname VALUE 'CLICK_ROW_COL',
        toolbar_button_click       TYPE slis_formname VALUE 'TOOLBAR_BUTTON_CLICK',
        double_click_col_separator TYPE slis_formname VALUE 'DOUBLE_CLICK_COL_SEPARATOR',
        delayed_change_selection   TYPE slis_formname VALUE 'DELAYED_CHANGE_SELECTION',
        context_menu               TYPE slis_formname VALUE 'CONTEXT_MENU',
        total_click_row_col        TYPE slis_formname VALUE 'TOTAL_CLICK_ROW_COL',
        context_menu_selected      TYPE slis_formname VALUE 'CONTEXT_MENU_SELECTED',
        context_menu_request       TYPE slis_formname VALUE 'CONTEXT_MENU_REQUEST',
        toolbar_menu_selected      TYPE slis_formname VALUE 'TOOLBAR_MENU_SELECTED',
        request_data               TYPE slis_formname VALUE 'REQUEST_DATA',
      END OF events .
    DATA cb_after_refresh TYPE  slis_formname VALUE 'FRM_AFTER_REFRESH'.
    DATA cb_after_user_command TYPE  slis_formname VALUE 'FRM_AFTER_USER_COMMAND'.
    DATA cb_before_user_command TYPE  slis_formname VALUE 'FRM_BEFORE_USER_COMMAND'.
    DATA cb_btn_click TYPE  slis_formname VALUE 'FRM_BTN_CLICK'.
    DATA cb_data_changed TYPE  slis_formname VALUE 'FRM_DATA_CHANGED'.
    DATA cb_data_changed_internal TYPE  slis_formname VALUE 'FRM_DATA_CHANGED_INTERNAL'.
    DATA cb_data_changed_finished TYPE  slis_formname VALUE 'FRM_DATA_CHANGED_FINISHED'.
    DATA cb_double_click TYPE  slis_formname VALUE 'FRM_DOUBLE_CLICK'.
    DATA cb_hotspot_click TYPE  slis_formname VALUE 'FRM_HOTSPOT_CLICK'.
    DATA cb_menu_button TYPE  slis_formname VALUE 'FRM_MENU_BUTTON'.
    DATA cb_onf1 TYPE  slis_formname VALUE 'FRM_ONF1'.
    DATA cb_onf4 TYPE  slis_formname VALUE 'FRM_ONF4'.
    DATA cb_subtotal_text TYPE  slis_formname VALUE 'FRM_SUBTOTAL_TEXT'.
    DATA cb_toolbar TYPE  slis_formname VALUE 'FRM_TOOLBAR'.
    DATA cb_user_command TYPE  slis_formname VALUE 'FRM_USER_COMMAND'.
    DATA cb_at_set_pf_status TYPE  slis_formname VALUE 'FRM_AT_SET_PF_STATUS'.
    DATA cb_at_set_title TYPE  slis_formname VALUE 'FRM_AT_SET_TITLE'.
    DATA cb_top_of_page TYPE  slis_formname VALUE 'FRM_TOP_OF_PAGE'.
    DATA cb_delayed_callback TYPE  slis_formname VALUE 'FRM_DELAYED_CALLBACK'.
    DATA cb_delayed_changed_sel_call TYPE  slis_formname VALUE 'FRM_DELAYED_CHANGED_SEL_CALL'.
    DATA cb_ondrag TYPE  slis_formname VALUE 'FRM_ONDRAG'.
    DATA cb_ondrop TYPE  slis_formname VALUE 'FRM_ONDROP'.
    DATA cb_ondropcomplete TYPE  slis_formname VALUE 'FRM_ONDROPCOMPLETE'.
    DATA cb_ondropgetflavor TYPE  slis_formname VALUE 'FRM_ONDROPGETFLAVOR'.
    DATA cb_drop_external_file TYPE  slis_formname VALUE 'FRM_DROP_EXTERNAL_FILE'.
    DATA cb_toolbar_menubutton_click TYPE  slis_formname VALUE 'FRM_TOOLBAR_MENUBUTTON_CLICK'.
    DATA cb_click_col_header TYPE  slis_formname VALUE 'FRM_CLICK_COL_HEADER'.
    DATA cb_delayed_move_current_cell TYPE  slis_formname VALUE 'FRM_DELAYED_MOVE_CURRENT_CELL'.
    DATA cb_f1 TYPE  slis_formname VALUE 'FRM_F1'.
    DATA cb_dblclick_row_col TYPE  slis_formname VALUE 'FRM_DBLCLICK_ROW_COL'.
    DATA cb_click_row_col TYPE  slis_formname VALUE 'FRM_CLICK_ROW_COL'.
    DATA cb_toolbar_button_click TYPE  slis_formname VALUE 'FRM_TOOLBAR_BUTTON_CLICK'.
    DATA cb_double_click_col_separator TYPE  slis_formname VALUE 'FRM_DOUBLE_CLICK_COL_SEPARATOR'.
    DATA cb_delayed_change_selection TYPE  slis_formname VALUE 'FRM_DELAYED_CHANGE_SELECTION'.
    DATA cb_context_menu TYPE  slis_formname VALUE 'FRM_CONTEXT_MENU'.
    DATA cb_total_click_row_col TYPE  slis_formname VALUE 'FRM_TOTAL_CLICK_ROW_COL'.
    DATA cb_context_menu_selected TYPE  slis_formname VALUE 'FRM_CONTEXT_MENU_SELECTED'.
    DATA cb_context_menu_request TYPE  slis_formname VALUE 'FRM_CONTEXT_MENU_REQUEST'.
    DATA cb_toolbar_menu_selected TYPE  slis_formname VALUE 'FRM_TOOLBAR_MENU_SELECTED'.
    DATA cb_request_data TYPE  slis_formname VALUE 'FRM_REQUEST_DATA'.
* add by yu.xiaosan 20230525 events callback form end

    CLASS-METHODS create
      IMPORTING
        VALUE(i_parent)          TYPE REF TO cl_gui_container OPTIONAL
        VALUE(i_applogparent)    TYPE REF TO cl_gui_container OPTIONAL
        VALUE(i_popup)           TYPE abap_bool DEFAULT abap_false
        VALUE(i_applog_embedded) TYPE abap_bool DEFAULT abap_false
        VALUE(i_subclass)        TYPE REF TO cl_abap_typedescr OPTIONAL
        VALUE(i_repid)           TYPE sy-repid OPTIONAL
        VALUE(i_handle)          TYPE slis_handl OPTIONAL
        VALUE(it_events)         TYPE slis_t_event OPTIONAL
      CHANGING
        !ct_table                TYPE STANDARD TABLE
      RETURNING
        VALUE(rv_falv)           TYPE REF TO zcl_falv .
    METHODS create_by_copy
      IMPORTING
        VALUE(i_parent)       TYPE REF TO cl_gui_container OPTIONAL
        VALUE(i_applogparent) TYPE REF TO cl_gui_container OPTIONAL
        VALUE(i_popup)        TYPE abap_bool DEFAULT abap_false
      RETURNING
        VALUE(rv_falv)        TYPE REF TO zcl_falv .
    CLASS-METHODS create_by_type
      IMPORTING
        VALUE(i_parent)          TYPE REF TO cl_gui_container OPTIONAL
        VALUE(i_applogparent)    TYPE REF TO cl_gui_container OPTIONAL
        VALUE(i_popup)           TYPE abap_bool DEFAULT abap_false
        VALUE(i_applog_embedded) TYPE abap_bool DEFAULT abap_false
        VALUE(i_subclass)        TYPE REF TO cl_abap_typedescr OPTIONAL
        !i_type                  TYPE REF TO cl_abap_typedescr
        VALUE(i_repid)           TYPE sy-repid OPTIONAL
        VALUE(i_handle)          TYPE slis_handl OPTIONAL
        VALUE(it_events)         TYPE slis_t_event OPTIONAL
      RETURNING
        VALUE(rv_falv)           TYPE REF TO zcl_falv .
    CLASS-METHODS lvc_fcat_from_itab
      IMPORTING
        !it_table      TYPE STANDARD TABLE
      RETURNING
        VALUE(rt_fcat) TYPE lvc_t_fcat .
    METHODS constructor
      IMPORTING
        VALUE(i_shellstyle)  TYPE i DEFAULT 0
        VALUE(i_lifetime)    TYPE i OPTIONAL
        VALUE(i_parent)      TYPE REF TO cl_gui_container OPTIONAL
        VALUE(i_appl_events) TYPE char01 DEFAULT space
        !i_parentdbg         TYPE REF TO cl_gui_container OPTIONAL
        !i_applogparent      TYPE REF TO cl_gui_container OPTIONAL
        !i_graphicsparent    TYPE REF TO cl_gui_container OPTIONAL
        VALUE(i_name)        TYPE string OPTIONAL
        !i_fcat_complete     TYPE sap_bool DEFAULT space
      EXCEPTIONS
        error_cntl_create
        error_cntl_init
        error_cntl_link
        error_dp_create
        object_created_manually .
    METHODS pbo
      IMPORTING
        VALUE(iv_dynnr) TYPE sy-dynnr DEFAULT sy-dynnr .
    METHODS pai
      IMPORTING
        VALUE(iv_dynnr) TYPE sy-dynnr DEFAULT sy-dynnr
      CHANGING
        !c_ucomm        TYPE sy-ucomm DEFAULT sy-ucomm .
    METHODS display
      FINAL
      IMPORTING
        VALUE(iv_force_grid)   TYPE abap_bool DEFAULT space
        VALUE(iv_start_row)    TYPE i OPTIONAL
        VALUE(iv_start_column) TYPE i OPTIONAL
        VALUE(iv_end_row)      TYPE i OPTIONAL
        VALUE(iv_end_column)   TYPE i OPTIONAL
      RETURNING
        VALUE(r_falv)          TYPE REF TO zcl_falv .
    METHODS exclude_function
      IMPORTING
        VALUE(iv_ucomm) TYPE sy-ucomm
      RETURNING
        VALUE(r_falv)   TYPE REF TO zcl_falv .
    METHODS column
      IMPORTING
        VALUE(iv_fieldname) TYPE lvc_s_fcat-fieldname
      RETURNING
        VALUE(rv_column)    TYPE REF TO zcl_falv_column .
    METHODS soft_refresh
      RETURNING
        VALUE(r_falv) TYPE REF TO zcl_falv .
    METHODS set_mark_field
      IMPORTING
        VALUE(iv_fieldname) TYPE lvc_s_fcat-fieldname
      RETURNING
        VALUE(r_falv)       TYPE REF TO zcl_falv .
    METHODS set_editable
      IMPORTING
        VALUE(iv_modify) TYPE abap_bool DEFAULT abap_false
      RETURNING
        VALUE(r_falv)    TYPE REF TO zcl_falv .
    METHODS set_readonly
      RETURNING
        VALUE(r_falv) TYPE REF TO zcl_falv .
    METHODS add_button
      IMPORTING
        VALUE(iv_function)  TYPE ui_func
        VALUE(iv_icon)      TYPE icon_d OPTIONAL
        VALUE(iv_quickinfo) TYPE iconquick OPTIONAL
        VALUE(iv_butn_type) TYPE tb_btype OPTIONAL
        VALUE(iv_disabled)  TYPE abap_bool OPTIONAL
        VALUE(iv_text)      TYPE text40 OPTIONAL
        VALUE(iv_checked)   TYPE abap_bool OPTIONAL
      RETURNING
        VALUE(r_falv)       TYPE REF TO zcl_falv .
    "! Don't call it from Toolbar event handler
    "! as it will cause endless loop
    METHODS disable_button
      IMPORTING
        VALUE(iv_function) TYPE ui_func
      RETURNING
        VALUE(r_falv)      TYPE REF TO zcl_falv .
    "! Don't call it from Toolbar event handler
    "! as it will cause endless loop
    METHODS enable_button
      IMPORTING
        VALUE(iv_function) TYPE ui_func
      RETURNING
        VALUE(r_falv)      TYPE REF TO zcl_falv .
    "! Don't call it from Toolbar event handler
    "! as it will cause endless loop
    METHODS delete_button
      IMPORTING
        VALUE(iv_function) TYPE ui_func
      RETURNING
        VALUE(r_falv)      TYPE REF TO zcl_falv .
    "! Don't call it from Toolbar event handler
    "! as it will cause endless loop
    METHODS delete_all_buttons
      IMPORTING
        VALUE(iv_exceptions) TYPE ttb_button OPTIONAL
      RETURNING
        VALUE(r_falv)        TYPE REF TO zcl_falv .
    METHODS set_cell_disabled
      IMPORTING
        VALUE(iv_fieldname) TYPE fieldname
        VALUE(iv_row)       TYPE lvc_s_roid-row_id
      RETURNING
        VALUE(r_falv)       TYPE REF TO zcl_falv .
    METHODS set_cell_enabled
      IMPORTING
        VALUE(iv_fieldname) TYPE fieldname
        VALUE(iv_row)       TYPE lvc_s_roid-row_id
      RETURNING
        VALUE(r_falv)       TYPE REF TO zcl_falv .
    METHODS set_cell_button
      IMPORTING
        VALUE(iv_fieldname) TYPE fieldname
        VALUE(iv_row)       TYPE lvc_s_roid-row_id
      RETURNING
        VALUE(r_falv)       TYPE REF TO zcl_falv .
    METHODS set_cell_hotspot
      IMPORTING
        VALUE(iv_fieldname) TYPE fieldname
        VALUE(iv_row)       TYPE lvc_s_roid-row_id
      RETURNING
        VALUE(r_falv)       TYPE REF TO zcl_falv .
    METHODS set_row_color
      IMPORTING
        VALUE(iv_color) TYPE char04
        VALUE(iv_row)   TYPE lvc_s_roid-row_id
      RETURNING
        VALUE(r_falv)   TYPE REF TO zcl_falv .
    METHODS set_cell_color
      IMPORTING
        VALUE(iv_fieldname) TYPE fieldname
        VALUE(iv_color)     TYPE lvc_s_colo
        VALUE(iv_row)       TYPE lvc_s_roid-row_id
      RETURNING
        VALUE(r_falv)       TYPE REF TO zcl_falv .
    METHODS mass_replace .
    METHODS export_to_excel
      RETURNING
        VALUE(rv_xstring) TYPE xstring .
    METHODS save_excel_localy
      IMPORTING
        VALUE(iv_path)  TYPE string OPTIONAL
      RETURNING
        VALUE(rv_saved) TYPE abap_bool .
    METHODS hide_top_of_page
      RETURNING
        VALUE(r_falv) TYPE REF TO zcl_falv .
    METHODS show_top_of_page
      RETURNING
        VALUE(r_falv) TYPE REF TO zcl_falv .
    METHODS set_list_view
      RETURNING
        VALUE(r_falv) TYPE REF TO zcl_falv .
    METHODS encode_picture_base64
      IMPORTING
        VALUE(iv_xstring)   TYPE xstring
        VALUE(iv_mime_type) TYPE csequence
      RETURNING
        VALUE(rv_image)     TYPE string .
    METHODS get_file_from_mime
      IMPORTING
        VALUE(iv_path)      TYPE string
      EXPORTING
        VALUE(ev_xstring)   TYPE xstring
        VALUE(ev_mime_type) TYPE string .
    METHODS get_picture_from_se78
      IMPORTING
        VALUE(iv_name)    TYPE stxbitmaps-tdname
        VALUE(iv_type)    TYPE stxbitmaps-tdbtype DEFAULT 'BCOL'
        VALUE(iv_id)      TYPE stxbitmaps-tdid DEFAULT 'BMAP'
      RETURNING
        VALUE(rv_xstring) TYPE xstring .
    METHODS send
      IMPORTING
        VALUE(iv_subject)     TYPE csequence OPTIONAL
        VALUE(iv_sender)      TYPE ad_smtpadr OPTIONAL
        VALUE(iv_sender_name) TYPE ad_smtpadr OPTIONAL
        VALUE(iv_filename)    TYPE csequence OPTIONAL
        VALUE(it_recipients)  TYPE tt_email
        VALUE(iv_body)        TYPE string OPTIONAL
        VALUE(iv_importance)  TYPE bcs_docimp OPTIONAL
        VALUE(iv_sensitivity) TYPE so_obj_sns OPTIONAL
        VALUE(iv_immediately) TYPE abap_bool OPTIONAL
        VALUE(iv_commit)      TYPE abap_bool DEFAULT abap_true
      RETURNING
        VALUE(r_falv)         TYPE REF TO zcl_falv
      EXCEPTIONS
        create_request_error
        create_document_error
        add_attachment_error
        add_document_error
        add_recipient_error
        add_sender_error
        send_error
        send_immediately_error .
    METHODS hide_applog .
    METHODS show_applog
      RETURNING
        VALUE(r_falv) TYPE REF TO zcl_falv .
    "! Cell can be editable by layout, by field-catalog or by cell styles
    METHODS get_cell_enabled
      IMPORTING
        VALUE(i_row)     TYPE i
        VALUE(i_field)   TYPE lvc_fname
      RETURNING
        VALUE(r_enabled) TYPE abap_bool .
    METHODS refresh_toolbar
      RETURNING
        VALUE(r_falv) TYPE REF TO zcl_falv .
    METHODS set_dummy_function_code
      RETURNING
        VALUE(r_falv) TYPE REF TO zcl_falv .
    METHODS get_columns
      RETURNING
        VALUE(rt_columns) TYPE t_columns .
    METHODS set_output_table
      CHANGING
        !ct_table TYPE STANDARD TABLE .

    METHODS set_frontend_fieldcatalog
        REDEFINITION .
    METHODS set_frontend_layout
        REDEFINITION .
  PROTECTED SECTION.


    DATA: toolbar_added      TYPE ttb_button,
          toolbar_deleted    TYPE ttb_button,
          toolbar_disabled   TYPE ttb_button,
          toolbar_exceptions TYPE ttb_button.
    DATA:
      columns TYPE SORTED TABLE OF t_column WITH UNIQUE KEY table_line .

    DATA application_log_embedded TYPE abap_bool .
    DATA subclass_type TYPE REF TO cl_abap_typedescr .

    EVENTS at_set_pf_status .
    EVENTS at_set_title .

    METHODS evf_btn_click
      FOR EVENT button_click OF cl_gui_alv_grid
      IMPORTING
        !es_col_id
        !es_row_no ##NEEDED.
    METHODS evf_user_command
      FOR EVENT user_command OF cl_gui_alv_grid
      IMPORTING
        !e_ucomm ##NEEDED.
    METHODS evf_hotspot_click
      FOR EVENT hotspot_click OF cl_gui_alv_grid
      IMPORTING
        !e_row_id
        !e_column_id
        !es_row_no ##NEEDED.
    METHODS evf_data_changed
      FOR EVENT data_changed OF cl_gui_alv_grid
      IMPORTING
        !er_data_changed
        !e_onf4
        !e_onf4_before
        !e_onf4_after
        !e_ucomm ##NEEDED.
    METHODS evf_data_changed_finished
      FOR EVENT data_changed_finished OF cl_gui_alv_grid
      IMPORTING
        !e_modified
        !et_good_cells ##NEEDED.
    METHODS evf_double_click
      FOR EVENT double_click OF cl_gui_alv_grid
      IMPORTING
        !e_row
        !e_column
        !es_row_no ##NEEDED.
    METHODS evf_onf1
      FOR EVENT onf1 OF cl_gui_alv_grid
      IMPORTING
        !e_fieldname
        !es_row_no
        !er_event_data ##NEEDED.
    METHODS evf_onf4
      FOR EVENT onf4 OF cl_gui_alv_grid
      IMPORTING
        !e_fieldname
        !e_fieldvalue
        !es_row_no
        !er_event_data
        !et_bad_cells
        !e_display ##NEEDED.
    METHODS evf_subtotal_text
      FOR EVENT subtotal_text OF cl_gui_alv_grid
      IMPORTING
        !es_subtottxt_info
        !ep_subtot_line
        !e_event_data ##NEEDED.
    METHODS evf_before_user_command
      FOR EVENT before_user_command OF cl_gui_alv_grid
      IMPORTING
        !e_ucomm ##NEEDED.
    METHODS evf_after_user_command
      FOR EVENT after_user_command OF cl_gui_alv_grid
      IMPORTING
        !e_ucomm
        !e_saved
        !e_not_processed ##NEEDED.
    METHODS evf_menu_button
      FOR EVENT menu_button OF cl_gui_alv_grid
      IMPORTING
        !e_object
        !e_ucomm ##NEEDED.
    METHODS evf_toolbar
      FOR EVENT toolbar OF cl_gui_alv_grid
      IMPORTING
        !e_object
        !e_interactive ##NEEDED.
    METHODS evf_after_refresh
        FOR EVENT after_refresh OF cl_gui_alv_grid.
    METHODS evf_top_of_page
      FOR EVENT top_of_page OF cl_gui_alv_grid
      IMPORTING
        !e_dyndoc_id
        !table_index ##NEEDED.
    METHODS evf_delayed_callback
        FOR EVENT delayed_callback OF cl_gui_alv_grid.
    METHODS evf_delayed_changed_sel_call
        FOR EVENT delayed_changed_sel_callback OF cl_gui_alv_grid.
    METHODS evf_ondropgetflavor
      FOR EVENT ondropgetflavor OF cl_gui_alv_grid
      IMPORTING
        !es_row_no
        !e_column
        !e_dragdropobj
        !e_flavors
        !e_row ##NEEDED.
    METHODS evf_ondrag
      FOR EVENT ondrag OF cl_gui_alv_grid
      IMPORTING
        !es_row_no
        !e_column
        !e_dragdropobj
        !e_row ##NEEDED.
    METHODS evf_ondrop
      FOR EVENT ondrop OF cl_gui_alv_grid
      IMPORTING
        !es_row_no
        !e_column
        !e_dragdropobj
        !e_row ##NEEDED.
    METHODS evf_ondropcomplete
      FOR EVENT ondropcomplete OF cl_gui_alv_grid
      IMPORTING
        !es_row_no
        !e_column
        !e_dragdropobj
        !e_row ##NEEDED.
    METHODS evf_drop_external_file
      FOR EVENT drop_external_files OF cl_gui_alv_grid
      IMPORTING
        !files ##NEEDED.
    METHODS evf_toolbar_menubutton_click
      FOR EVENT toolbar_menubutton_click OF cl_gui_alv_grid
      IMPORTING
        !fcode
        !menu_pos_x
        !menu_pos_y ##NEEDED.
    METHODS evf_click_col_header
      FOR EVENT click_col_header OF cl_gui_alv_grid
      IMPORTING
        !col_id ##NEEDED.
    METHODS evf_delayed_move_current_cell
        FOR EVENT delayed_move_current_cell OF cl_gui_alv_grid.
    METHODS evf_f1
        FOR EVENT f1 OF cl_gui_alv_grid.
    METHODS evf_dblclick_row_col
      FOR EVENT dblclick_row_col OF cl_gui_alv_grid
      IMPORTING
        !col_id
        !row_id ##NEEDED.
    METHODS evf_click_row_col
      FOR EVENT click_row_col OF cl_gui_alv_grid
      IMPORTING
        !col_id
        !row_id ##NEEDED.
    METHODS evf_toolbar_button_click
      FOR EVENT toolbar_button_click OF cl_gui_alv_grid
      IMPORTING
        !fcode ##NEEDED.
    METHODS evf_double_click_col_separator
      FOR EVENT double_click_col_separator OF cl_gui_alv_grid
      IMPORTING
        !col_id ##NEEDED.
    METHODS evf_delayed_change_selection
        FOR EVENT delayed_change_selection OF cl_gui_alv_grid.
    METHODS evf_context_menu
        FOR EVENT context_menu OF cl_gui_alv_grid.
    METHODS evf_context_menu_request
      FOR EVENT context_menu_request OF cl_gui_alv_grid
      IMPORTING
        !e_object.
    METHODS evf_total_click_row_col
      FOR EVENT total_click_row_col OF cl_gui_alv_grid
      IMPORTING
        !col_id
        !row_id ##NEEDED.
    METHODS evf_context_menu_selected
      FOR EVENT context_menu_selected OF cl_gui_alv_grid
      IMPORTING
        !fcode ##NEEDED.
    METHODS evf_toolbar_menu_selected
      FOR EVENT toolbar_menu_selected OF cl_gui_alv_grid
      IMPORTING
        !fcode ##NEEDED.
    METHODS evf_request_data
      FOR EVENT _request_data OF cl_gui_alv_grid
      IMPORTING
        !fragments ##NEEDED.
    METHODS evf_at_set_pf_status
        FOR EVENT at_set_pf_status OF zcl_falv.
    METHODS evf_at_set_title
        FOR EVENT at_set_title OF zcl_falv.
  PRIVATE SECTION.

    CLASS-DATA created_from_factory TYPE abap_bool .
    DATA top_of_page_doc TYPE REF TO cl_dd_document .
    DATA top_of_page_visible_at_start TYPE abap_bool .
    DATA repid TYPE sy-repid .
    DATA mt_events TYPE slis_t_event.

    CLASS-METHODS check_if_called_from_subclass
      RETURNING
        VALUE(ro_subclass) TYPE REF TO object .
    CLASS-METHODS create_containters
      IMPORTING
        !i_parent               TYPE REF TO cl_gui_container
        !i_applogparent         TYPE REF TO cl_gui_container
        !i_popup                TYPE abap_bool
        !i_applog_embedded      TYPE abap_bool
      EXPORTING
        !e_built_in_screen      TYPE abap_bool
        !e_parent               TYPE REF TO cl_gui_container
        !e_applog               TYPE REF TO cl_gui_container
        !e_top_of_page_parent   TYPE REF TO cl_gui_container
        !e_custom_container     TYPE REF TO cl_gui_container
        !e_main_split_container TYPE REF TO cl_gui_splitter_container
        !e_split_container      TYPE REF TO cl_gui_splitter_container .
    CLASS-METHODS create_falv_object
      IMPORTING
        !i_subclass    TYPE REF TO cl_abap_typedescr
        !i_parent      TYPE REF TO cl_gui_container
        !i_applog      TYPE REF TO cl_gui_container
      RETURNING
        VALUE(rv_falv) TYPE REF TO zcl_falv .
    CLASS-METHODS link_containers
      IMPORTING
        !iv_falv                TYPE REF TO zcl_falv
        !i_top_of_page_parent   TYPE REF TO cl_gui_container
        !i_custom_container     TYPE REF TO cl_gui_container
        !i_main_split_container TYPE REF TO cl_gui_splitter_container
        !i_split_container      TYPE REF TO cl_gui_splitter_container .
    CLASS-METHODS create_main_split_cotainer
      IMPORTING
        !i_popup                      TYPE abap_bool
        !i_applog_embedded            TYPE abap_bool
        !i_main_parent                TYPE REF TO cl_gui_container
      RETURNING
        VALUE(r_main_split_container) TYPE REF TO cl_gui_splitter_container .
    CLASS-METHODS create_main_cont_for_full_scr
      IMPORTING
        !i_popup                  TYPE abap_bool
      RETURNING
        VALUE(r_custom_container) TYPE REF TO cl_gui_container .
    CLASS-METHODS crate_main_splitter
      IMPORTING
        !i_main_split_container  TYPE REF TO cl_gui_splitter_container
      RETURNING
        VALUE(r_split_container) TYPE REF TO cl_gui_splitter_container .
    METHODS evf_before_ucommand_internal
      FOR EVENT before_user_command OF cl_gui_alv_grid
      IMPORTING
        !e_ucomm  ##NEEDED.
    METHODS evf_toolbar_internal
      FOR EVENT toolbar OF cl_gui_alv_grid
      IMPORTING
        !e_object
        !e_interactive  ##NEEDED.
    METHODS evf_data_changed_internal
      FOR EVENT data_changed OF cl_gui_alv_grid
      IMPORTING
        !er_data_changed
        !e_onf4
        !e_onf4_before
        !e_onf4_after
        !e_ucomm  ##NEEDED.
    METHODS set_parent
      IMPORTING
        !io_parent    TYPE REF TO object
      RETURNING
        VALUE(r_falv) TYPE REF TO zcl_falv .
    METHODS build_columns .
    METHODS raise_top_of_page .
    METHODS set_handlers
      IMPORTING
        !iv_falv TYPE REF TO zcl_falv .
    METHODS set_events
      IMPORTING
        !iv_falv TYPE REF TO zcl_falv.
    METHODS copy_attributes
      IMPORTING
        !i_falv TYPE REF TO zcl_falv .
    METHODS create_ex_result_falv
      RETURNING
        VALUE(er_result_table) TYPE REF TO cl_salv_ex_result_data_table .
ENDCLASS.



CLASS zcl_falv IMPLEMENTATION.


  METHOD add_button.
    IF NOT line_exists( toolbar_added[ function = iv_function ] ).
      INSERT VALUE #( function = iv_function
                      icon = CONV #( iv_icon )
                      quickinfo = iv_quickinfo
                      butn_type = iv_butn_type
                      disabled = iv_disabled
                      text = iv_text
                      checked = iv_checked
                        ) INTO TABLE toolbar_added .

      DELETE toolbar_deleted WHERE function = iv_function.
      me->refresh_toolbar( ).
    ENDIF.
    r_falv = me.
  ENDMETHOD.


  METHOD build_columns.
    LOOP AT fcat ASSIGNING FIELD-SYMBOL(<fcat>).
      DATA(column) = NEW zcl_falv_column( iv_fieldname = <fcat>-fieldname io_falv = me ).
      INSERT column INTO TABLE columns.
    ENDLOOP.
  ENDMETHOD.


  METHOD check_if_called_from_subclass.
    DATA: callstack TYPE abap_callstack,
          src       TYPE TABLE OF string.

    CALL FUNCTION 'SYSTEM_CALLSTACK'
      IMPORTING
        callstack = callstack.

    ASSIGN callstack[ 3 ] TO FIELD-SYMBOL(<stack>).
    CHECK sy-subrc EQ 0.
    DATA(compiler) = cl_abap_compiler=>create(
      p_name             = <stack>-mainprogram
      p_include          = <stack>-include
      p_no_package_check = abap_true ).

    compiler->get_single_ref(
      EXPORTING
        p_full_name = |\\TY:ZCL_FALV\\ME:{ callstack[ 2 ]-blockname CASE = UPPER }|
        p_grade     = 1   " Grade of Use
      IMPORTING
        p_result    = DATA(falv_references) " Where-Used List
      EXCEPTIONS
        OTHERS      = 5 ).
    IF sy-subrc EQ 0.
      READ REPORT <stack>-include INTO src.
      IF sy-subrc NE 0.
        RETURN.
      ENDIF.

      ASSIGN src[ <stack>-line ] TO FIELD-SYMBOL(<line>).
      IF <line> IS ASSIGNED.
        ASSIGN falv_references[ line = <stack>-line ] TO FIELD-SYMBOL(<reference>).
        IF sy-subrc EQ 0.
          DATA: subclass_name TYPE string.
          DO.
            DATA(offset) = <reference>-column - sy-index - 2. "-2 because of =>
            IF offset LT 0 OR <line>+offset(1) EQ ` `.
              EXIT.
            ENDIF.
            subclass_name =  <line>+offset(1) && subclass_name.
          ENDDO.
          IF subclass_name IS INITIAL OR to_upper( subclass_name ) EQ 'ZCL_FALV'.
            RETURN.
          ENDIF.

          "global class
          cl_abap_classdescr=>describe_by_name( EXPORTING  p_name         = to_upper( subclass_name )
                                                RECEIVING  p_descr_ref    = ro_subclass
                                                EXCEPTIONS type_not_found = 1 ).
          IF sy-subrc EQ 0.
            RETURN.
          ELSE.
            "local class
            subclass_name = |\\PROGRAM={ <stack>-mainprogram }\\CLASS={ subclass_name }|.
            cl_abap_classdescr=>describe_by_name( EXPORTING  p_name         = to_upper( subclass_name )
                                                  RECEIVING  p_descr_ref    = ro_subclass
                                                  EXCEPTIONS type_not_found = 1 ).
            IF sy-subrc EQ 0.
              RETURN.
            ENDIF.
          ENDIF.
        ENDIF.
      ENDIF.
    ENDIF.

  ENDMETHOD.


  METHOD column.
    TRY.
        rv_column = columns[  table_line->fieldname = iv_fieldname ].
      CATCH cx_sy_itab_line_not_found.

    ENDTRY.
  ENDMETHOD.


  METHOD constructor.
    IF created_from_factory EQ abap_false.
      RAISE object_created_manually.
    ENDIF.

    super->constructor(
      EXPORTING
        i_shellstyle      = i_shellstyle    " Control Style
        i_lifetime        = i_lifetime    " Lifetime
        i_parent          = i_parent    " Parent Container
        i_appl_events     = i_appl_events    " Register Events as Application Events
        i_parentdbg       = i_parentdbg    " Internal, Do not Use
        i_applogparent    = i_applogparent    " Container for Application Log
        i_graphicsparent  = i_graphicsparent    " Container for Graphics
        i_name            = i_name    " Name
        i_fcat_complete   = i_fcat_complete  " Boolean Variable (X=True, Space=False)
      EXCEPTIONS
        error_cntl_create = 1
        error_cntl_init   = 2
        error_cntl_link   = 3
        error_dp_create   = 4
        OTHERS            = 5 ).
    IF sy-subrc <> 0.
      CASE sy-subrc.
        WHEN 1.
          RAISE error_cntl_create.
        WHEN 2.
          RAISE error_cntl_init.
        WHEN 3.
          RAISE error_cntl_link.
        WHEN 4.
          RAISE error_dp_create.
      ENDCASE.
    ENDIF.
  ENDMETHOD.


  METHOD create.
    DATA: callstack TYPE abap_callstack.
    IF i_subclass IS INITIAL.
      i_subclass ?= check_if_called_from_subclass( ).
    ENDIF.

    create_containters(
      EXPORTING
        i_parent               = i_parent
        i_applogparent         = i_applogparent
        i_popup                = i_popup
        i_applog_embedded      = i_applog_embedded
      IMPORTING
        e_built_in_screen      = DATA(built_in_screen)
        e_parent               = DATA(parent)
        e_applog               = DATA(applog)
        e_top_of_page_parent   = DATA(top_of_page_parent)
        e_custom_container     = DATA(custom_container)
        e_main_split_container = DATA(main_split_container)
        e_split_container      = DATA(split_container) ).


    rv_falv = create_falv_object(
      i_subclass = i_subclass
      i_parent   = parent
      i_applog   = applog ).

    rv_falv->set_handlers( rv_falv ).
    rv_falv->mt_events = it_events.
    rv_falv->set_events( iv_falv = rv_falv ).

    rv_falv->set_output_table( CHANGING ct_table = ct_table ).
    rv_falv->fcat = rv_falv->lvc_fcat_from_itab( it_table = ct_table ).
    rv_falv->set_frontend_fieldcatalog( it_fieldcatalog = rv_falv->fcat ).
    rv_falv->application_log_embedded = i_applog_embedded.
    rv_falv->built_in_screen = built_in_screen.
    rv_falv->build_columns( ).
    rv_falv->layout = NEW zcl_falv_layout( rv_falv ).

    rv_falv->gui_status = NEW zcl_falv_dynamic_status( ).

    rv_falv->screen = SWITCH #( i_popup WHEN abap_true THEN c_screen_popup
                                        WHEN abap_false THEN c_screen_full ).
    IF built_in_screen EQ abap_true AND rv_falv->screen EQ c_screen_full.
      "default in full screen
      rv_falv->layout->set_no_toolbar( abap_true ).
      CALL FUNCTION 'Z_FALV_ADD_FALV_TO_STACK'
        EXPORTING
          io_falv = rv_falv.
    ENDIF.


    link_containers(
      iv_falv                = rv_falv
      i_top_of_page_parent   = top_of_page_parent
      i_custom_container     = custom_container
      i_main_split_container = main_split_container
      i_split_container      = split_container ).

    rv_falv->layout_save = 'A'.

    rv_falv->grid = CAST #(  rv_falv ).

    IF i_repid IS INITIAL.
      CALL FUNCTION 'SYSTEM_CALLSTACK'
        IMPORTING
          callstack = callstack.

      ASSIGN callstack[ 2 ] TO FIELD-SYMBOL(<stack>).
      IF sy-subrc EQ 0.
        rv_falv->repid = <stack>-mainprogram.
      ENDIF.
    ELSE.
      rv_falv->repid = i_repid.
    ENDIF.
    IF i_handle IS NOT INITIAL.
      rv_falv->variant-handle   = i_handle.
    ENDIF.
    rv_falv->variant-report = i_repid.
    rv_falv->variant-username = sy-uname.
  ENDMETHOD.


  METHOD link_containers.

    iv_falv->main_container ?= i_custom_container.
    iv_falv->split_container = i_split_container.
    iv_falv->main_split_container = i_main_split_container.
    iv_falv->top_of_page_container = i_top_of_page_parent.
    IF i_main_split_container IS NOT INITIAL.
      i_main_split_container->set_row_mode(
        EXPORTING
          mode              = i_split_container->mode_absolute
        EXCEPTIONS
          cntl_error        = 0
          cntl_system_error = 0
          OTHERS            = 0 ).
      iv_falv->hide_applog( ).
    ENDIF.
    IF i_split_container IS NOT INITIAL.
      i_split_container->set_row_mode(
        EXPORTING
          mode              = i_split_container->mode_absolute
        EXCEPTIONS
          cntl_error        = 0
          cntl_system_error = 0
          OTHERS            = 0 ).
      iv_falv->hide_top_of_page( ).
    ENDIF.

  ENDMETHOD.


  METHOD create_falv_object.

    created_from_factory = abap_true.

    IF i_subclass IS NOT INITIAL.
      DATA: subclass TYPE REF TO object.
      DATA(sublcass_abs_name) = i_subclass->absolute_name.
      CREATE OBJECT subclass TYPE (sublcass_abs_name)
       EXPORTING
        i_parent       = i_parent
        i_applogparent = i_applog.
      rv_falv ?= subclass.
      rv_falv->subclass_type = i_subclass.

    ELSE.
      CREATE OBJECT rv_falv
        EXPORTING
          i_parent       = i_parent
          i_applogparent = i_applog.

    ENDIF.


  ENDMETHOD.


  METHOD create_containters.

    DATA main_parent TYPE REF TO cl_gui_container.
    DATA docking_parent TYPE REF TO cl_gui_docking_container.

    IF cl_gui_alv_grid=>offline( ) IS NOT INITIAL.
      main_parent ?= docking_parent.
    ENDIF.
    "We need to call full screen ALV as container was not passed
    IF i_parent IS INITIAL.
      e_built_in_screen = abap_true.

      IF cl_gui_alv_grid=>offline( ) IS INITIAL.
        e_custom_container = create_main_cont_for_full_scr( i_popup ).
        main_parent ?= e_custom_container.
        e_main_split_container = create_main_split_cotainer( i_popup           = i_popup
                                                             i_applog_embedded = i_applog_embedded
                                                             i_main_parent     = main_parent ).
        e_split_container = crate_main_splitter( e_main_split_container ).
        e_parent ?= e_split_container->get_container( row = 2 column = 1 ).
        e_applog ?= e_main_split_container->get_container( row = 2 column = 1 ).
        e_top_of_page_parent ?= e_split_container->get_container( row = 1 column = 1 ).
      ELSE.

        e_parent ?= main_parent.
        e_custom_container ?= e_parent.

      ENDIF.

    ELSE.
      IF cl_gui_alv_grid=>offline( ) IS NOT INITIAL.

        e_parent ?= main_parent.
        e_custom_container ?= e_parent.

      ELSE.

        e_applog ?= i_applogparent.
        e_custom_container ?= i_parent.

        e_main_split_container = create_main_split_cotainer( i_popup           = i_popup
                                                             i_applog_embedded = i_applog_embedded
                                                             i_main_parent     = e_custom_container ).

        e_split_container = crate_main_splitter( e_main_split_container ).

        IF e_applog IS INITIAL.
          e_parent ?= e_split_container->get_container( row = 2 column = 1 ).
          e_applog ?= e_main_split_container->get_container( row = 2 column = 1 ).
          e_top_of_page_parent ?= e_split_container->get_container( row = 1 column = 1 ).
        ELSE.
          e_parent ?= e_split_container->get_container( row = 2 column = 1 ).
          e_top_of_page_parent ?= e_split_container->get_container( row = 1 column = 1 ).
          e_custom_container ?= i_parent.
        ENDIF.

      ENDIF.

    ENDIF.

  ENDMETHOD.


  METHOD crate_main_splitter.
    DATA(parent) = i_main_split_container->get_container( row = 1 column = 1 ).
    IF parent->children[] IS NOT INITIAL.
      r_split_container ?= parent->children[ 1 ].
      RETURN.
    ENDIF.
    r_split_container = NEW cl_gui_splitter_container(
      parent  = parent
      rows    = 2
      columns = 1 ).

  ENDMETHOD.


  METHOD create_main_cont_for_full_scr.

    IF i_popup EQ abap_true.

      CALL FUNCTION 'Z_FALV_CREATE_MAIN_CONTAINER'
        IMPORTING
          main_container = r_custom_container.
    ELSE.
      r_custom_container  = CAST cl_gui_container( NEW cl_gui_custom_container(
           container_name = cc_name
           dynnr          = c_screen_full
           repid          = c_fscr_repid
           no_autodef_progid_dynnr =  abap_true  ) ).
    ENDIF.


  ENDMETHOD.


  METHOD create_main_split_cotainer.

    " Create split container, log at bottom, grid at top.
    "Log hidden as default, will appear when error will be thrown.
    IF i_main_parent->children[] IS NOT INITIAL.
      r_main_split_container ?= i_main_parent->children[ 1 ].
      RETURN.
    ENDIF.
    r_main_split_container = NEW cl_gui_splitter_container(
      link_dynnr = SWITCH #( i_popup WHEN abap_true THEN c_screen_popup
                                     WHEN abap_false THEN c_screen_full )
      link_repid = c_fscr_repid
      parent     = i_main_parent
      rows       = COND #( WHEN  i_applog_embedded EQ abap_true THEN 2
                            ELSE 1 )
      columns    = 1 ).

  ENDMETHOD.


  METHOD create_by_copy.

    create_containters(
      EXPORTING
        i_parent               = i_parent
        i_applogparent         = i_applogparent
        i_popup                = i_popup
        i_applog_embedded      = application_log_embedded
      IMPORTING
*       e_built_in_screen      = data(built_in_screen)
        e_parent               = DATA(parent)
        e_applog               = DATA(applog)
        e_top_of_page_parent   = DATA(top_of_page_parent)
        e_custom_container     = DATA(custom_container)
        e_main_split_container = DATA(main_split_container)
        e_split_container      = DATA(split_container) ).


    rv_falv = create_falv_object(
      i_subclass = subclass_type
      i_parent   = parent
      i_applog   = applog ).

    copy_attributes( rv_falv ).
    set_handlers( rv_falv ).
    set_events( iv_falv = rv_falv ).


    rv_falv->screen = SWITCH #( i_popup WHEN abap_true THEN c_screen_popup
                                        WHEN abap_false THEN c_screen_full ).
    link_containers(
      iv_falv                = rv_falv
      i_top_of_page_parent   = top_of_page_parent
      i_custom_container     = custom_container
      i_main_split_container = main_split_container
      i_split_container      = split_container ).

    IF rv_falv->built_in_screen EQ abap_true.
      CALL FUNCTION 'Z_FALV_ADD_FALV_TO_STACK'
        EXPORTING
          io_falv = rv_falv.
    ENDIF.
    rv_falv->grid = CAST #( rv_falv ).
  ENDMETHOD.


  METHOD set_handlers.

    SET HANDLER iv_falv->evf_after_refresh FOR iv_falv.
    SET HANDLER iv_falv->evf_after_user_command FOR iv_falv.
    SET HANDLER iv_falv->evf_before_ucommand_internal FOR iv_falv.
    SET HANDLER iv_falv->evf_before_user_command FOR iv_falv.
    SET HANDLER iv_falv->evf_btn_click FOR iv_falv.
    SET HANDLER iv_falv->evf_data_changed FOR iv_falv.
    SET HANDLER iv_falv->evf_data_changed_internal FOR iv_falv.
    SET HANDLER iv_falv->evf_data_changed_finished FOR iv_falv.
    SET HANDLER iv_falv->evf_double_click FOR iv_falv.
    SET HANDLER iv_falv->evf_hotspot_click FOR iv_falv.
    SET HANDLER iv_falv->evf_menu_button FOR iv_falv.
    SET HANDLER iv_falv->evf_onf1 FOR iv_falv.
    SET HANDLER iv_falv->evf_onf4 FOR iv_falv.
    SET HANDLER iv_falv->evf_subtotal_text FOR iv_falv.
    SET HANDLER iv_falv->evf_toolbar_internal FOR iv_falv.
    SET HANDLER iv_falv->evf_toolbar FOR iv_falv.
    SET HANDLER iv_falv->evf_user_command FOR iv_falv.
    SET HANDLER iv_falv->evf_at_set_pf_status FOR iv_falv.
    SET HANDLER iv_falv->evf_at_set_title FOR iv_falv.
    SET HANDLER iv_falv->evf_top_of_page FOR iv_falv.
    SET HANDLER iv_falv->evf_delayed_callback FOR iv_falv.
    SET HANDLER iv_falv->evf_delayed_changed_sel_call FOR iv_falv.
    SET HANDLER iv_falv->evf_ondrag FOR iv_falv.
    SET HANDLER iv_falv->evf_ondrop FOR iv_falv.
    SET HANDLER iv_falv->evf_ondropcomplete FOR iv_falv.
    SET HANDLER iv_falv->evf_ondropgetflavor FOR iv_falv.
    SET HANDLER iv_falv->evf_drop_external_file FOR iv_falv.
    SET HANDLER iv_falv->evf_toolbar_menubutton_click FOR iv_falv.
    SET HANDLER iv_falv->evf_click_col_header FOR iv_falv.
    SET HANDLER iv_falv->evf_delayed_move_current_cell FOR iv_falv.
    SET HANDLER iv_falv->evf_f1 FOR iv_falv.
    SET HANDLER iv_falv->evf_dblclick_row_col FOR iv_falv.
    SET HANDLER iv_falv->evf_click_row_col FOR iv_falv.
    SET HANDLER iv_falv->evf_toolbar_button_click FOR iv_falv.
    SET HANDLER iv_falv->evf_double_click_col_separator FOR iv_falv.
    SET HANDLER iv_falv->evf_delayed_change_selection FOR iv_falv.
    SET HANDLER iv_falv->evf_context_menu FOR iv_falv.
    SET HANDLER iv_falv->evf_total_click_row_col FOR iv_falv.
    SET HANDLER iv_falv->evf_context_menu_selected FOR iv_falv.
    SET HANDLER iv_falv->evf_context_menu_request FOR iv_falv.
    SET HANDLER iv_falv->evf_toolbar_menu_selected FOR iv_falv.
    SET HANDLER iv_falv->evf_request_data FOR iv_falv.

    iv_falv->set_delay_change_selection(
      EXPORTING
        time   = iv_falv->delay_change_selection
      EXCEPTIONS
        error  = 0
        OTHERS = 0 ).

    iv_falv->set_delay_move_current_cell(
      EXPORTING
        time   = iv_falv->delay_move_current_cell
      EXCEPTIONS
        error  = 0
        OTHERS = 0 ).

  ENDMETHOD.

  METHOD set_events.
    DATA: ls_events TYPE slis_alv_event.
    LOOP AT iv_falv->mt_events INTO ls_events WHERE NOT form IS INITIAL.
      CASE ls_events-name.
        WHEN events-after_refresh.
          iv_falv->cb_after_refresh  = ls_events-form.
        WHEN events-after_user_command.
          iv_falv->cb_after_user_command = ls_events-form.
        WHEN events-before_user_command.
          iv_falv->cb_before_user_command = ls_events-form.
        WHEN events-btn_click.
          iv_falv->cb_btn_click   = ls_events-form.
        WHEN events-data_changed.
          iv_falv->cb_data_changed = ls_events-form.
        WHEN events-data_changed_internal.
          iv_falv->cb_data_changed_internal = ls_events-form.
        WHEN events-data_changed_finished.
          iv_falv->cb_data_changed_finished = ls_events-form.
        WHEN events-double_click.
          iv_falv->cb_double_click = ls_events-form.
        WHEN events-hotspot_click.
          iv_falv->cb_hotspot_click = ls_events-form.
        WHEN events-menu_button.
          iv_falv->cb_menu_button = ls_events-form.
        WHEN events-onf1.
          iv_falv->cb_onf1 = ls_events-form.
        WHEN events-onf4.
          iv_falv->cb_onf4 = ls_events-form.
        WHEN events-subtotal_text.
          iv_falv->cb_subtotal_text = ls_events-form.
        WHEN events-toolbar.
          iv_falv->cb_toolbar = ls_events-form.
        WHEN events-user_command.
          iv_falv->cb_user_command = ls_events-form.
        WHEN events-at_set_pf_status.
          iv_falv->cb_at_set_pf_status = ls_events-form.
        WHEN events-at_set_title.
          iv_falv->cb_at_set_title = ls_events-form.
        WHEN events-top_of_page.
          iv_falv->cb_top_of_page = ls_events-form.
        WHEN events-delayed_callback.
          iv_falv->cb_delayed_callback = ls_events-form.
        WHEN events-delayed_changed_sel_call.
          iv_falv->cb_delayed_changed_sel_call = ls_events-form.
        WHEN events-ondrag.
          iv_falv->cb_ondrag = ls_events-form.
        WHEN events-ondrop.
          iv_falv->cb_ondrop = ls_events-form.
        WHEN events-ondropcomplete.
          iv_falv->cb_ondropcomplete = ls_events-form.
        WHEN events-ondropgetflavor.
          cb_ondropgetflavor = ls_events-form.
        WHEN events-drop_external_file.
          iv_falv->cb_drop_external_file = ls_events-form.
        WHEN events-toolbar_menubutton_click.
          iv_falv->cb_toolbar_menubutton_click = ls_events-form.
        WHEN events-click_col_header.
          iv_falv->cb_click_col_header = ls_events-form.
        WHEN events-delayed_move_current_cell.
          iv_falv->cb_delayed_move_current_cell = ls_events-form.
        WHEN events-f1.
          iv_falv->cb_f1 = ls_events-form.
        WHEN events-dblclick_row_col.
          iv_falv->cb_dblclick_row_col = ls_events-form.
        WHEN events-click_row_col.
          iv_falv->cb_click_row_col = ls_events-form.
        WHEN events-toolbar_button_click.
          iv_falv->cb_toolbar_button_click = ls_events-form.
        WHEN events-double_click_col_separator.
          iv_falv->cb_double_click_col_separator = ls_events-form.
        WHEN events-delayed_change_selection.
          iv_falv->cb_delayed_change_selection = ls_events-form.
        WHEN events-context_menu.
          iv_falv->cb_context_menu = ls_events-form.
        WHEN events-total_click_row_col.
          iv_falv->cb_total_click_row_col = ls_events-form.
        WHEN events-context_menu_selected.
          iv_falv->cb_context_menu_selected = ls_events-form.
        WHEN events-context_menu_request.
          iv_falv->cb_context_menu_request = ls_events-form.
        WHEN events-toolbar_menu_selected.
          iv_falv->cb_toolbar_menu_selected = ls_events-form.
        WHEN events-request_data.
          iv_falv->cb_request_data = ls_events-form.
      ENDCASE.
    ENDLOOP.
  ENDMETHOD.

  METHOD delete_all_buttons.
    layout->delete_all_buttons = abap_true.
    IF iv_exceptions IS INITIAL.
      APPEND LINES OF mt_toolbar TO toolbar_deleted.
      REFRESH toolbar_added.
    ELSE.
      toolbar_exceptions = iv_exceptions.
      LOOP AT mt_toolbar ASSIGNING FIELD-SYMBOL(<tlb>).
        IF NOT line_exists( iv_exceptions[ function = <tlb>-function ] ).
          APPEND <tlb> TO toolbar_deleted.
          DELETE toolbar_added WHERE function EQ <tlb>-function.
        ENDIF.
      ENDLOOP.
    ENDIF.
    APPEND LINES OF toolbar_deleted TO exclude_functions.
    me->refresh_toolbar( ).
    r_falv = me.
  ENDMETHOD.


  METHOD delete_button.
    DELETE toolbar_added WHERE function = iv_function.
    IF sy-subrc NE 0.
      INSERT VALUE #( function = iv_function ) INTO TABLE toolbar_deleted.
    ENDIF.
    me->refresh_toolbar( ).
    r_falv = me.
  ENDMETHOD.


  METHOD disable_button.
    TRY.
        toolbar_added[ function = iv_function ]-disabled = abap_true.
      CATCH cx_sy_itab_line_not_found.
        CLEAR sy-subrc.
    ENDTRY.
    INSERT VALUE #( function = iv_function ) INTO TABLE toolbar_disabled.
    me->refresh_toolbar( ).
    r_falv = me.
  ENDMETHOD.


  METHOD display.
    FIELD-SYMBOLS: <outtab> TYPE STANDARD TABLE.
    r_falv = me.
    IF me->title_v1 IS INITIAL.
      me->title_v1 = sy-title. " for lazy people who wants to have alv title to be equal one from report.
    ENDIF.
    IF built_in_screen EQ abap_true AND iv_force_grid EQ abap_false.
      IF screen EQ c_screen_popup AND iv_start_row IS INITIAL
                                  AND iv_start_column IS INITIAL
                                  AND iv_end_row IS INITIAL
                                  AND iv_end_column IS INITIAL.
        iv_start_row = 1.
        iv_start_column = 1.
        iv_end_row = 20.
        iv_end_column = 150.
      ENDIF.
      CALL FUNCTION 'Z_FALV_DISPLAY'
        EXPORTING
          io_falv         = me
          iv_start_row    = iv_start_row
          iv_start_column = iv_start_column
          iv_end_row      = iv_end_row
          iv_end_column   = iv_end_column.
      .
    ELSE.
      ASSIGN outtab->* TO <outtab>.
      me->set_table_for_first_display(
        EXPORTING
          i_buffer_active               = buffering_active   " Buffering Active
          i_bypassing_buffer            = bypassing_buffer   " Switch Off Buffer
*         i_consistency_check           =     " Starting Consistency Check for Interface Error Recognition
*         i_structure_name              =     " Internal Output Table Structure Name
          is_variant                    = variant
          i_save                        = layout_save
*         i_default                     = 'X'    " Default Display Variant
          is_layout                     = lvc_layout
*         is_print                      =     " Print Control
*         it_special_groups             =     " Field Groups
          it_toolbar_excluding          = exclude_functions
*         it_hyperlink                  =     " Hyperlinks
*         it_alv_graphics               =     " Table of Structure DTC_S_TC
*         it_except_qinfo               =     " Table for Exception Quickinfo
*         ir_salv_adapter               =     " Interface ALV Adapter
        CHANGING
          it_outtab                     = <outtab> " Output Table
          it_fieldcatalog               = fcat
          it_sort                       = sort " Sort Criteria
          it_filter                     = filter " Filter Criteria
        EXCEPTIONS
          invalid_parameter_combination = 1
          program_error                 = 2
          too_many_lines                = 3
          OTHERS                        = 4 ).
      IF sy-subrc EQ 0.
        IF layout->delete_all_buttons EQ abap_true.
          delete_all_buttons( toolbar_exceptions ).
        ENDIF.
        IF split_container IS NOT INITIAL.
          split_container->set_focus(
            EXPORTING
              control           = me
            EXCEPTIONS
              cntl_error        = 0
              cntl_system_error = 0
              OTHERS            = 0 ).
          me->hide_applog( ).
        ELSE.
          me->parent->set_focus(
            EXPORTING
              control           = me
            EXCEPTIONS
              cntl_error        = 0
              cntl_system_error = 0
              OTHERS            = 0 ).
        ENDIF.
        cl_gui_cfw=>flush(
          EXCEPTIONS
            cntl_system_error = 0
            cntl_error        = 0
            OTHERS            = 0 ).
        me->set_visible( abap_true ).
        me->parent->set_visible( abap_true ).
        me->main_container->set_visible( abap_true ).
        IF me->split_container IS NOT INITIAL.
          me->split_container->set_visible( abap_true ).
        ENDIF.
        me->raise_top_of_page( ).
      ENDIF.
    ENDIF.
  ENDMETHOD.


  METHOD enable_button.
    TRY.
        toolbar_added[ function = iv_function ]-disabled = abap_false.
      CATCH cx_sy_itab_line_not_found.
        CLEAR sy-subrc.
    ENDTRY.
    DELETE toolbar_disabled WHERE function = iv_function.
    me->refresh_toolbar( ).
    r_falv = me.
  ENDMETHOD.


  METHOD encode_picture_base64.

    rv_image = |<img src="data:{ iv_mime_type };base64,{ cl_http_utility=>encode_x_base64( unencoded = iv_xstring ) }">|.

  ENDMETHOD.


  METHOD evf_after_refresh.
    PERFORM (cb_after_refresh) IN PROGRAM (repid) IF FOUND USING me.       "ZCL_SALV
  ENDMETHOD.


  METHOD evf_after_user_command.
    PERFORM (cb_after_user_command) IN PROGRAM (repid) IF FOUND USING me       "ZCL_SALV
                                                                     e_ucomm. "SY-UCOMM
  ENDMETHOD.


  METHOD evf_at_set_pf_status.
    PERFORM (cb_at_set_pf_status) IN PROGRAM (repid) IF FOUND USING me.       "ZCL_SALV
  ENDMETHOD.


  METHOD evf_at_set_title.
    PERFORM (cb_at_set_pf_status) IN PROGRAM (repid) IF FOUND USING me.       "ZCL_SALV
  ENDMETHOD.


  METHOD set_dummy_function_code.
    CALL FUNCTION 'SAPGUI_SET_FUNCTIONCODE'
      EXPORTING
        functioncode           = 'DUMMY'
      EXCEPTIONS
        function_not_supported = 0
        OTHERS                 = 0.
    r_falv = me.
  ENDMETHOD.


  METHOD evf_before_ucommand_internal.
    FIELD-SYMBOLS: <outtab> TYPE STANDARD TABLE.
    CASE e_ucomm.
      WHEN me->mc_fc_select_all.
        IF layout->mark_field IS NOT INITIAL AND
           line_exists( fcat[ fieldname = layout->mark_field checkbox = abap_true ] ).
          ASSIGN outtab->* TO <outtab>.
          LOOP AT <outtab> ASSIGNING FIELD-SYMBOL(<line>).
            ASSIGN COMPONENT layout->mark_field OF STRUCTURE <line> TO FIELD-SYMBOL(<mark>).
            IF sy-subrc EQ 0 AND me->get_cell_enabled( i_row = sy-tabix i_field = layout->mark_field ) EQ abap_true.
              <mark> = abap_true.
            ENDIF.
          ENDLOOP.
          me->soft_refresh( ).
          set_user_command( i_ucomm = space ).
        ENDIF.
      WHEN me->mc_fc_deselect_all.
        IF layout->mark_field IS NOT INITIAL AND
          line_exists( fcat[ fieldname = layout->mark_field checkbox = abap_true ] ).
          ASSIGN outtab->* TO <outtab>.
          LOOP AT <outtab> ASSIGNING <line>.
            ASSIGN COMPONENT layout->mark_field OF STRUCTURE <line> TO <mark>.
            IF sy-subrc EQ 0 AND me->get_cell_enabled( i_row = sy-tabix i_field = layout->mark_field ) EQ abap_true.
              <mark> = abap_false.
            ENDIF.
          ENDLOOP.
          me->soft_refresh( ).
          set_user_command( i_ucomm = space ).
        ENDIF.
    ENDCASE.
  ENDMETHOD.


  METHOD evf_before_user_command.
    PERFORM (cb_before_user_command) IN PROGRAM (repid) IF FOUND USING me       "ZCL_SALV
                                                                      e_ucomm. "SY-UCOMM
  ENDMETHOD.


  METHOD evf_btn_click.
    PERFORM (cb_btn_click) IN PROGRAM (repid) IF FOUND USING me        "ZCL_SALV
                                                            es_col_id "LVC_S_COL
                                                            es_row_no."LVC_S_ROID
  ENDMETHOD.


  METHOD evf_click_col_header.
    PERFORM (cb_click_col_header) IN PROGRAM (repid) IF FOUND USING me     "ZCL_SALV
                                                                   col_id."C
  ENDMETHOD.


  METHOD evf_click_row_col.
    PERFORM (cb_click_row_col) IN PROGRAM (repid) IF FOUND USING me     "ZCL_SALV
                                                                col_id "C
                                                                row_id."C
  ENDMETHOD.


  METHOD evf_context_menu.
    PERFORM (cb_context_menu) IN PROGRAM (repid) IF FOUND USING me.     "ZCL_SALV
  ENDMETHOD.


  METHOD evf_context_menu_selected.
    PERFORM (cb_context_menu_selected) IN PROGRAM (repid) IF FOUND USING me    "ZCL_SALV
                                                                        fcode."C
  ENDMETHOD.


  METHOD evf_context_menu_request.
    PERFORM (cb_context_menu_request) IN PROGRAM (repid) IF FOUND USING me       "ZCL_SALV
                                                                       e_object."CL_CTMENU
  ENDMETHOD.


  METHOD evf_data_changed.
    PERFORM (cb_data_changed) IN PROGRAM (repid) IF FOUND USING me              "ZCL_SALV
                                                               er_data_changed "CL_ALV_CHANGED_DATA_PROTOCOL
                                                               e_onf4          "CHAR01
                                                               e_onf4_before   "CHAR01
                                                               e_onf4_after    "CHAR01
                                                               e_ucomm.        "SY-UCOMM
  ENDMETHOD.


  METHOD evf_data_changed_finished.
    PERFORM (cb_data_changed_finished) IN PROGRAM (repid) IF FOUND USING me            "ZCL_SALV
                                                                        e_modified    "CHAR01
                                                                        et_good_cells."LVC_T_MODI
  ENDMETHOD.


  METHOD evf_data_changed_internal.

    IF er_data_changed->mt_protocol IS NOT INITIAL.
      show_applog( ).
    ELSE.
      hide_applog( ).
    ENDIF.

    "This lines makes that focus stays on grid
    "while embedded error log appears on the screen.
    "This trick will not work if someone will use own handler
    "for data_changed instead of evf_data_changed
    me->m_display_protocol = abap_true.

    er_data_changed->display_protocol( ).

    cl_gui_control=>set_focus(
      EXPORTING
        control           = CAST #( me )
      EXCEPTIONS
        cntl_error        = 1
        cntl_system_error = 2
        OTHERS            = 3 ).
    IF sy-subrc EQ 0.
      me->m_display_protocol = abap_false.
    ENDIF.

  ENDMETHOD.


  METHOD evf_dblclick_row_col.
    PERFORM (cb_dblclick_row_col) IN PROGRAM (repid) IF FOUND USING me     "ZCL_SALV
                                                                   col_id "C
                                                                   row_id."C
  ENDMETHOD.


  METHOD evf_delayed_callback.
    PERFORM (cb_delayed_callback) IN PROGRAM (repid) IF FOUND USING me."ZCL_SALV
  ENDMETHOD.


  METHOD evf_delayed_changed_sel_call.
    PERFORM (cb_delayed_changed_sel_call) IN PROGRAM (repid) IF FOUND USING me."ZCL_SALV
  ENDMETHOD.


  METHOD evf_delayed_change_selection.
    PERFORM (cb_delayed_change_selection) IN PROGRAM (repid) IF FOUND USING me."ZCL_SALV
  ENDMETHOD.


  METHOD evf_delayed_move_current_cell.
    PERFORM (cb_delayed_move_current_cell) IN PROGRAM (repid) IF FOUND USING me."ZCL_SALV
  ENDMETHOD.


  METHOD evf_double_click.
    PERFORM (cb_double_click) IN PROGRAM (repid) IF FOUND USING me         "ZCL_FALV
                                                               e_row      "LVC_S_ROW
                                                               e_column   "LVC_S_COL
                                                               es_row_no. "LVC_S_ROID
  ENDMETHOD.


  METHOD evf_double_click_col_separator.
    PERFORM (cb_double_click_col_separator) IN PROGRAM (repid) IF FOUND USING me     "ZCL_FALV
                                                                             col_id."C
  ENDMETHOD.


  METHOD evf_drop_external_file.
    PERFORM (cb_drop_external_file) IN PROGRAM (repid) IF FOUND USING me    "ZCL_FALV
                                                                     files."String
  ENDMETHOD.


  METHOD evf_f1.
    PERFORM (cb_f1) IN PROGRAM (repid) IF FOUND USING me.    "ZCL_FALV
  ENDMETHOD.


  METHOD evf_hotspot_click.
    PERFORM (cb_hotspot_click) IN PROGRAM (repid) IF FOUND USING me          "ZCL_FALV
                                                                e_row_id    "LVC_S_ROW
                                                                e_column_id "LVC_S_COL
                                                                es_row_no.  "LVC_S_ROID
  ENDMETHOD.


  METHOD evf_menu_button.
    PERFORM (cb_menu_button) IN PROGRAM (repid) IF FOUND USING me       "ZCL_FALV
                                                              e_object "CL_CTMENU
                                                              e_ucomm. "SY-UCOMM
  ENDMETHOD.


  METHOD evf_ondrag.
    PERFORM (cb_ondrag) IN PROGRAM (repid) IF FOUND USING me             "ZCL_FALV
                                                         es_row_no      "LVC_S_ROID
                                                         e_column       "LVC_S_COL
                                                         e_dragdropobj  "CL_DRAGDROPOBJECT
                                                         e_row.         "LVC_S_ROW
  ENDMETHOD.


  METHOD evf_ondrop.
    PERFORM (cb_ondrop) IN PROGRAM (repid) IF FOUND USING me             "ZCL_FALV
                                                         es_row_no      "LVC_S_ROID
                                                         e_column       "LVC_S_COL
                                                         e_dragdropobj  "CL_DRAGDROPOBJECT
                                                         e_row.         "LVC_S_ROW
  ENDMETHOD.


  METHOD evf_ondropcomplete.
    PERFORM (cb_ondropcomplete) IN PROGRAM (repid) IF FOUND USING me             "ZCL_FALV
                                                                 es_row_no      "LVC_S_ROID
                                                                 e_column       "LVC_S_COL
                                                                 e_dragdropobj  "CL_DRAGDROPOBJECT
                                                                 e_row.         "LVC_S_ROW
  ENDMETHOD.


  METHOD evf_ondropgetflavor.
    PERFORM (cb_ondropgetflavor) IN PROGRAM (repid) IF FOUND USING me             "ZCL_FALV
                                                                  es_row_no      "LVC_S_ROID
                                                                  e_column       "LVC_S_COL
                                                                  e_dragdropobj  "CL_DRAGDROPOBJECT
                                                                  e_flavors      "CNDD_FLAVORS
                                                                  e_row.         "LVC_S_ROW
  ENDMETHOD.


  METHOD evf_onf1.
    PERFORM (cb_onf1) IN PROGRAM (repid) IF FOUND USING me              "ZCL_FALV
                                                       e_fieldname     "LVC_FNAME
                                                       es_row_no       "LVC_S_ROID
                                                       er_event_data.  "CL_ALV_EVENT_DATA
  ENDMETHOD.


  METHOD evf_onf4.
    PERFORM (cb_onf4) IN PROGRAM (repid) IF FOUND USING me              "ZCL_FALV
                                                       e_fieldname     "LVC_FNAME
                                                       e_fieldvalue    "LVC_VALUE
                                                       es_row_no       "LVC_S_ROID
                                                       er_event_data   "CL_ALV_EVENT_DATA
                                                       et_bad_cells    "LVC_T_MODI
                                                       e_display.      "CHAR01
  ENDMETHOD.


  METHOD evf_request_data.
    PERFORM (cb_request_data) IN PROGRAM (repid) IF FOUND USING me         "ZCL_FALV
                                                               fragments. "String
  ENDMETHOD.


  METHOD evf_subtotal_text.
    PERFORM (cb_subtotal_text) IN PROGRAM (repid) IF FOUND USING me                "ZCL_FALV
                                                                es_subtottxt_info "LVC_S_STXT
                                                                ep_subtot_line    "DATA
                                                                e_event_data.     "CL_ALV_EVENT_DATA
  ENDMETHOD.


  METHOD evf_toolbar.
    PERFORM (cb_toolbar) IN PROGRAM (repid) IF FOUND USING me            "ZCL_FALV
                                                          e_object      "CL_ALV_EVENT_TOOLBAR_SET
                                                          e_interactive."CHAR01
  ENDMETHOD.


  METHOD evf_toolbar_button_click.
    PERFORM (cb_toolbar_button_click) IN PROGRAM (repid) IF FOUND USING me     "ZCL_FALV
                                                                       fcode ."C
  ENDMETHOD.


  METHOD evf_toolbar_internal.
    LOOP AT toolbar_added ASSIGNING FIELD-SYMBOL(<tb>).
      INSERT <tb> INTO TABLE e_object->mt_toolbar[].
    ENDLOOP.
    LOOP AT toolbar_disabled ASSIGNING <tb>.
      TRY.
          e_object->mt_toolbar[ function = <tb>-function ]-disabled = abap_true.
        CATCH cx_sy_itab_line_not_found.
          CLEAR sy-subrc.
      ENDTRY.
    ENDLOOP.
    LOOP AT toolbar_deleted ASSIGNING <tb>.
      DELETE e_object->mt_toolbar WHERE function = <tb>-function.
    ENDLOOP.

  ENDMETHOD.


  METHOD evf_toolbar_menubutton_click.
    PERFORM (cb_toolbar_menubutton_click) IN PROGRAM (repid) IF FOUND USING me         "ZCL_FALV
                                                                           fcode      "C
                                                                           menu_pos_x "I
                                                                           menu_pos_y."I
  ENDMETHOD.


  METHOD evf_toolbar_menu_selected.
    PERFORM (cb_toolbar_menu_selected) IN PROGRAM (repid) IF FOUND USING me     "ZCL_FALV
                                                                        fcode ."C
  ENDMETHOD.


  METHOD evf_top_of_page.
    PERFORM (cb_top_of_page) IN PROGRAM (repid) IF FOUND USING me          "ZCL_FALV
                                                              e_dyndoc_id "CL_DD_DOCUMENT
                                                              table_index."SYINDEX
  ENDMETHOD.


  METHOD evf_total_click_row_col.
    PERFORM (cb_total_click_row_col) IN PROGRAM (repid) IF FOUND USING me     "ZCL_FALV
                                                                      col_id "C
                                                                      row_id."C
  ENDMETHOD.


  METHOD evf_user_command.
    DATA: callstack TYPE abap_callstack.
    CASE e_ucomm.
      WHEN fc_back.
        LEAVE TO SCREEN 0.
      WHEN fc_exit.
        LEAVE TO SCREEN 0.
      WHEN fc_up.
        LEAVE TO SCREEN 0.
      WHEN fc_cancel.
        LEAVE TO SCREEN 0.
      WHEN fc_mass_replace.
        mass_replace( ).
      WHEN fc_find.
        e_ucomm = '%SC'.
        set_function_code( CHANGING c_ucomm = e_ucomm ).
      WHEN fc_find_next.
        e_ucomm = '%SC+'.
        set_function_code( CHANGING c_ucomm = e_ucomm ).
      WHEN OTHERS.
        PERFORM (cb_user_command) IN PROGRAM (repid) IF FOUND USING me       "ZCL_SALV
                                                                   e_ucomm. "SY-UCOMM
    ENDCASE.
  ENDMETHOD.


  METHOD exclude_function.
    IF NOT line_exists( exclude_functions[ table_line = iv_ucomm ] ).
      INSERT iv_ucomm INTO TABLE exclude_functions.
    ENDIF.
  ENDMETHOD.


  METHOD create_ex_result_falv.

    DATA:
      lt_lvc_row TYPE lvc_t_row.

    CLEAR:
      lt_lvc_row.
    me->get_selected_rows(
      IMPORTING
        et_index_rows = lt_lvc_row ).

    DATA: lt_sel_cols  TYPE lvc_t_col,
          lt_sel_cells TYPE lvc_t_cell.

    me->get_selected_columns(
      IMPORTING
        et_index_columns = lt_sel_cols ).

    me->get_selected_cells(
      IMPORTING
        et_cell = lt_sel_cells ).

    DATA:
      ls_lvc_col  TYPE lvc_s_col,
      ls_lvc_row  TYPE lvc_s_row,
      ls_cur_cell TYPE lvc_s_cell.

    CLEAR:
      ls_lvc_row,
      ls_lvc_col.
    me->get_current_cell(
      IMPORTING
        es_row_id = ls_lvc_row
        es_col_id = ls_lvc_col ).
    ls_cur_cell-col_id-fieldname = ls_lvc_col-fieldname.
    ls_cur_cell-row_id-index = ls_lvc_row-index.

    DATA: ls_hyper_entry    TYPE string,
          ls_dropdown_entry TYPE string,
          lt_drdn           TYPE lvc_t_drop.

    IF grid->r_salv_adapter IS BOUND.
      DATA:
        lr_display TYPE REF TO if_salv_display_adapter.

      lr_display ?= grid->r_salv_adapter.

      DATA:
        lr_columns TYPE REF TO cl_salv_columns_list.

      lr_columns ?= lr_display->get_columns( ).

      ls_hyper_entry = lr_columns->get_hyperlink_entry_column( ).
      ls_dropdown_entry = lr_columns->get_dropdown_entry_column( ).

      DATA:
        lr_om TYPE REF TO cl_salv_table.

      lr_om ?= grid->r_salv_adapter->r_controller->r_model.

      DATA:
        lr_functional_settings TYPE REF TO cl_salv_functional_settings.

      lr_functional_settings = lr_om->get_functional_settings( ).

      DATA:
        lr_dropdowns TYPE REF TO cl_salv_dropdowns.

***<<<Y7AK057779
      TRY.
          lr_dropdowns = lr_functional_settings->get_dropdowns( ).

          lt_drdn = cl_salv_controller_metadata=>get_dropdowns( lr_dropdowns ).
        CATCH cx_salv_method_not_supported.
          CLEAR sy-subrc.
      ENDTRY.
***>>>Y7AK057779

*>>> Y7AK058143
      DATA:
        lr_tol TYPE REF TO cl_salv_form_element,
        lr_eol TYPE REF TO cl_salv_form_element.
*<<< Y7AK058143

      lr_tol = lr_om->get_top_of_list( ).
      lr_eol = lr_om->get_end_of_list( ).
    ENDIF.

*>>> Y7AK058143
    DATA:
      lr_top_of_list TYPE REF TO cl_salv_form,
      lr_end_of_list TYPE REF TO cl_salv_form.

    CREATE OBJECT lr_top_of_list
      EXPORTING
        r_content = lr_tol.

    CREATE OBJECT lr_end_of_list
      EXPORTING
        r_content = lr_eol.
*<<< Y7AK058143

    er_result_table = cl_salv_ex_util=>factory_result_data_table(
      t_selected_rows        = lt_lvc_row
      t_selected_columns     = lt_sel_cols
      t_selected_cells       = lt_sel_cells
      r_data                 = grid->mt_outtab
      s_layout               = grid->m_cl_variant->ms_layout
      t_fieldcatalog         = grid->m_cl_variant->mt_fieldcatalog
      t_sort                 = grid->m_cl_variant->mt_sort
      t_filter               = grid->m_cl_variant->mt_filter
      t_hyperlinks           = grid->mt_hyperlinks
      s_current_cell         = ls_cur_cell
      hyperlink_entry_column = ls_hyper_entry
      dropdown_entry_column  = ls_dropdown_entry
      r_top_of_list          = lr_top_of_list
      r_end_of_list          = lr_end_of_list
      t_dropdown_values      = lt_drdn ).

  ENDMETHOD.


  METHOD export_to_excel.


    DATA: version TYPE string.
    DATA: result_data TYPE REF TO cl_salv_ex_result_data_table.
    DATA: columns TYPE REF TO cl_salv_columns_table.
    DATA: aggreg TYPE REF TO cl_salv_aggregations.
    DATA: salv_intf_descr TYPE REF TO cl_abap_objectdescr.
    DATA: salv_table TYPE REF TO cl_salv_table.
    DATA: file_type TYPE salv_bs_constant.
    FIELD-SYMBOLS <tab> TYPE ANY TABLE.


    IF cl_salv_bs_a_xml_base=>get_version( ) EQ if_salv_bs_xml=>version_25 OR
       cl_salv_bs_a_xml_base=>get_version( ) EQ if_salv_bs_xml=>version_26.

      result_data = create_ex_result_falv( ).

      CASE cl_salv_bs_a_xml_base=>get_version( ).
        WHEN if_salv_bs_xml=>version_25.
          version = if_salv_bs_xml=>version_25.
        WHEN if_salv_bs_xml=>version_26.
          version = if_salv_bs_xml=>version_26.
      ENDCASE.

      "if XLSX is possible then we create it,  if not then MHTML excel file
      salv_intf_descr ?= cl_abap_intfdescr=>describe_by_name( EXPORTING p_name = 'IF_SALV_BS_XML' ).
      IF salv_intf_descr IS NOT INITIAL AND line_exists( salv_intf_descr->attributes[ name = 'C_TYPE_XLSX'  ] ).
        file_type = 10.
      ELSE.
        file_type = 02.
      ENDIF.

      "transformation of data to excel
      CALL METHOD cl_salv_bs_tt_util=>if_salv_bs_tt_util~transform
        EXPORTING
          xml_type      = file_type
          xml_version   = version
          r_result_data = result_data
          xml_flavour   = if_salv_bs_c_tt=>c_tt_xml_flavour_export
          gui_type      = if_salv_bs_xml=>c_gui_type_gui
        IMPORTING
          xml           = rv_xstring.
    ENDIF.


  ENDMETHOD.


  METHOD get_cell_enabled.
    FIELD-SYMBOLS: <outtab> TYPE STANDARD TABLE,
                   <styles> TYPE lvc_t_styl,
                   <field>  TYPE any.
    CHECK i_row IS NOT INITIAL AND i_field IS NOT INITIAL.
    get_frontend_layout( IMPORTING es_layout = lvc_layout ).

    " if sy-subrc eq 0. " The value of SY-SUBRC is always set to 0 by CALL METHOD GET_FRONTEND_LAYOUT.
    IF lvc_layout-stylefname IS NOT INITIAL.
      ASSIGN outtab->* TO <outtab>.
      ASSIGN <outtab>[ i_row ] TO FIELD-SYMBOL(<line>).
      IF sy-subrc EQ 0.
        ASSIGN COMPONENT lvc_layout-stylefname OF STRUCTURE <line> TO <styles>.
        IF sy-subrc EQ 0.
          ASSIGN <styles>[ fieldname = i_field ] TO FIELD-SYMBOL(<style>).
          IF sy-subrc EQ 0.
            IF <style>-style = mc_style_enabled.
              r_enabled = abap_true.
              RETURN.
            ELSEIF <style>-style = mc_style_disabled.
              r_enabled = abap_false.
              RETURN.
            ENDIF.
          ENDIF.
        ENDIF.
      ENDIF.
    ENDIF.
    "all cells editable
    IF lvc_layout-edit EQ abap_true.
      r_enabled = abap_true.
    ELSE.
      get_frontend_fieldcatalog( IMPORTING et_fieldcatalog = fcat ).
      ASSIGN fcat[ fieldname = i_field ] TO FIELD-SYMBOL(<fcat>).
      IF <fcat>-edit EQ abap_true.
        r_enabled = abap_true.
      ENDIF.
    ENDIF.
    " endif.
  ENDMETHOD.


  METHOD get_file_from_mime.
    cl_mime_repository_api=>get_api( )->get(
            EXPORTING i_url = iv_path
            IMPORTING e_content = ev_xstring
                      e_mime_type = ev_mime_type
        EXCEPTIONS OTHERS = 1 ).
    CHECK sy-subrc EQ 0.
  ENDMETHOD.


  METHOD get_picture_from_se78.
    cl_ssf_xsf_utilities=>get_bds_graphic_as_bmp(
      EXPORTING
        p_object       = 'GRAPHICS'    " SAPscript Graphics Management: Application object
        p_name         = iv_name   " Name
        p_id           = iv_id   " SAPscript Graphics Management: ID
        p_btype        = iv_type   " SAPscript: Type of graphic
      RECEIVING
        p_bmp          = rv_xstring   " Graphic Data
      EXCEPTIONS
        not_found      = 0
        internal_error = 0
        OTHERS         = 0 ).
  ENDMETHOD.


  METHOD hide_applog.

    IF main_split_container IS NOT INITIAL.
      main_split_container->set_row_sash(
        EXPORTING
          id                = 1   " Row Splitter Bar ID
          type              = split_container->type_sashvisible   " Attribute
          value             = 0   " Value
        EXCEPTIONS
          cntl_error        = 0
          cntl_system_error = 0
          OTHERS            = 0 ).
      main_split_container->set_row_height(
        EXPORTING
          id                = 2 " Row ID
          height            = 0  " Height
        EXCEPTIONS
          cntl_error        = 0
          cntl_system_error = 0
          OTHERS            = 0 ).
      CLEAR splitter_row_3_height.
    ENDIF.
  ENDMETHOD.


  METHOD hide_top_of_page.
    IF split_container IS NOT INITIAL.

      split_container->set_row_sash(
        EXPORTING
          id                = 1   " Row Splitter Bar ID
          type              = split_container->type_sashvisible   " Attribute
          value             = 0   " Value
        EXCEPTIONS
          cntl_error        = 0
          cntl_system_error = 0
          OTHERS            = 0 ).

      split_container->set_row_height(
        EXPORTING
          id                = 1 " Row ID
          height            = 0  " Height
        EXCEPTIONS
          cntl_error        = 1
          cntl_system_error = 2
          OTHERS            = 3 ).
      IF sy-subrc EQ 0.
        splitter_row_1_height = 0.
      ENDIF.
    ENDIF.
    r_falv = me.
  ENDMETHOD.


  METHOD lvc_fcat_from_itab.
    DATA: table TYPE REF TO data.
    CREATE DATA table LIKE it_table.
    ASSIGN table->* TO FIELD-SYMBOL(<table>).
    TRY.
        cl_salv_table=>factory( IMPORTING r_salv_table = DATA(salv_table)
                                CHANGING  t_table      = <table> ).
        rt_fcat = cl_salv_controller_metadata=>get_lvc_fieldcatalog(
            r_columns      = salv_table->get_columns( ) " ALV Filter
            r_aggregations = salv_table->get_aggregations( ) )." ALV Aggregations
      CATCH cx_root.
    ENDTRY.
  ENDMETHOD.


  METHOD mass_replace.
    FIELD-SYMBOLS: <outtab> TYPE STANDARD TABLE.
    ASSIGN outtab->* TO <outtab>.
    IF sy-subrc EQ 0.
      CALL FUNCTION 'Z_FALV_MASS_REPLACE'
        EXPORTING
          io_grid   = CAST cl_gui_alv_grid( me )
        CHANGING
          ct_outtab = <outtab>.
    ENDIF.
  ENDMETHOD.


  METHOD pai.
    DATA: ucomm TYPE sy-ucomm.
    ucomm = c_ucomm.
    CLEAR c_ucomm.
    RAISE EVENT user_command EXPORTING e_ucomm = ucomm.

    me->set_function_code(
      CHANGING
        c_ucomm = ucomm ).
  ENDMETHOD.


  METHOD pbo.

    gui_status->show_gui_status( ).
    RAISE EVENT at_set_pf_status .

    gui_status->show_title(
      EXPORTING
        iv_text1 = title_v1
        iv_text2 = title_v2
        iv_text3 = title_v3
        iv_text4 = title_v4
        iv_text5 = title_v5 ).
    RAISE EVENT at_set_title.

  ENDMETHOD.


  METHOD raise_top_of_page.

    IF top_of_page_visible_at_start EQ abap_true AND
       top_of_page_container IS NOT INITIAL.

      IF me->top_of_page_doc IS INITIAL.
        top_of_page_doc = NEW cl_dd_document( ).
      ENDIF.

      EXPORT alv_form_html FROM abap_true
            TO MEMORY ID 'ALV_FORM_HTML'.


      CALL METHOD me->list_processing_events
        EXPORTING
          i_event_name = 'TOP_OF_PAGE'
          i_dyndoc_id  = me->top_of_page_doc.


      EXPORT alv_form_html FROM abap_false
             TO MEMORY ID 'ALV_FORM_HTML'.

      top_of_page_doc->display_document(
        EXPORTING
          reuse_control      = 'X'
          parent             = top_of_page_container
        EXCEPTIONS
          html_display_error = 0
          OTHERS             = 0 ).
      show_top_of_page( ).
    ENDIF.
  ENDMETHOD.


  METHOD refresh_toolbar.
    CHECK cl_gui_alv_grid=>offline( ) IS INITIAL.
    CHECK grid->m_init_toolbar EQ space.
    TRY.
        me->set_toolbar_interactive(  ).
      CATCH cx_root.
        "in case method is called before the display of grid
        "no need to do anything with that
        CLEAR sy-subrc.
    ENDTRY.
    r_falv = me.
  ENDMETHOD.


  METHOD save_excel_localy.
    DATA: path     TYPE string,
          filename TYPE string.

    IF iv_path IS INITIAL.
      cl_gui_frontend_services=>file_save_dialog(
        EXPORTING
*         window_title         = window_title
          default_extension    = 'XLSX'
*         default_file_name    = default_file_name
*         with_encoding        = with_encoding
*         file_filter          = file_filter
*         initial_directory    = initial_directory
*         prompt_on_overwrite  = 'X'
        CHANGING
          filename             = filename
          path                 = path
          fullpath             = iv_path
*         user_action          = user_action
*         file_encoding        = file_encoding
        EXCEPTIONS
          cntl_error           = 1
          error_no_gui         = 2
          not_supported_by_gui = 3
          OTHERS               = 4 ).
      IF sy-subrc <> 0.
        RETURN.
      ENDIF.
    ENDIF.

    IF iv_path IS NOT INITIAL.

      DATA(xstring) = me->export_to_excel( ).
      DATA(xstrsize) = xstrlen( xstring ).
      DATA(solix) = cl_bcs_convert=>xstring_to_solix( xstring  ).

      cl_gui_frontend_services=>gui_download(
        EXPORTING
          bin_filesize            = xstrsize
          filename                = iv_path
          filetype                = 'BIN'
        CHANGING
          data_tab                = solix
        EXCEPTIONS
          file_write_error        = 1
          no_batch                = 2
          gui_refuse_filetransfer = 3
          invalid_type            = 4
          no_authority            = 5
          unknown_error           = 6
          header_not_allowed      = 7
          separator_not_allowed   = 8
          filesize_not_allowed    = 9
          header_too_long         = 10
          dp_error_create         = 11
          dp_error_send           = 12
          dp_error_write          = 13
          unknown_dp_error        = 14
          access_denied           = 15
          dp_out_of_memory        = 16
          disk_full               = 17
          dp_timeout              = 18
          file_not_found          = 19
          dataprovider_exception  = 20
          control_flush_error     = 21
          not_supported_by_gui    = 22
          error_no_gui            = 23
          OTHERS                  = 24
      ).
      IF sy-subrc EQ 0.
        rv_saved = abap_true.
      ENDIF.

    ENDIF.
  ENDMETHOD.


  METHOD send.
    r_falv = me.
    TRY.
        DATA(request) = cl_bcs=>create_persistent( ).
      CATCH cx_send_req_bcs.
        RAISE create_request_error.
    ENDTRY.

    TRY.
        DATA(document) = cl_document_bcs=>create_document(
                                                            i_type = 'HTM'
                                                            i_text = cl_document_bcs=>string_to_soli( iv_body )
                                                            i_subject = CONV #( iv_subject )
                                                            i_importance = iv_importance
                                                            i_sensitivity = iv_sensitivity ).


      CATCH cx_document_bcs.
        RAISE create_document_error.
    ENDTRY.

    DATA(excel) = export_to_excel( ).

    TRY.
        document->add_attachment(
            i_attachment_type    = 'EXT'
            i_att_content_hex    = cl_document_bcs=>xstring_to_solix( excel )
            i_attachment_size    = CONV #( xstrlen( excel ) )
            i_attachment_subject = COND #( WHEN iv_filename IS NOT INITIAL THEN iv_filename
                                           ELSE CONV #( |{ sy-datum }_{ sy-uzeit }.xlsx | )
                                                        ) ).
      CATCH cx_document_bcs .
        RAISE add_attachment_error.
    ENDTRY.


    TRY.

        request->set_document( document ).
      CATCH cx_send_req_bcs.
        RAISE add_document_error.
    ENDTRY.

    IF it_recipients IS NOT INITIAL.
      LOOP AT it_recipients ASSIGNING FIELD-SYMBOL(<addr>).
        TRY.
            DATA(smtp_addr) = cl_cam_address_bcs=>create_internet_address( <addr>-smtp_addr ).
          CATCH cx_address_bcs.
            RAISE add_recipient_error.
        ENDTRY.

        TRY.
            request->add_recipient( i_recipient  = smtp_addr
                                    i_express    = <addr>-express
                                    i_copy       = <addr>-copy
                                    i_blind_copy = <addr>-blind_copy
                                    ).

          CATCH cx_send_req_bcs.
            RAISE add_recipient_error.
        ENDTRY.
      ENDLOOP.

      IF iv_sender IS NOT INITIAL.
        TRY.
            DATA(sender) = cl_cam_address_bcs=>create_internet_address( i_address_string = iv_sender
                                                                        i_address_name   = iv_sender_name ).
          CATCH cx_address_bcs.
            RAISE add_sender_error.
        ENDTRY.

        TRY.
            request->set_sender( i_sender = sender ).
          CATCH cx_send_req_bcs.
            RAISE add_sender_error.
        ENDTRY.
      ENDIF.

      TRY.
          request->set_message_subject( ip_subject = iv_subject ).
        CATCH cx_root.
      ENDTRY.


      IF iv_immediately EQ abap_true.
        TRY .
*     set send immediately
            request->set_send_immediately( abap_true ).
          CATCH cx_send_req_bcs.
            RAISE send_immediately_error.
        ENDTRY.

      ENDIF.
      TRY.
          DATA(result) = request->send(  ).
          IF iv_commit EQ abap_true.
            COMMIT WORK.
          ENDIF.
        CATCH cx_send_req_bcs.
          RAISE send_error.
      ENDTRY.
    ELSE.
      RAISE add_recipient_error.
    ENDIF.
  ENDMETHOD.


  METHOD set_cell_button.
    r_falv = me.
    FIELD-SYMBOLS: <outtab> TYPE STANDARD TABLE,
                   <styles> TYPE lvc_t_styl.
    get_frontend_layout( IMPORTING es_layout = lvc_layout ).
    CHECK lvc_layout-stylefname IS NOT INITIAL.
    ASSIGN outtab->* TO <outtab>.
    IF sy-subrc EQ 0.
      ASSIGN <outtab>[ iv_row ] TO FIELD-SYMBOL(<row>).
      IF sy-subrc EQ 0.
        ASSIGN COMPONENT lvc_layout-stylefname OF STRUCTURE <row> TO <styles>.
        IF sy-subrc EQ 0.
          TRY.
              <styles>[ fieldname = iv_fieldname ]-style = mc_style_button.
            CATCH cx_sy_itab_line_not_found.
              INSERT VALUE #( fieldname = iv_fieldname style = mc_style_button ) INTO TABLE <styles>.
          ENDTRY.
        ENDIF.
      ENDIF.
    ENDIF.
  ENDMETHOD.


  METHOD set_cell_color.
    FIELD-SYMBOLS: <outtab> TYPE STANDARD TABLE,
                   <colors> TYPE lvc_t_scol.
    r_falv = me.
    get_frontend_layout( IMPORTING es_layout = lvc_layout ).
    CHECK lvc_layout-ctab_fname IS NOT INITIAL.
    ASSIGN outtab->* TO <outtab>.
    IF sy-subrc EQ 0.
      ASSIGN <outtab>[ iv_row ] TO FIELD-SYMBOL(<row>).
      IF sy-subrc EQ 0.
        ASSIGN COMPONENT lvc_layout-ctab_fname OF STRUCTURE <row> TO <colors>.
        IF sy-subrc EQ 0.
          TRY.
              <colors>[ fname = iv_fieldname ]-color = iv_color.
            CATCH cx_sy_itab_line_not_found.
              INSERT VALUE #( fname = iv_fieldname color = iv_color ) INTO TABLE <colors>.
          ENDTRY.
        ENDIF.
      ENDIF.
    ENDIF.
  ENDMETHOD.


  METHOD set_cell_disabled.
    FIELD-SYMBOLS: <outtab> TYPE STANDARD TABLE,
                   <styles> TYPE lvc_t_styl.
    r_falv = me.
    get_frontend_layout( IMPORTING es_layout = lvc_layout ).
    CHECK lvc_layout-stylefname IS NOT INITIAL.
    ASSIGN outtab->* TO <outtab>.
    IF sy-subrc EQ 0.
      ASSIGN <outtab>[ iv_row ] TO FIELD-SYMBOL(<row>).
      IF sy-subrc EQ 0.
        ASSIGN COMPONENT lvc_layout-stylefname OF STRUCTURE <row> TO <styles>.
        IF sy-subrc EQ 0.
          TRY.
              <styles>[ fieldname = iv_fieldname ]-style = mc_style_disabled.
            CATCH cx_sy_itab_line_not_found.
              INSERT VALUE #( fieldname = iv_fieldname style = mc_style_disabled ) INTO TABLE <styles>.
          ENDTRY.
        ENDIF.
      ENDIF.
    ENDIF.
  ENDMETHOD.


  METHOD set_cell_enabled.
    FIELD-SYMBOLS: <outtab> TYPE STANDARD TABLE,
                   <styles> TYPE lvc_t_styl.
    r_falv = me.
    get_frontend_layout( IMPORTING es_layout = lvc_layout ).
    CHECK lvc_layout-stylefname IS NOT INITIAL.
    ASSIGN outtab->* TO <outtab>.
    IF sy-subrc EQ 0.
      ASSIGN <outtab>[ iv_row ] TO FIELD-SYMBOL(<row>).
      IF sy-subrc EQ 0.
        ASSIGN COMPONENT lvc_layout-stylefname OF STRUCTURE <row> TO <styles>.
        IF sy-subrc EQ 0.
          TRY.
              <styles>[ fieldname = iv_fieldname ]-style = mc_style_enabled.
            CATCH cx_sy_itab_line_not_found.
              INSERT VALUE #( fieldname = iv_fieldname style = mc_style_enabled ) INTO TABLE <styles>.
          ENDTRY.
        ENDIF.
      ENDIF.
    ENDIF.
  ENDMETHOD.


  METHOD set_cell_hotspot.
    FIELD-SYMBOLS: <outtab> TYPE STANDARD TABLE,
                   <styles> TYPE lvc_t_styl.
    r_falv = me.
    get_frontend_layout( IMPORTING es_layout = lvc_layout ).
    CHECK lvc_layout-stylefname IS NOT INITIAL.
    ASSIGN outtab->* TO <outtab>.
    IF sy-subrc EQ 0.
      ASSIGN <outtab>[ iv_row ] TO FIELD-SYMBOL(<row>).
      IF sy-subrc EQ 0.
        ASSIGN COMPONENT lvc_layout-stylefname OF STRUCTURE <row> TO <styles>.
        IF sy-subrc EQ 0.
          TRY.
              <styles>[ fieldname = iv_fieldname ]-style = mc_style_hotspot.
            CATCH cx_sy_itab_line_not_found.
              INSERT VALUE #( fieldname = iv_fieldname style = mc_style_hotspot ) INTO TABLE <styles>.
          ENDTRY.
        ENDIF.
      ENDIF.
    ENDIF.
  ENDMETHOD.


  METHOD set_editable.
    r_falv = me.
    CHECK cl_gui_alv_grid=>offline( ) IS INITIAL.
    me->set_ready_for_input( i_ready_for_input = 1 ).
    IF iv_modify EQ abap_true.
      me->register_edit_event(
        EXPORTING
          i_event_id = me->mc_evt_modified
        EXCEPTIONS
          error      = 0
          OTHERS     = 0 ).
    ELSE.
      me->register_edit_event(
        EXPORTING
          i_event_id = me->mc_evt_enter
        EXCEPTIONS
          error      = 0
          OTHERS     = 0 ).
    ENDIF.
  ENDMETHOD.


  METHOD set_frontend_fieldcatalog.
    fcat = it_fieldcatalog.
    super->set_frontend_fieldcatalog( fcat ).
  ENDMETHOD.


  METHOD set_frontend_layout.
    lvc_layout = is_layout.
    super->set_frontend_layout( is_layout ).
  ENDMETHOD.


  METHOD set_list_view.
    m_batch_mode = abap_true.
    r_falv = me.
  ENDMETHOD.


  METHOD set_mark_field.
    IF line_exists( fcat[ fieldname = iv_fieldname ] ).
      layout->mark_field = iv_fieldname.
      CHECK iv_fieldname IS NOT INITIAL.
      column( iv_fieldname )->set_checkbox( abap_true ).
    ENDIF.
  ENDMETHOD.


  METHOD set_output_table.
    GET REFERENCE OF ct_table INTO outtab.
  ENDMETHOD.


  METHOD set_parent.
    me->parent ?= io_parent.
    r_falv = me.
  ENDMETHOD.


  METHOD set_readonly.
    me->set_ready_for_input( i_ready_for_input = 0 ).
    r_falv = me.
  ENDMETHOD.


  METHOD set_row_color.
    FIELD-SYMBOLS: <outtab> TYPE STANDARD TABLE,
                   <color>  TYPE char04.
    r_falv = me.
    get_frontend_layout( IMPORTING es_layout = lvc_layout ).
    CHECK lvc_layout-info_fname IS NOT INITIAL.
    ASSIGN outtab->* TO <outtab>.
    IF sy-subrc EQ 0.
      ASSIGN <outtab>[ iv_row ] TO FIELD-SYMBOL(<row>).
      IF sy-subrc EQ 0.
        ASSIGN COMPONENT lvc_layout-info_fname OF STRUCTURE <row> TO <color>.
        IF sy-subrc EQ 0.
          <color> = iv_color.
        ENDIF.
      ENDIF.
    ENDIF.
  ENDMETHOD.


  METHOD show_applog.

    r_falv = me.
    IF main_split_container IS NOT INITIAL.
      main_split_container->get_row_height(
        EXPORTING
          id                = 2
        IMPORTING
          result            = splitter_row_2_height
        EXCEPTIONS
          cntl_error        = 1
          cntl_system_error = 2
          OTHERS            = 3 ).
      IF sy-subrc EQ 0 AND splitter_row_2_height EQ 0.
        main_split_container->set_row_sash(
          EXPORTING
            id                = 1   " Row Splitter Bar ID
            type              = split_container->type_sashvisible   " Attribute
            value             = 1   " Value
          EXCEPTIONS
            cntl_error        = 0
            cntl_system_error = 0
            OTHERS            = 0 ).
        main_split_container->get_row_height(
          EXPORTING
            id                = 1   " ALV
          IMPORTING
            result            = splitter_row_2_height
          EXCEPTIONS
            cntl_error        = 0
            cntl_system_error = 0
            OTHERS            = 0 ).

        main_split_container->get_row_height(
          EXPORTING
            id                = 2   " Row ID
          IMPORTING
            result            = splitter_row_3_height   " Result Code
          EXCEPTIONS
            cntl_error        = 0
            cntl_system_error = 0
            OTHERS            = 0 ).

        main_split_container->set_row_height(
          EXPORTING
            id                = 2 "error log
            height            = error_log_height
          IMPORTING
            result            = result
          EXCEPTIONS
            cntl_error        = 0
            cntl_system_error = 0
            OTHERS            = 0 ).

        TRY.
            main_split_container->set_row_height(
              EXPORTING
                id                = 1 " ALV
                height            = CONV #( splitter_row_2_height - error_log_height )
              IMPORTING
                result            = result
              EXCEPTIONS
                cntl_error        = 0
                cntl_system_error = 0
                OTHERS            = 0 ).
          CATCH cx_root.
        ENDTRY.
      ENDIF.
      CLEAR splitter_row_2_height.
      CLEAR splitter_row_3_height.
    ENDIF.
  ENDMETHOD.


  METHOD show_top_of_page.
    r_falv = me.
    IF split_container IS NOT INITIAL.
      split_container->set_row_sash(
        EXPORTING
          id                = 1   " Row Splitter Bar ID
          type              = split_container->type_sashvisible   " Attribute
          value             = 1   " Value
        EXCEPTIONS
          cntl_error        = 0
          cntl_system_error = 0
          OTHERS            = 0 ).

      split_container->get_row_height(
        EXPORTING
          id                = 1   " Row ID
        IMPORTING
          result            = splitter_row_1_height   " Result Code
        EXCEPTIONS
          cntl_error        = 1
          cntl_system_error = 2
          OTHERS            = 3 ).
      IF sy-subrc EQ 0 AND splitter_row_1_height EQ 0.
        split_container->set_row_height(
          EXPORTING
            id                = 1 " Row ID
            height            = top_of_page_height
          IMPORTING
            result            = result
          EXCEPTIONS
            cntl_error        = 0
            cntl_system_error = 0
            OTHERS            = 0 ).
      ENDIF.
      top_of_page_visible_at_start = abap_true.
    ENDIF.
  ENDMETHOD.


  METHOD soft_refresh.
    me->refresh_table_display(
      EXPORTING
        is_stable      = CONV #( 'XX' ) " With Stable Rows/Columns
        i_soft_refresh = abap_true " Without Sort, Filter, etc.
      EXCEPTIONS
        finished       = 0
        OTHERS         = 0 ).
    r_falv = me.
  ENDMETHOD.


  METHOD copy_attributes.
    FIELD-SYMBOLS: <outtab> TYPE STANDARD TABLE.
    ASSIGN me->outtab->* TO <outtab>.
    i_falv->set_output_table( CHANGING ct_table = <outtab> ).
    i_falv->fcat = i_falv->lvc_fcat_from_itab( it_table = <outtab> ).
    i_falv->sort = me->sort.
    i_falv->filter = me->filter.
    i_falv->set_frontend_fieldcatalog( it_fieldcatalog = me->fcat ).
    i_falv->application_log_embedded = application_log_embedded.
    i_falv->built_in_screen = built_in_screen.
    i_falv->build_columns( ).
    i_falv->layout = NEW zcl_falv_layout( io_falv = i_falv ).
    i_falv->gui_status ?= me->gui_status->if_os_clone~clone( ). "clone object
    i_falv->lvc_layout = me->lvc_layout.
    i_falv->variant = me->variant.
    i_falv->top_of_page_height = me->top_of_page_height.
    i_falv->top_of_page_visible_at_start = me->top_of_page_visible_at_start.
    i_falv->title_v1 = me->title_v1.
    i_falv->title_v2 = me->title_v2.
    i_falv->title_v3 = me->title_v3.
    i_falv->title_v4 = me->title_v4.
    i_falv->exclude_functions = me->exclude_functions.
    i_falv->toolbar_added = me->toolbar_added.
    i_falv->toolbar_deleted = me->toolbar_deleted.
    i_falv->toolbar_disabled = me->toolbar_disabled.
    i_falv->m_batch_mode = me->m_batch_mode.
    i_falv->layout->delete_all_buttons = me->layout->delete_all_buttons.
    i_falv->layout->mark_field = me->layout->mark_field.
    i_falv->register_f4_for_fields( it_f4 = me->grid->mt_f4 ).
    i_falv->repid = me->repid.
    i_falv->mt_events = me->mt_events.
  ENDMETHOD.


  METHOD get_columns.
    rt_columns = me->columns.
  ENDMETHOD.


  METHOD create_by_type.
    DATA: callstack TYPE abap_callstack.
    DATA: lv_repid  LIKE sy-repid.
    DATA:
      lr_output TYPE REF TO data.

    FIELD-SYMBOLS:
      <table> TYPE ANY TABLE.

    DATA(lv_type_name) = i_type->absolute_name.

    IF i_type->kind <> cl_abap_typedescr=>kind_table.
      FREE: rv_falv.
      RETURN.
    ENDIF.

    CREATE DATA lr_output TYPE (lv_type_name).
    ASSIGN lr_output->* TO <table>.

    IF i_subclass IS INITIAL.
      i_subclass ?= check_if_called_from_subclass( ).
    ENDIF.

    IF i_repid IS INITIAL.
      CALL FUNCTION 'SYSTEM_CALLSTACK'
        IMPORTING
          callstack = callstack.

      ASSIGN callstack[ 2 ] TO FIELD-SYMBOL(<stack>).
      IF sy-subrc EQ 0.
        lv_repid = <stack>-mainprogram.
      ENDIF.
    ELSE.
      lv_repid = i_repid.
    ENDIF.

    rv_falv = zcl_falv=>create(
      EXPORTING
        i_parent          = i_parent
        i_applogparent    = i_applogparent
        i_popup           = i_popup
        i_applog_embedded = i_applog_embedded
        i_subclass        = i_subclass
        i_repid           = lv_repid
        i_handle          = i_handle
        it_events         = it_events
      CHANGING
        ct_table          = <table>
    ).
  ENDMETHOD.
ENDCLASS.
