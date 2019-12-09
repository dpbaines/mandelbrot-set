vlib work

vlog output_files/movement_controls.v

vsim pan_control

log {/*}

add wave {/*}

force {keys} 1111
force {clock} 0
run 1ns

force {keys} 1111
force {clock} 1 1ns, 0 2ns -r 2ns
run 50ns

force {keys} 0111
force {clock} 1 1ns, 0 2ns -r 2ns
run 210ns