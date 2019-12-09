

module get_colour(iteration_count, max_iter, red, green, blue);
	
	input [11:0] iteration_count, max_iter;
	output [3:0] red, green, blue;
	
	reg [3:0] red_r, green_r, blue_r;
	
	
	//JUST DOES BLACK AND WHITE FOR NOW
	//TODO Add colour wheel, possibly using HSV colour to get smooth colour transitions
	/*always@(*) begin
		if(iteration_count == max_iter) begin
			red_r = 4'b1111;
			green_r = 4'b1111;
			blue_r = 4'b1111;
		end
		else begin
			red_r = 4'b0000;
			green_r = 4'b0000;
			blue_r = 4'b0000;
		end
	end*/
	
	reg [8:0] iter_adjust;
	//assign iter_adjust = iteration_count;
	
	always@(*) begin
		case(max_iter)
		12'd1: iter_adjust = ~(~iteration_count << 8);
		12'd3: iter_adjust = ~(~iteration_count << 7);
		12'd7: iter_adjust = ~(~iteration_count << 6);
		12'd15: iter_adjust = ~(~iteration_count << 5);
		12'd31: iter_adjust = ~(~iteration_count << 4);
		12'd63: iter_adjust = ~(~iteration_count << 3);
		12'd127: iter_adjust = ~(~iteration_count << 2);
		12'd255: iter_adjust = ~(~iteration_count << 1);
		12'd511: iter_adjust = iteration_count;
		12'd1023: iter_adjust = iteration_count >> 1;
		default: iter_adjust = iteration_count;
		endcase
	end
	
	colour_lut lut1(iter_adjust, red, green, blue);
	
	//assign red = red_r;
	//assign green = green_r;
	//assign blue = blue_r;

endmodule

module colour_lut(iter, red, green, blue);
	input [11:0] iter;
	output [3:0] red, green, blue;
	
	reg [3:0] red_r, green_r, blue_r;
	
	assign red = red_r;
	assign green = green_r;
	assign blue = blue_r;
	
	always@(*) begin
	case(iter)
9'b000000000: {red_r, green_r, blue_r} = {4'b1111, 4'b0000, 4'b0000};
9'b000000001: {red_r, green_r, blue_r} = {4'b1111, 4'b0000, 4'b0000};
9'b000000010: {red_r, green_r, blue_r} = {4'b1111, 4'b0000, 4'b0000};
9'b000000011: {red_r, green_r, blue_r} = {4'b1111, 4'b0000, 4'b0000};
9'b000000100: {red_r, green_r, blue_r} = {4'b1111, 4'b0000, 4'b0000};
9'b000000101: {red_r, green_r, blue_r} = {4'b1111, 4'b0000, 4'b0000};
9'b000000110: {red_r, green_r, blue_r} = {4'b1111, 4'b0001, 4'b0000};
9'b000000111: {red_r, green_r, blue_r} = {4'b1111, 4'b0001, 4'b0000};
9'b000001000: {red_r, green_r, blue_r} = {4'b1111, 4'b0001, 4'b0000};
9'b000001001: {red_r, green_r, blue_r} = {4'b1111, 4'b0001, 4'b0000};
9'b000001010: {red_r, green_r, blue_r} = {4'b1111, 4'b0001, 4'b0000};
9'b000001011: {red_r, green_r, blue_r} = {4'b1111, 4'b0010, 4'b0000};
9'b000001100: {red_r, green_r, blue_r} = {4'b1111, 4'b0010, 4'b0000};
9'b000001101: {red_r, green_r, blue_r} = {4'b1111, 4'b0010, 4'b0000};
9'b000001110: {red_r, green_r, blue_r} = {4'b1111, 4'b0010, 4'b0000};
9'b000001111: {red_r, green_r, blue_r} = {4'b1111, 4'b0010, 4'b0000};
9'b000010000: {red_r, green_r, blue_r} = {4'b1111, 4'b0011, 4'b0000};
9'b000010001: {red_r, green_r, blue_r} = {4'b1111, 4'b0011, 4'b0000};
9'b000010010: {red_r, green_r, blue_r} = {4'b1111, 4'b0011, 4'b0000};
9'b000010011: {red_r, green_r, blue_r} = {4'b1111, 4'b0011, 4'b0000};
9'b000010100: {red_r, green_r, blue_r} = {4'b1111, 4'b0011, 4'b0000};
9'b000010101: {red_r, green_r, blue_r} = {4'b1111, 4'b0011, 4'b0000};
9'b000010110: {red_r, green_r, blue_r} = {4'b1111, 4'b0100, 4'b0000};
9'b000010111: {red_r, green_r, blue_r} = {4'b1111, 4'b0100, 4'b0000};
9'b000011000: {red_r, green_r, blue_r} = {4'b1111, 4'b0100, 4'b0000};
9'b000011001: {red_r, green_r, blue_r} = {4'b1111, 4'b0100, 4'b0000};
9'b000011010: {red_r, green_r, blue_r} = {4'b1111, 4'b0100, 4'b0000};
9'b000011011: {red_r, green_r, blue_r} = {4'b1111, 4'b0101, 4'b0000};
9'b000011100: {red_r, green_r, blue_r} = {4'b1111, 4'b0101, 4'b0000};
9'b000011101: {red_r, green_r, blue_r} = {4'b1111, 4'b0101, 4'b0000};
9'b000011110: {red_r, green_r, blue_r} = {4'b1111, 4'b0101, 4'b0000};
9'b000011111: {red_r, green_r, blue_r} = {4'b1111, 4'b0101, 4'b0000};
9'b000100000: {red_r, green_r, blue_r} = {4'b1111, 4'b0110, 4'b0000};
9'b000100001: {red_r, green_r, blue_r} = {4'b1111, 4'b0110, 4'b0000};
9'b000100010: {red_r, green_r, blue_r} = {4'b1111, 4'b0110, 4'b0000};
9'b000100011: {red_r, green_r, blue_r} = {4'b1111, 4'b0110, 4'b0000};
9'b000100100: {red_r, green_r, blue_r} = {4'b1111, 4'b0110, 4'b0000};
9'b000100101: {red_r, green_r, blue_r} = {4'b1111, 4'b0110, 4'b0000};
9'b000100110: {red_r, green_r, blue_r} = {4'b1111, 4'b0111, 4'b0000};
9'b000100111: {red_r, green_r, blue_r} = {4'b1111, 4'b0111, 4'b0000};
9'b000101000: {red_r, green_r, blue_r} = {4'b1111, 4'b0111, 4'b0000};
9'b000101001: {red_r, green_r, blue_r} = {4'b1111, 4'b0111, 4'b0000};
9'b000101010: {red_r, green_r, blue_r} = {4'b1111, 4'b0111, 4'b0000};
9'b000101011: {red_r, green_r, blue_r} = {4'b1111, 4'b1000, 4'b0000};
9'b000101100: {red_r, green_r, blue_r} = {4'b1111, 4'b1000, 4'b0000};
9'b000101101: {red_r, green_r, blue_r} = {4'b1111, 4'b1000, 4'b0000};
9'b000101110: {red_r, green_r, blue_r} = {4'b1111, 4'b1000, 4'b0000};
9'b000101111: {red_r, green_r, blue_r} = {4'b1111, 4'b1000, 4'b0000};
9'b000110000: {red_r, green_r, blue_r} = {4'b1111, 4'b1000, 4'b0000};
9'b000110001: {red_r, green_r, blue_r} = {4'b1111, 4'b1001, 4'b0000};
9'b000110010: {red_r, green_r, blue_r} = {4'b1111, 4'b1001, 4'b0000};
9'b000110011: {red_r, green_r, blue_r} = {4'b1111, 4'b1001, 4'b0000};
9'b000110100: {red_r, green_r, blue_r} = {4'b1111, 4'b1001, 4'b0000};
9'b000110101: {red_r, green_r, blue_r} = {4'b1111, 4'b1001, 4'b0000};
9'b000110110: {red_r, green_r, blue_r} = {4'b1111, 4'b1010, 4'b0000};
9'b000110111: {red_r, green_r, blue_r} = {4'b1111, 4'b1010, 4'b0000};
9'b000111000: {red_r, green_r, blue_r} = {4'b1111, 4'b1010, 4'b0000};
9'b000111001: {red_r, green_r, blue_r} = {4'b1111, 4'b1010, 4'b0000};
9'b000111010: {red_r, green_r, blue_r} = {4'b1111, 4'b1010, 4'b0000};
9'b000111011: {red_r, green_r, blue_r} = {4'b1111, 4'b1011, 4'b0000};
9'b000111100: {red_r, green_r, blue_r} = {4'b1111, 4'b1011, 4'b0000};
9'b000111101: {red_r, green_r, blue_r} = {4'b1111, 4'b1011, 4'b0000};
9'b000111110: {red_r, green_r, blue_r} = {4'b1111, 4'b1011, 4'b0000};
9'b000111111: {red_r, green_r, blue_r} = {4'b1111, 4'b1011, 4'b0000};
9'b001000000: {red_r, green_r, blue_r} = {4'b1111, 4'b1011, 4'b0000};
9'b001000001: {red_r, green_r, blue_r} = {4'b1111, 4'b1100, 4'b0000};
9'b001000010: {red_r, green_r, blue_r} = {4'b1111, 4'b1100, 4'b0000};
9'b001000011: {red_r, green_r, blue_r} = {4'b1111, 4'b1100, 4'b0000};
9'b001000100: {red_r, green_r, blue_r} = {4'b1111, 4'b1100, 4'b0000};
9'b001000101: {red_r, green_r, blue_r} = {4'b1111, 4'b1100, 4'b0000};
9'b001000110: {red_r, green_r, blue_r} = {4'b1111, 4'b1101, 4'b0000};
9'b001000111: {red_r, green_r, blue_r} = {4'b1111, 4'b1101, 4'b0000};
9'b001001000: {red_r, green_r, blue_r} = {4'b1111, 4'b1101, 4'b0000};
9'b001001001: {red_r, green_r, blue_r} = {4'b1111, 4'b1101, 4'b0000};
9'b001001010: {red_r, green_r, blue_r} = {4'b1111, 4'b1101, 4'b0000};
9'b001001011: {red_r, green_r, blue_r} = {4'b1111, 4'b1110, 4'b0000};
9'b001001100: {red_r, green_r, blue_r} = {4'b1111, 4'b1110, 4'b0000};
9'b001001101: {red_r, green_r, blue_r} = {4'b1111, 4'b1110, 4'b0000};
9'b001001110: {red_r, green_r, blue_r} = {4'b1111, 4'b1110, 4'b0000};
9'b001001111: {red_r, green_r, blue_r} = {4'b1111, 4'b1110, 4'b0000};
9'b001010000: {red_r, green_r, blue_r} = {4'b1111, 4'b1110, 4'b0000};
9'b001010001: {red_r, green_r, blue_r} = {4'b1111, 4'b1111, 4'b0000};
9'b001010010: {red_r, green_r, blue_r} = {4'b1111, 4'b1111, 4'b0000};
9'b001010011: {red_r, green_r, blue_r} = {4'b1111, 4'b1111, 4'b0000};
9'b001010100: {red_r, green_r, blue_r} = {4'b1111, 4'b1111, 4'b0000};
9'b001010101: {red_r, green_r, blue_r} = {4'b1111, 4'b1111, 4'b0000};
9'b001010110: {red_r, green_r, blue_r} = {4'b1111, 4'b1111, 4'b0000};
9'b001010111: {red_r, green_r, blue_r} = {4'b1111, 4'b1111, 4'b0000};
9'b001011000: {red_r, green_r, blue_r} = {4'b1111, 4'b1111, 4'b0000};
9'b001011001: {red_r, green_r, blue_r} = {4'b1111, 4'b1111, 4'b0000};
9'b001011010: {red_r, green_r, blue_r} = {4'b1111, 4'b1111, 4'b0000};
9'b001011011: {red_r, green_r, blue_r} = {4'b1110, 4'b1111, 4'b0000};
9'b001011100: {red_r, green_r, blue_r} = {4'b1110, 4'b1111, 4'b0000};
9'b001011101: {red_r, green_r, blue_r} = {4'b1110, 4'b1111, 4'b0000};
9'b001011110: {red_r, green_r, blue_r} = {4'b1110, 4'b1111, 4'b0000};
9'b001011111: {red_r, green_r, blue_r} = {4'b1110, 4'b1111, 4'b0000};
9'b001100000: {red_r, green_r, blue_r} = {4'b1101, 4'b1111, 4'b0000};
9'b001100001: {red_r, green_r, blue_r} = {4'b1101, 4'b1111, 4'b0000};
9'b001100010: {red_r, green_r, blue_r} = {4'b1101, 4'b1111, 4'b0000};
9'b001100011: {red_r, green_r, blue_r} = {4'b1101, 4'b1111, 4'b0000};
9'b001100100: {red_r, green_r, blue_r} = {4'b1101, 4'b1111, 4'b0000};
9'b001100101: {red_r, green_r, blue_r} = {4'b1101, 4'b1111, 4'b0000};
9'b001100110: {red_r, green_r, blue_r} = {4'b1100, 4'b1111, 4'b0000};
9'b001100111: {red_r, green_r, blue_r} = {4'b1100, 4'b1111, 4'b0000};
9'b001101000: {red_r, green_r, blue_r} = {4'b1100, 4'b1111, 4'b0000};
9'b001101001: {red_r, green_r, blue_r} = {4'b1100, 4'b1111, 4'b0000};
9'b001101010: {red_r, green_r, blue_r} = {4'b1100, 4'b1111, 4'b0000};
9'b001101011: {red_r, green_r, blue_r} = {4'b1011, 4'b1111, 4'b0000};
9'b001101100: {red_r, green_r, blue_r} = {4'b1011, 4'b1111, 4'b0000};
9'b001101101: {red_r, green_r, blue_r} = {4'b1011, 4'b1111, 4'b0000};
9'b001101110: {red_r, green_r, blue_r} = {4'b1011, 4'b1111, 4'b0000};
9'b001101111: {red_r, green_r, blue_r} = {4'b1011, 4'b1111, 4'b0000};
9'b001110000: {red_r, green_r, blue_r} = {4'b1010, 4'b1111, 4'b0000};
9'b001110001: {red_r, green_r, blue_r} = {4'b1010, 4'b1111, 4'b0000};
9'b001110010: {red_r, green_r, blue_r} = {4'b1010, 4'b1111, 4'b0000};
9'b001110011: {red_r, green_r, blue_r} = {4'b1010, 4'b1111, 4'b0000};
9'b001110100: {red_r, green_r, blue_r} = {4'b1010, 4'b1111, 4'b0000};
9'b001110101: {red_r, green_r, blue_r} = {4'b1010, 4'b1111, 4'b0000};
9'b001110110: {red_r, green_r, blue_r} = {4'b1001, 4'b1111, 4'b0000};
9'b001110111: {red_r, green_r, blue_r} = {4'b1001, 4'b1111, 4'b0000};
9'b001111000: {red_r, green_r, blue_r} = {4'b1001, 4'b1111, 4'b0000};
9'b001111001: {red_r, green_r, blue_r} = {4'b1001, 4'b1111, 4'b0000};
9'b001111010: {red_r, green_r, blue_r} = {4'b1001, 4'b1111, 4'b0000};
9'b001111011: {red_r, green_r, blue_r} = {4'b1000, 4'b1111, 4'b0000};
9'b001111100: {red_r, green_r, blue_r} = {4'b1000, 4'b1111, 4'b0000};
9'b001111101: {red_r, green_r, blue_r} = {4'b1000, 4'b1111, 4'b0000};
9'b001111110: {red_r, green_r, blue_r} = {4'b1000, 4'b1111, 4'b0000};
9'b001111111: {red_r, green_r, blue_r} = {4'b1000, 4'b1111, 4'b0000};
9'b010000000: {red_r, green_r, blue_r} = {4'b1000, 4'b1111, 4'b0000};
9'b010000001: {red_r, green_r, blue_r} = {4'b0111, 4'b1111, 4'b0000};
9'b010000010: {red_r, green_r, blue_r} = {4'b0111, 4'b1111, 4'b0000};
9'b010000011: {red_r, green_r, blue_r} = {4'b0111, 4'b1111, 4'b0000};
9'b010000100: {red_r, green_r, blue_r} = {4'b0111, 4'b1111, 4'b0000};
9'b010000101: {red_r, green_r, blue_r} = {4'b0111, 4'b1111, 4'b0000};
9'b010000110: {red_r, green_r, blue_r} = {4'b0110, 4'b1111, 4'b0000};
9'b010000111: {red_r, green_r, blue_r} = {4'b0110, 4'b1111, 4'b0000};
9'b010001000: {red_r, green_r, blue_r} = {4'b0110, 4'b1111, 4'b0000};
9'b010001001: {red_r, green_r, blue_r} = {4'b0110, 4'b1111, 4'b0000};
9'b010001010: {red_r, green_r, blue_r} = {4'b0110, 4'b1111, 4'b0000};
9'b010001011: {red_r, green_r, blue_r} = {4'b0101, 4'b1111, 4'b0000};
9'b010001100: {red_r, green_r, blue_r} = {4'b0101, 4'b1111, 4'b0000};
9'b010001101: {red_r, green_r, blue_r} = {4'b0101, 4'b1111, 4'b0000};
9'b010001110: {red_r, green_r, blue_r} = {4'b0101, 4'b1111, 4'b0000};
9'b010001111: {red_r, green_r, blue_r} = {4'b0101, 4'b1111, 4'b0000};
9'b010010000: {red_r, green_r, blue_r} = {4'b0101, 4'b1111, 4'b0000};
9'b010010001: {red_r, green_r, blue_r} = {4'b0100, 4'b1111, 4'b0000};
9'b010010010: {red_r, green_r, blue_r} = {4'b0100, 4'b1111, 4'b0000};
9'b010010011: {red_r, green_r, blue_r} = {4'b0100, 4'b1111, 4'b0000};
9'b010010100: {red_r, green_r, blue_r} = {4'b0100, 4'b1111, 4'b0000};
9'b010010101: {red_r, green_r, blue_r} = {4'b0100, 4'b1111, 4'b0000};
9'b010010110: {red_r, green_r, blue_r} = {4'b0011, 4'b1111, 4'b0000};
9'b010010111: {red_r, green_r, blue_r} = {4'b0011, 4'b1111, 4'b0000};
9'b010011000: {red_r, green_r, blue_r} = {4'b0011, 4'b1111, 4'b0000};
9'b010011001: {red_r, green_r, blue_r} = {4'b0011, 4'b1111, 4'b0000};
9'b010011010: {red_r, green_r, blue_r} = {4'b0011, 4'b1111, 4'b0000};
9'b010011011: {red_r, green_r, blue_r} = {4'b0010, 4'b1111, 4'b0000};
9'b010011100: {red_r, green_r, blue_r} = {4'b0010, 4'b1111, 4'b0000};
9'b010011101: {red_r, green_r, blue_r} = {4'b0010, 4'b1111, 4'b0000};
9'b010011110: {red_r, green_r, blue_r} = {4'b0010, 4'b1111, 4'b0000};
9'b010011111: {red_r, green_r, blue_r} = {4'b0010, 4'b1111, 4'b0000};
9'b010100000: {red_r, green_r, blue_r} = {4'b0010, 4'b1111, 4'b0000};
9'b010100001: {red_r, green_r, blue_r} = {4'b0001, 4'b1111, 4'b0000};
9'b010100010: {red_r, green_r, blue_r} = {4'b0001, 4'b1111, 4'b0000};
9'b010100011: {red_r, green_r, blue_r} = {4'b0001, 4'b1111, 4'b0000};
9'b010100100: {red_r, green_r, blue_r} = {4'b0001, 4'b1111, 4'b0000};
9'b010100101: {red_r, green_r, blue_r} = {4'b0001, 4'b1111, 4'b0000};
9'b010100110: {red_r, green_r, blue_r} = {4'b0000, 4'b1111, 4'b0000};
9'b010100111: {red_r, green_r, blue_r} = {4'b0000, 4'b1111, 4'b0000};
9'b010101000: {red_r, green_r, blue_r} = {4'b0000, 4'b1111, 4'b0000};
9'b010101001: {red_r, green_r, blue_r} = {4'b0000, 4'b1111, 4'b0000};
9'b010101010: {red_r, green_r, blue_r} = {4'b0000, 4'b1111, 4'b0000};
9'b010101011: {red_r, green_r, blue_r} = {4'b0000, 4'b1111, 4'b0000};
9'b010101100: {red_r, green_r, blue_r} = {4'b0000, 4'b1111, 4'b0000};
9'b010101101: {red_r, green_r, blue_r} = {4'b0000, 4'b1111, 4'b0000};
9'b010101110: {red_r, green_r, blue_r} = {4'b0000, 4'b1111, 4'b0000};
9'b010101111: {red_r, green_r, blue_r} = {4'b0000, 4'b1111, 4'b0000};
9'b010110000: {red_r, green_r, blue_r} = {4'b0000, 4'b1111, 4'b0001};
9'b010110001: {red_r, green_r, blue_r} = {4'b0000, 4'b1111, 4'b0001};
9'b010110010: {red_r, green_r, blue_r} = {4'b0000, 4'b1111, 4'b0001};
9'b010110011: {red_r, green_r, blue_r} = {4'b0000, 4'b1111, 4'b0001};
9'b010110100: {red_r, green_r, blue_r} = {4'b0000, 4'b1111, 4'b0001};
9'b010110101: {red_r, green_r, blue_r} = {4'b0000, 4'b1111, 4'b0001};
9'b010110110: {red_r, green_r, blue_r} = {4'b0000, 4'b1111, 4'b0010};
9'b010110111: {red_r, green_r, blue_r} = {4'b0000, 4'b1111, 4'b0010};
9'b010111000: {red_r, green_r, blue_r} = {4'b0000, 4'b1111, 4'b0010};
9'b010111001: {red_r, green_r, blue_r} = {4'b0000, 4'b1111, 4'b0010};
9'b010111010: {red_r, green_r, blue_r} = {4'b0000, 4'b1111, 4'b0010};
9'b010111011: {red_r, green_r, blue_r} = {4'b0000, 4'b1111, 4'b0011};
9'b010111100: {red_r, green_r, blue_r} = {4'b0000, 4'b1111, 4'b0011};
9'b010111101: {red_r, green_r, blue_r} = {4'b0000, 4'b1111, 4'b0011};
9'b010111110: {red_r, green_r, blue_r} = {4'b0000, 4'b1111, 4'b0011};
9'b010111111: {red_r, green_r, blue_r} = {4'b0000, 4'b1111, 4'b0011};
9'b011000000: {red_r, green_r, blue_r} = {4'b0000, 4'b1111, 4'b0100};
9'b011000001: {red_r, green_r, blue_r} = {4'b0000, 4'b1111, 4'b0100};
9'b011000010: {red_r, green_r, blue_r} = {4'b0000, 4'b1111, 4'b0100};
9'b011000011: {red_r, green_r, blue_r} = {4'b0000, 4'b1111, 4'b0100};
9'b011000100: {red_r, green_r, blue_r} = {4'b0000, 4'b1111, 4'b0100};
9'b011000101: {red_r, green_r, blue_r} = {4'b0000, 4'b1111, 4'b0100};
9'b011000110: {red_r, green_r, blue_r} = {4'b0000, 4'b1111, 4'b0101};
9'b011000111: {red_r, green_r, blue_r} = {4'b0000, 4'b1111, 4'b0101};
9'b011001000: {red_r, green_r, blue_r} = {4'b0000, 4'b1111, 4'b0101};
9'b011001001: {red_r, green_r, blue_r} = {4'b0000, 4'b1111, 4'b0101};
9'b011001010: {red_r, green_r, blue_r} = {4'b0000, 4'b1111, 4'b0101};
9'b011001011: {red_r, green_r, blue_r} = {4'b0000, 4'b1111, 4'b0110};
9'b011001100: {red_r, green_r, blue_r} = {4'b0000, 4'b1111, 4'b0110};
9'b011001101: {red_r, green_r, blue_r} = {4'b0000, 4'b1111, 4'b0110};
9'b011001110: {red_r, green_r, blue_r} = {4'b0000, 4'b1111, 4'b0110};
9'b011001111: {red_r, green_r, blue_r} = {4'b0000, 4'b1111, 4'b0110};
9'b011010000: {red_r, green_r, blue_r} = {4'b0000, 4'b1111, 4'b0111};
9'b011010001: {red_r, green_r, blue_r} = {4'b0000, 4'b1111, 4'b0111};
9'b011010010: {red_r, green_r, blue_r} = {4'b0000, 4'b1111, 4'b0111};
9'b011010011: {red_r, green_r, blue_r} = {4'b0000, 4'b1111, 4'b0111};
9'b011010100: {red_r, green_r, blue_r} = {4'b0000, 4'b1111, 4'b0111};
9'b011010101: {red_r, green_r, blue_r} = {4'b0000, 4'b1111, 4'b0111};
9'b011010110: {red_r, green_r, blue_r} = {4'b0000, 4'b1111, 4'b1000};
9'b011010111: {red_r, green_r, blue_r} = {4'b0000, 4'b1111, 4'b1000};
9'b011011000: {red_r, green_r, blue_r} = {4'b0000, 4'b1111, 4'b1000};
9'b011011001: {red_r, green_r, blue_r} = {4'b0000, 4'b1111, 4'b1000};
9'b011011010: {red_r, green_r, blue_r} = {4'b0000, 4'b1111, 4'b1000};
9'b011011011: {red_r, green_r, blue_r} = {4'b0000, 4'b1111, 4'b1001};
9'b011011100: {red_r, green_r, blue_r} = {4'b0000, 4'b1111, 4'b1001};
9'b011011101: {red_r, green_r, blue_r} = {4'b0000, 4'b1111, 4'b1001};
9'b011011110: {red_r, green_r, blue_r} = {4'b0000, 4'b1111, 4'b1001};
9'b011011111: {red_r, green_r, blue_r} = {4'b0000, 4'b1111, 4'b1001};
9'b011100000: {red_r, green_r, blue_r} = {4'b0000, 4'b1111, 4'b1001};
9'b011100001: {red_r, green_r, blue_r} = {4'b0000, 4'b1111, 4'b1010};
9'b011100010: {red_r, green_r, blue_r} = {4'b0000, 4'b1111, 4'b1010};
9'b011100011: {red_r, green_r, blue_r} = {4'b0000, 4'b1111, 4'b1010};
9'b011100100: {red_r, green_r, blue_r} = {4'b0000, 4'b1111, 4'b1010};
9'b011100101: {red_r, green_r, blue_r} = {4'b0000, 4'b1111, 4'b1010};
9'b011100110: {red_r, green_r, blue_r} = {4'b0000, 4'b1111, 4'b1011};
9'b011100111: {red_r, green_r, blue_r} = {4'b0000, 4'b1111, 4'b1011};
9'b011101000: {red_r, green_r, blue_r} = {4'b0000, 4'b1111, 4'b1011};
9'b011101001: {red_r, green_r, blue_r} = {4'b0000, 4'b1111, 4'b1011};
9'b011101010: {red_r, green_r, blue_r} = {4'b0000, 4'b1111, 4'b1011};
9'b011101011: {red_r, green_r, blue_r} = {4'b0000, 4'b1111, 4'b1100};
9'b011101100: {red_r, green_r, blue_r} = {4'b0000, 4'b1111, 4'b1100};
9'b011101101: {red_r, green_r, blue_r} = {4'b0000, 4'b1111, 4'b1100};
9'b011101110: {red_r, green_r, blue_r} = {4'b0000, 4'b1111, 4'b1100};
9'b011101111: {red_r, green_r, blue_r} = {4'b0000, 4'b1111, 4'b1100};
9'b011110000: {red_r, green_r, blue_r} = {4'b0000, 4'b1111, 4'b1100};
9'b011110001: {red_r, green_r, blue_r} = {4'b0000, 4'b1111, 4'b1101};
9'b011110010: {red_r, green_r, blue_r} = {4'b0000, 4'b1111, 4'b1101};
9'b011110011: {red_r, green_r, blue_r} = {4'b0000, 4'b1111, 4'b1101};
9'b011110100: {red_r, green_r, blue_r} = {4'b0000, 4'b1111, 4'b1101};
9'b011110101: {red_r, green_r, blue_r} = {4'b0000, 4'b1111, 4'b1101};
9'b011110110: {red_r, green_r, blue_r} = {4'b0000, 4'b1111, 4'b1110};
9'b011110111: {red_r, green_r, blue_r} = {4'b0000, 4'b1111, 4'b1110};
9'b011111000: {red_r, green_r, blue_r} = {4'b0000, 4'b1111, 4'b1110};
9'b011111001: {red_r, green_r, blue_r} = {4'b0000, 4'b1111, 4'b1110};
9'b011111010: {red_r, green_r, blue_r} = {4'b0000, 4'b1111, 4'b1110};
9'b011111011: {red_r, green_r, blue_r} = {4'b0000, 4'b1111, 4'b1111};
9'b011111100: {red_r, green_r, blue_r} = {4'b0000, 4'b1111, 4'b1111};
9'b011111101: {red_r, green_r, blue_r} = {4'b0000, 4'b1111, 4'b1111};
9'b011111110: {red_r, green_r, blue_r} = {4'b0000, 4'b1111, 4'b1111};
9'b011111111: {red_r, green_r, blue_r} = {4'b0000, 4'b1111, 4'b1111};
9'b100000000: {red_r, green_r, blue_r} = {4'b0000, 4'b1111, 4'b1111};
9'b100000001: {red_r, green_r, blue_r} = {4'b0000, 4'b1111, 4'b1111};
9'b100000010: {red_r, green_r, blue_r} = {4'b0000, 4'b1111, 4'b1111};
9'b100000011: {red_r, green_r, blue_r} = {4'b0000, 4'b1111, 4'b1111};
9'b100000100: {red_r, green_r, blue_r} = {4'b0000, 4'b1111, 4'b1111};
9'b100000101: {red_r, green_r, blue_r} = {4'b0000, 4'b1111, 4'b1111};
9'b100000110: {red_r, green_r, blue_r} = {4'b0000, 4'b1110, 4'b1111};
9'b100000111: {red_r, green_r, blue_r} = {4'b0000, 4'b1110, 4'b1111};
9'b100001000: {red_r, green_r, blue_r} = {4'b0000, 4'b1110, 4'b1111};
9'b100001001: {red_r, green_r, blue_r} = {4'b0000, 4'b1110, 4'b1111};
9'b100001010: {red_r, green_r, blue_r} = {4'b0000, 4'b1110, 4'b1111};
9'b100001011: {red_r, green_r, blue_r} = {4'b0000, 4'b1101, 4'b1111};
9'b100001100: {red_r, green_r, blue_r} = {4'b0000, 4'b1101, 4'b1111};
9'b100001101: {red_r, green_r, blue_r} = {4'b0000, 4'b1101, 4'b1111};
9'b100001110: {red_r, green_r, blue_r} = {4'b0000, 4'b1101, 4'b1111};
9'b100001111: {red_r, green_r, blue_r} = {4'b0000, 4'b1101, 4'b1111};
9'b100010000: {red_r, green_r, blue_r} = {4'b0000, 4'b1100, 4'b1111};
9'b100010001: {red_r, green_r, blue_r} = {4'b0000, 4'b1100, 4'b1111};
9'b100010010: {red_r, green_r, blue_r} = {4'b0000, 4'b1100, 4'b1111};
9'b100010011: {red_r, green_r, blue_r} = {4'b0000, 4'b1100, 4'b1111};
9'b100010100: {red_r, green_r, blue_r} = {4'b0000, 4'b1100, 4'b1111};
9'b100010101: {red_r, green_r, blue_r} = {4'b0000, 4'b1100, 4'b1111};
9'b100010110: {red_r, green_r, blue_r} = {4'b0000, 4'b1011, 4'b1111};
9'b100010111: {red_r, green_r, blue_r} = {4'b0000, 4'b1011, 4'b1111};
9'b100011000: {red_r, green_r, blue_r} = {4'b0000, 4'b1011, 4'b1111};
9'b100011001: {red_r, green_r, blue_r} = {4'b0000, 4'b1011, 4'b1111};
9'b100011010: {red_r, green_r, blue_r} = {4'b0000, 4'b1011, 4'b1111};
9'b100011011: {red_r, green_r, blue_r} = {4'b0000, 4'b1010, 4'b1111};
9'b100011100: {red_r, green_r, blue_r} = {4'b0000, 4'b1010, 4'b1111};
9'b100011101: {red_r, green_r, blue_r} = {4'b0000, 4'b1010, 4'b1111};
9'b100011110: {red_r, green_r, blue_r} = {4'b0000, 4'b1010, 4'b1111};
9'b100011111: {red_r, green_r, blue_r} = {4'b0000, 4'b1010, 4'b1111};
9'b100100000: {red_r, green_r, blue_r} = {4'b0000, 4'b1001, 4'b1111};
9'b100100001: {red_r, green_r, blue_r} = {4'b0000, 4'b1001, 4'b1111};
9'b100100010: {red_r, green_r, blue_r} = {4'b0000, 4'b1001, 4'b1111};
9'b100100011: {red_r, green_r, blue_r} = {4'b0000, 4'b1001, 4'b1111};
9'b100100100: {red_r, green_r, blue_r} = {4'b0000, 4'b1001, 4'b1111};
9'b100100101: {red_r, green_r, blue_r} = {4'b0000, 4'b1001, 4'b1111};
9'b100100110: {red_r, green_r, blue_r} = {4'b0000, 4'b1000, 4'b1111};
9'b100100111: {red_r, green_r, blue_r} = {4'b0000, 4'b1000, 4'b1111};
9'b100101000: {red_r, green_r, blue_r} = {4'b0000, 4'b1000, 4'b1111};
9'b100101001: {red_r, green_r, blue_r} = {4'b0000, 4'b1000, 4'b1111};
9'b100101010: {red_r, green_r, blue_r} = {4'b0000, 4'b1000, 4'b1111};
9'b100101011: {red_r, green_r, blue_r} = {4'b0000, 4'b0111, 4'b1111};
9'b100101100: {red_r, green_r, blue_r} = {4'b0000, 4'b0111, 4'b1111};
9'b100101101: {red_r, green_r, blue_r} = {4'b0000, 4'b0111, 4'b1111};
9'b100101110: {red_r, green_r, blue_r} = {4'b0000, 4'b0111, 4'b1111};
9'b100101111: {red_r, green_r, blue_r} = {4'b0000, 4'b0111, 4'b1111};
9'b100110000: {red_r, green_r, blue_r} = {4'b0000, 4'b0111, 4'b1111};
9'b100110001: {red_r, green_r, blue_r} = {4'b0000, 4'b0110, 4'b1111};
9'b100110010: {red_r, green_r, blue_r} = {4'b0000, 4'b0110, 4'b1111};
9'b100110011: {red_r, green_r, blue_r} = {4'b0000, 4'b0110, 4'b1111};
9'b100110100: {red_r, green_r, blue_r} = {4'b0000, 4'b0110, 4'b1111};
9'b100110101: {red_r, green_r, blue_r} = {4'b0000, 4'b0110, 4'b1111};
9'b100110110: {red_r, green_r, blue_r} = {4'b0000, 4'b0101, 4'b1111};
9'b100110111: {red_r, green_r, blue_r} = {4'b0000, 4'b0101, 4'b1111};
9'b100111000: {red_r, green_r, blue_r} = {4'b0000, 4'b0101, 4'b1111};
9'b100111001: {red_r, green_r, blue_r} = {4'b0000, 4'b0101, 4'b1111};
9'b100111010: {red_r, green_r, blue_r} = {4'b0000, 4'b0101, 4'b1111};
9'b100111011: {red_r, green_r, blue_r} = {4'b0000, 4'b0100, 4'b1111};
9'b100111100: {red_r, green_r, blue_r} = {4'b0000, 4'b0100, 4'b1111};
9'b100111101: {red_r, green_r, blue_r} = {4'b0000, 4'b0100, 4'b1111};
9'b100111110: {red_r, green_r, blue_r} = {4'b0000, 4'b0100, 4'b1111};
9'b100111111: {red_r, green_r, blue_r} = {4'b0000, 4'b0100, 4'b1111};
9'b101000000: {red_r, green_r, blue_r} = {4'b0000, 4'b0100, 4'b1111};
9'b101000001: {red_r, green_r, blue_r} = {4'b0000, 4'b0011, 4'b1111};
9'b101000010: {red_r, green_r, blue_r} = {4'b0000, 4'b0011, 4'b1111};
9'b101000011: {red_r, green_r, blue_r} = {4'b0000, 4'b0011, 4'b1111};
9'b101000100: {red_r, green_r, blue_r} = {4'b0000, 4'b0011, 4'b1111};
9'b101000101: {red_r, green_r, blue_r} = {4'b0000, 4'b0011, 4'b1111};
9'b101000110: {red_r, green_r, blue_r} = {4'b0000, 4'b0010, 4'b1111};
9'b101000111: {red_r, green_r, blue_r} = {4'b0000, 4'b0010, 4'b1111};
9'b101001000: {red_r, green_r, blue_r} = {4'b0000, 4'b0010, 4'b1111};
9'b101001001: {red_r, green_r, blue_r} = {4'b0000, 4'b0010, 4'b1111};
9'b101001010: {red_r, green_r, blue_r} = {4'b0000, 4'b0010, 4'b1111};
9'b101001011: {red_r, green_r, blue_r} = {4'b0000, 4'b0001, 4'b1111};
9'b101001100: {red_r, green_r, blue_r} = {4'b0000, 4'b0001, 4'b1111};
9'b101001101: {red_r, green_r, blue_r} = {4'b0000, 4'b0001, 4'b1111};
9'b101001110: {red_r, green_r, blue_r} = {4'b0000, 4'b0001, 4'b1111};
9'b101001111: {red_r, green_r, blue_r} = {4'b0000, 4'b0001, 4'b1111};
9'b101010000: {red_r, green_r, blue_r} = {4'b0000, 4'b0001, 4'b1111};
9'b101010001: {red_r, green_r, blue_r} = {4'b0000, 4'b0000, 4'b1111};
9'b101010010: {red_r, green_r, blue_r} = {4'b0000, 4'b0000, 4'b1111};
9'b101010011: {red_r, green_r, blue_r} = {4'b0000, 4'b0000, 4'b1111};
9'b101010100: {red_r, green_r, blue_r} = {4'b0000, 4'b0000, 4'b1111};
9'b101010101: {red_r, green_r, blue_r} = {4'b0000, 4'b0000, 4'b1111};
9'b101010110: {red_r, green_r, blue_r} = {4'b0000, 4'b0000, 4'b1111};
9'b101010111: {red_r, green_r, blue_r} = {4'b0000, 4'b0000, 4'b1111};
9'b101011000: {red_r, green_r, blue_r} = {4'b0000, 4'b0000, 4'b1111};
9'b101011001: {red_r, green_r, blue_r} = {4'b0000, 4'b0000, 4'b1111};
9'b101011010: {red_r, green_r, blue_r} = {4'b0000, 4'b0000, 4'b1111};
9'b101011011: {red_r, green_r, blue_r} = {4'b0001, 4'b0000, 4'b1111};
9'b101011100: {red_r, green_r, blue_r} = {4'b0001, 4'b0000, 4'b1111};
9'b101011101: {red_r, green_r, blue_r} = {4'b0001, 4'b0000, 4'b1111};
9'b101011110: {red_r, green_r, blue_r} = {4'b0001, 4'b0000, 4'b1111};
9'b101011111: {red_r, green_r, blue_r} = {4'b0001, 4'b0000, 4'b1111};
9'b101100000: {red_r, green_r, blue_r} = {4'b0010, 4'b0000, 4'b1111};
9'b101100001: {red_r, green_r, blue_r} = {4'b0010, 4'b0000, 4'b1111};
9'b101100010: {red_r, green_r, blue_r} = {4'b0010, 4'b0000, 4'b1111};
9'b101100011: {red_r, green_r, blue_r} = {4'b0010, 4'b0000, 4'b1111};
9'b101100100: {red_r, green_r, blue_r} = {4'b0010, 4'b0000, 4'b1111};
9'b101100101: {red_r, green_r, blue_r} = {4'b0010, 4'b0000, 4'b1111};
9'b101100110: {red_r, green_r, blue_r} = {4'b0011, 4'b0000, 4'b1111};
9'b101100111: {red_r, green_r, blue_r} = {4'b0011, 4'b0000, 4'b1111};
9'b101101000: {red_r, green_r, blue_r} = {4'b0011, 4'b0000, 4'b1111};
9'b101101001: {red_r, green_r, blue_r} = {4'b0011, 4'b0000, 4'b1111};
9'b101101010: {red_r, green_r, blue_r} = {4'b0011, 4'b0000, 4'b1111};
9'b101101011: {red_r, green_r, blue_r} = {4'b0100, 4'b0000, 4'b1111};
9'b101101100: {red_r, green_r, blue_r} = {4'b0100, 4'b0000, 4'b1111};
9'b101101101: {red_r, green_r, blue_r} = {4'b0100, 4'b0000, 4'b1111};
9'b101101110: {red_r, green_r, blue_r} = {4'b0100, 4'b0000, 4'b1111};
9'b101101111: {red_r, green_r, blue_r} = {4'b0100, 4'b0000, 4'b1111};
9'b101110000: {red_r, green_r, blue_r} = {4'b0101, 4'b0000, 4'b1111};
9'b101110001: {red_r, green_r, blue_r} = {4'b0101, 4'b0000, 4'b1111};
9'b101110010: {red_r, green_r, blue_r} = {4'b0101, 4'b0000, 4'b1111};
9'b101110011: {red_r, green_r, blue_r} = {4'b0101, 4'b0000, 4'b1111};
9'b101110100: {red_r, green_r, blue_r} = {4'b0101, 4'b0000, 4'b1111};
9'b101110101: {red_r, green_r, blue_r} = {4'b0101, 4'b0000, 4'b1111};
9'b101110110: {red_r, green_r, blue_r} = {4'b0110, 4'b0000, 4'b1111};
9'b101110111: {red_r, green_r, blue_r} = {4'b0110, 4'b0000, 4'b1111};
9'b101111000: {red_r, green_r, blue_r} = {4'b0110, 4'b0000, 4'b1111};
9'b101111001: {red_r, green_r, blue_r} = {4'b0110, 4'b0000, 4'b1111};
9'b101111010: {red_r, green_r, blue_r} = {4'b0110, 4'b0000, 4'b1111};
9'b101111011: {red_r, green_r, blue_r} = {4'b0111, 4'b0000, 4'b1111};
9'b101111100: {red_r, green_r, blue_r} = {4'b0111, 4'b0000, 4'b1111};
9'b101111101: {red_r, green_r, blue_r} = {4'b0111, 4'b0000, 4'b1111};
9'b101111110: {red_r, green_r, blue_r} = {4'b0111, 4'b0000, 4'b1111};
9'b101111111: {red_r, green_r, blue_r} = {4'b0111, 4'b0000, 4'b1111};
9'b110000000: {red_r, green_r, blue_r} = {4'b1000, 4'b0000, 4'b1111};
9'b110000001: {red_r, green_r, blue_r} = {4'b1000, 4'b0000, 4'b1111};
9'b110000010: {red_r, green_r, blue_r} = {4'b1000, 4'b0000, 4'b1111};
9'b110000011: {red_r, green_r, blue_r} = {4'b1000, 4'b0000, 4'b1111};
9'b110000100: {red_r, green_r, blue_r} = {4'b1000, 4'b0000, 4'b1111};
9'b110000101: {red_r, green_r, blue_r} = {4'b1000, 4'b0000, 4'b1111};
9'b110000110: {red_r, green_r, blue_r} = {4'b1001, 4'b0000, 4'b1111};
9'b110000111: {red_r, green_r, blue_r} = {4'b1001, 4'b0000, 4'b1111};
9'b110001000: {red_r, green_r, blue_r} = {4'b1001, 4'b0000, 4'b1111};
9'b110001001: {red_r, green_r, blue_r} = {4'b1001, 4'b0000, 4'b1111};
9'b110001010: {red_r, green_r, blue_r} = {4'b1001, 4'b0000, 4'b1111};
9'b110001011: {red_r, green_r, blue_r} = {4'b1010, 4'b0000, 4'b1111};
9'b110001100: {red_r, green_r, blue_r} = {4'b1010, 4'b0000, 4'b1111};
9'b110001101: {red_r, green_r, blue_r} = {4'b1010, 4'b0000, 4'b1111};
9'b110001110: {red_r, green_r, blue_r} = {4'b1010, 4'b0000, 4'b1111};
9'b110001111: {red_r, green_r, blue_r} = {4'b1010, 4'b0000, 4'b1111};
9'b110010000: {red_r, green_r, blue_r} = {4'b1010, 4'b0000, 4'b1111};
9'b110010001: {red_r, green_r, blue_r} = {4'b1011, 4'b0000, 4'b1111};
9'b110010010: {red_r, green_r, blue_r} = {4'b1011, 4'b0000, 4'b1111};
9'b110010011: {red_r, green_r, blue_r} = {4'b1011, 4'b0000, 4'b1111};
9'b110010100: {red_r, green_r, blue_r} = {4'b1011, 4'b0000, 4'b1111};
9'b110010101: {red_r, green_r, blue_r} = {4'b1011, 4'b0000, 4'b1111};
9'b110010110: {red_r, green_r, blue_r} = {4'b1100, 4'b0000, 4'b1111};
9'b110010111: {red_r, green_r, blue_r} = {4'b1100, 4'b0000, 4'b1111};
9'b110011000: {red_r, green_r, blue_r} = {4'b1100, 4'b0000, 4'b1111};
9'b110011001: {red_r, green_r, blue_r} = {4'b1100, 4'b0000, 4'b1111};
9'b110011010: {red_r, green_r, blue_r} = {4'b1100, 4'b0000, 4'b1111};
9'b110011011: {red_r, green_r, blue_r} = {4'b1101, 4'b0000, 4'b1111};
9'b110011100: {red_r, green_r, blue_r} = {4'b1101, 4'b0000, 4'b1111};
9'b110011101: {red_r, green_r, blue_r} = {4'b1101, 4'b0000, 4'b1111};
9'b110011110: {red_r, green_r, blue_r} = {4'b1101, 4'b0000, 4'b1111};
9'b110011111: {red_r, green_r, blue_r} = {4'b1101, 4'b0000, 4'b1111};
9'b110100000: {red_r, green_r, blue_r} = {4'b1101, 4'b0000, 4'b1111};
9'b110100001: {red_r, green_r, blue_r} = {4'b1110, 4'b0000, 4'b1111};
9'b110100010: {red_r, green_r, blue_r} = {4'b1110, 4'b0000, 4'b1111};
9'b110100011: {red_r, green_r, blue_r} = {4'b1110, 4'b0000, 4'b1111};
9'b110100100: {red_r, green_r, blue_r} = {4'b1110, 4'b0000, 4'b1111};
9'b110100101: {red_r, green_r, blue_r} = {4'b1110, 4'b0000, 4'b1111};
9'b110100110: {red_r, green_r, blue_r} = {4'b1111, 4'b0000, 4'b1111};
9'b110100111: {red_r, green_r, blue_r} = {4'b1111, 4'b0000, 4'b1111};
9'b110101000: {red_r, green_r, blue_r} = {4'b1111, 4'b0000, 4'b1111};
9'b110101001: {red_r, green_r, blue_r} = {4'b1111, 4'b0000, 4'b1111};
9'b110101010: {red_r, green_r, blue_r} = {4'b1111, 4'b0000, 4'b1111};
9'b110101011: {red_r, green_r, blue_r} = {4'b1111, 4'b0000, 4'b1111};
9'b110101100: {red_r, green_r, blue_r} = {4'b1111, 4'b0000, 4'b1111};
9'b110101101: {red_r, green_r, blue_r} = {4'b1111, 4'b0000, 4'b1111};
9'b110101110: {red_r, green_r, blue_r} = {4'b1111, 4'b0000, 4'b1111};
9'b110101111: {red_r, green_r, blue_r} = {4'b1111, 4'b0000, 4'b1111};
9'b110110000: {red_r, green_r, blue_r} = {4'b1111, 4'b0000, 4'b1110};
9'b110110001: {red_r, green_r, blue_r} = {4'b1111, 4'b0000, 4'b1110};
9'b110110010: {red_r, green_r, blue_r} = {4'b1111, 4'b0000, 4'b1110};
9'b110110011: {red_r, green_r, blue_r} = {4'b1111, 4'b0000, 4'b1110};
9'b110110100: {red_r, green_r, blue_r} = {4'b1111, 4'b0000, 4'b1110};
9'b110110101: {red_r, green_r, blue_r} = {4'b1111, 4'b0000, 4'b1110};
9'b110110110: {red_r, green_r, blue_r} = {4'b1111, 4'b0000, 4'b1101};
9'b110110111: {red_r, green_r, blue_r} = {4'b1111, 4'b0000, 4'b1101};
9'b110111000: {red_r, green_r, blue_r} = {4'b1111, 4'b0000, 4'b1101};
9'b110111001: {red_r, green_r, blue_r} = {4'b1111, 4'b0000, 4'b1101};
9'b110111010: {red_r, green_r, blue_r} = {4'b1111, 4'b0000, 4'b1101};
9'b110111011: {red_r, green_r, blue_r} = {4'b1111, 4'b0000, 4'b1100};
9'b110111100: {red_r, green_r, blue_r} = {4'b1111, 4'b0000, 4'b1100};
9'b110111101: {red_r, green_r, blue_r} = {4'b1111, 4'b0000, 4'b1100};
9'b110111110: {red_r, green_r, blue_r} = {4'b1111, 4'b0000, 4'b1100};
9'b110111111: {red_r, green_r, blue_r} = {4'b1111, 4'b0000, 4'b1100};
9'b111000000: {red_r, green_r, blue_r} = {4'b1111, 4'b0000, 4'b1011};
9'b111000001: {red_r, green_r, blue_r} = {4'b1111, 4'b0000, 4'b1011};
9'b111000010: {red_r, green_r, blue_r} = {4'b1111, 4'b0000, 4'b1011};
9'b111000011: {red_r, green_r, blue_r} = {4'b1111, 4'b0000, 4'b1011};
9'b111000100: {red_r, green_r, blue_r} = {4'b1111, 4'b0000, 4'b1011};
9'b111000101: {red_r, green_r, blue_r} = {4'b1111, 4'b0000, 4'b1011};
9'b111000110: {red_r, green_r, blue_r} = {4'b1111, 4'b0000, 4'b1010};
9'b111000111: {red_r, green_r, blue_r} = {4'b1111, 4'b0000, 4'b1010};
9'b111001000: {red_r, green_r, blue_r} = {4'b1111, 4'b0000, 4'b1010};
9'b111001001: {red_r, green_r, blue_r} = {4'b1111, 4'b0000, 4'b1010};
9'b111001010: {red_r, green_r, blue_r} = {4'b1111, 4'b0000, 4'b1010};
9'b111001011: {red_r, green_r, blue_r} = {4'b1111, 4'b0000, 4'b1001};
9'b111001100: {red_r, green_r, blue_r} = {4'b1111, 4'b0000, 4'b1001};
9'b111001101: {red_r, green_r, blue_r} = {4'b1111, 4'b0000, 4'b1001};
9'b111001110: {red_r, green_r, blue_r} = {4'b1111, 4'b0000, 4'b1001};
9'b111001111: {red_r, green_r, blue_r} = {4'b1111, 4'b0000, 4'b1001};
9'b111010000: {red_r, green_r, blue_r} = {4'b1111, 4'b0000, 4'b1000};
9'b111010001: {red_r, green_r, blue_r} = {4'b1111, 4'b0000, 4'b1000};
9'b111010010: {red_r, green_r, blue_r} = {4'b1111, 4'b0000, 4'b1000};
9'b111010011: {red_r, green_r, blue_r} = {4'b1111, 4'b0000, 4'b1000};
9'b111010100: {red_r, green_r, blue_r} = {4'b1111, 4'b0000, 4'b1000};
9'b111010101: {red_r, green_r, blue_r} = {4'b1111, 4'b0000, 4'b1000};
9'b111010110: {red_r, green_r, blue_r} = {4'b1111, 4'b0000, 4'b0111};
9'b111010111: {red_r, green_r, blue_r} = {4'b1111, 4'b0000, 4'b0111};
9'b111011000: {red_r, green_r, blue_r} = {4'b1111, 4'b0000, 4'b0111};
9'b111011001: {red_r, green_r, blue_r} = {4'b1111, 4'b0000, 4'b0111};
9'b111011010: {red_r, green_r, blue_r} = {4'b1111, 4'b0000, 4'b0111};
9'b111011011: {red_r, green_r, blue_r} = {4'b1111, 4'b0000, 4'b0110};
9'b111011100: {red_r, green_r, blue_r} = {4'b1111, 4'b0000, 4'b0110};
9'b111011101: {red_r, green_r, blue_r} = {4'b1111, 4'b0000, 4'b0110};
9'b111011110: {red_r, green_r, blue_r} = {4'b1111, 4'b0000, 4'b0110};
9'b111011111: {red_r, green_r, blue_r} = {4'b1111, 4'b0000, 4'b0110};
9'b111100000: {red_r, green_r, blue_r} = {4'b1111, 4'b0000, 4'b0110};
9'b111100001: {red_r, green_r, blue_r} = {4'b1111, 4'b0000, 4'b0101};
9'b111100010: {red_r, green_r, blue_r} = {4'b1111, 4'b0000, 4'b0101};
9'b111100011: {red_r, green_r, blue_r} = {4'b1111, 4'b0000, 4'b0101};
9'b111100100: {red_r, green_r, blue_r} = {4'b1111, 4'b0000, 4'b0101};
9'b111100101: {red_r, green_r, blue_r} = {4'b1111, 4'b0000, 4'b0101};
9'b111100110: {red_r, green_r, blue_r} = {4'b1111, 4'b0000, 4'b0100};
9'b111100111: {red_r, green_r, blue_r} = {4'b1111, 4'b0000, 4'b0100};
9'b111101000: {red_r, green_r, blue_r} = {4'b1111, 4'b0000, 4'b0100};
9'b111101001: {red_r, green_r, blue_r} = {4'b1111, 4'b0000, 4'b0100};
9'b111101010: {red_r, green_r, blue_r} = {4'b1111, 4'b0000, 4'b0100};
9'b111101011: {red_r, green_r, blue_r} = {4'b1111, 4'b0000, 4'b0011};
9'b111101100: {red_r, green_r, blue_r} = {4'b1111, 4'b0000, 4'b0011};
9'b111101101: {red_r, green_r, blue_r} = {4'b1111, 4'b0000, 4'b0011};
9'b111101110: {red_r, green_r, blue_r} = {4'b1111, 4'b0000, 4'b0011};
9'b111101111: {red_r, green_r, blue_r} = {4'b1111, 4'b0000, 4'b0011};
9'b111110000: {red_r, green_r, blue_r} = {4'b1111, 4'b0000, 4'b0011};
9'b111110001: {red_r, green_r, blue_r} = {4'b1111, 4'b0000, 4'b0010};
9'b111110010: {red_r, green_r, blue_r} = {4'b1111, 4'b0000, 4'b0010};
9'b111110011: {red_r, green_r, blue_r} = {4'b1111, 4'b0000, 4'b0010};
9'b111110100: {red_r, green_r, blue_r} = {4'b1111, 4'b0000, 4'b0010};
9'b111110101: {red_r, green_r, blue_r} = {4'b1111, 4'b0000, 4'b0010};
9'b111110110: {red_r, green_r, blue_r} = {4'b1111, 4'b0000, 4'b0001};
9'b111110111: {red_r, green_r, blue_r} = {4'b1111, 4'b0000, 4'b0001};
9'b111111000: {red_r, green_r, blue_r} = {4'b1111, 4'b0000, 4'b0001};
9'b111111001: {red_r, green_r, blue_r} = {4'b1111, 4'b0000, 4'b0001};
9'b111111010: {red_r, green_r, blue_r} = {4'b1111, 4'b0000, 4'b0001};
9'b111111011: {red_r, green_r, blue_r} = {4'b1111, 4'b0000, 4'b0000};
9'b111111100: {red_r, green_r, blue_r} = {4'b1111, 4'b0000, 4'b0000};
9'b111111101: {red_r, green_r, blue_r} = {4'b1111, 4'b0000, 4'b0000};
9'b111111110: {red_r, green_r, blue_r} = {4'b1111, 4'b0000, 4'b0000};
9'b111111111: {red_r, green_r, blue_r} = {4'b0000, 4'b0000, 4'b0000};
		default: {red_r, green_r, blue_r} = {4'b0000, 4'b0000, 4'b0000};
	endcase
	end

endmodule