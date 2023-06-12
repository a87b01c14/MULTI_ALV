class lcl_output definition.

  public section.
    data: okcode type sy-ucomm.
    data: guid type char22 read-only.
    methods: constructor importing io_falv type ref to zcl_falv.
    methods: pbo importing value(iv_dynnr) type sy-dynnr default sy-dynnr.
    methods: pai changing c_ucomm type sy-ucomm.
    class-methods: end_of_ss1001 importing !p_task type clike.
    class-methods: set_ss1001_status.
    data: falv type ref to zcl_falv.
    class-data: wait_for_mass_repl type abap_bool.
    class-data: mass_repl_params type rsparams_tt.
  protected section.
    data: first_output type abap_bool value abap_true.
  private section.
    methods: hide.
    methods: show.


endclass.
