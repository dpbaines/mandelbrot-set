module iterator(clock, reset, calc, plot, x, y, _iter);
	
	input clock, reset;
	input [11:0] _iter;
	output calc, plot;
	output [9:0] x, y;
	
	//FSM to control the state of the display
	localparam [2:0] 	S_ITER_X 	= 3'b000,
							S_ITER_Y 	= 3'b001,
							S_RESET	 	= 3'b010,
							S_CALC		= 3'b011,
							S_WAIT		= 3'b100,
							S_PLOT		= 3'b101,
							S_PLOT2		= 3'b110;
							
	//Defining the resolution
	parameter [9:0] 	MAX_WIDTH 	= 9'd320,
							MAX_HEIGHT 	= 8'd240;
				
	reg [9:0] x_counter, y_counter, iter;
	reg [2:0] state, next;
	
	reg calc1, plot1;
	assign calc = calc1;
	assign plot = plot1;
	
	assign x = x_counter;
	assign y = y_counter;
	
	initial begin
		x_counter = 10'd0;
		y_counter = 10'd0;
		iter = 10'd0;
	end
	
	//FSM control
	always@(posedge clock) begin
		case(state)
		S_ITER_X: next = x_counter == MAX_WIDTH ? S_ITER_Y : S_CALC;
		S_ITER_Y: next = y_counter == MAX_HEIGHT ? S_RESET : S_CALC;
		S_RESET: next = S_CALC;
		S_WAIT: next = iter == _iter ? S_PLOT : S_WAIT;
		S_CALC: next = S_WAIT;
		S_PLOT: next = S_PLOT2;
		S_PLOT2: next = S_ITER_X;
		default: next = S_ITER_X;
		endcase
	end
	
	//It was easier to have plot just always be high, since its continuosly scanning
	always@(posedge clock) begin
		plot1 = 1;
		calc1 = 0;
	
		case(state)
		S_ITER_X: begin
			x_counter = x_counter + 1;
			iter = 10'd0;
		end
		S_ITER_Y: begin
			x_counter = 10'd0;
			y_counter = y_counter + 1;
		end
		S_RESET: begin
			x_counter = 10'd0;
			y_counter = 10'd0;
			iter = 10'd0;
		end
		S_CALC: calc1 = 1;
		S_WAIT: begin
			iter = iter + 1;
		end
		S_PLOT: begin
			plot1 = 1;
		end
		S_PLOT2: plot1 = 1;
		endcase
	end
	
	always@(*) begin
		if(reset) state = S_RESET;
		else state = next;
	end
	
endmodule
