module nunchuck_translator(data_in, stick_x, stick_y, accel_x, accel_y, accel_z, z, c);
	
	input[7:0] data_in [5:0];	//6 bytes each are 8 bits
	output[7:0] stick_x, stick_y;
	output[9:0] accel_x, accel_y, accel_z;
	output z, c;
	
	assign stick_x = data_in[0];
	assign stick_y = data_in[1];
	assign accel_x = {data_in[2], data_in[5][4], data_in[5][5]};
	assign accel_y = {data_in[3], data_in[5][2], data_in[5][3]};
	assign accel_z = {data_in[4], data_in[5][0], data_in[5][1]};
	assign z = data_in[5][7];
	assign c = data_in[5][6];

endmodule
//TODO: Finish nunchuck_translator as described in the lab spec!