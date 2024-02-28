if {![namespace exists ::IMEX]} { namespace eval ::IMEX {} }
set ::IMEX::dataVar [file dirname [file normalize [info script]]]
set ::IMEX::libVar ${::IMEX::dataVar}/libs

create_library_set -name SS\
   -timing\
    [list ${::IMEX::libVar}/mmmc/CLOCK65LPLVT_wc_0.95V_125C_10y.lib\
    ${::IMEX::libVar}/mmmc/CORE65LPLVT_wc_0.95V_125C_10y.lib\
    ${::IMEX::libVar}/mmmc/IO65LP_SF_BASIC_50A_ST_7M4X0Y2Z_wc_0.95V_125C_10y.lib\
    ${::IMEX::libVar}/mmmc/IO65LPHVT_SF_1V8_50A_7M4X0Y2Z_wc_0.95V_1.65V_125C_10y.lib\
    ${::IMEX::libVar}/mmmc/SPHD110420_wc_1.10V_125C_10y.lib\
    ${::IMEX::libVar}/mmmc/Pads_Oct2012.lib]
create_library_set -name FF\
   -timing\
    [list ${::IMEX::libVar}/mmmc/CLOCK65LPLVT_bc_1.30V_m40C_10y.lib\
    ${::IMEX::libVar}/mmmc/CORE65LPLVT_bc_1.30V_m40C_10y.lib\
    ${::IMEX::libVar}/mmmc/IO65LP_SF_BASIC_50A_ST_7M4X0Y2Z_bc_1.30V_m40C_10y.lib\
    ${::IMEX::libVar}/mmmc/IO65LPHVT_SF_1V8_50A_7M4X0Y2Z_bc_1.30V_1.95V_m40C_10y.lib\
    ${::IMEX::libVar}/mmmc/SPHD110420_bc_1.30V_m40C_10y.lib\
    ${::IMEX::libVar}/mmmc/Pads_Oct2012.lib]
create_op_cond -name WCCOM -library_file ${::IMEX::libVar}/mmmc/CORE65LPLVT_wc_0.95V_125C_10y.lib -P 1 -V 0.95 -T 125
create_op_cond -name BCCOM -library_file ${::IMEX::libVar}/mmmc/CORE65LPLVT_bc_1.30V_m40C_10y.lib -P 1 -V 1.3 -T -40
create_rc_corner -name SS\
   -cap_table ${::IMEX::libVar}/mmmc/cmos065_7m4x0y2z_AP_Worst.captable\
   -preRoute_res 1\
   -postRoute_res {1 1 1}\
   -preRoute_cap 1\
   -postRoute_cap {1 1 1}\
   -postRoute_xcap {1 1 1}\
   -preRoute_clkres 0\
   -preRoute_clkcap 0\
   -T 125\
   -qx_tech_file ${::IMEX::libVar}/mmmc/SS/RCMIN.tech
create_rc_corner -name FF\
   -cap_table ${::IMEX::libVar}/mmmc/cmos065_7m4x0y2z_AP_Best.captable\
   -preRoute_res 1\
   -postRoute_res {1 1 1}\
   -preRoute_cap 1\
   -postRoute_cap {1 1 1}\
   -postRoute_xcap {1 1 1}\
   -preRoute_clkres 0\
   -preRoute_clkcap 0\
   -T -40\
   -qx_tech_file ${::IMEX::libVar}/mmmc/FF/RCMAX.tech
create_delay_corner -name SS\
   -library_set SS\
   -opcond_library ${::IMEX::libVar}/mmmc/CORE65LPLVT_wc_0.95V_125C_10y.lib\
   -opcond WCCOM\
   -rc_corner SS
create_delay_corner -name FF\
   -library_set FF\
   -opcond_library ${::IMEX::libVar}/mmmc/CORE65LPLVT_bc_1.30V_m40C_10y.lib\
   -opcond BCCOM\
   -rc_corner FF
create_constraint_mode -name Clock_Constraint\
   -sdc_files\
    [list ${::IMEX::dataVar}/mmmc/modes/Clock_Constraint/Clock_Constraint.sdc]
create_analysis_view -name SS -constraint_mode Clock_Constraint -delay_corner SS -latency_file ${::IMEX::dataVar}/mmmc/views/SS/latency.sdc
create_analysis_view -name FF -constraint_mode Clock_Constraint -delay_corner FF -latency_file ${::IMEX::dataVar}/mmmc/views/FF/latency.sdc
set_analysis_view -setup [list SS] -hold [list FF]
