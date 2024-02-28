set_clock_latency -source -early -max   0.5 [get_ports {clk}]
set_clock_latency -source -late -max   0.5 [get_ports {clk}]
set_clock_latency -source -early -min -rise  0.408303 [get_ports {clk}] -clock clk 
set_clock_latency -source -early -min -fall  0.404247 [get_ports {clk}] -clock clk 
set_clock_latency -source -late -min -rise  0.408303 [get_ports {clk}] -clock clk 
set_clock_latency -source -late -min -fall  0.404247 [get_ports {clk}] -clock clk 
