#######################################################
#                                                     
#  Innovus Command Logging File                     
#  Created on Wed Feb 14 13:54:34 2024                
#                                                     
#######################################################

#@(#)CDS: Innovus v16.13-s045_1 (64bit) 10/03/2016 04:28 (Linux 2.6.18-194.el5)
#@(#)CDS: NanoRoute 16.13-s045_1 NR160923-1039/16_13-UB (database version 2.30, 351.6.1) {superthreading v1.30}
#@(#)CDS: AAE 16.13-s013 (64bit) 10/03/2016 (Linux 2.6.18-194.el5)
#@(#)CDS: CTE 16.13-s013_1 () Sep 28 2016 05:49:12 ( )
#@(#)CDS: SYNTECH 16.13-s008_1 () Sep 15 2016 11:59:01 ( )
#@(#)CDS: CPE v16.13-s039
#@(#)CDS: IQRC/TQRC 15.2.5-s542 (64bit) Thu Aug 25 18:41:43 PDT 2016 (Linux 2.6.18-194.el5)

set_global _enable_mmmc_by_default_flow      $CTE::mmmc_default
suppressMessage ENCEXT-2799
getDrawView
loadWorkspace -name Physical
win
save_global PnR/jollof.globals
save_global PnR/jollof.globals
save_global PnR/jollof.globals
save_global PnR/jollof.globals
save_global PnR/jollof.globals
set init_gnd_net GND
set init_lef_file {/usr/local-eit/cad2/cmpstm/dicp18/lu_pads_65nm/PADS_Jun2013.lef /usr/local-eit/cad2/cmpstm/stm065v536/EncounterTechnoKit_cmos065_7m4x0y2z_AP@5.3.1/TECH/cmos065_7m4x0y2z_AP_Worst.lef /usr/local-eit/cad2/cmpstm/stm065v536/CORE65LPLVT_5.1/CADENCE/LEF/CORE65LPLVT_soc.lef /usr/local-eit/cad2/cmpstm/stm065v536/CLOCK65LPLVT_3.1/CADENCE/LEF/CLOCK65LPLVT_soc.lef /usr/local-eit/cad2/cmpstm/stm065v536/PRHS65_7.0.a/CADENCE/LEF/PRHS65_soc.lef /usr/local-eit/cad2/cmpstm/stm065v536/IO65LPHVT_SF_1V8_50A_7M4X0Y2Z_7.0/CADENCE/LEF/IO65LPHVT_SF_1V8_50A_7M4X0Y2Z_soc.lef /usr/local-eit/cad2/cmpstm/stm065v536/IO65LP_SF_BASIC_50A_ST_7M4X0Y2Z_7.2/CADENCE/LEF/IO65LP_SF_BASIC_50A_ST_7M4X0Y2Z_soc.lef /usr/local-eit/cad2/cmpstm/oldmems/mem2011/SPHD110420-48158@1.0/CADENCE/LEF/SPHD110420_soc.lef}
set init_verilog outputs/jollof_top.v
set init_mmmc_file PnR/jollof.view
set init_top_cell jollof_top
set init_pwr_net VDD
init_design
