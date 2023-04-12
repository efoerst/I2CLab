module IOBuffer(in, out, enable, port);
	
	//TODO: complete IOBuffer as described in the lab spec.
	input in;
	input enable;
	output out;
	inout port;
	
	assign port = enable ? in : 1'bz;
	assign out = enable ? 1'b0 : port;
	
	/*always_comb begin 
		if (enable) begin
			port = in;
			out = 1'b0;
		end
		else begin
			port = 1'bz;
			out = port;
		end
	end*/
endmodule