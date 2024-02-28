#######################################################
##                                                     
##  Matrix Multiplier PnR Command Script                    
##                                                     
########################################################
#
#
########################################################
## Import Design
########################################################
## Set the computer usage

setMultiCpuUsage -localCpu 4 -cpuPerRemoteHost 4 -remoteHost 0 -keepLicense true
setDistributeHost -local

set_global _enable_mmmc_by_default_flow      $CTE::mmmc_default
suppressMessage ENCEXT-2799
getDrawView
loadWorkspace -name Physical
win
set ::TimeLib::tsgMarkCellLatchConstructFlag 1
set defHierChar /
set distributed_client_message_echo 1
set distributed_mmmc_disable_reports_auto_redirection 0
set init_gnd_net GND
set init_io_file PnR/jollof.io
set init_lef_file {/usr/local-eit/cad2/cmpstm/stm065v536/EncounterTechnoKit_cmos065_7m4x0y2z_AP@5.3.1/TECH/cmos065_7m4x0y2z_AP_Worst.lef /usr/local-eit/cad2/cmpstm/stm065v536/CORE65LPLVT_5.1/CADENCE/LEF/CORE65LPLVT_soc.lef /usr/local-eit/cad2/cmpstm/stm065v536/CLOCK65LPLVT_3.1/CADENCE/LEF/CLOCK65LPLVT_soc.lef /usr/local-eit/cad2/cmpstm/stm065v536/PRHS65_7.0.a/CADENCE/LEF/PRHS65_soc.lef /usr/local-eit/cad2/cmpstm/stm065v536/IO65LPHVT_SF_1V8_50A_7M4X0Y2Z_7.0/CADENCE/LEF/IO65LPHVT_SF_1V8_50A_7M4X0Y2Z_soc.lef /usr/local-eit/cad2/cmpstm/stm065v536/IO65LP_SF_BASIC_50A_ST_7M4X0Y2Z_7.2/CADENCE/LEF/IO65LP_SF_BASIC_50A_ST_7M4X0Y2Z_soc.lef /usr/local-eit/cad2/cmpstm/oldmems/mem2011/SPHD110420-48158@1.0/CADENCE/LEF/SPHD110420_soc.lef /usr/local-eit/cad2/cmpstm/dicp18/lu_pads_65nm/PADS_Jun2013.lef}
set init_mmmc_file PnR/jollof.view
set init_oa_search_lib {}
set init_pwr_net VDD
set init_top_cell jollof_top
set init_verilog outputs/jollof_top.v
set latch_time_borrow_mode max_borrow
set pegDefaultResScaleFactor 1
set pegDetailResScaleFactor 1
set report_inactive_arcs_format {from to when arc_type sense reason}
set tso_post_client_restore_command {update_timing ; write_eco_opt_db ;}
init_design


#######################################################
## Global Net Connections
########################################################

clearGlobalNets
globalNetConnect VDD -type tiehi -inst *
globalNetConnect VDD -type pgpin -pin vdd -inst *
globalNetConnect VDD -type pgpin -pin VDDC -inst *
globalNetConnect GND -type tielo -inst *
globalNetConnect GND -type pgpin -pin GNDC -inst *
globalNetConnect GND -type pgpin -pin gnd -inst *

#######################################################
## Floorplan Core and IO Size specification
########################################################

floorPlan -site CORE -s 500.0 300.0 20.0 20.0 20.0 20.0
uiSetTool select
getIoFlowFlag
fit

#######################################################
## Modify RAM Position 
########################################################

selectInst SRAM_wrapper_inst/DUT_ST_SPHDL_160x32_mem2011
setDrawView fplan
placeInstance SRAM_wrapper_inst/DUT_ST_SPHDL_160x32_mem2011 96.056 95.896 R180
setObjFPlanBox Instance SRAM_wrapper_inst/DUT_ST_SPHDL_160x32_mem2011 96.056 95.896 400.856 136.896
getIoFlowFlag
deselectAll

#######################################################
## Add Halo Around Memories
########################################################

selectInst SRAM_wrapper_inst/DUT_ST_SPHDL_160x32_mem2011
addHaloToBlock {10 10 10 10} -allBlock
deselectAll


#######################################################
## Cut Rows Under Memories
########################################################

selectInst SRAM_wrapper_inst/DUT_ST_SPHDL_160x32_mem2011
cutRow -selected
deselectAll

#######################################################
## Add Power Rings
########################################################

set sprCreateIeRingNets {}
set sprCreateIeRingLayers {}
set sprCreateIeRingWidth 1.0
set sprCreateIeRingSpacing 1.0
set sprCreateIeRingOffset 1.0
set sprCreateIeRingThreshold 1.0
set sprCreateIeRingJogDistance 1.0
addRing -skip_via_on_wire_shape Noshape -skip_via_on_pin Standardcell -stacked_via_top_layer AP -type core_rings -jog_distance 0.4 -threshold 0.4 -nets {GND VDD} -follow core -stacked_via_bottom_layer M1 -layer {bottom M3 top M3 right M4 left M4} -width 2 -spacing 2 -offset 2

#######################################################
## Add Block Ring Aroud memory block
########################################################

selectInst SRAM_wrapper_inst/DUT_ST_SPHDL_160x32_mem2011
addRing -skip_via_on_wire_shape Noshape -skip_via_on_pin Standardcell -stacked_via_top_layer AP -around selected -jog_distance 0.4 -threshold 0.4 -type block_rings -nets {GND VDD} -follow core -stacked_via_bottom_layer M1 -layer {bottom M3 top M3 right M4 left M4} -width 2 -spacing 2 -offset 2 -skip_side {left bottom}
deselectAll

#######################################################
## Add Strips
########################################################

set sprCreateIeStripeNets {}
set sprCreateIeStripeLayers {}
set sprCreateIeStripeWidth 10.0
set sprCreateIeStripeSpacing 2.0
set sprCreateIeStripeThreshold 1.0

#Vertical Strips

addStripe -skip_via_on_wire_shape Noshape -block_ring_top_layer_limit M1 -max_same_layer_jog_length 6 -padcore_ring_bottom_layer_limit M1 -set_to_set_distance 100 -skip_via_on_pin Standardcell -stacked_via_top_layer AP -padcore_ring_top_layer_limit M1 -spacing 4 -merge_stripes_value 2.5 -layer M4 -block_ring_bottom_layer_limit M1 -stop_x 0 -stop_y 0 -width 2 -area {} -nets {GND VDD} -start_x 0 -stacked_via_bottom_layer M1 -start_y 0

#Horizontal Strips

addStripe -skip_via_on_wire_shape Noshape -block_ring_top_layer_limit M1 -max_same_layer_jog_length 6 -padcore_ring_bottom_layer_limit M1 -set_to_set_distance 100 -skip_via_on_pin Standardcell -stacked_via_top_layer AP -padcore_ring_top_layer_limit M1 -spacing 4 -merge_stripes_value 2.5 -direction horizontal -layer M3 -block_ring_bottom_layer_limit M1 -stop_x 0 -stop_y 0 -width 2 -area {} -nets {GND VDD} -start_x 0 -stacked_via_bottom_layer M1 -start_y 0

#######################################################
## Add Well Taps
########################################################

addWellTap -cell HS65_LH_FILLERNPWPFP4 -cellInterval 25 -prefix WELLTAP


#######################################################
## Placement Blockage
########################################################

setPlaceMode -prerouteAsObs {1 2 3 4 5 6 7 8}

########################################################
## Placement- Standard cells with Memories
########################################################
setPlaceMode -ignoreScan false
setPlaceMode -fp false
placeDesign

setOptMode -fixCap true -fixTran true -fixFanoutLoad true
optDesign -preCTS
optDesign -preCTS

#######################################################
## Clock Synthesis
########################################################
setDrawView place

set_ccopt_property inverter_cells { HS65_LL_CNIVX10 HS65_LL_CNIVX103 HS65_LL_CNIVX124 HS65_LL_CNIVX14 HS65_LL_CNIVX17 HS65_LL_CNIVX21 HS65_LL_CNIVX24 HS65_LL_CNIVX27 HS65_LL_CNIVX3 HS65_LL_CNIVX31 HS65_LL_CNIVX34 HS65_LL_CNIVX38 HS65_LL_CNIVX41 HS65_LL_CNIVX45 HS65_LL_CNIVX48 HS65_LL_CNIVX52 HS65_LL_CNIVX55 HS65_LL_CNIVX58 HS65_LL_CNIVX62 HS65_LL_CNIVX7 HS65_LL_CNIVX82}

set_ccopt_property buffer_cells {HS65_LL_CNBFX10 HS65_LL_CNBFX103 HS65_LL_CNBFX124 HS65_LL_CNBFX14 HS65_LL_CNBFX17 HS65_LL_CNBFX21 HS65_LL_CNBFX24 HS65_LL_CNBFX27 HS65_LL_CNBFX31 HS65_LL_CNBFX34 HS65_LL_CNBFX38 HS65_LL_CNBFX38_0 HS65_LL_CNBFX38_1 HS65_LL_CNBFX38_10 HS65_LL_CNBFX38_11 HS65_LL_CNBFX38_12 HS65_LL_CNBFX38_13 HS65_LL_CNBFX38_14 HS65_LL_CNBFX38_15 HS65_LL_CNBFX38_16 HS65_LL_CNBFX38_17 HS65_LL_CNBFX38_18 HS65_LL_CNBFX38_19 HS65_LL_CNBFX38_2 HS65_LL_CNBFX38_20 HS65_LL_CNBFX38_21 HS65_LL_CNBFX38_22 HS65_LL_CNBFX38_23 HS65_LL_CNBFX38_3 HS65_LL_CNBFX38_4 HS65_LL_CNBFX38_5 HS65_LL_CNBFX38_6 HS65_LL_CNBFX38_7 HS65_LL_CNBFX38_8 HS65_LL_CNBFX38_9 HS65_LL_CNBFX41 HS65_LL_CNBFX45 HS65_LL_CNBFX48 HS65_LL_CNBFX52 HS65_LL_CNBFX55 HS65_LL_CNBFX58 HS65_LL_CNBFX62 HS65_LL_CNBFX82 }

# set hold_fixing_cells { HS65_LL_DLYIC2X7 HS65_LL_DLYIC2X9 HS65_LL_DLYIC4X4 HS65_LL_DLYIC4X7 HS65_LL_DLYIC4X9 HS65_LL_DLYIC6X4 HS65_LL_DLYIC6X7 HS65_LL_DLYIC6X9 }

create_ccopt_clock_tree_spec -file ./ccopt.spec
source ./ccopt.spec
ccopt_design

setOptMode -holdFixingCells { HS65_LL_DLYIC2X7 HS65_LL_DLYIC2X9 HS65_LL_DLYIC4X4 HS65_LL_DLYIC4X7 HS65_LL_DLYIC4X9 HS65_LL_DLYIC6X4 HS65_LL_DLYIC6X7 HS65_LL_DLYIC6X9 }
setOptMode -fixCap true -fixTran true -fixFanoutLoad true

optDesign -postCTS
optDesign -postCTS -hold
optDesign -postCTS
optDesign -postCTS -hold
optDesign -postCTS
optDesign -postCTS -hold

report_timing -late
report_timing -early

#######################################################
## ADD IO FILLERS
########################################################

deselectAll
selectInst PcornerLL
selectInst InPad_5
selectInst InPad_6
selectInst InPad_7
selectInst clkpad
selectInst readpad
spaceObject -fixSide bottom -space 14

deselectAll

selectInst validpad
selectInst InPad_4
selectInst InPad_3
selectInst InPad_2
selectInst OutPad_4
selectInst PcornerUR
spaceObject -fixSide bottom -space 14

deselectAll

selectInst PcornerLR
selectInst PVDD2
selectInst rstpad
selectInst finishpad
selectInst OutPad_3
selectInst OutPad_2
selectInst OutPad_1
selectInst OutPad_0
selectInst PVDD1
spaceObject -fixSide left -space 15

deselectAll

selectInst PGND1
selectInst PcornerUL
selectInst OutPad_5
selectInst OutPad_6
selectInst OutPad_7
selectInst InPad_0
selectInst InPad_1
selectInst OutPad_8
selectInst PGND2
spaceObject -fixSide left -space 15

addIoFiller -cell PADSPACE_74x1u -prefix IO_FILLER -side n
addIoFiller -cell PADSPACE_74x1u -prefix IO_FILLER -side s
addIoFiller -cell PADSPACE_74x1u -prefix IO_FILLER -side w
addIoFiller -cell PADSPACE_74x1u -prefix IO_FILLER -side e
fit

#######################################################
## Routing
########################################################

sroute -connect { blockPin padPin padRing corePin floatingStripe } -layerChangeRange { M1(1) AP(8) } -blockPinTarget { nearestTarget } -padPinPortConnect { allPort oneGeom } -padPinTarget { nearestTarget } -corePinTarget { firstAfterRowEnd } -floatingStripeTarget { blockring padring ring stripe ringpin blockpin followpin } -allowJogging 1 -crossoverViaLayerRange { M1(1) AP(8) } -nets { GND VDD } -allowLayerChange 1 -blockPin useLef -targetViaLayerRange { M1(1) AP(8) }


## Nano-Route
setNanoRouteMode -quiet -timingEngine {}
setNanoRouteMode -quiet -routeWithSiPostRouteFix 0
setNanoRouteMode -quiet -drouteStartIteration default
setNanoRouteMode -quiet -routeTopRoutingLayer default
setNanoRouteMode -quiet -routeBottomRoutingLayer default
setNanoRouteMode -quiet -drouteEndIteration default
setNanoRouteMode -quiet -routeWithTimingDriven false
setNanoRouteMode -quiet -routeWithSiDriven false
routeDesign -globalDetail

setAnalysisMode -analysisType onChipVariation

setOptMode -fixCap true -fixTran true -fixFanoutLoad true
optDesign -postRoute
optDesign -postRoute
optDesign -postRoute
optDesign -postRoute -hold
optDesign -postRoute -hold

setOptMode -fixCap true -fixTran true -fixFanoutLoad true
optDesign -postRoute

#######################################################
## Add Fillers
########################################################

addFiller -cell HS65_GL_FILLERPFP4 HS65_GL_FILLERPFP3 HS65_GL_FILLERPFP2 HS65_GL_FILLERPFP1 -prefix FILLER -markFixed

#######################################################
# Save Files
#######################################################
saveDesign PnR/jollof_top_2
write_sdf -version 2.1 -interconn nooutport PnR/jollof_top_2.sdf
saveNetlist PnR/jollof_top_2.v

#######################################################
# Extract RC SPEF File
#######################################################
# rcOut -spef $::env(RC_SETUP) -rc_corner SS
# rcOut -spef $::env(RC_HOLD) -rc_corner FF
