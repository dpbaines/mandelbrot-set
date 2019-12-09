module mandelbrot(x, y, x_zoom, y_zoom, x_offset, y_offset, clock, calc, colour, colour_invert, max_iter);
   input [9:0] x, y; 
	input [11:0] max_iter;
	input clock, calc, colour_invert;
	input [67:0] x_zoom, y_zoom, x_offset, y_offset;
   output [11:0] colour;
	
	//The reciprocal of 320 and 240, which are used to calculate dx and dy below
	parameter [67:0] 	x_w = 68'h000_00CCCCCCCCCCCD,
							y_w = 68'h000_01111111111111;
	
	wire [3:0] red, green, blue;
	assign colour[3:0] = colour_invert ? red : ~red;
	assign colour[7:4] = colour_invert ? green : ~green;
	assign colour[11:8] = colour_invert ? blue : ~blue;
	
	reg [11:0] iteration, final_iter;
	reg go;
	
	//Variable definitions which are needed for the algorithm
	reg [67:0] xc, yc, r2, i2, z2;
	wire [67:0] dx, dy;
	
	multiply1 mdx(x_w, x_zoom, dx);
	multiply1 mdy(y_w, y_zoom, dy);
	
	wire [67:0] x0, y0, x0_1, y0_1;
	multiply1 mx0({2'b00, x, 56'h0}, dx, x0_1);
	multiply1 my0({2'b00, y, 56'h0}, dy, y0_1);
	assign x0 = x0_1 - x_offset;
	assign y0 = y0_1 - y_offset;
	
	
	//Running the multiplications on the values based on the algorithm
	wire [67:0] mr2out;
	multiply1 mr2(xc, xc, mr2out);
	
	wire [67:0] mi2out;
	multiply1 mi2(yc, yc, mi2out);
	
	wire [67:0] mz2out, xy;
	assign xy = xc + yc;
	multiply1 mz2(xy, xy, mz2out);
	
	//Mini state machine to control the resetting of values each time calc is set to high
	localparam SET_VARS = 2'b00,
					GO = 2'b01;
					
	reg [1:0] state, next;
	
	always@(posedge clock) begin
		case(state)
			SET_VARS: next = calc ? GO : SET_VARS;
			GO: next = !go ? SET_VARS : GO;
			
			default: next = SET_VARS;
		endcase
	end
	
	always@(*) begin
		state = next;
	end
	
	//Runs around 512 iterations of the mandelbrot iter
	//Uses optimized for less multiplication
	always@(posedge clock) begin
		if(state == SET_VARS) begin
			//dx = multiply(x_w, x_zoom);//32'h0_066667;
			//dy = multiply(y_w, y_zoom);//32'h0_088888;
			r2 = 67'd0;
			i2 = 67'd0;
			z2 = 67'd0;
			xc = 67'd0;
			yc = 67'd0;
			
			iteration = 0;
			go = 1;
		end
	
		if(state == GO) begin
			xc = r2 - i2 + x0;
			yc = z2 - r2 - i2 + y0;
			
			//r2 = xc * xc;
			//r2 = multiply(xc, xc);
			r2 = mr2out;
			
			//i2 = yc * yc;
			//i2 = multiply(yc, yc);
			i2 = mi2out;
			
			//z2 = (((xc + yc) * (xc + yc)) >> 32);
			//z2 = multiply(xc + yc, xc + yc);
			z2 = mz2out;
			
			iteration = iteration + 1;
			
			//Check if has exceeded a radius of 2
			if(r2 + i2 > 67'h004_00000000000000) begin
				final_iter = iteration;
				go = 0;
			end
			
			if(iteration >= max_iter) begin
				final_iter = max_iter;
				go = 0;
			end
			
		end
		else begin
			r2 = 0;
			i2 = 0;
			z2 = 0;
			xc = 0;
			yc = 0;
		end
	end
	
	//Check the colour lookup table
	get_colour c1(final_iter, max_iter, red, green, blue);


endmodule

module multiply1(in1, in2, out);

	input signed [67:0] in1, in2;
	output signed [67:0] out;
	
	wire signed [140:0] _out;
	
	assign _out = (in1 * in2) >> 56;
	assign out = _out[67:0];

endmodule
