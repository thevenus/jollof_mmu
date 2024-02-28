###############################################################
#  Generated by:      Cadence Innovus 16.13-s045_1
#  OS:                Linux x86_64(Host ID toke.fransg.eit.lth.se)
#  Generated on:      Wed Feb 28 13:04:49 2024
#  Design:            jollof_top
#  Command:           saveDesign PnR/jollof_top_2
###############################################################
current_design jollof_top
set_clock_gating_check -rise -setup 0 
set_clock_gating_check -fall -setup 0 
create_clock [get_ports {clk}]  -name clk -period 10.000000 -waveform {0.000000 5.000000}
set_propagated_clock  [get_clocks {clk}]
set_clock_transition  -rise -max 0.2 [get_clocks {clk}]
set_clock_transition  -fall -max 0.2 [get_clocks {clk}]
set_propagated_clock  [get_ports {clk}]
set_wire_load_mode enclosed
set_input_delay -add_delay 0.5 -clock [get_clocks {clk}] [get_ports {input_data[4]}]
set_input_delay -add_delay 0.5 -clock [get_clocks {clk}] [get_ports {read_ram}]
set_input_delay -add_delay 0.5 -clock [get_clocks {clk}] [get_ports {input_data[2]}]
set_input_delay -add_delay 0.5 -clock [get_clocks {clk}] [get_ports {valid_input}]
set_input_delay -add_delay 0.5 -clock [get_clocks {clk}] [get_ports {input_data[0]}]
set_input_delay -add_delay 0.5 -clock [get_clocks {clk}] [get_ports {rst}]
set_input_delay -add_delay 0.5 -clock [get_clocks {clk}] [get_ports {input_data[7]}]
set_input_delay -add_delay 0.5 -clock [get_clocks {clk}] [get_ports {input_data[5]}]
set_input_delay -add_delay 0.5 -clock [get_clocks {clk}] [get_ports {input_data[3]}]
set_input_delay -add_delay 0.5 -clock [get_clocks {clk}] [get_ports {input_data[1]}]
set_input_delay -add_delay 0.5 -clock [get_clocks {clk}] [get_ports {input_data[6]}]
set_output_delay -add_delay 0.5 -clock [get_clocks {clk}] [get_ports {finish}]
set_output_delay -add_delay 0.5 -clock [get_clocks {clk}] [get_ports {read_data_out[7]}]
set_output_delay -add_delay 0.5 -clock [get_clocks {clk}] [get_ports {read_data_out[5]}]
set_output_delay -add_delay 0.5 -clock [get_clocks {clk}] [get_ports {read_data_out[3]}]
set_output_delay -add_delay 0.5 -clock [get_clocks {clk}] [get_ports {read_data_out[1]}]
set_output_delay -add_delay 0.5 -clock [get_clocks {clk}] [get_ports {read_data_out[8]}]
set_output_delay -add_delay 0.5 -clock [get_clocks {clk}] [get_ports {read_data_out[6]}]
set_output_delay -add_delay 0.5 -clock [get_clocks {clk}] [get_ports {read_data_out[4]}]
set_output_delay -add_delay 0.5 -clock [get_clocks {clk}] [get_ports {read_data_out[2]}]
set_output_delay -add_delay 0.5 -clock [get_clocks {clk}] [get_ports {read_data_out[0]}]
set_clock_uncertainty  0.5 [get_ports {clk}]
set_dont_use  [get_lib_cells {CORE65LPLVT/HS65_LL_SDFPQTX18}]
set_dont_use  [get_lib_cells {CLOCK65LPLVT/HS65_LLP_CNHLSX62}]
set_dont_use  [get_lib_cells {CLOCK65LPLVT/HS65_LLP_CNHLSX10}]
set_dont_use  [get_lib_cells {SPHD110420/ST_SPHDL_160x64m8_bL}]
set_dont_use  [get_lib_cells {CORE65LPLVT/HS65_LL_SDFPSQX27}]
set_dont_use  [get_lib_cells {CORE65LPLVT/HS65_LL_SDFPHQNX35}]
set_dont_use  [get_lib_cells {CORE65LPLVT/HS65_LL_SDFPSQNX18}]
set_dont_use  [get_lib_cells {CORE65LPLVT/HS65_LL_DFPSQNX35}]
set_dont_use  [get_lib_cells {CLOCK65LPLVT/HS65_LL_CNBFX38_22}]
set_dont_use  [get_lib_cells {CORE65LPLVT/HS65_LL_DFPRQNX27}]
set_dont_use  [get_lib_cells {CLOCK65LPLVT/HS65_LL_CNBFX38_12}]
set_dont_use  [get_lib_cells {CORE65LPLVT/HS65_LL_DFPQNX18}]
set_dont_use  [get_lib_cells {CORE65LPLVT/HS65_LL_SDFPQTX35}]
set_dont_use  [get_lib_cells {CLOCK65LPLVT/HS65_LLP_CNHLSX82}]
set_dont_use  [get_lib_cells {CORE65LPLVT/HS65_LL_SDFPQNTX27}]
set_dont_use  [get_lib_cells {CLOCK65LPLVT/HS65_LLP_CNHLSX17}]
set_dont_use  [get_lib_cells {CORE65LPLVT/HS65_LL_SDFPHRQNTX18}]
set_dont_use  [get_lib_cells {CORE65LPLVT/HS65_LL_SDFPSQNX35}]
set_dont_use  [get_lib_cells {CLOCK65LPLVT/HS65_LL_CNBFX38_3}]
set_dont_use  [get_lib_cells {CORE65LPLVT/HS65_LL_SDFPRQX27}]
set_dont_use  [get_lib_cells {CLOCK65LPLVT/HS65_LL_CNBFX38_14}]
set_dont_use  [get_lib_cells {CORE65LPLVT/HS65_LL_SDFPRQNX18}]
set_dont_use  [get_lib_cells {CORE65LPLVT/HS65_LL_DFPQNX35}]
set_dont_use  [get_lib_cells {CORE65LPLVT/HS65_LL_DFPHQNX27}]
set_dont_use  [get_lib_cells {CLOCK65LPLVT/HS65_LL_CAPX35}]
set_dont_use  [get_lib_cells {PAD/CPAD_S_74x50u_IN}]
set_dont_use  [get_lib_cells {CLOCK65LPLVT/HS65_LLP_CNHLSX24}]
set_dont_use  [get_lib_cells {CORE65LPLVT/HS65_LL_SDFPHRQNTX35}]
set_dont_use  [get_lib_cells {CORE65LPLVT/HS65_LL_SDFPHQTX27}]
set_dont_use  [get_lib_cells {CORE65LPLVT/HS65_LL_SDFPHQNTX18}]
set_dont_use  [get_lib_cells {CORE65LPLVT/HS65_LL_DFPSQX27}]
set_dont_use  [get_lib_cells {CLOCK65LPLVT/HS65_LL_CNBFX38_5}]
set_dont_use  [get_lib_cells {CORE65LPLVT/HS65_LL_DFPRQX18}]
set_dont_use  [get_lib_cells {CLOCK65LPLVT/HS65_LL_CNBFX38_16}]
set_dont_use  [get_lib_cells {CORE65LPLVT/HS65_LL_SDFPRQNX35}]
set_dont_use  [get_lib_cells {CORE65LPLVT/HS65_LL_SDFPQX27}]
set_dont_use  [get_lib_cells {CLOCK65LPLVT/HS65_LL_CAPX9}]
set_dont_use  [get_lib_cells {CORE65LPLVT/HS65_LL_SDFPQNX18}]
set_dont_use  [get_lib_cells {CLOCK65LPLVT/HS65_LLP_CNHLSX31}]
set_dont_use  [get_lib_cells {CORE65LPLVT/HS65_LL_SDFPSQTX27}]
set_dont_use  [get_lib_cells {CORE65LPLVT/HS65_LL_SDFPHQNTX35}]
set_dont_use  [get_lib_cells {CLOCK65LPLVT/HS65_LL_CNBFX38_7}]
set_dont_use  [get_lib_cells {CORE65LPLVT/HS65_LL_SDFPSQNTX18}]
set_dont_use  [get_lib_cells {CORE65LPLVT/HS65_LL_DFPRQX35}]
set_dont_use  [get_lib_cells {CLOCK65LPLVT/HS65_LL_CNBFX38_18}]
set_dont_use  [get_lib_cells {CORE65LPLVT/HS65_LL_DFPQX27}]
set_dont_use  [get_lib_cells {CORE65LPLVT/HS65_LL_DFPHQX18}]
set_dont_use  [get_lib_cells {CORE65LPLVT/HS65_LL_SDFPQNX35}]
set_dont_use  [get_lib_cells {CLOCK65LPLVT/HS65_LLP_CNHLSX38}]
set_dont_use  [get_lib_cells {CORE65LPLVT/HS65_LL_SDFPHRQTX27}]
set_dont_use  [get_lib_cells {SPHD110420/ST_SPHDL_1216x32m16_bL}]
set_dont_use  [get_lib_cells {CORE65LPLVT/HS65_LL_SDFPHQX18}]
set_dont_use  [get_lib_cells {CORE65LPLVT/HS65_LL_BK1SX1}]
set_dont_use  [get_lib_cells {CLOCK65LPLVT/HS65_LL_CNBFX38_9}]
set_dont_use  [get_lib_cells {CORE65LPLVT/HS65_LL_SDFPSQNTX35}]
set_dont_use  [get_lib_cells {CLOCK65LPLVT/HS65_LL_CNBFX38_2}]
set_dont_use  [get_lib_cells {CORE65LPLVT/HS65_LL_SDFPRQTX27}]
set_dont_use  [get_lib_cells {CLOCK65LPLVT/HS65_LL_CNBFX38_1}]
set_dont_use  [get_lib_cells {CORE65LPLVT/HS65_LL_SDFPRQNTX18}]
set_dont_use  [get_lib_cells {CORE65LPLVT/HS65_LL_DFPHQX35}]
set_dont_use  [get_lib_cells {CLOCK65LPLVT/HS65_LLP_CNHLSX52}]
set_dont_use  [get_lib_cells {SPHD110420/ST_SPHDL_160x64m8_L}]
set_dont_use  [get_lib_cells {CORE65LPLVT/HS65_LL_SDFPHQX35}]
set_dont_use  [get_lib_cells {CORE65LPLVT/HS65_LL_SDFPSQX18}]
set_dont_use  [get_lib_cells {CORE65LPLVT/HS65_LL_SDFPHQNX27}]
set_dont_use  [get_lib_cells {CORE65LPLVT/HS65_LL_DFPSQNX27}]
set_dont_use  [get_lib_cells {CLOCK65LPLVT/HS65_LL_CNBFX38_21}]
set_dont_use  [get_lib_cells {CORE65LPLVT/HS65_LL_DFPRQNX18}]
set_dont_use  [get_lib_cells {CLOCK65LPLVT/HS65_LL_CNBFX38_11}]
set_dont_use  [get_lib_cells {CORE65LPLVT/HS65_LL_SDFPRQNTX35}]
set_dont_use  [get_lib_cells {CORE65LPLVT/HS65_LL_SDFPQTX27}]
set_dont_use  [get_lib_cells {CLOCK65LPLVT/HS65_LLP_CNHLSX7}]
set_dont_use  [get_lib_cells {CORE65LPLVT/HS65_LL_SDFPQNTX18}]
set_dont_use  [get_lib_cells {CLOCK65LPLVT/HS65_LLP_CNHLSX14}]
set_dont_use  [get_lib_cells {SPHD110420/ST_SPHDL_640x32m16_L}]
set_dont_use  [get_lib_cells {CORE65LPLVT/HS65_LL_SDFPSQX35}]
set_dont_use  [get_lib_cells {CORE65LPLVT/HS65_LL_SDFPSQNX27}]
set_dont_use  [get_lib_cells {CLOCK65LPLVT/HS65_LL_CNBFX38_23}]
set_dont_use  [get_lib_cells {CORE65LPLVT/HS65_LL_SDFPRQX18}]
set_dont_use  [get_lib_cells {CORE65LPLVT/HS65_LL_DFPRQNX35}]
set_dont_use  [get_lib_cells {CLOCK65LPLVT/HS65_LL_CNBFX38_13}]
set_dont_use  [get_lib_cells {CORE65LPLVT/HS65_LL_DFPQNX27}]
set_dont_use  [get_lib_cells {CORE65LPLVT/HS65_LL_DFPHQNX18}]
set_dont_use  [get_lib_cells {CLOCK65LPLVT/HS65_LL_CAPX18}]
set_dont_use  [get_lib_cells {PAD/CPAD_S_74x50u_OUT}]
set_dont_use  [get_lib_cells {CORE65LPLVT/HS65_LL_SDFPQNTX35}]
set_dont_use  [get_lib_cells {CLOCK65LPLVT/HS65_LLP_CNHLSX21}]
set_dont_use  [get_lib_cells {CORE65LPLVT/HS65_LL_SDFPHRQNTX27}]
set_dont_use  [get_lib_cells {CORE65LPLVT/HS65_LL_SDFPHQTX18}]
set_dont_use  [get_lib_cells {CORE65LPLVT/HS65_LL_SDFPBTQX9}]
set_dont_use  [get_lib_cells {CORE65LPLVT/HS65_LL_DFPSQX18}]
set_dont_use  [get_lib_cells {CLOCK65LPLVT/HS65_LL_CNBFX38_4}]
set_dont_use  [get_lib_cells {CORE65LPLVT/HS65_LL_SDFPRQX35}]
set_dont_use  [get_lib_cells {CLOCK65LPLVT/HS65_LL_CNBFX38_15}]
set_dont_use  [get_lib_cells {CORE65LPLVT/HS65_LL_SDFPRQNX27}]
set_dont_use  [get_lib_cells {CORE65LPLVT/HS65_LL_SDFPQX18}]
set_dont_use  [get_lib_cells {CORE65LPLVT/HS65_LL_DFPHQNX35}]
set_dont_use  [get_lib_cells {CLOCK65LPLVT/HS65_LL_CAPX53}]
set_dont_use  [get_lib_cells {CLOCK65LPLVT/HS65_LLP_CNHLSX27}]
set_dont_use  [get_lib_cells {CORE65LPLVT/HS65_LL_SDFPHQTX35}]
set_dont_use  [get_lib_cells {CORE65LPLVT/HS65_LL_SDFPSQTX18}]
set_dont_use  [get_lib_cells {CORE65LPLVT/HS65_LL_SDFPHQNTX27}]
set_dont_use  [get_lib_cells {CORE65LPLVT/HS65_LL_DFPSQX35}]
set_dont_use  [get_lib_cells {CLOCK65LPLVT/HS65_LL_CNBFX38_6}]
set_dont_use  [get_lib_cells {CORE65LPLVT/HS65_LL_DFPRQX27}]
set_dont_use  [get_lib_cells {CLOCK65LPLVT/HS65_LL_CNBFX38_17}]
set_dont_use  [get_lib_cells {CORE65LPLVT/HS65_LL_DFPQX18}]
set_dont_use  [get_lib_cells {CORE65LPLVT/HS65_LL_SDFPQX35}]
set_dont_use  [get_lib_cells {CORE65LPLVT/HS65_LL_SDFPQNX27}]
set_dont_use  [get_lib_cells {CLOCK65LPLVT/HS65_LLP_CNHLSX34}]
set_dont_use  [get_lib_cells {CORE65LPLVT/HS65_LL_SDFPHRQTX18}]
set_dont_use  [get_lib_cells {CORE65LPLVT/HS65_LL_SDFPSQTX35}]
set_dont_use  [get_lib_cells {CLOCK65LPLVT/HS65_LL_CNBFX38_8}]
set_dont_use  [get_lib_cells {CORE65LPLVT/HS65_LL_SDFPSQNTX27}]
set_dont_use  [get_lib_cells {CLOCK65LPLVT/HS65_LL_CNBFX38_19}]
set_dont_use  [get_lib_cells {CORE65LPLVT/HS65_LL_SDFPRQTX18}]
set_dont_use  [get_lib_cells {CORE65LPLVT/HS65_LL_DFPQX35}]
set_dont_use  [get_lib_cells {CLOCK65LPLVT/HS65_LL_CNBFX38_0}]
set_dont_use  [get_lib_cells {CORE65LPLVT/HS65_LL_DFPHQX27}]
set_dont_use  [get_lib_cells {CLOCK65LPLVT/HS65_LLP_CNHLSX41}]
set_dont_use  [get_lib_cells {CORE65LPLVT/HS65_LL_SDFPHRQTX35}]
set_dont_use  [get_lib_cells {SPHD110420/ST_SPHDL_160x32m8_L}]
set_dont_use  [get_lib_cells {CORE65LPLVT/HS65_LL_SDFPHQX27}]
set_dont_use  [get_lib_cells {CORE65LPLVT/HS65_LL_BK1X1}]
set_dont_use  [get_lib_cells {CORE65LPLVT/HS65_LL_SDFPHQNX18}]
set_dont_use  [get_lib_cells {CORE65LPLVT/HS65_LL_DFPSQNX18}]
set_dont_use  [get_lib_cells {CLOCK65LPLVT/HS65_LL_CNBFX38_20}]
set_dont_use  [get_lib_cells {CORE65LPLVT/HS65_LL_SDFPRQTX35}]
set_dont_use  [get_lib_cells {CLOCK65LPLVT/HS65_LL_CNBFX38_10}]
set_dont_use  [get_lib_cells {CORE65LPLVT/HS65_LL_SDFPRQNTX27}]