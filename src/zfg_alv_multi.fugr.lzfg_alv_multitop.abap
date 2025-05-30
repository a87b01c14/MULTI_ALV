FUNCTION-POOL zfg_alv_multi.                "MESSAGE-ID ..

* INCLUDE LZFG_ALV_MULTID...                 " Local class definition
INCLUDE lzfg_alv_multicld.


DATA: go_alv            TYPE REF TO zcl_alv_multi,
      gv_popup          TYPE abap_bool,
      gv_title          TYPE lvc_title,
      gv_mode           TYPE zcl_alv_multi=>ty_alv_mode,
      gt_events         TYPE slis_t_event,
      gv_start_row      TYPE i,
      gv_start_column   TYPE i,
      gv_end_row        TYPE i,
      gv_end_column     TYPE i,
      gv_save_enabled   TYPE abap_bool,
      gv_no_toolbar     TYPE abap_bool,
      gv_status_program TYPE bus_screen-program_name,
      gv_status_key     TYPE bus_screen-status_key,
      gt_function       TYPE  zcl_alv_multi=>tt_function_enabled.

DATA: go_current_falv TYPE REF TO zcl_falv.

DATA gc_program_name TYPE bus_screen-program_name VALUE 'SAPLZFG_ALV_MULTI'.
DATA gc_status_key TYPE bus_screen-status_key VALUE 'BUS_MAIN_SCREEN'.
DATA gs_dynpro_id   TYPE bus_screen-area.

CONTROLS gs_screen_9000_tabstrip TYPE TABSTRIP.


DATA go_screen_9000 TYPE REF TO lcl_screen_9000.

DATA go_screen_9010 TYPE REF TO lcl_screen_9010.

DATA: BEGIN OF gs_screen_9000,
        tabstrip TYPE bus_screen_tabstrip,
      END OF gs_screen_9000.

CONSTANTS: gc_dynnr_8000 TYPE sy-dynnr VALUE '8000'.
CONSTANTS: gc_dynnr_8010 TYPE sy-dynnr VALUE '8010'.
CONSTANTS: gc_dynnr_9000 TYPE sy-dynnr VALUE '9000'.
CONSTANTS: gc_dynnr_9001 TYPE sy-dynnr VALUE '9001'.
CONSTANTS: gc_dynnr_9010 TYPE sy-dynnr VALUE '9010'.

CONSTANTS: gc_cont_name_9001 TYPE string VALUE 'C9001'.
CONSTANTS: gc_cont_name_9010 TYPE string VALUE 'C9010'.
