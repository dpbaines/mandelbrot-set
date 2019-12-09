module main(CLOCK_50, KEY, VGA_R, VGA_G, VGA_B, VGA_VS, VGA_HS, VGA_BLANK_N, VGA_SYNC_N, VGA_CLK, LEDR, SW, PS2_DAT, PS2_CLK, HEX0, HEX1, HEX2, HEX3);
	
	input CLOCK_50;
	input [3:0] KEY;
	input [9:0] SW;
	
	inout PS2_DAT, PS2_CLK;
	
	output			VGA_CLK;
	output			VGA_HS;
	output			VGA_VS;
	output			VGA_BLANK_N;
	output			VGA_SYNC_N;
	output	[7:0]	VGA_R;
	output	[7:0]	VGA_G;
	output	[7:0]	VGA_B;
	output [9:0] LEDR;
	output [6:0] HEX0, HEX1, HEX2, HEX3;
	
	wire [8:0] x, y;
	wire [68:0] x_zoom, y_zoom, x_offset, y_offset, x_offset_offset, y_offset_offset;
	wire [11:0] colour;
	wire plot, calc;
	
	wire [11:0] iter;
	
	//{ ... , w, a, s, d, r, f }
	wire [15:0] keyboard;
	
	assign LEDR[9] = plot;
	assign LEDR[8] = calc;
	
	assign LEDR[7:0] = iter[7:0];
	
	mandelbrot m1(.x(x), .y(y), .clock(CLOCK_50), .calc(calc), .colour(colour), .x_zoom(x_zoom), .y_zoom(y_zoom), .x_offset(x_offset), .y_offset(y_offset), .colour_invert(~SW[0]), .max_iter(iter));
	
	iterator i1(.clock(CLOCK_50), .reset(SW[9]), .calc(calc), .plot(plot), .x(x), .y(y), ._iter(iter));
	
	video_controller v1(.resetn(~SW[9]), .clock(CLOCK_50), .colour(colour), .x(x), .y(y), .plot(plot), .VGA_R(VGA_R), .VGA_G(VGA_G), .VGA_B(VGA_B), .VGA_VS(VGA_VS), .VGA_HS(VGA_HS), .VGA_BLANK_N(VGA_BLANK_N), .VGA_SYNC_N(VGA_SYNC_N), .VGA_CLK(VGA_CLK));
	
	pan_control p1(.keys(keyboard[5:2]), .x_offset(x_offset), .y_offset(y_offset), .clock(CLOCK_50), .x_offset_offset(x_offset_offset), .y_offset_offset(y_offset_offset));
	zoom_control z1(.x_zoom(x_zoom), .y_zoom(y_zoom), .keys(keyboard[1:0]), .clock(CLOCK_50), .x_offset_offset(x_offset_offset), .y_offset_offset(y_offset_offset));
	
	
	keyboard_in k1(.clock(CLOCK_50), .ps2_clk(PS2_CLK), .ps2_dat(PS2_DAT), .out(keyboard));
	
	get_iteration g1(.clock(CLOCK_50), .keys(keyboard[15:6]), .iter(iter), .hex0(HEX0), .hex1(HEX1), .hex2(HEX2), .hex3(HEX3));
	
endmodule
