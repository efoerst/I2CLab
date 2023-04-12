module nunchuck_test(clk, rst, SDApin, SCLpin, leds, dig5, dig4, dig3, dig2, dig1, dig0);
	
	//TODO: Modify this file to do something meaningful with the nunchuck!
	input clk, rst;
	inout SDApin;
	output SCLpin;
	output [9:0] leds;
	output [7:0] dig5, dig4, dig3, dig2, dig1, dig0;
	
	wire [7:0] stick_x, stick_y;
	wire [9:0] accel_x, accel_y, accel_z;
	wire z, c;
	reg [9:0] w; 
	nunchuckDriver driver(clk, SDApin, SCLpin, stick_x, stick_y, accel_x, accel_y, accel_z, z, c, rst);
	wire [19:0] value;
	assign value = {stick_y, stick_x};
	
	sevenSegDisp disp(value, z, c, dig5, dig4, dig3, dig2, dig1, dig0);
	
	reg [9:0] val;
	assign val = accel_x - 10'd512;
	always_comb begin
		if (val < 0) begin
			if (val > -20 && val < 0) begin
				w = 10'b0000000000;
			end
			else if (val > -40 && val <= -20) begin
				w = 10'b0000000001;
			end
			else if (val > -60 && val <= -40) begin
				w = 10'b0000000011;
			end
			else if (val > -80 && val <= -60) begin
				w = 10'b0000000111;
			end
			else if (val > -100 && val <= -80) begin
				w = 10'b0000001111;
			end
			else if (val >-120 && val <= -100) begin
				w = 10'b0000011111;
			end
			else if (val > -140 && val <= -120) begin
				w = 10'b0000111111;
			end
			else if (val > -160 && val <= -140) begin
				w = 10'b0001111111;
			end
			else if (val > -180 && val <= -160) begin
				w = 10'b0011111111;
			end 
			else if (val > -200 && val <= -180) begin
				w = 10'b0111111111;
			end
			else begin
				w = 10'b1111111111;
			end
		end
		
		else if (val > 0) begin
			if (val >0 && val < 20) begin
				w = 10'b0000000000;
			end
			else if (val >= 20 && val < 40) begin
				w = 10'b1000000000;
			end
			else if (val >= 40 && val < 60) begin
				w = 10'b1100000000;
			end
			else if (val >= 60 && val <80) begin
				w = 10'b1110000000;
			end
			else if (val >= 80 && val < 100) begin
				w = 10'b1111000000;
			end
			else if (val >= 100 && val < 120) begin
				w = 10'b1111100000;
			end
			else if (val >= 120 && val < 140) begin
				w = 10'b1111110000;
			end
			else if (val >= 140 && val < 160) begin
				w = 10'b1111111000;
			end
			else if (val >= 160 && val < 180) begin
				w = 10'b1111111100;
			end
			else if (val >= 180 && val < 200) begin
				w = 10'b1111111110;
			end
			else begin
				w = 10'b1111111111;
			end
		end
		
		else begin
			w = 10'b0000000000;
		end
		
	end
	
	assign leds = w; 
	
endmodule