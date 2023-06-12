class ZCL_FALV_COLUMN definition
  public
  create public .

public section.

  data FIELDNAME type LVC_S_FCAT-FIELDNAME read-only .

  methods CONSTRUCTOR
    importing
      value(IV_FIELDNAME) type LVC_S_FCAT-FIELDNAME
      !IO_FALV type ref to ZCL_FALV .
  methods SET_EDITABLE
    returning
      value(R_COLUMN) type ref to ZCL_FALV_COLUMN .
  methods SET_READONLY
    returning
      value(R_COLUMN) type ref to ZCL_FALV_COLUMN .
  methods SET_ROW_POS
    importing
      value(IV_VALUE) type LVC_ROWPOS
    returning
      value(R_COLUMN) type ref to ZCL_FALV_COLUMN .
  methods SET_COL_POS
    importing
      value(IV_VALUE) type LVC_COLPOS
    returning
      value(R_COLUMN) type ref to ZCL_FALV_COLUMN .
  methods SET_FIELDNAME
    importing
      value(IV_VALUE) type LVC_FNAME
    returning
      value(R_COLUMN) type ref to ZCL_FALV_COLUMN .
  methods SET_TABNAME
    importing
      value(IV_VALUE) type LVC_TNAME
    returning
      value(R_COLUMN) type ref to ZCL_FALV_COLUMN .
  methods SET_CURRENCY
    importing
      value(IV_VALUE) type LVC_CURR
    returning
      value(R_COLUMN) type ref to ZCL_FALV_COLUMN .
  methods SET_CFIELDNAME
    importing
      value(IV_VALUE) type LVC_CFNAME
    returning
      value(R_COLUMN) type ref to ZCL_FALV_COLUMN .
  methods SET_QUANTITY
    importing
      value(IV_VALUE) type LVC_QUAN
    returning
      value(R_COLUMN) type ref to ZCL_FALV_COLUMN .
  methods SET_QFIELDNAME
    importing
      value(IV_VALUE) type LVC_QFNAME
    returning
      value(R_COLUMN) type ref to ZCL_FALV_COLUMN .
  methods SET_IFIELDNAME
    importing
      value(IV_VALUE) type LVC_FNAME
    returning
      value(R_COLUMN) type ref to ZCL_FALV_COLUMN .
  methods SET_ROUND
    importing
      value(IV_VALUE) type LVC_ROUND
    returning
      value(R_COLUMN) type ref to ZCL_FALV_COLUMN .
  methods SET_EXPONENT
    importing
      value(IV_VALUE) type LVC_EXPONT
    returning
      value(R_COLUMN) type ref to ZCL_FALV_COLUMN .
  methods SET_KEY
    importing
      value(IV_VALUE) type LVC_KEY
    returning
      value(R_COLUMN) type ref to ZCL_FALV_COLUMN .
  methods SET_KEY_SEL
    importing
      value(IV_VALUE) type LVC_KEYSEL
    returning
      value(R_COLUMN) type ref to ZCL_FALV_COLUMN .
  methods SET_ICON
    importing
      value(IV_VALUE) type LVC_ICON
    returning
      value(R_COLUMN) type ref to ZCL_FALV_COLUMN .
  methods SET_SYMBOL
    importing
      value(IV_VALUE) type LVC_SYMBOL
    returning
      value(R_COLUMN) type ref to ZCL_FALV_COLUMN .
  methods SET_CHECKBOX
    importing
      value(IV_VALUE) type LVC_CHECKB
    returning
      value(R_COLUMN) type ref to ZCL_FALV_COLUMN .
  methods SET_JUST
    importing
      value(IV_VALUE) type LVC_JUST
    returning
      value(R_COLUMN) type ref to ZCL_FALV_COLUMN .
  methods SET_LZERO
    importing
      value(IV_VALUE) type LVC_LZERO
    returning
      value(R_COLUMN) type ref to ZCL_FALV_COLUMN .
  methods SET_NO_SIGN
    importing
      value(IV_VALUE) type LVC_NOSIGN
    returning
      value(R_COLUMN) type ref to ZCL_FALV_COLUMN .
  methods SET_NO_ZERO
    importing
      value(IV_VALUE) type LVC_NOZERO
    returning
      value(R_COLUMN) type ref to ZCL_FALV_COLUMN .
  methods SET_NO_CONVEXT
    importing
      value(IV_VALUE) type LVC_NOCONV
    returning
      value(R_COLUMN) type ref to ZCL_FALV_COLUMN .
  methods SET_EDIT_MASK
    importing
      value(IV_VALUE) type LVC_EDTMSK
    returning
      value(R_COLUMN) type ref to ZCL_FALV_COLUMN .
  methods SET_EMPHASIZE
    importing
      value(IV_VALUE) type LVC_EMPHSZ
    returning
      value(R_COLUMN) type ref to ZCL_FALV_COLUMN .
  methods SET_COLOR
    importing
      value(IV_VALUE) type LVC_EMPHSZ
    returning
      value(R_COLUMN) type ref to ZCL_FALV_COLUMN .
  methods SET_FIX_COLUMN
    importing
      value(IV_VALUE) type LVC_FIXCOL
    returning
      value(R_COLUMN) type ref to ZCL_FALV_COLUMN .
  methods SET_DO_SUM
    importing
      value(IV_VALUE) type LVC_DOSUM
    returning
      value(R_COLUMN) type ref to ZCL_FALV_COLUMN .
  methods SET_NO_SUM
    importing
      value(IV_VALUE) type LVC_NOSUM
    returning
      value(R_COLUMN) type ref to ZCL_FALV_COLUMN .
  methods SET_NO_OUT
    importing
      value(IV_VALUE) type LVC_NOOUT
    returning
      value(R_COLUMN) type ref to ZCL_FALV_COLUMN .
  methods SET_TECH
    importing
      value(IV_VALUE) type LVC_TECH
    returning
      value(R_COLUMN) type ref to ZCL_FALV_COLUMN .
  methods SET_OUTPUTLEN
    importing
      value(IV_VALUE) type LVC_OUTLEN
    returning
      value(R_COLUMN) type ref to ZCL_FALV_COLUMN .
  methods SET_CONVEXIT
    importing
      value(IV_VALUE) type CONVEXIT
    returning
      value(R_COLUMN) type ref to ZCL_FALV_COLUMN .
  methods SET_SELTEXT
    importing
      value(IV_VALUE) type LVC_TXT
    returning
      value(R_COLUMN) type ref to ZCL_FALV_COLUMN .
  methods SET_TOOLTIP
    importing
      value(IV_VALUE) type LVC_TIP
    returning
      value(R_COLUMN) type ref to ZCL_FALV_COLUMN .
  methods SET_ROLLNAME
    importing
      value(IV_VALUE) type LVC_ROLL
    returning
      value(R_COLUMN) type ref to ZCL_FALV_COLUMN .
  methods SET_DATATYPE
    importing
      value(IV_VALUE) type DATATYPE_D
    returning
      value(R_COLUMN) type ref to ZCL_FALV_COLUMN .
  methods SET_INTTYPE
    importing
      value(IV_VALUE) type INTTYPE
    returning
      value(R_COLUMN) type ref to ZCL_FALV_COLUMN .
  methods SET_INTLEN
    importing
      value(IV_VALUE) type INTLEN
    returning
      value(R_COLUMN) type ref to ZCL_FALV_COLUMN .
  methods SET_LOWERCASE
    importing
      value(IV_VALUE) type LOWERCASE
    returning
      value(R_COLUMN) type ref to ZCL_FALV_COLUMN .
  methods SET_REPTEXT
    importing
      value(IV_VALUE) type REPTEXT
    returning
      value(R_COLUMN) type ref to ZCL_FALV_COLUMN .
  methods SET_HIER_LEVEL
    importing
      value(IV_VALUE) type LVC_HIERL
    returning
      value(R_COLUMN) type ref to ZCL_FALV_COLUMN .
  methods SET_REPREP
    importing
      value(IV_VALUE) type LVC_CRPRP
    returning
      value(R_COLUMN) type ref to ZCL_FALV_COLUMN .
  methods SET_DOMNAME
    importing
      value(IV_VALUE) type DOMNAME
    returning
      value(R_COLUMN) type ref to ZCL_FALV_COLUMN .
  methods SET_SP_GROUP
    importing
      value(IV_VALUE) type LVC_SPGRP
    returning
      value(R_COLUMN) type ref to ZCL_FALV_COLUMN .
  methods SET_HOTSPOT
    importing
      value(IV_VALUE) type LVC_HOTSPT
    returning
      value(R_COLUMN) type ref to ZCL_FALV_COLUMN .
  methods SET_DFIELDNAME
    importing
      value(IV_VALUE) type LVCDBGFN
    returning
      value(R_COLUMN) type ref to ZCL_FALV_COLUMN .
  methods SET_COL_ID
    importing
      value(IV_VALUE) type LVC_COLID
    returning
      value(R_COLUMN) type ref to ZCL_FALV_COLUMN .
  methods SET_F4AVAILABL
    importing
      value(IV_VALUE) type DDF4AVAIL
    returning
      value(R_COLUMN) type ref to ZCL_FALV_COLUMN .
  methods SET_AUTO_VALUE
    importing
      value(IV_VALUE) type LVC_AUTO
    returning
      value(R_COLUMN) type ref to ZCL_FALV_COLUMN .
  methods SET_CHECKTABLE
    importing
      value(IV_VALUE) type TABNAME
    returning
      value(R_COLUMN) type ref to ZCL_FALV_COLUMN .
  methods SET_VALEXI
    importing
      value(IV_VALUE) type VALEXI
    returning
      value(R_COLUMN) type ref to ZCL_FALV_COLUMN .
  methods SET_WEB_FIELD
    importing
      value(IV_VALUE) type LVC_FNAME
    returning
      value(R_COLUMN) type ref to ZCL_FALV_COLUMN .
  methods SET_HREF_HNDL
    importing
      value(IV_VALUE) type INT4
    returning
      value(R_COLUMN) type ref to ZCL_FALV_COLUMN .
  methods SET_STYLE
    importing
      value(IV_VALUE) type LVC_STYLE
    returning
      value(R_COLUMN) type ref to ZCL_FALV_COLUMN .
  methods SET_STYLE2
    importing
      value(IV_VALUE) type LVC_STYLE
    returning
      value(R_COLUMN) type ref to ZCL_FALV_COLUMN .
  methods SET_STYLE3
    importing
      value(IV_VALUE) type LVC_STYLE
    returning
      value(R_COLUMN) type ref to ZCL_FALV_COLUMN .
  methods SET_STYLE4
    importing
      value(IV_VALUE) type LVC_STYLE
    returning
      value(R_COLUMN) type ref to ZCL_FALV_COLUMN .
  methods SET_DRDN_HNDL
    importing
      value(IV_VALUE) type INT4
    returning
      value(R_COLUMN) type ref to ZCL_FALV_COLUMN .
  methods SET_DRDN_FIELD
    importing
      value(IV_VALUE) type LVC_FNAME
    returning
      value(R_COLUMN) type ref to ZCL_FALV_COLUMN .
  methods SET_NO_MERGING
    importing
      value(IV_VALUE) type CHAR01
    returning
      value(R_COLUMN) type ref to ZCL_FALV_COLUMN .
  methods SET_H_FTYPE
    importing
      value(IV_VALUE) type LVC_FTYPE
    returning
      value(R_COLUMN) type ref to ZCL_FALV_COLUMN .
  methods SET_COL_OPT
    importing
      value(IV_VALUE) type LVC_COLOPT
    returning
      value(R_COLUMN) type ref to ZCL_FALV_COLUMN .
  methods SET_NO_INIT_CH
    importing
      value(IV_VALUE) type CHAR01
    returning
      value(R_COLUMN) type ref to ZCL_FALV_COLUMN .
  methods SET_DRDN_ALIAS
    importing
      value(IV_VALUE) type CHAR01
    returning
      value(R_COLUMN) type ref to ZCL_FALV_COLUMN .
  methods SET_DECFLOAT_STYLE
    importing
      value(IV_VALUE) type OUTPUTSTYLE
    returning
      value(R_COLUMN) type ref to ZCL_FALV_COLUMN .
  methods SET_PARAMETER0
    importing
      value(IV_VALUE) type CHAR30
    returning
      value(R_COLUMN) type ref to ZCL_FALV_COLUMN .
  methods SET_PARAMETER1
    importing
      value(IV_VALUE) type CHAR30
    returning
      value(R_COLUMN) type ref to ZCL_FALV_COLUMN .
  methods SET_PARAMETER2
    importing
      value(IV_VALUE) type CHAR30
    returning
      value(R_COLUMN) type ref to ZCL_FALV_COLUMN .
  methods SET_PARAMETER3
    importing
      value(IV_VALUE) type CHAR30
    returning
      value(R_COLUMN) type ref to ZCL_FALV_COLUMN .
  methods SET_PARAMETER4
    importing
      value(IV_VALUE) type CHAR30
    returning
      value(R_COLUMN) type ref to ZCL_FALV_COLUMN .
  methods SET_PARAMETER5
    importing
      value(IV_VALUE) type INT4
    returning
      value(R_COLUMN) type ref to ZCL_FALV_COLUMN .
  methods SET_PARAMETER6
    importing
      value(IV_VALUE) type INT4
    returning
      value(R_COLUMN) type ref to ZCL_FALV_COLUMN .
  methods SET_PARAMETER7
    importing
      value(IV_VALUE) type INT4
    returning
      value(R_COLUMN) type ref to ZCL_FALV_COLUMN .
  methods SET_PARAMETER8
    importing
      value(IV_VALUE) type INT4
    returning
      value(R_COLUMN) type ref to ZCL_FALV_COLUMN .
  methods SET_PARAMETER9
    importing
      value(IV_VALUE) type INT4
    returning
      value(R_COLUMN) type ref to ZCL_FALV_COLUMN .
  methods SET_REF_FIELD
    importing
      value(IV_VALUE) type LVC_RFNAME
    returning
      value(R_COLUMN) type ref to ZCL_FALV_COLUMN .
  methods SET_REF_TABLE
    importing
      value(IV_VALUE) type LVC_RTNAME
    returning
      value(R_COLUMN) type ref to ZCL_FALV_COLUMN .
  methods SET_TXT_FIELD
    importing
      value(IV_VALUE) type LVC_FNAME
    returning
      value(R_COLUMN) type ref to ZCL_FALV_COLUMN .
  methods SET_ROUNDFIELD
    importing
      value(IV_VALUE) type LVC_RNDFN
    returning
      value(R_COLUMN) type ref to ZCL_FALV_COLUMN .
  methods SET_DECIMALS_O
    importing
      value(IV_VALUE) type LVC_DECMLS
    returning
      value(R_COLUMN) type ref to ZCL_FALV_COLUMN .
  methods SET_DECMLFIELD
    importing
      value(IV_VALUE) type LVC_DFNAME
    returning
      value(R_COLUMN) type ref to ZCL_FALV_COLUMN .
  methods SET_DD_OUTLEN
    importing
      value(IV_VALUE) type LVC_DDLEN
    returning
      value(R_COLUMN) type ref to ZCL_FALV_COLUMN .
  methods SET_DECIMALS
    importing
      value(IV_VALUE) type DECIMALS
    returning
      value(R_COLUMN) type ref to ZCL_FALV_COLUMN .
  methods SET_COLTEXT
    importing
      value(IV_VALUE) type LVC_TXTCOL
    returning
      value(R_COLUMN) type ref to ZCL_FALV_COLUMN .
  methods SET_SCRTEXT_L
    importing
      value(IV_VALUE) type SCRTEXT_L
    returning
      value(R_COLUMN) type ref to ZCL_FALV_COLUMN .
  methods SET_SCRTEXT_M
    importing
      value(IV_VALUE) type SCRTEXT_M
    returning
      value(R_COLUMN) type ref to ZCL_FALV_COLUMN .
  methods SET_SCRTEXT_S
    importing
      value(IV_VALUE) type SCRTEXT_S
    returning
      value(R_COLUMN) type ref to ZCL_FALV_COLUMN .
  methods SET_TEXT
    importing
      value(IV_VALUE) type STRING
    returning
      value(R_COLUMN) type ref to ZCL_FALV_COLUMN .
  methods SET_COLDDICTXT
    importing
      value(IV_VALUE) type LVC_DDICT
    returning
      value(R_COLUMN) type ref to ZCL_FALV_COLUMN .
  methods SET_SELDDICTXT
    importing
      value(IV_VALUE) type LVC_DDICT
    returning
      value(R_COLUMN) type ref to ZCL_FALV_COLUMN .
  methods SET_TIPDDICTXT
    importing
      value(IV_VALUE) type LVC_DDICT
    returning
      value(R_COLUMN) type ref to ZCL_FALV_COLUMN .
  methods SET_EDIT
    importing
      value(IV_VALUE) type LVC_EDIT
    returning
      value(R_COLUMN) type ref to ZCL_FALV_COLUMN .
  methods SET_TECH_COL
    importing
      value(IV_VALUE) type LVC_TCOL
    returning
      value(R_COLUMN) type ref to ZCL_FALV_COLUMN .
  methods SET_TECH_FORM
    importing
      value(IV_VALUE) type LVC_TFORM
    returning
      value(R_COLUMN) type ref to ZCL_FALV_COLUMN .
  methods SET_TECH_COMP
    importing
      value(IV_VALUE) type LVC_TCOMP
    returning
      value(R_COLUMN) type ref to ZCL_FALV_COLUMN .
  methods SET_HIER_CPOS
    importing
      value(IV_VALUE) type LVCHCOLPOS
    returning
      value(R_COLUMN) type ref to ZCL_FALV_COLUMN .
  methods SET_H_COL_KEY
    importing
      value(IV_VALUE) type TV_ITMNAME
    returning
      value(R_COLUMN) type ref to ZCL_FALV_COLUMN .
  methods SET_H_SELECT
    importing
      value(IV_VALUE) type LVC_SELECT
    returning
      value(R_COLUMN) type ref to ZCL_FALV_COLUMN .
  methods SET_DD_ROLL
    importing
      value(IV_VALUE) type ROLLNAME
    returning
      value(R_COLUMN) type ref to ZCL_FALV_COLUMN .
  methods SET_DRAGDROPID
    importing
      value(IV_VALUE) type LVC_DDID
    returning
      value(R_COLUMN) type ref to ZCL_FALV_COLUMN .
  methods SET_MAC
    importing
      value(IV_VALUE) type CHAR01
    returning
      value(R_COLUMN) type ref to ZCL_FALV_COLUMN .
  methods SET_INDX_FIELD
    importing
      value(IV_VALUE) type INT4
    returning
      value(R_COLUMN) type ref to ZCL_FALV_COLUMN .
  methods SET_INDX_CFIEL
    importing
      value(IV_VALUE) type INT4
    returning
      value(R_COLUMN) type ref to ZCL_FALV_COLUMN .
  methods SET_INDX_QFIEL
    importing
      value(IV_VALUE) type INT4
    returning
      value(R_COLUMN) type ref to ZCL_FALV_COLUMN .
  methods SET_INDX_IFIEL
    importing
      value(IV_VALUE) type INT4
    returning
      value(R_COLUMN) type ref to ZCL_FALV_COLUMN .
  methods SET_INDX_ROUND
    importing
      value(IV_VALUE) type INT4
    returning
      value(R_COLUMN) type ref to ZCL_FALV_COLUMN .
  methods SET_INDX_DECML
    importing
      value(IV_VALUE) type INT4
    returning
      value(R_COLUMN) type ref to ZCL_FALV_COLUMN .
  methods SET_GET_STYLE
    importing
      value(IV_VALUE) type CHAR01
    returning
      value(R_COLUMN) type ref to ZCL_FALV_COLUMN .
  methods SET_MARK
    importing
      value(IV_VALUE) type CHAR01
    returning
      value(R_COLUMN) type ref to ZCL_FALV_COLUMN .
  methods SET_TEXTS
    importing
      value(IV_TEXT_S) type SCRTEXT_S
      value(IV_TEXT_M) type SCRTEXT_M
      value(IV_TEXT_L) type SCRTEXT_L
    returning
      value(R_COLUMN) type ref to ZCL_FALV_COLUMN .
  methods GET_EDITABLE
    returning
      value(RV_EDITABLE) type ABAP_BOOL .
  methods GET_READONLY
    returning
      value(RV_READ_ONLY) type ABAP_BOOL .
  methods GET_ROW_POS
    returning
      value(RV_VALUE) type LVC_ROWPOS .
  methods GET_COL_POS
    returning
      value(RV_VALUE) type LVC_COLPOS .
  methods GET_FIELDNAME
    returning
      value(RV_VALUE) type LVC_FNAME .
  methods GET_TABNAME
    returning
      value(RV_VALUE) type LVC_TNAME .
  methods GET_CURRENCY
    returning
      value(RV_VALUE) type LVC_CURR .
  methods GET_CFIELDNAME
    returning
      value(RV_VALUE) type LVC_CFNAME .
  methods GET_QUANTITY
    returning
      value(RV_VALUE) type LVC_QUAN .
  methods GET_QFIELDNAME
    returning
      value(RV_VALUE) type LVC_QFNAME .
  methods GET_IFIELDNAME
    returning
      value(RV_VALUE) type LVC_FNAME .
  methods GET_ROUND
    returning
      value(RV_VALUE) type LVC_ROUND .
  methods GET_EXPONENT
    returning
      value(RV_VALUE) type LVC_EXPONT .
  methods GET_KEY
    returning
      value(RV_VALUE) type LVC_KEY .
  methods GET_KEY_SEL
    returning
      value(RV_VALUE) type LVC_KEYSEL .
  methods GET_ICON
    returning
      value(RV_VALUE) type LVC_ICON .
  methods GET_SYMBOL
    returning
      value(RV_VALUE) type LVC_SYMBOL .
  methods GET_CHECKBOX
    returning
      value(RV_VALUE) type LVC_CHECKB .
  methods GET_JUST
    returning
      value(RV_VALUE) type LVC_JUST .
  methods GET_LZERO
    returning
      value(RV_VALUE) type LVC_LZERO .
  methods GET_NO_SIGN
    returning
      value(RV_VALUE) type LVC_NOSIGN .
  methods GET_NO_ZERO
    returning
      value(RV_VALUE) type LVC_NOZERO .
  methods GET_NO_CONVEXT
    returning
      value(RV_VALUE) type LVC_NOCONV .
  methods GET_EDIT_MASK
    returning
      value(RV_VALUE) type LVC_EDTMSK .
  methods GET_EMPHASIZE
    returning
      value(RV_VALUE) type LVC_EMPHSZ .
  methods GET_COLOR
    returning
      value(RV_VALUE) type LVC_EMPHSZ .
  methods GET_FIX_COLUMN
    returning
      value(RV_VALUE) type LVC_FIXCOL .
  methods GET_DO_SUM
    returning
      value(RV_VALUE) type LVC_DOSUM .
  methods GET_NO_SUM
    returning
      value(RV_VALUE) type LVC_NOSUM .
  methods GET_NO_OUT
    returning
      value(RV_VALUE) type LVC_NOOUT .
  methods GET_TECH
    returning
      value(RV_VALUE) type LVC_TECH .
  methods GET_OUTPUTLEN
    returning
      value(RV_VALUE) type LVC_OUTLEN .
  methods GET_CONVEXIT
    returning
      value(RV_VALUE) type CONVEXIT .
  methods GET_SELTEXT
    returning
      value(RV_VALUE) type LVC_TXT .
  methods GET_TOOLTIP
    returning
      value(RV_VALUE) type LVC_TIP .
  methods GET_ROLLNAME
    returning
      value(RV_VALUE) type LVC_ROLL .
  methods GET_DATATYPE
    returning
      value(RV_VALUE) type DATATYPE_D .
  methods GET_INTTYPE
    returning
      value(RV_VALUE) type INTTYPE .
  methods GET_INTLEN
    returning
      value(RV_VALUE) type INTLEN .
  methods GET_LOWERCASE
    returning
      value(RV_VALUE) type LOWERCASE .
  methods GET_REPTEXT
    returning
      value(RV_VALUE) type REPTEXT .
  methods GET_HIER_LEVEL
    returning
      value(RV_VALUE) type LVC_HIERL .
  methods GET_REPREP
    returning
      value(RV_VALUE) type LVC_CRPRP .
  methods GET_DOMNAME
    returning
      value(RV_VALUE) type DOMNAME .
  methods GET_SP_GROUP
    returning
      value(RV_VALUE) type LVC_SPGRP .
  methods GET_HOTSPOT
    returning
      value(RV_VALUE) type LVC_HOTSPT .
  methods GET_DFIELDNAME
    returning
      value(RV_VALUE) type LVCDBGFN .
  methods GET_COL_ID
    returning
      value(RV_VALUE) type LVC_COLID .
  methods GET_F4AVAILABL
    returning
      value(RV_VALUE) type DDF4AVAIL .
  methods GET_AUTO_VALUE
    returning
      value(RV_VALUE) type LVC_AUTO .
  methods GET_CHECKTABLE
    returning
      value(RV_VALUE) type TABNAME .
  methods GET_VALEXI
    returning
      value(RV_VALUE) type VALEXI .
  methods GET_WEB_FIELD
    returning
      value(RV_VALUE) type LVC_FNAME .
  methods GET_HREF_HNDL
    returning
      value(RV_VALUE) type INT4 .
  methods GET_STYLE
    returning
      value(RV_VALUE) type LVC_STYLE .
  methods GET_STYLE2
    returning
      value(RV_VALUE) type LVC_STYLE .
  methods GET_STYLE3
    returning
      value(RV_VALUE) type LVC_STYLE .
  methods GET_STYLE4
    returning
      value(RV_VALUE) type LVC_STYLE .
  methods GET_DRDN_HNDL
    returning
      value(RV_VALUE) type INT4 .
  methods GET_DRDN_FIELD
    returning
      value(RV_VALUE) type LVC_FNAME .
  methods GET_NO_MERGING
    returning
      value(RV_VALUE) type CHAR01 .
  methods GET_H_FTYPE
    returning
      value(RV_VALUE) type LVC_FTYPE .
  methods GET_COL_OPT
    returning
      value(RV_VALUE) type LVC_COLOPT .
  methods GET_NO_INIT_CH
    returning
      value(RV_VALUE) type CHAR01 .
  methods GET_DRDN_ALIAS
    returning
      value(RV_VALUE) type CHAR01 .
  methods GET_DECFLOAT_STYLE
    returning
      value(RV_VALUE) type OUTPUTSTYLE .
  methods GET_PARAMETER0
    returning
      value(RV_VALUE) type CHAR30 .
  methods GET_PARAMETER1
    returning
      value(RV_VALUE) type CHAR30 .
  methods GET_PARAMETER2
    returning
      value(RV_VALUE) type CHAR30 .
  methods GET_PARAMETER3
    returning
      value(RV_VALUE) type CHAR30 .
  methods GET_PARAMETER4
    returning
      value(RV_VALUE) type CHAR30 .
  methods GET_PARAMETER5
    returning
      value(RV_VALUE) type INT4 .
  methods GET_PARAMETER6
    returning
      value(RV_VALUE) type INT4 .
  methods GET_PARAMETER7
    returning
      value(RV_VALUE) type INT4 .
  methods GET_PARAMETER8
    returning
      value(RV_VALUE) type INT4 .
  methods GET_PARAMETER9
    returning
      value(RV_VALUE) type INT4 .
  methods GET_REF_FIELD
    returning
      value(RV_VALUE) type LVC_RFNAME .
  methods GET_REF_TABLE
    returning
      value(RV_VALUE) type LVC_RTNAME .
  methods GET_TXT_FIELD
    returning
      value(RV_VALUE) type LVC_FNAME .
  methods GET_ROUNDFIELD
    returning
      value(RV_VALUE) type LVC_RNDFN .
  methods GET_DECIMALS_O
    returning
      value(RV_VALUE) type LVC_DECMLS .
  methods GET_DECMLFIELD
    returning
      value(RV_VALUE) type LVC_DFNAME .
  methods GET_DD_OUTLEN
    returning
      value(RV_VALUE) type LVC_DDLEN .
  methods GET_DECIMALS
    returning
      value(RV_VALUE) type DECIMALS .
  methods GET_COLTEXT
    returning
      value(RV_VALUE) type LVC_TXTCOL .
  methods GET_SCRTEXT_L
    returning
      value(RV_VALUE) type SCRTEXT_L .
  methods GET_SCRTEXT_M
    returning
      value(RV_VALUE) type SCRTEXT_M .
  methods GET_SCRTEXT_S
    returning
      value(RV_VALUE) type SCRTEXT_S .
  methods GET_COLDDICTXT
    returning
      value(RV_VALUE) type LVC_DDICT .
  methods GET_SELDDICTXT
    returning
      value(RV_VALUE) type LVC_DDICT .
  methods GET_TIPDDICTXT
    returning
      value(RV_VALUE) type LVC_DDICT .
  methods GET_EDIT
    returning
      value(RV_VALUE) type LVC_EDIT .
  methods GET_TECH_COL
    returning
      value(RV_VALUE) type LVC_TCOL .
  methods GET_TECH_FORM
    returning
      value(RV_VALUE) type LVC_TFORM .
  methods GET_TECH_COMP
    returning
      value(RV_VALUE) type LVC_TCOMP .
  methods GET_HIER_CPOS
    returning
      value(RV_VALUE) type LVCHCOLPOS .
  methods GET_H_COL_KEY
    returning
      value(RV_VALUE) type TV_ITMNAME .
  methods GET_H_SELECT
    returning
      value(RV_VALUE) type LVC_SELECT .
  methods GET_DD_ROLL
    returning
      value(RV_VALUE) type ROLLNAME .
  methods GET_DRAGDROPID
    returning
      value(RV_VALUE) type LVC_DDID .
  methods GET_MAC
    returning
      value(RV_VALUE) type CHAR01 .
  methods GET_INDX_FIELD
    returning
      value(RV_VALUE) type INT4 .
  methods GET_INDX_CFIEL
    returning
      value(RV_VALUE) type INT4 .
  methods GET_INDX_QFIEL
    returning
      value(RV_VALUE) type INT4 .
  methods GET_INDX_IFIEL
    returning
      value(RV_VALUE) type INT4 .
  methods GET_INDX_ROUND
    returning
      value(RV_VALUE) type INT4 .
  methods GET_INDX_DECML
    returning
      value(RV_VALUE) type INT4 .
  methods GET_GET_STYLE
    returning
      value(RV_VALUE) type CHAR01 .
  methods GET_MARK
    returning
      value(RV_VALUE) type CHAR01 .
  protected section.
  private section.

    data falv type ref to zcl_falv .

    methods change_setting
      importing
        value(iv_value)   type any
        value(iv_setting) type string .

    methods get_setting
      importing
        value(iv_setting) type string
      exporting
        value(e_value)    type any.
ENDCLASS.



CLASS ZCL_FALV_COLUMN IMPLEMENTATION.


  method change_setting.
    falv->get_frontend_fieldcatalog( importing et_fieldcatalog = falv->fcat ).
    assign falv->fcat[ fieldname = fieldname ] to field-symbol(<fcat>).
    if sy-subrc eq 0.
      data(fcat_field) = |<fcat>-{ iv_setting }|.
      assign (fcat_field) to field-symbol(<field>).
      if sy-subrc eq 0.
        <field> = iv_value.
      endif.
      falv->set_frontend_fieldcatalog( it_fieldcatalog = falv->fcat ).
    endif.
  endmethod.


  method get_setting.
    falv->get_frontend_fieldcatalog( importing et_fieldcatalog = falv->fcat ).
    assign falv->fcat[ fieldname = fieldname ] to field-symbol(<fcat>).
    if sy-subrc eq 0.
      data(fcat_field) = |<fcat>-{ iv_setting }|.
      assign (fcat_field) to field-symbol(<field>).
      if sy-subrc eq 0.
        e_value = <field>.
      endif.
    endif.
  endmethod.


  method constructor.
    fieldname = iv_fieldname.
    falv = io_falv.
  endmethod.


  method set_auto_value.
    change_setting( iv_value = iv_value iv_setting = 'AUTO_VALUE' ).
    r_column = me.
  endmethod.


  method set_cfieldname.
    change_setting( iv_value = iv_value iv_setting = 'CFIELDNAME' ).
    set_tech_form( 2 ).
    r_column = me.
  endmethod.


  method set_checkbox.
    change_setting( iv_value = iv_value iv_setting = 'CHECKBOX' ).
    r_column = me.
  endmethod.


  method set_checktable.
    change_setting( iv_value = iv_value iv_setting = 'CHECKTABLE' ).
    r_column = me.
  endmethod.


  method set_colddictxt.
    change_setting( iv_value = iv_value iv_setting = 'COLDDICTXT' ).
    r_column = me.
  endmethod.


  method set_color.
    set_emphasize( iv_value = iv_value ).
    r_column = me.
  endmethod.


  method set_coltext.
    change_setting( iv_value = iv_value iv_setting = 'COLTEXT' ).
    r_column = me.
  endmethod.


  method set_col_id.
    change_setting( iv_value = iv_value iv_setting = 'COL_ID' ).
    r_column = me.
  endmethod.


  method set_col_opt.
    change_setting( iv_value = iv_value iv_setting = 'COL_OPT' ).
    r_column = me.
  endmethod.


  method set_col_pos.
    change_setting( iv_value = iv_value iv_setting = 'COL_POS' ).
    r_column = me.
  endmethod.


  method set_convexit.
    change_setting( iv_value = iv_value iv_setting = 'CONVEXIT' ).
    r_column = me.
  endmethod.


  method set_currency.
    change_setting( iv_value = iv_value iv_setting = 'CURRENCY' ).
    r_column = me.
  endmethod.


  method set_datatype.
    change_setting( iv_value = iv_value iv_setting = 'DATATYPE' ).
    r_column = me.
  endmethod.


  method set_dd_outlen.
    change_setting( iv_value = iv_value iv_setting = 'DD_OUTLEN' ).
    r_column = me.
  endmethod.


  method set_dd_roll.
    change_setting( iv_value = iv_value iv_setting = 'DD_ROLL' ).
    r_column = me.
  endmethod.


  method set_decfloat_style.
    change_setting( iv_value = iv_value iv_setting = 'DECFLOAT_STYLE' ).
    r_column = me.
  endmethod.


  method set_decimals.
    change_setting( iv_value = iv_value iv_setting = 'DECIMALS' ).
    r_column = me.
  endmethod.


  method set_decimals_o.
    change_setting( iv_value = iv_value iv_setting = 'DECIMALS_O' ).
    r_column = me.
  endmethod.


  method set_decmlfield.
    change_setting( iv_value = iv_value iv_setting = 'DECMLFIELD' ).
    r_column = me.
  endmethod.


  method set_dfieldname.
    change_setting( iv_value = iv_value iv_setting = 'DFIELDNAME' ).
    r_column = me.
  endmethod.


  method set_domname.
    change_setting( iv_value = iv_value iv_setting = 'DOMNAME' ).
    r_column = me.
  endmethod.


  method set_do_sum.
    change_setting( iv_value = iv_value iv_setting = 'DO_SUM' ).
    r_column = me.
  endmethod.


  method set_dragdropid.
    change_setting( iv_value = iv_value iv_setting = 'DRAGDROPID' ).
    r_column = me.
  endmethod.


  method set_drdn_alias.
    change_setting( iv_value = iv_value iv_setting = 'DRDN_ALIAS' ).
    r_column = me.
  endmethod.


  method set_drdn_field.
    change_setting( iv_value = iv_value iv_setting = 'DRDN_FIELD' ).
    r_column = me.
  endmethod.


  method set_drdn_hndl.
    change_setting( iv_value = iv_value iv_setting = 'DRDN_HNDL' ).
    r_column = me.
  endmethod.


  method set_edit.
    change_setting( iv_value = iv_value iv_setting = 'EDIT' ).
    r_column = me.
  endmethod.


  method set_editable.
    change_setting( iv_value = abap_true iv_setting = 'EDIT' ).
    r_column = me.
  endmethod.


  method set_edit_mask.
    change_setting( iv_value = iv_value iv_setting = 'EDIT_MASK' ).
    r_column = me.
  endmethod.


  method set_emphasize.
    change_setting( iv_value = iv_value iv_setting = 'EMPHASIZE' ).
    r_column = me.
  endmethod.


  method set_exponent.
    change_setting( iv_value = iv_value iv_setting = 'EXPONENT' ).
    r_column = me.
  endmethod.


  method set_f4availabl.
    change_setting( iv_value = iv_value iv_setting = 'F4AVAILABL' ).
    r_column = me.
  endmethod.


  method set_fieldname.
    change_setting( iv_value = iv_value iv_setting = 'FIELDNAME' ).
    r_column = me.
  endmethod.


  method set_fix_column.
    change_setting( iv_value = iv_value iv_setting = 'FIX_COLUMN' ).
    r_column = me.
  endmethod.


  method set_get_style.
    change_setting( iv_value = iv_value iv_setting = 'GET_STYLE' ).
    r_column = me.
  endmethod.


  method set_hier_cpos.
    change_setting( iv_value = iv_value iv_setting = 'HIER_CPOS' ).
    r_column = me.
  endmethod.


  method set_hier_level.
    change_setting( iv_value = iv_value iv_setting = 'HIER_LEVEL' ).
    r_column = me.
  endmethod.


  method set_hotspot.
    change_setting( iv_value = iv_value iv_setting = 'HOTSPOT' ).
    r_column = me.
  endmethod.


  method set_href_hndl.
    change_setting( iv_value = iv_value iv_setting = 'HREF_HNDL' ).
    r_column = me.
  endmethod.


  method set_h_col_key.
    change_setting( iv_value = iv_value iv_setting = 'H_COL_KEY' ).
    r_column = me.
  endmethod.


  method set_h_ftype.
    change_setting( iv_value = iv_value iv_setting = 'H_FTYPE' ).
    r_column = me.
  endmethod.


  method set_h_select.
    change_setting( iv_value = iv_value iv_setting = 'H_SELECT' ).
    r_column = me.
  endmethod.


  method set_icon.
    change_setting( iv_value = iv_value iv_setting = 'ICON' ).
    r_column = me.
  endmethod.


  method set_ifieldname.
    change_setting( iv_value = iv_value iv_setting = 'IFIELDNAME' ).
    r_column = me.
  endmethod.


  method set_indx_cfiel.
    change_setting( iv_value = iv_value iv_setting = 'INDX_CFIEL' ).
    r_column = me.
  endmethod.


  method set_indx_decml.
    change_setting( iv_value = iv_value iv_setting = 'INDX_DECML' ).
    r_column = me.
  endmethod.


  method set_indx_field.
    change_setting( iv_value = iv_value iv_setting = 'INDX_FIELD' ).
    r_column = me.
  endmethod.


  method set_indx_ifiel.
    change_setting( iv_value = iv_value iv_setting = 'INDX_IFIEL' ).
    r_column = me.
  endmethod.


  method set_indx_qfiel.
    change_setting( iv_value = iv_value iv_setting = 'INDX_QFIEL' ).
    r_column = me.
  endmethod.


  method set_indx_round.
    change_setting( iv_value = iv_value iv_setting = 'INDX_ROUND' ).
    r_column = me.
  endmethod.


  method set_intlen.
    change_setting( iv_value = iv_value iv_setting = 'INTLEN' ).
    r_column = me.
  endmethod.


  method set_inttype.
    change_setting( iv_value = iv_value iv_setting = 'INTTYPE' ).
    r_column = me.
  endmethod.


  method set_just.
    change_setting( iv_value = iv_value iv_setting = 'JUST' ).
    r_column = me.
  endmethod.


  method set_key.
    change_setting( iv_value = iv_value iv_setting = 'KEY' ).
    r_column = me.
  endmethod.


  method set_key_sel.
    change_setting( iv_value = iv_value iv_setting = 'KEY_SEL' ).
    r_column = me.
  endmethod.


  method set_lowercase.
    change_setting( iv_value = iv_value iv_setting = 'LOWERCASE' ).
    r_column = me.
  endmethod.


  method set_lzero.
    change_setting( iv_value = iv_value iv_setting = 'LZERO' ).
    r_column = me.
  endmethod.


  method set_mac.
    change_setting( iv_value = iv_value iv_setting = 'MAC' ).
    r_column = me.
  endmethod.


  method set_mark.
    change_setting( iv_value = iv_value iv_setting = 'MARK' ).
    r_column = me.
  endmethod.


  method set_texts.
    set_scrtext_s( iv_text_s ).
    set_scrtext_m( iv_text_m ).
    set_scrtext_l( iv_text_l ).
    set_tooltip( iv_text_l ) .
    set_coltext( iv_text_l ).
    set_seltext( iv_text_l ).
    set_reptext( iv_text_l && '' ).

    r_column = me.
  endmethod.


  method set_no_convext.
    change_setting( iv_value = iv_value iv_setting = 'NO_CONVEXT' ).
    r_column = me.
  endmethod.


  method set_no_init_ch.
    change_setting( iv_value = iv_value iv_setting = 'NO_INIT_CH' ).
    r_column = me.
  endmethod.


  method set_no_merging.
    change_setting( iv_value = iv_value iv_setting = 'NO_MERGING' ).
    r_column = me.
  endmethod.


  method set_no_out.
    change_setting( iv_value = iv_value iv_setting = 'NO_OUT' ).
    r_column = me.
  endmethod.


  method set_no_sign.
    change_setting( iv_value = iv_value iv_setting = 'NO_SIGN' ).
    r_column = me.
  endmethod.


  method set_no_sum.
    change_setting( iv_value = iv_value iv_setting = 'NO_SUM' ).
    r_column = me.
  endmethod.


  method set_no_zero.
    change_setting( iv_value = iv_value iv_setting = 'NO_ZERO' ).
    r_column = me.
  endmethod.


  method set_outputlen.
    change_setting( iv_value = iv_value iv_setting = 'OUTPUTLEN' ).
    r_column = me.
  endmethod.


  method set_parameter0.
    change_setting( iv_value = iv_value iv_setting = 'PARAMETER0' ).
    r_column = me.
  endmethod.


  method set_parameter1.
    change_setting( iv_value = iv_value iv_setting = 'PARAMETER1' ).
    r_column = me.
  endmethod.


  method set_parameter2.
    change_setting( iv_value = iv_value iv_setting = 'PARAMETER2' ).
    r_column = me.
  endmethod.


  method set_parameter3.
    change_setting( iv_value = iv_value iv_setting = 'PARAMETER3' ).
    r_column = me.
  endmethod.


  method set_parameter4.
    change_setting( iv_value = iv_value iv_setting = 'PARAMETER4' ).
    r_column = me.
  endmethod.


  method set_parameter5.
    change_setting( iv_value = iv_value iv_setting = 'PARAMETER5' ).
    r_column = me.
  endmethod.


  method set_parameter6.
    change_setting( iv_value = iv_value iv_setting = 'PARAMETER6' ).
    r_column = me.
  endmethod.


  method set_parameter7.
    change_setting( iv_value = iv_value iv_setting = 'PARAMETER7' ).
    r_column = me.
  endmethod.


  method set_parameter8.
    change_setting( iv_value = iv_value iv_setting = 'PARAMETER8' ).
    r_column = me.
  endmethod.


  method set_parameter9.
    change_setting( iv_value = iv_value iv_setting = 'PARAMETER9' ).
    r_column = me.
  endmethod.


  method set_qfieldname.
    change_setting( iv_value = iv_value iv_setting = 'QFIELDNAME' ).
    r_column = me.
  endmethod.


  method set_quantity.
    change_setting( iv_value = iv_value iv_setting = 'QUANTITY' ).
    r_column = me.
  endmethod.


  method set_readonly.
    change_setting( iv_value = abap_false iv_setting = 'EDIT' ).
    r_column = me.
  endmethod.


  method set_ref_field.
    change_setting( iv_value = iv_value iv_setting = 'REF_FIELD' ).
    r_column = me.
  endmethod.


  method set_ref_table.
    change_setting( iv_value = iv_value iv_setting = 'REF_TABLE' ).
    r_column = me.
  endmethod.


  method set_reprep.
    change_setting( iv_value = iv_value iv_setting = 'REPREP' ).
    r_column = me.
  endmethod.


  method set_reptext.
    change_setting( iv_value = iv_value iv_setting = 'REPTEXT' ).
    r_column = me.
  endmethod.


  method set_rollname.
    change_setting( iv_value = iv_value iv_setting = 'ROLLNAME' ).
    r_column = me.
  endmethod.


  method set_round.
    change_setting( iv_value = iv_value iv_setting = 'ROUND' ).
    r_column = me.
  endmethod.


  method set_roundfield.
    change_setting( iv_value = iv_value iv_setting = 'ROUNDFIELD' ).
    r_column = me.
  endmethod.


  method set_row_pos.
    change_setting( iv_value = iv_value iv_setting = 'ROW_POS' ).
    r_column = me.
  endmethod.


  method set_scrtext_l.
    change_setting( iv_value = iv_value iv_setting = 'SCRTEXT_L' ).
    r_column = me.
  endmethod.


  method set_scrtext_m.
    change_setting( iv_value = iv_value iv_setting = 'SCRTEXT_M' ).
    r_column = me.
  endmethod.


  method set_scrtext_s.
    change_setting( iv_value = iv_value iv_setting = 'SCRTEXT_S' ).
    r_column = me.
  endmethod.


  method set_selddictxt.
    change_setting( iv_value = iv_value iv_setting = 'SELDDICTXT' ).
    r_column = me.
  endmethod.


  method set_seltext.
    change_setting( iv_value = iv_value iv_setting = 'SELTEXT' ).
    r_column = me.
  endmethod.


  method set_sp_group.
    change_setting( iv_value = iv_value iv_setting = 'SP_GROUP' ).
    r_column = me.
  endmethod.


  method set_style.
    change_setting( iv_value = iv_value iv_setting = 'STYLE' ).
    r_column = me.
  endmethod.


  method set_style2.
    change_setting( iv_value = iv_value iv_setting = 'STYLE2' ).
    r_column = me.
  endmethod.


  method set_style3.
    change_setting( iv_value = iv_value iv_setting = 'STYLE3' ).
    r_column = me.
  endmethod.


  method set_style4.
    change_setting( iv_value = iv_value iv_setting = 'STYLE4' ).
    r_column = me.
  endmethod.


  method set_symbol.
    change_setting( iv_value = iv_value iv_setting = 'SYMBOL' ).
    r_column = me.
  endmethod.


  method set_tabname.
    change_setting( iv_value = iv_value iv_setting = 'TABNAME' ).
    r_column = me.
  endmethod.


  method set_tech.
    change_setting( iv_value = iv_value iv_setting = 'TECH' ).
    r_column = me.
  endmethod.


  method set_tech_col.
    change_setting( iv_value = iv_value iv_setting = 'TECH_COL' ).
    r_column = me.
  endmethod.


  method set_tech_comp.
    change_setting( iv_value = iv_value iv_setting = 'TECH_COMP' ).
    r_column = me.
  endmethod.


  method set_tech_form.
    change_setting( iv_value = iv_value iv_setting = 'TECH_FORM' ).
    r_column = me.
  endmethod.


  method set_tipddictxt.
    change_setting( iv_value = iv_value iv_setting = 'TIPDDICTXT' ).
    r_column = me.
  endmethod.


  method set_tooltip.
    change_setting( iv_value = iv_value iv_setting = 'TOOLTIP' ).
    r_column = me.
  endmethod.


  method set_txt_field.
    change_setting( iv_value = iv_value iv_setting = 'TXT_FIELD' ).
    r_column = me.
  endmethod.


  method set_valexi.
    change_setting( iv_value = iv_value iv_setting = 'VALEXI' ).
    r_column = me.
  endmethod.


  method set_web_field.
    change_setting( iv_value = iv_value iv_setting = 'WEB_FIELD' ).
    r_column = me.
  endmethod.


  method get_auto_value.
    get_setting( exporting  iv_setting = 'AUTO_VALUE' importing e_value = rv_value ).
  endmethod.


  method get_cfieldname.
    get_setting( exporting  iv_setting = 'CFIELDNAME' importing e_value = rv_value ).
  endmethod.


  method get_checkbox.
    get_setting( exporting  iv_setting = 'CHECKBOX' importing e_value = rv_value ).
  endmethod.


  method get_checktable.
    get_setting( exporting  iv_setting = 'CHECKTABLE' importing e_value = rv_value ).
  endmethod.


  method get_colddictxt.
    get_setting( exporting  iv_setting = 'COLDDICTXT' importing e_value = rv_value ).
  endmethod.


  method get_color.
    get_emphasize(   receiving rv_value = rv_value ).
  endmethod.


  method get_coltext.
    get_setting( exporting  iv_setting = 'COLTEXT' importing e_value = rv_value ).
  endmethod.


  method get_col_id.
    get_setting( exporting  iv_setting = 'COL_ID' importing e_value = rv_value ).
  endmethod.


  method get_col_opt.
    get_setting( exporting  iv_setting = 'COL_OPT' importing e_value = rv_value ).
  endmethod.


  method get_col_pos.
    get_setting( exporting  iv_setting = 'COL_POS' importing e_value = rv_value ).
  endmethod.


  method get_convexit.
    get_setting( exporting  iv_setting = 'CONVEXIT' importing e_value = rv_value ).
  endmethod.


  method get_currency.
    get_setting( exporting  iv_setting = 'CURRENCY' importing e_value = rv_value ).
  endmethod.


  method get_datatype.
    get_setting( exporting  iv_setting = 'DATATYPE' importing e_value = rv_value ).
  endmethod.


  method get_dd_outlen.
    get_setting( exporting  iv_setting = 'DD_OUTLEN' importing e_value = rv_value ).
  endmethod.


  method get_dd_roll.
    get_setting( exporting  iv_setting = 'DD_ROLL' importing e_value = rv_value ).
  endmethod.


  method get_decfloat_style.
    get_setting( exporting  iv_setting = 'DECFLOAT_STYLE' importing e_value = rv_value ).
  endmethod.


  method get_decimals.
    get_setting( exporting  iv_setting = 'DECIMALS' importing e_value = rv_value ).
  endmethod.


  method get_decimals_o.
    get_setting( exporting  iv_setting = 'DECIMALS_O' importing e_value = rv_value ).
  endmethod.


  method get_decmlfield.
    get_setting( exporting  iv_setting = 'DECMLFIELD' importing e_value = rv_value ).
  endmethod.


  method get_dfieldname.
    get_setting( exporting  iv_setting = 'DFIELDNAME' importing e_value = rv_value ).
  endmethod.


  method get_domname.
    get_setting( exporting  iv_setting = 'DOMNAME' importing e_value = rv_value ).
  endmethod.


  method get_do_sum.
    get_setting( exporting  iv_setting = 'DO_SUM' importing e_value = rv_value ).
  endmethod.


  method get_dragdropid.
    get_setting( exporting  iv_setting = 'DRAGDROPID' importing e_value = rv_value ).
  endmethod.


  method get_drdn_alias.
    get_setting( exporting  iv_setting = 'DRDN_ALIAS' importing e_value = rv_value ).
  endmethod.


  method get_drdn_field.
    get_setting( exporting  iv_setting = 'DRDN_FIELD' importing e_value = rv_value ).
  endmethod.


  method get_drdn_hndl.
    get_setting( exporting  iv_setting = 'DRDN_HNDL' importing e_value = rv_value ).
  endmethod.


  method get_edit.
    get_setting( exporting  iv_setting = 'EDIT' importing e_value = rv_value ).
  endmethod.


  method get_editable.
    get_setting( exporting iv_setting = 'EDIT' importing e_value = rv_editable ).
  endmethod.


  method get_edit_mask.
    get_setting( exporting  iv_setting = 'EDIT_MASK' importing e_value = rv_value ).
  endmethod.


  method get_emphasize.
    get_setting( exporting  iv_setting = 'EMPHASIZE' importing e_value = rv_value ).
  endmethod.


  method get_exponent.
    get_setting( exporting  iv_setting = 'EXPONENT' importing e_value = rv_value ).
  endmethod.


  method get_f4availabl.
    get_setting( exporting  iv_setting = 'F4AVAILABL' importing e_value = rv_value ).
  endmethod.


  method get_fieldname.
    get_setting( exporting  iv_setting = 'FIELDNAME' importing e_value = rv_value ).
  endmethod.


  method get_fix_column.
    get_setting( exporting  iv_setting = 'FIX_COLUMN' importing e_value = rv_value ).
  endmethod.


  method get_get_style.
    get_setting( exporting  iv_setting = 'GET_STYLE' importing e_value = rv_value ).
  endmethod.


  method get_hier_cpos.
    get_setting( exporting  iv_setting = 'HIER_CPOS' importing e_value = rv_value ).
  endmethod.


  method get_hier_level.
    get_setting( exporting  iv_setting = 'HIER_LEVEL' importing e_value = rv_value ).
  endmethod.


  method get_hotspot.
    get_setting( exporting  iv_setting = 'HOTSPOT' importing e_value = rv_value ).
  endmethod.


  method get_href_hndl.
    get_setting( exporting  iv_setting = 'HREF_HNDL' importing e_value = rv_value ).
  endmethod.


  method get_h_col_key.
    get_setting( exporting  iv_setting = 'H_COL_KEY' importing e_value = rv_value ).
  endmethod.


  method get_h_ftype.
    get_setting( exporting  iv_setting = 'H_FTYPE' importing e_value = rv_value ).
  endmethod.


  method get_h_select.
    get_setting( exporting  iv_setting = 'H_SELECT' importing e_value = rv_value ).
  endmethod.


  method get_icon.
    get_setting( exporting  iv_setting = 'ICON' importing e_value = rv_value ).
  endmethod.


  method get_ifieldname.
    get_setting( exporting  iv_setting = 'IFIELDNAME' importing e_value = rv_value ).
  endmethod.


  method get_indx_cfiel.
    get_setting( exporting  iv_setting = 'INDX_CFIEL' importing e_value = rv_value ).
  endmethod.


  method get_indx_decml.
    get_setting( exporting  iv_setting = 'INDX_DECML' importing e_value = rv_value ).
  endmethod.


  method get_indx_field.
    get_setting( exporting  iv_setting = 'INDX_FIELD' importing e_value = rv_value ).
  endmethod.


  method get_indx_ifiel.
    get_setting( exporting  iv_setting = 'INDX_IFIEL' importing e_value = rv_value ).
  endmethod.


  method get_indx_qfiel.
    get_setting( exporting  iv_setting = 'INDX_QFIEL' importing e_value = rv_value ).
  endmethod.


  method get_indx_round.
    get_setting( exporting  iv_setting = 'INDX_ROUND' importing e_value = rv_value ).
  endmethod.


  method get_intlen.
    get_setting( exporting  iv_setting = 'INTLEN' importing e_value = rv_value ).
  endmethod.


  method get_inttype.
    get_setting( exporting  iv_setting = 'INTTYPE' importing e_value = rv_value ).
  endmethod.


  method get_just.
    get_setting( exporting  iv_setting = 'JUST' importing e_value = rv_value ).
  endmethod.


  method get_key.
    get_setting( exporting  iv_setting = 'KEY' importing e_value = rv_value ).
  endmethod.


  method get_key_sel.
    get_setting( exporting  iv_setting = 'KEY_SEL' importing e_value = rv_value ).
  endmethod.


  method get_lowercase.
    get_setting( exporting  iv_setting = 'LOWERCASE' importing e_value = rv_value ).
  endmethod.


  method get_lzero.
    get_setting( exporting  iv_setting = 'LZERO' importing e_value = rv_value ).
  endmethod.


  method get_mac.
    get_setting( exporting  iv_setting = 'MAC' importing e_value = rv_value ).
  endmethod.


  method get_mark.
    get_setting( exporting  iv_setting = 'MARK' importing e_value = rv_value ).
  endmethod.


  method get_no_convext.
    get_setting( exporting  iv_setting = 'NO_CONVEXT' importing e_value = rv_value ).
  endmethod.


  method get_no_init_ch.
    get_setting( exporting  iv_setting = 'NO_INIT_CH' importing e_value = rv_value ).
  endmethod.


  method get_no_merging.
    get_setting( exporting  iv_setting = 'NO_MERGING' importing e_value = rv_value ).
  endmethod.


  method get_no_out.
    get_setting( exporting  iv_setting = 'NO_OUT' importing e_value = rv_value ).
  endmethod.


  method get_no_sign.
    get_setting( exporting  iv_setting = 'NO_SIGN' importing e_value = rv_value ).
  endmethod.


  method get_no_sum.
    get_setting( exporting  iv_setting = 'NO_SUM' importing e_value = rv_value ).
  endmethod.


  method get_no_zero.
    get_setting( exporting  iv_setting = 'NO_ZERO' importing e_value = rv_value ).
  endmethod.


  method get_outputlen.
    get_setting( exporting  iv_setting = 'OUTPUTLEN' importing e_value = rv_value ).
  endmethod.


  method get_parameter0.
    get_setting( exporting  iv_setting = 'PARAMETER0' importing e_value = rv_value ).
  endmethod.


  method get_parameter1.
    get_setting( exporting  iv_setting = 'PARAMETER1' importing e_value = rv_value ).
  endmethod.


  method get_parameter2.
    get_setting( exporting  iv_setting = 'PARAMETER2' importing e_value = rv_value ).
  endmethod.


  method get_parameter3.
    get_setting( exporting  iv_setting = 'PARAMETER3' importing e_value = rv_value ).
  endmethod.


  method get_parameter4.
    get_setting( exporting  iv_setting = 'PARAMETER4' importing e_value = rv_value ).
  endmethod.


  method get_parameter5.
    get_setting( exporting  iv_setting = 'PARAMETER5' importing e_value = rv_value ).
  endmethod.


  method get_parameter6.
    get_setting( exporting  iv_setting = 'PARAMETER6' importing e_value = rv_value ).
  endmethod.


  method get_parameter7.
    get_setting( exporting  iv_setting = 'PARAMETER7' importing e_value = rv_value ).
  endmethod.


  method get_parameter8.
    get_setting( exporting  iv_setting = 'PARAMETER8' importing e_value = rv_value ).
  endmethod.


  method get_parameter9.
    get_setting( exporting  iv_setting = 'PARAMETER9' importing e_value = rv_value ).
  endmethod.


  method get_qfieldname.
    get_setting( exporting  iv_setting = 'QFIELDNAME' importing e_value = rv_value ).
  endmethod.


  method get_quantity.
    get_setting( exporting  iv_setting = 'QUANTITY' importing e_value = rv_value ).
  endmethod.


  method get_readonly.
    get_setting( exporting iv_setting = 'EDIT' importing e_value = rv_read_only ).
    rv_read_only = switch #( rv_read_only when abap_true then abap_false
                                          when abap_false then abap_true ).
  endmethod.


  method get_ref_field.
    get_setting( exporting  iv_setting = 'REF_FIELD' importing e_value = rv_value ).
  endmethod.


  method get_ref_table.
    get_setting( exporting  iv_setting = 'REF_TABLE' importing e_value = rv_value ).
  endmethod.


  method get_reprep.
    get_setting( exporting  iv_setting = 'REPREP' importing e_value = rv_value ).
  endmethod.


  method get_reptext.
    get_setting( exporting  iv_setting = 'REPTEXT' importing e_value = rv_value ).
  endmethod.


  method get_rollname.
    get_setting( exporting  iv_setting = 'ROLLNAME' importing e_value = rv_value ).
  endmethod.


  method get_round.
    get_setting( exporting  iv_setting = 'ROUND' importing e_value = rv_value ).
  endmethod.


  method get_roundfield.
    get_setting( exporting  iv_setting = 'ROUNDFIELD' importing e_value = rv_value ).
  endmethod.


  method get_row_pos.
    get_setting( exporting  iv_setting = 'ROW_POS' importing e_value = rv_value ).
  endmethod.


  method get_scrtext_l.
    get_setting( exporting  iv_setting = 'SCRTEXT_L' importing e_value = rv_value ).
  endmethod.


  method get_scrtext_m.
    get_setting( exporting  iv_setting = 'SCRTEXT_M' importing e_value = rv_value ).
  endmethod.


  method get_scrtext_s.
    get_setting( exporting  iv_setting = 'SCRTEXT_S' importing e_value = rv_value ).
  endmethod.


  method get_selddictxt.
    get_setting( exporting  iv_setting = 'SELDDICTXT' importing e_value = rv_value ).
  endmethod.


  method get_seltext.
    get_setting( exporting  iv_setting = 'SELTEXT' importing e_value = rv_value ).
  endmethod.


  method get_sp_group.
    get_setting( exporting  iv_setting = 'SP_GROUP' importing e_value = rv_value ).
  endmethod.


  method get_style.
    get_setting( exporting  iv_setting = 'STYLE' importing e_value = rv_value ).
  endmethod.


  method get_style2.
    get_setting( exporting  iv_setting = 'STYLE2' importing e_value = rv_value ).
  endmethod.


  method get_style3.
    get_setting( exporting  iv_setting = 'STYLE3' importing e_value = rv_value ).
  endmethod.


  method get_style4.
    get_setting( exporting  iv_setting = 'STYLE4' importing e_value = rv_value ).
  endmethod.


  method get_symbol.
    get_setting( exporting  iv_setting = 'SYMBOL' importing e_value = rv_value ).
  endmethod.


  method get_tabname.
    get_setting( exporting  iv_setting = 'TABNAME' importing e_value = rv_value ).
  endmethod.


  method get_tech.
    get_setting( exporting  iv_setting = 'TECH' importing e_value = rv_value ).
  endmethod.


  method get_tech_col.
    get_setting( exporting  iv_setting = 'TECH_COL' importing e_value = rv_value ).
  endmethod.


  method get_tech_comp.
    get_setting( exporting  iv_setting = 'TECH_COMP' importing e_value = rv_value ).
  endmethod.


  method get_tech_form.
    get_setting( exporting  iv_setting = 'TECH_FORM' importing e_value = rv_value ).
  endmethod.


  method get_tipddictxt.
    get_setting( exporting  iv_setting = 'TIPDDICTXT' importing e_value = rv_value ).
  endmethod.


  method get_tooltip.
    get_setting( exporting  iv_setting = 'TOOLTIP' importing e_value = rv_value ).
  endmethod.


  method get_txt_field.
    get_setting( exporting  iv_setting = 'TXT_FIELD' importing e_value = rv_value ).
  endmethod.


  method get_valexi.
    get_setting( exporting  iv_setting = 'VALEXI' importing e_value = rv_value ).
  endmethod.


  method get_web_field.
    get_setting( exporting  iv_setting = 'WEB_FIELD' importing e_value = rv_value ).
  endmethod.


  METHOD set_text.
    DATA: lv_scrtext_l TYPE scrtext_l,
          lv_scrtext_m TYPE scrtext_m,
          lv_scrtext_s TYPE scrtext_s.

    lv_scrtext_l = iv_value.
    lv_scrtext_m = iv_value.
    lv_scrtext_s = iv_value.

    set_scrtext_s( lv_scrtext_s ).
    set_scrtext_m( lv_scrtext_m ).
    set_scrtext_l( lv_scrtext_l ).
    set_tooltip( lv_scrtext_l ) .
    set_coltext( lv_scrtext_l ).
    set_seltext( lv_scrtext_l ).
    set_reptext( lv_scrtext_l && '' ).

    r_column = me.
  ENDMETHOD.
ENDCLASS.
