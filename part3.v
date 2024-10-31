module part3 (SW, LEDR);

	input [1:0] SW;
	output [9:0] LEDR;
	
	wire Clk, D, Qm, Q;
	
	assign D = SW[0];
	assign Clk = SW[1];
	
	D_latch DL1 (~Clk, D, Qm);
	D_latch DL2 (Clk, Qm, Q);
		
	assign LEDR[0] = Q;
	
endmodule

module D_latch (Clk, D, Q);

	input Clk, D;
	output Q;

	wire S, R;
	wire S_g, R_g;
	wire Qa, Qb;
	
	assign S = D;
	assign R = ~D;
	
	assign S_g = ~(S & Clk);
	assign R_g = ~(R & Clk);
	
	assign Qa = ~(S_g & Qb);
	assign Qb = ~(R_g & Qa);
	
	assign Q = Qa;
	
endmodule