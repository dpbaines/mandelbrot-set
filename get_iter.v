/*
 *	This module just manages the customizable iteration count, it interprets keyboard input and sets a latch to 
 *	whatever the iteration value for that key is
 */

module get_iteration(keys, iter, clock, hex0, hex1, hex2, hex3);
	
	input [9:0] keys;
	input clock;
	input [6:0] hex0, hex1, hex2, hex3;
	
	output [12:0] iter;
	
	reg [11:0] iter_r;
	reg [15:0] hex_iter;
	reg [3:0] last_pressed;
	
	initial begin
		last_pressed = 4'h8;
	end
	
	always@(posedge clock) begin
		if(keys != 10'd0) begin
			casez(keys)
				10'b1?????????: last_pressed = 4'h1;
				10'b?1????????: last_pressed = 4'h2;
				10'b??1???????: last_pressed = 4'h3;
				10'b???1??????: last_pressed = 4'h4;
				10'b????1?????: last_pressed = 4'h5;
				10'b?????1????: last_pressed = 4'h6;
				10'b??????1???: last_pressed = 4'h7;
				10'b???????1??: last_pressed = 4'h8;
				10'b????????1?: last_pressed = 4'h9;
				10'b?????????1: last_pressed = 4'h0;
				default: last_pressed = 4'h8;
			endcase
		end
	end
	
	always@(*) begin
	iter_r = 12'd0;
	
		case(last_pressed)
		4'h0: iter_r = 12'd1;
		4'h1: iter_r = 12'd3;
		4'h2: iter_r = 12'd7;
		4'h3: iter_r = 12'd15;
		4'h4: iter_r = 12'd31;
		4'h5: iter_r = 12'd63;
		4'h6: iter_r = 12'd127;
		4'h7: iter_r = 12'd255;
		4'h8: iter_r = 12'd511;
		4'h9: iter_r = 12'd1023;
		default: iter_r = 12'd511;
		endcase
	end
	
	//This just shows the decimal value of the iteration count on the hex display
	always@(*) begin
	hex_iter = 12'd0;
	
	case(iter_r)
		12'd1: 	hex_iter = 16'b0000000000000001;
		12'd3: 	hex_iter = 16'b0000000000000011;
		12'd7: 	hex_iter = 16'b0000000000000111;
		12'd15: 	hex_iter = 16'b0000000000010101;
		12'd31: 	hex_iter = 16'b0000000000110001;
		12'd63: 	hex_iter = 16'b0000000011000011;
		12'd127: hex_iter = 16'b0000000100100111;
		12'd255: hex_iter = 16'b0000001001010101;
		12'd511: hex_iter = 16'b0000010100010001;
		12'd1023:hex_iter = 16'b0001000000100011;
		default: hex_iter = 16'b0000010100010001;
	endcase
	
	end
	
	//Shows the iteration value on the hex display
	decoder de1(.hex_digit(hex_iter[3:0]), .segments(hex0));
	decoder de2(.hex_digit(hex_iter[7:4]), .segments(hex1));
	decoder de3(.hex_digit(hex_iter[11:8]), .segments(hex2));
	decoder de4(.hex_digit(hex_iter[15:12]), .segments(hex3));
	
	assign iter = iter_r;
	
endmodule
