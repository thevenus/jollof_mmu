set_clock_latency -source -early -max   0.5 [get_ports {clk}]
set_clock_latency -source -late -max   0.5 [get_ports {clk}]
set_clock_latency -source -early -max -rise  0.628443 [get_ports {clk}] -clock clk 
set_clock_latency -source -early -max -fall  0.624792 [get_ports {clk}] -clock clk 
set_clock_latency -source -late -max -rise  0.628443 [get_ports {clk}] -clock clk 
set_clock_latency -source -late -max -fall  0.624792 [get_ports {clk}] -clock clk 
