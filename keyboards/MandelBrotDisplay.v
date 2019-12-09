module keyboard_in
	(
		clock,						//	On Board 50 MHz
		ps2_clk,
		ps2_dat,
		out
	);

	input			clock;				//	50 MHz
	output [15:0] out;
	// Declare your inputs and outputs here
	// Do not change the following outputs
	
	inout ps2_clk, ps2_dat;
	
	wire resetn, to_count;
	assign resetn = 1'b1;
	//writeEn wires that are inputs to the controller.
	wire writeEn;
	
	wire send_command, command_was_sent, error_communication_timed_out, received_data_en;
	wire [7:0] the_command, received_data;
	reg [7:0] last_received_data, last02_received_data,last03_received_data ;

	reg w, a, s, d, r, f;
	reg [9:0] nums;
	
	assign out[15:0] = {nums, w, a, s, d, r, f};


	Ps2Controller ps2 (
		.CLOCK_50(clock),
		.reset(~resetn),
		.the_command(the_command),
		.send_command(send_command),
		.PS2_CLK(ps2_clk),					
		.PS2_DAT(ps2_dat),
		.command_was_sent(command_was_sent),
		.error_communication_timed_out(error_communication_timed_out),
		.received_data(received_data),
		.received_data_en(received_data_en)
	);
	
	reg wup, aup, sup, dup;
	
	
	always @ (posedge clock) begin
		last03_received_data <= received_data_en ? last02_received_data : last03_received_data;
		last02_received_data <= received_data_en ? last_received_data : last02_received_data;
		last_received_data <= received_data_en ? received_data : last_received_data;
		
		if ((last02_received_data == 8'hF0) && (last_received_data == 8'h1C) && a) a = 1'b0;
		if ((last02_received_data == 8'hF0) && (last_received_data == 8'h1D) && w) w = 1'b0;
		if ((last02_received_data == 8'hF0) && (last_received_data == 8'h1B) && s) s = 1'b0;
		if ((last02_received_data == 8'hF0) && (last_received_data == 8'h23) && d) d = 1'b0;
		if ((last02_received_data == 8'hF0) && (last_received_data == 8'h2D) && r) r = 1'b0;
		if ((last02_received_data == 8'hF0) && (last_received_data == 8'h2B) && f) f = 1'b0;
		
		if ((last02_received_data != 8'hF0) && (last_received_data == 8'h1C)) a = 1'b1;
		if ((last02_received_data != 8'hF0) && (last_received_data == 8'h1D)) w = 1'b1;
		if ((last02_received_data != 8'hF0) && (last_received_data == 8'h1B)) s = 1'b1;
		if ((last02_received_data != 8'hF0) && (last_received_data == 8'h23)) d = 1'b1;
		if ((last02_received_data != 8'hF0) && (last_received_data == 8'h2D)) r = 1'b1;
		if ((last02_received_data != 8'hF0) && (last_received_data == 8'h2B)) f = 1'b1;
		
		
		if ((last02_received_data == 8'hF0) && (last_received_data == 8'h16) && nums[9]) nums[9] = 1'b0;
		if ((last02_received_data == 8'hF0) && (last_received_data == 8'h1E) && nums[8]) nums[8] = 1'b0;
		if ((last02_received_data == 8'hF0) && (last_received_data == 8'h26) && nums[7]) nums[7] = 1'b0;
		if ((last02_received_data == 8'hF0) && (last_received_data == 8'h25) && nums[6]) nums[6] = 1'b0;
		if ((last02_received_data == 8'hF0) && (last_received_data == 8'h2E) && nums[5]) nums[5] = 1'b0;
		if ((last02_received_data == 8'hF0) && (last_received_data == 8'h36) && nums[4]) nums[4] = 1'b0;
		if ((last02_received_data == 8'hF0) && (last_received_data == 8'h3D) && nums[3]) nums[3] = 1'b0;
		if ((last02_received_data == 8'hF0) && (last_received_data == 8'h3E) && nums[2]) nums[2] = 1'b0;
		if ((last02_received_data == 8'hF0) && (last_received_data == 8'h46) && nums[1]) nums[1] = 1'b0;
		if ((last02_received_data == 8'hF0) && (last_received_data == 8'h45) && nums[0]) nums[0] = 1'b0;
		
		if ((last02_received_data != 8'hF0) && (last_received_data == 8'h16)) nums[9] = 1'b1;
		if ((last02_received_data != 8'hF0) && (last_received_data == 8'h1E)) nums[8] = 1'b1;
		if ((last02_received_data != 8'hF0) && (last_received_data == 8'h26)) nums[7] = 1'b1;
		if ((last02_received_data != 8'hF0) && (last_received_data == 8'h25)) nums[6] = 1'b1;
		if ((last02_received_data != 8'hF0) && (last_received_data == 8'h2E)) nums[5] = 1'b1;
		if ((last02_received_data != 8'hF0) && (last_received_data == 8'h36)) nums[4] = 1'b1;
		if ((last02_received_data != 8'hF0) && (last_received_data == 8'h3D)) nums[3] = 1'b1;
		if ((last02_received_data != 8'hF0) && (last_received_data == 8'h3E)) nums[2] = 1'b1;
		if ((last02_received_data != 8'hF0) && (last_received_data == 8'h46)) nums[1] = 1'b1;
		if ((last02_received_data != 8'hF0) && (last_received_data == 8'h45)) nums[0] = 1'b1;
		
	end 
	
endmodule





