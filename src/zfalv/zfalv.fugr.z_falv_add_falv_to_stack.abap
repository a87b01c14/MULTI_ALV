FUNCTION Z_FALV_ADD_FALV_TO_STACK.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     REFERENCE(IO_FALV) TYPE REF TO  ZCL_FALV
*"----------------------------------------------------------------------
  insert new lcl_output( io_falv ) into table outputs.


endfunction.
