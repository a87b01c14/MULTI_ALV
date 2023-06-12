*&---------------------------------------------------------------------*
*& Report zdemo_falv21
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
report zdemo_falv21.


select * up to 100 rows from spfli into table @data(spfli).


data(first_falv) = zcl_falv=>create( changing ct_table = spfli ).
data(second_falv) = zcl_falv=>create(  "exporting i_applog_embedded = abap_true
                    changing ct_table = spfli )->display( ).


first_falv->set_editable( iv_modify = abap_true )->display( ).

second_falv->display( ).
