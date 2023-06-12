class zcl_falv_layout definition
  public
  create public

  global friends zcl_falv .

  public section.

    data mark_field type lvc_fname read-only .

    methods constructor
      importing
        !io_falv type ref to zcl_falv .
    methods set_zebra
      importing
                value(iv_value) type lvc_zebra
      returning value(r_layout) type ref to zcl_falv_layout.
    methods set_edit
      importing
                value(iv_value) type lvc_edit
      returning value(r_layout) type ref to zcl_falv_layout.
    methods set_edit_mode
      importing
                value(iv_value) type lvc_edmo
      returning value(r_layout) type ref to zcl_falv_layout.
    methods set_no_keyfix
      importing
                value(iv_value) type lvc_nokfix
      returning value(r_layout) type ref to zcl_falv_layout.
    methods set_frontend
      importing
                value(iv_value) type lvc_front
      returning value(r_layout) type ref to zcl_falv_layout.
    methods set_object_key
      importing
                value(iv_value) type bds_typeid
      returning value(r_layout) type ref to zcl_falv_layout.
    methods set_doc_id
      importing
                value(iv_value) type bds_docid
      returning value(r_layout) type ref to zcl_falv_layout.
    methods set_template
      importing
                value(iv_value) type bds_filena
      returning value(r_layout) type ref to zcl_falv_layout.
    methods set_language
      importing
                value(iv_value) type lang
      returning value(r_layout) type ref to zcl_falv_layout.
    methods set_graphics
      importing
                value(iv_value) type guid_32
      returning value(r_layout) type ref to zcl_falv_layout.
    methods set_smalltitle
      importing
                value(iv_value) type lvc_titsz
      returning value(r_layout) type ref to zcl_falv_layout.
    methods set_no_hgridln
      importing
                value(iv_value) type lvc_hgrid
      returning value(r_layout) type ref to zcl_falv_layout.
    methods set_no_vgridln
      importing
                value(iv_value) type lvc_vgrid
      returning value(r_layout) type ref to zcl_falv_layout.
    methods set_no_headers
      importing
                value(iv_value) type lvc_heads
      returning value(r_layout) type ref to zcl_falv_layout.
    methods set_no_merging
      importing
                value(iv_value) type lvc_merge
      returning value(r_layout) type ref to zcl_falv_layout.
    methods set_cwidth_opt
      importing
                value(iv_value) type lvc_cwo
      returning value(r_layout) type ref to zcl_falv_layout.
    methods set_totals_bef
      importing
                value(iv_value) type lvc_totbef
      returning value(r_layout) type ref to zcl_falv_layout.
    methods set_no_totarr
      importing
                value(iv_value) type char01
      returning value(r_layout) type ref to zcl_falv_layout.
    methods set_no_totexp
      importing
                value(iv_value) type char01
      returning value(r_layout) type ref to zcl_falv_layout.
    methods set_no_rowmove
      importing
                value(iv_value) type char01
      returning value(r_layout) type ref to zcl_falv_layout.
    methods set_no_rowins
      importing
                value(iv_value) type char01
      returning value(r_layout) type ref to zcl_falv_layout.
    methods set_no_colexpd
      importing
                value(iv_value) type char01
      returning value(r_layout) type ref to zcl_falv_layout.
    methods set_no_f4
      importing
                value(iv_value) type char01
      returning value(r_layout) type ref to zcl_falv_layout.
    methods set_countfname
      importing
                value(iv_value) type lvc_fname
      returning value(r_layout) type ref to zcl_falv_layout.
    methods set_col_opt
      importing
                value(iv_value) type char01
      returning value(r_layout) type ref to zcl_falv_layout.
    methods set_val_data
      importing
                value(iv_value) type char01
      returning value(r_layout) type ref to zcl_falv_layout.
    methods set_blob_scope
      importing
                value(iv_value) type salv_bs_blob_scope
      returning value(r_layout) type ref to zcl_falv_layout.
    methods set_blob_flavour
      importing
                value(iv_value) type salv_bs_blob_flavour
      returning value(r_layout) type ref to zcl_falv_layout.
    methods set_blob_name
      importing
                value(iv_value) type salv_bs_blob_name
      returning value(r_layout) type ref to zcl_falv_layout.
    methods set_blob_key
      importing
                value(iv_value) type slis_blob_key
      returning value(r_layout) type ref to zcl_falv_layout.
    methods set_blob_type
      importing
                value(iv_value) type slis_blob_type
      returning value(r_layout) type ref to zcl_falv_layout.
    methods set_stylefname
      importing
                value(iv_value) type lvc_fname
      returning value(r_layout) type ref to zcl_falv_layout.
    methods set_no_rowmark
      importing
                value(iv_value) type lvc_rowmk
      returning value(r_layout) type ref to zcl_falv_layout.
    methods set_no_toolbar
      importing
                value(iv_value) type lvc_toolb
      returning value(r_layout) type ref to zcl_falv_layout.
    methods set_grid_title
      importing
                value(iv_value) type lvc_title
      returning value(r_layout) type ref to zcl_falv_layout.
    methods set_sel_mode
      importing
                value(iv_value) type lvc_libox
      returning value(r_layout) type ref to zcl_falv_layout.
    methods set_box_fname
      importing
                value(iv_value) type lvc_fname
      returning value(r_layout) type ref to zcl_falv_layout.
    methods set_sgl_clk_hd
      importing
                value(iv_value) type lvc_sglclh
      returning value(r_layout) type ref to zcl_falv_layout.
    methods set_no_totline
      importing
                value(iv_value) type lvc_nototl
      returning value(r_layout) type ref to zcl_falv_layout.
    methods set_numc_total
      importing
                value(iv_value) type lvc_numcto
      returning value(r_layout) type ref to zcl_falv_layout.
    methods set_no_utsplit
      importing
                value(iv_value) type lvc_unitsp
      returning value(r_layout) type ref to zcl_falv_layout.
    methods set_excp_fname
      importing
                value(iv_value) type lvc_exfnm
      returning value(r_layout) type ref to zcl_falv_layout.
    methods set_excp_rolln
      importing
                value(iv_value) type lvc_exrol
      returning value(r_layout) type ref to zcl_falv_layout.
    methods set_excp_conds
      importing
                value(iv_value) type lvc_excon
      returning value(r_layout) type ref to zcl_falv_layout.
    methods set_excp_led
      importing
                value(iv_value) type lvc_exled
      returning value(r_layout) type ref to zcl_falv_layout.
    methods set_excp_group
      importing
                value(iv_value) type lvc_exgrp
      returning value(r_layout) type ref to zcl_falv_layout.
    methods set_detailinit
      importing
                value(iv_value) type lvc_detini
      returning value(r_layout) type ref to zcl_falv_layout.
    methods set_detailtitl
      importing
                value(iv_value) type lvc_dettit
      returning value(r_layout) type ref to zcl_falv_layout.
    methods set_keyhot
      importing
                value(iv_value) type lvc_keyhot
      returning value(r_layout) type ref to zcl_falv_layout.
    methods set_no_author
      importing
                value(iv_value) type lvc_noauth
      returning value(r_layout) type ref to zcl_falv_layout.
    methods set_xifunckey
      importing
                value(iv_value) type aqs_xikey
      returning value(r_layout) type ref to zcl_falv_layout.
    methods set_xidirect
      importing
                value(iv_value) type flag
      returning value(r_layout) type ref to zcl_falv_layout.
    methods set_s_dragdrop
      importing
                value(iv_value) type lvc_s_dd01
      returning value(r_layout) type ref to zcl_falv_layout.
    methods set_info_fname
      importing
                value(iv_value) type lvc_cifnm
      returning value(r_layout) type ref to zcl_falv_layout.
    methods set_ctab_fname
      importing
                value(iv_value) type lvc_ctfnm
      returning value(r_layout) type ref to zcl_falv_layout.
    methods set_weblook
      importing
                value(iv_value) type lvc_look
      returning value(r_layout) type ref to zcl_falv_layout.
    methods set_webstyle
      importing
                value(iv_value) type lvc_style
      returning value(r_layout) type ref to zcl_falv_layout.
    methods set_webrows
      importing
                value(iv_value) type lvc_webrow
      returning value(r_layout) type ref to zcl_falv_layout.
    methods set_webxwidth
      importing
                value(iv_value) type int4
      returning value(r_layout) type ref to zcl_falv_layout.
    methods set_webxheight
      importing
                value(iv_value) type int4
      returning value(r_layout) type ref to zcl_falv_layout.
  protected section.
  private section.

    data: falv               type ref to zcl_falv,
          "! Deletes all buttons except the once passed in delete_all_buttons
          "! method
          delete_all_buttons type abap_bool.
    methods change_setting
      importing
        value(iv_value)   type any
        value(iv_setting) type string .
endclass.



class zcl_falv_layout implementation.


  method change_setting.
    falv->get_frontend_layout(  importing  es_layout = falv->lvc_layout ).
    data(layout_field) = |falv->lvc_layout-{ iv_setting }|.
    assign (layout_field) to field-symbol(<field>).
    if sy-subrc eq 0.
      <field> = iv_value.
    endif.
    falv->set_frontend_layout( is_layout = falv->lvc_layout  ).
  endmethod.


  method constructor.
    falv = io_falv.
  endmethod.


  method set_blob_flavour.
    change_setting( iv_value = iv_value iv_setting = 'BLOB_FLAVOUR' ).
    r_layout = me.
  endmethod.


  method set_blob_key.
    change_setting( iv_value = iv_value iv_setting = 'BLOB_KEY' ).
    r_layout = me.
  endmethod.


  method set_blob_name.
    change_setting( iv_value = iv_value iv_setting = 'BLOB_NAME' ).
    r_layout = me.
  endmethod.


  method set_blob_scope.
    change_setting( iv_value = iv_value iv_setting = 'BLOB_SCOPE' ).
    r_layout = me.
  endmethod.


  method set_blob_type.
    change_setting( iv_value = iv_value iv_setting = 'BLOB_TYPE' ).
    r_layout = me.
  endmethod.


  method set_box_fname.
    change_setting( iv_value = iv_value iv_setting = 'BOX_FNAME' ).
    r_layout = me.
  endmethod.


  method set_col_opt.
    change_setting( iv_value = iv_value iv_setting = 'COL_OPT' ).
    r_layout = me.
  endmethod.


  method set_countfname.
    change_setting( iv_value = iv_value iv_setting = 'COUNTFNAME' ).
    r_layout = me.
  endmethod.


  method set_ctab_fname.
    change_setting( iv_value = iv_value iv_setting = 'CTAB_FNAME' ).
    r_layout = me.
  endmethod.


  method set_cwidth_opt.
    change_setting( iv_value = iv_value iv_setting = 'CWIDTH_OPT' ).
    r_layout = me.
  endmethod.


  method set_detailinit.
    change_setting( iv_value = iv_value iv_setting = 'DETAILINIT' ).
    r_layout = me.
  endmethod.


  method set_detailtitl.
    change_setting( iv_value = iv_value iv_setting = 'DETAILTITL' ).
    r_layout = me.
  endmethod.


  method set_doc_id.
    change_setting( iv_value = iv_value iv_setting = 'DOC_ID' ).
    r_layout = me.
  endmethod.


  method set_edit.
    change_setting( iv_value = iv_value iv_setting = 'EDIT' ).
    r_layout = me.
  endmethod.


  method set_edit_mode.
    change_setting( iv_value = iv_value iv_setting = 'EDIT_MODE' ).
    r_layout = me.
  endmethod.


  method set_excp_conds.
    change_setting( iv_value = iv_value iv_setting = 'EXCP_CONDS' ).
    r_layout = me.
  endmethod.


  method set_excp_fname.
    change_setting( iv_value = iv_value iv_setting = 'EXCP_FNAME' ).
    r_layout = me.
  endmethod.


  method set_excp_group.
    change_setting( iv_value = iv_value iv_setting = 'EXCP_GROUP' ).
    r_layout = me.
  endmethod.


  method set_excp_led.
    change_setting( iv_value = iv_value iv_setting = 'EXCP_LED' ).
    r_layout = me.
  endmethod.


  method set_excp_rolln.
    change_setting( iv_value = iv_value iv_setting = 'EXCP_ROLLN' ).
    r_layout = me.
  endmethod.


  method set_frontend.
    change_setting( iv_value = iv_value iv_setting = 'FRONTEND' ).
    r_layout = me.
  endmethod.


  method set_graphics.
    change_setting( iv_value = iv_value iv_setting = 'GRAPHICS' ).
    r_layout = me.
  endmethod.


  method set_grid_title.
    change_setting( iv_value = iv_value iv_setting = 'GRID_TITLE' ).
    r_layout = me.
  endmethod.


  method set_info_fname.
    change_setting( iv_value = iv_value iv_setting = 'INFO_FNAME' ).
    r_layout = me.
  endmethod.


  method set_keyhot.
    change_setting( iv_value = iv_value iv_setting = 'KEYHOT' ).
    r_layout = me.
  endmethod.


  method set_language.
    change_setting( iv_value = iv_value iv_setting = 'LANGUAGE' ).
    r_layout = me.
  endmethod.


  method set_no_author.
    change_setting( iv_value = iv_value iv_setting = 'NO_AUTHOR' ).
    r_layout = me.
  endmethod.


  method set_no_colexpd.
    change_setting( iv_value = iv_value iv_setting = 'NO_COLEXPD' ).
    r_layout = me.
  endmethod.


  method set_no_f4.
    change_setting( iv_value = iv_value iv_setting = 'NO_F4' ).
    r_layout = me.
  endmethod.


  method set_no_headers.
    change_setting( iv_value = iv_value iv_setting = 'NO_HEADERS' ).
    r_layout = me.
  endmethod.


  method set_no_hgridln.
    change_setting( iv_value = iv_value iv_setting = 'NO_HGRIDLN' ).
    r_layout = me.
  endmethod.


  method set_no_keyfix.
    change_setting( iv_value = iv_value iv_setting = 'NO_KEYFIX' ).
    r_layout = me.
  endmethod.


  method set_no_merging.
    change_setting( iv_value = iv_value iv_setting = 'NO_MERGING' ).
    r_layout = me.
  endmethod.


  method set_no_rowins.
    change_setting( iv_value = iv_value iv_setting = 'NO_ROWINS' ).
    r_layout = me.
  endmethod.


  method set_no_rowmark.
    change_setting( iv_value = iv_value iv_setting = 'NO_ROWMARK' ).
    r_layout = me.
  endmethod.


  method set_no_rowmove.
    change_setting( iv_value = iv_value iv_setting = 'NO_ROWMOVE' ).
    r_layout = me.
  endmethod.


  method set_no_toolbar.
    change_setting( iv_value = iv_value iv_setting = 'NO_TOOLBAR' ).
    r_layout = me.
  endmethod.


  method set_no_totarr.
    change_setting( iv_value = iv_value iv_setting = 'NO_TOTARR' ).
    r_layout = me.
  endmethod.


  method set_no_totexp.
    change_setting( iv_value = iv_value iv_setting = 'NO_TOTEXP' ).
    r_layout = me.
  endmethod.


  method set_no_totline.
    change_setting( iv_value = iv_value iv_setting = 'NO_TOTLINE' ).
    r_layout = me.
  endmethod.


  method set_no_utsplit.
    change_setting( iv_value = iv_value iv_setting = 'NO_UTSPLIT' ).
    r_layout = me.
  endmethod.


  method set_no_vgridln.
    change_setting( iv_value = iv_value iv_setting = 'NO_VGRIDLN' ).
    r_layout = me.
  endmethod.


  method set_numc_total.
    change_setting( iv_value = iv_value iv_setting = 'NUMC_TOTAL' ).
    r_layout = me.
  endmethod.


  method set_object_key.
    change_setting( iv_value = iv_value iv_setting = 'OBJECT_KEY' ).
    r_layout = me.
  endmethod.


  method set_sel_mode.
    change_setting( iv_value = iv_value iv_setting = 'SEL_MODE' ).
    r_layout = me.
  endmethod.


  method set_sgl_clk_hd.
    change_setting( iv_value = iv_value iv_setting = 'SGL_CLK_HD' ).
    r_layout = me.
  endmethod.


  method set_smalltitle.
    change_setting( iv_value = iv_value iv_setting = 'SMALLTITLE' ).
    r_layout = me.
  endmethod.


  method set_stylefname.
    change_setting( iv_value = iv_value iv_setting = 'STYLEFNAME' ).
    r_layout = me.
  endmethod.


  method set_s_dragdrop.
    change_setting( iv_value = iv_value iv_setting = 'S_DRAGDROP' ).
    r_layout = me.
  endmethod.


  method set_template.
    change_setting( iv_value = iv_value iv_setting = 'TEMPLATE' ).
    r_layout = me.
  endmethod.


  method set_totals_bef.
    change_setting( iv_value = iv_value iv_setting = 'TOTALS_BEF' ).
    r_layout = me.
  endmethod.


  method set_val_data.
    change_setting( iv_value = iv_value iv_setting = 'VAL_DATA' ).
    r_layout = me.
  endmethod.


  method set_weblook.
    change_setting( iv_value = iv_value iv_setting = 'WEBLOOK' ).
    r_layout = me.
  endmethod.


  method set_webrows.
    change_setting( iv_value = iv_value iv_setting = 'WEBROWS' ).
    r_layout = me.
  endmethod.


  method set_webstyle.
    change_setting( iv_value = iv_value iv_setting = 'WEBSTYLE' ).
    r_layout = me.
  endmethod.


  method set_webxheight.
    change_setting( iv_value = iv_value iv_setting = 'WEBXHEIGHT' ).
    r_layout = me.
  endmethod.


  method set_webxwidth.
    change_setting( iv_value = iv_value iv_setting = 'WEBXWIDTH' ).
    r_layout = me.
  endmethod.


  method set_xidirect.
    change_setting( iv_value = iv_value iv_setting = 'XIDIRECT' ).
    r_layout = me.
  endmethod.


  method set_xifunckey.
    change_setting( iv_value = iv_value iv_setting = 'XIFUNCKEY' ).
    r_layout = me.
  endmethod.


  method set_zebra.
    change_setting( iv_value = iv_value iv_setting = 'ZEBRA' ).
    r_layout = me.
  endmethod.
endclass.
