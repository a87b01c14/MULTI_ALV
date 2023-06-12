"! This is demo for FALV with redefinition of hotspot event handler
"! done by Lukasz Pegiel for http://abapblog.com
REPORT zdemo_falv021.

DATA: sflight TYPE STANDARD TABLE OF sflight.


START-OF-SELECTION.

  SELECT * UP TO 100 ROWS
  INTO CORRESPONDING FIELDS OF TABLE @sflight
  FROM sflight.                                         "#EC CI_NOWHERE

  "creation of falv with local redefinition
  DATA falv TYPE REF TO zcl_falv.
  falv = zcl_falv=>create( CHANGING ct_table = sflight ).

  "Add hotspot to column 'SEATSMAX'
  falv->column( 'SEATSMAX' )->set_hotspot( abap_true ).

  falv->top_of_page_height = 100. "absolute size

  "Enable top_of_page and display Grid on full screen
  falv->show_top_of_page( )->display( ).

FORM frm_hotspot_click USING sender TYPE REF TO zcl_falv
                             e_row_id  TYPE lvc_s_row
                             e_column_id TYPE  lvc_s_col
                             es_row_no TYPE lvc_s_roid.
  CASE e_column_id-fieldname.
    WHEN 'SEATSMAX'.
      CALL FUNCTION 'POPUP_DISPLAY_MESSAGE'
        EXPORTING
          titel = 'Hotspot is working'   " Title
          msgid = '00'
          msgty = 'I'
          msgno = '001'
          msgv1 = 'Yupi!'.
  ENDCASE.
ENDFORM.

FORM frm_top_of_page USING sender TYPE REF TO zcl_falv
                           e_dyndoc_id TYPE REF TO cl_dd_document
                           table_index TYPE syindex.
  e_dyndoc_id->add_text( text = 'Top Of Page' sap_style = cl_dd_area=>heading ).

  e_dyndoc_id->new_line( repeat = 1 ).

  e_dyndoc_id->add_link(
    EXPORTING
      name    = 'ABAPBLOG.com'   " Name (You Can Use Any Name You Choose)
      url     = 'http://abapblog.com'  " URL
      tooltip = 'ABAPBLOG.com'   " Tool Tip
      text    = 'ABAPBLOG.com'    " Text
  ).
ENDFORM.
