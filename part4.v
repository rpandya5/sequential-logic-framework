module part4 (Clk, D, Qa, Qb, Qc);

	input Clk, D;
	output Qa, Qb, Qc;
	
	wire Qout1, Qout2;
	
	D_latch latch (D, Clk, Qa);
	
	D_latch Master1 (D, ~Clk, Qout1);
	D_latch Slave1 (Qout1, Clk, Qb);
	
	D_latch Master2 (D, Clk, Qout2);
	D_latch Slave2 (Qout2, ~Clk, Qc);
	
endmodule


module D_latch (D, Clk, Q);

	input Clk, D;
	output Q;

	wire S, R;
	wire S_g, R_g;
	wire Qa1, Qb1;
	
	assign S = D;
	assign R = ~D;
	
	assign S_g = ~(S & Clk);
	assign R_g = ~(R & Clk);
	
	assign Qa1 = ~(S_g & Qb1);
	assign Qb1 = ~(R_g & Qa1);
	
	assign Q = Qa1;
	
endmodule