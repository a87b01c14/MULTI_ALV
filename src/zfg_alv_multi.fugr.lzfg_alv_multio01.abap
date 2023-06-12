*----------------------------------------------------------------------*
***INCLUDE LZFG_ALV_MULTIO01.
*----------------------------------------------------------------------*

*&---------------------------------------------------------------------*
*& Module DYNPRO_PBO_BEGIN_9000 OUTPUT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
MODULE dynpro_pbo_begin_9000 OUTPUT.
  gs_dynpro_id-program_name = sy-repid.
  gs_dynpro_id-dynpro_number = sy-dynnr.

  CALL METHOD cl_bus_abstract_screen=>dynpro_pbo_begin
    EXPORTING
      iv_program_name  = gs_dynpro_id-program_name
      iv_dynpro_number = gs_dynpro_id-dynpro_number.
ENDMODULE.

*&---------------------------------------------------------------------*
*& Module DYNPRO_PBO_END_9000 OUTPUT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
MODULE dynpro_pbo_end_9000 OUTPUT.
  gs_dynpro_id-program_name = sy-repid.
  gs_dynpro_id-dynpro_number = sy-dynnr.

  CALL METHOD cl_bus_abstract_screen=>dynpro_pbo_end
    EXPORTING
      iv_program_name  = gs_dynpro_id-program_name
      iv_dynpro_number = gs_dynpro_id-dynpro_number.
ENDMODULE.

*&---------------------------------------------------------------------*
*&      Module  DYNPRO_PAI_BEGIN_9000  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE dynpro_pai_begin_9000 INPUT.
  gs_dynpro_id-program_name = sy-repid.
  gs_dynpro_id-dynpro_number = sy-dynnr.

  CALL METHOD cl_bus_abstract_screen=>dynpro_pai_begin
    EXPORTING
      iv_program_name  = gs_dynpro_id-program_name
      iv_dynpro_number = gs_dynpro_id-dynpro_number.

ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  DYNPRO_PAI_END_9000  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE dynpro_pai_end_9000 INPUT.
  gs_dynpro_id-program_name = sy-repid.
  gs_dynpro_id-dynpro_number = sy-dynnr.

  CALL METHOD cl_bus_abstract_screen=>dynpro_pai_end
    EXPORTING
      iv_program_name  = gs_dynpro_id-program_name
      iv_dynpro_number = gs_dynpro_id-dynpro_number.
ENDMODULE.

*&---------------------------------------------------------------------*
*& Module DYNPRO_PBO_BEGIN_9010 OUTPUT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
MODULE dynpro_pbo_begin_9010 OUTPUT.
  gs_dynpro_id-program_name = sy-repid.
  gs_dynpro_id-dynpro_number = sy-dynnr.

  CALL METHOD cl_bus_abstract_screen=>dynpro_pbo_begin
    EXPORTING
      iv_program_name  = gs_dynpro_id-program_name
      iv_dynpro_number = gs_dynpro_id-dynpro_number.
ENDMODULE.

*&---------------------------------------------------------------------*
*& Module DYNPRO_PBO_END_9010 OUTPUT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
MODULE dynpro_pbo_end_9010 OUTPUT.
  gs_dynpro_id-program_name = sy-repid.
  gs_dynpro_id-dynpro_number = sy-dynnr.

  CALL METHOD cl_bus_abstract_screen=>dynpro_pbo_end
    EXPORTING
      iv_program_name  = gs_dynpro_id-program_name
      iv_dynpro_number = gs_dynpro_id-dynpro_number.
ENDMODULE.

*&---------------------------------------------------------------------*
*&      Module  DYNPRO_PAI_BEGIN_9010  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE dynpro_pai_begin_9010 INPUT.
  gs_dynpro_id-program_name = sy-repid.
  gs_dynpro_id-dynpro_number = sy-dynnr.

  CALL METHOD cl_bus_abstract_screen=>dynpro_pai_begin
    EXPORTING
      iv_program_name  = gs_dynpro_id-program_name
      iv_dynpro_number = gs_dynpro_id-dynpro_number.

ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  DYNPRO_PAI_END_9010  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE dynpro_pai_end_9010 INPUT.
  gs_dynpro_id-program_name = sy-repid.
  gs_dynpro_id-dynpro_number = sy-dynnr.

  CALL METHOD cl_bus_abstract_screen=>dynpro_pai_end
    EXPORTING
      iv_program_name  = gs_dynpro_id-program_name
      iv_dynpro_number = gs_dynpro_id-dynpro_number.
ENDMODULE.
