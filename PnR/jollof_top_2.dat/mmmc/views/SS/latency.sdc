set_clock_latency -source -early -max   0.5 [get_ports {clk}]
set_clock_latency -source -late -max   0.5 [get_ports {clk}]
set_clock_latency -source -early -max -rise  0.668692 [get_ports {clk}] -clock clk 
set_clock_latency -source -early -max -fall  0.667167 [get_ports {clk}] -clock clk 
set_clock_latency -source -late -max -rise  0.668692 [get_ports {clk}] -clock clk 
set_clock_latency -source -late -max -fall  0.667167 [get_ports {clk}] -clock clk 
