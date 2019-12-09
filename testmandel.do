vlib work

vlog mandelbrot.v output_files/get_colour.v

vsim mandelbrot

log {/*}

add wave {/*}

force {x_zoom} 00000000010000000000000000000000000000000000000000000000000000000000
force {y_zoom} 00000000010000000000000000000000000000000000000000000000000000000000
force {x_offset} 00000000001000000000000000000000000000000000000000000000000000000000
force {y_offset} 00000000001000000000000000000000000000000000000000000000000000000000
force {colour_invert} 1

force {x} 00101000
force {y} 00011100
force {calc} 1
force {clock} 0
run 1ns

force {calc} 1
force {clock} 1
run 1ns

force {calc} 1
force {clock} 0
run 1ns

force {calc} 1
force {clock} 1
run 1ns

force {calc} 0
force {clock} 1 1ns, 0 2ns -r 2ns
run 210ns