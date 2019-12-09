
module zoom_control(x_zoom, y_zoom, keys, clock, x_offset_offset, y_offset_offset);
	
	input [3:0] keys;
	input clock;
	output [68:0] x_zoom, y_zoom, x_offset_offset, y_offset_offset;
	
	//Defining the rate and delta zoom
	localparam [22:0] rate 	= 23'd000000500;
	localparam [67:0] inc	= 68'h000_00010000000000;
	
	reg [68:0] x_zoom_r, y_zoom_r, delta, x_offset_offset_r, y_offset_offset_r, delta_offset;
	
	wire in, out;
	
	assign in = keys[1];
	assign out = keys[0];
	
	reg [22:0] counter;
	reg cycle;
	
	//Setting initial values
	//offset_offset is used to correct the zoom, so it converges in the center, i know silly name
	initial begin
		x_zoom_r = 68'h004_00000000000000;
		y_zoom_r = 68'h004_00000000000000;
		x_offset_offset_r = x_zoom_r >> 1;
		y_offset_offset_r = y_zoom_r >> 1;
		counter = 23'd0;
	end
	
	//Just a simple rate divider type circuit
	always@(posedge clock) begin
		cycle = 0;
		
		if(counter == rate) begin
			cycle = 1;
			counter = 0;
		end
			
		else begin
			counter = counter + 1;
		end
		
		//Calculates a delta zoom proportional to the zoom
		if(in) delta = -(x_offset_offset >> 15);
		else if(out) delta = (x_offset_offset >> 15);
		else delta = 68'h0;
		
		if(in) delta_offset = x_zoom_r >> 1;
		else if(out) delta_offset = -(x_zoom_r >> 1);
		else delta_offset = 68'd0;
	end
	
	always@(posedge clock) begin
		if(cycle) begin
			//Modifies the zoom values
			x_zoom_r = x_zoom_r + delta;
			y_zoom_r = y_zoom_r + delta;
			
			x_offset_offset_r = x_zoom_r >> 1;
			y_offset_offset_r = y_zoom_r >> 1;
		end
	end
	
	assign x_zoom = x_zoom_r;
	assign y_zoom = y_zoom_r;
	
	assign x_offset_offset = x_offset_offset_r;
	assign y_offset_offset = y_offset_offset_r;
	
endmodule

module pan_control(keys, clock, x_offset, y_offset, x_offset_offset, y_offset_offset);
	
	localparam [22:0] rate 	= 23'd000005000;
	localparam [68:0] inc	= 68'h000_00010000000000;
	
	input [3:0] keys;
	input clock;
	input [68:0] x_offset_offset, y_offset_offset;
	output [68:0] x_offset, y_offset;
	
	reg [68:0] x_offset_r, y_offset_r, delta_x, delta_y;
	
	wire up, down, left, right;
	assign up = keys[1];
	assign down = keys[3];
	
	assign left = keys[0];
	assign right = keys[2];
	
	reg [22:0] counter;
	reg cycle;
	
	//Setting initial values
	initial begin
		x_offset_r = 68'h000_00000000000000;
		y_offset_r = 68'h000_00000000000000;
		counter = 23'd0;
	end
	
	always@(posedge clock) begin
		cycle = 0;
		
		if(counter == rate) begin
			cycle = 1;
			counter = 0;
		end
			
		else begin
			counter = counter + 1;
		end
		
		//Setting deltas as proportional to zoom value
		if(up) delta_y = -(x_offset_offset >> 15);
		else if(down) delta_y = x_offset_offset >> 15;
		else delta_y = 68'h0;
		
		if(left) delta_x = -(x_offset_offset >> 15);
		else if(right) delta_x = (x_offset_offset >> 15);
		else delta_x = 68'h0;
	end
	
	always@(posedge clock) begin
	if(cycle) begin
		x_offset_r = x_offset_r + delta_x;
		y_offset_r = y_offset_r + delta_y;
	end
	end
	
	//Calculates offset to be sum of offset, and zoom correction offset
	assign x_offset = x_offset_r + x_offset_offset;
	assign y_offset = y_offset_r + y_offset_offset;
	
endmodule
