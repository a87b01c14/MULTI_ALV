*&---------------------------------------------------------------------*
*& 包含               LZFG_ALV_MULTICLD
*&---------------------------------------------------------------------*

CLASS lcl_abstract_dialog DEFINITION ABSTRACT.
  PUBLIC SECTION.
    METHODS collect_message.

  PROTECTED SECTION.
    METHODS clear_message.
    METHODS show_message.

    DATA gv_message_dummy TYPE c.

  PRIVATE SECTION.
    DATA gs_message       TYPE symsg.
ENDCLASS.




CLASS lcl_application DEFINITION INHERITING FROM lcl_abstract_dialog
                      FINAL.

  PUBLIC SECTION.
    METHODS constructor.
    CLASS-METHODS start_from_transaction.

  PRIVATE SECTION.
    METHODS start IMPORTING iv_popup           TYPE abap_bool OPTIONAL.
    METHODS end.
    METHODS on_process_after_input
      FOR EVENT process_after_input OF cl_bus_abstract_main_screen
      IMPORTING iv_function_code.
    METHODS dispatch IMPORTING iv_function_code TYPE bus_screen-function_code
                     EXPORTING ev_dispatched    TYPE bus_locator-boolean.
ENDCLASS.


CLASS lcl_screen_9000 DEFINITION
                      INHERITING FROM cl_bus_abstract_main_screen.

  PUBLIC SECTION.
    DATA go_container TYPE REF TO cl_gui_custom_container.
    DATA mr_tabstrip TYPE REF TO cl_bus_tabstrip.
    METHODS pbo_begin REDEFINITION.
    METHODS remove_tabstrip_tabs.

  PROTECTED SECTION.
    METHODS call_screen REDEFINITION.
    METHODS call_screen_starting_at REDEFINITION.
  PRIVATE SECTION.

ENDCLASS.


CLASS lcl_screen_9010 DEFINITION
                      INHERITING FROM cl_bus_abstract_main_screen.

  PUBLIC SECTION.
    DATA go_container TYPE REF TO cl_gui_custom_container.
    DATA go_splitter TYPE REF TO cl_gui_splitter_container.
    METHODS pbo_begin REDEFINITION.

  PROTECTED SECTION.
    METHODS call_screen REDEFINITION.
    METHODS call_screen_starting_at REDEFINITION.
  PRIVATE SECTION.

ENDCLASS.
