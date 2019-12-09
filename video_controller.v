			
module video_controller(resetn, clock, colour, x, y, plot, VGA_R, VGA_G, VGA_B, VGA_VS, VGA_HS, VGA_BLANK_N, VGA_SYNC_N, VGA_CLK);
	
	input resetn, clock, plot;
	input [11:0] colour;
	input [8:0] x, y;
	
	output			VGA_CLK;
	output			VGA_HS;
	output			VGA_VS;
	output			VGA_BLANK_N;
	output			VGA_SYNC_N;
	output	[7:0]	VGA_R;
	output	[7:0]	VGA_G;
	output	[7:0]	VGA_B;  
	
	vga_adapter VGA(
			.resetn(resetn),
			.clock(clock),
			.colour(colour),
			.x(x),
			.y(y[7:0]),
			.plot(plot),
			.VGA_R(VGA_R),
			.VGA_G(VGA_G),
			.VGA_B(VGA_B),
			.VGA_HS(VGA_HS),
			.VGA_VS(VGA_VS),
			.VGA_BLANK(VGA_BLANK_N),
			.VGA_SYNC(VGA_SYNC_N),
			.VGA_CLK(VGA_CLK));
	defparam VGA.RESOLUTION = "320x240";
	defparam VGA.MONOCHROME = "FALSE";
	defparam VGA.BITS_PER_COLOUR_CHANNEL = 4;
	defparam VGA.BACKGROUND_IMAGE = "black.mif";
	
endmodule

