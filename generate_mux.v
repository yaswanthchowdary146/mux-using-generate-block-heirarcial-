
//8:1 mix using 2:1 mux
module mux8(input [2:0]s,
	   input [7:0]i,
	   output y);
wire [17:0]w;
assign w[7:0]=i[7:0];
assign y=w[17];
assign w[10:8]=s[2:0];
   genvar j;
   generate
		    for(j=0;j<7;j=j+1) begin
			   if(j<4)
				   mux2 m1(.a(w[2*j]),.b(w[(2*j)+1]),.s(w[8]),.y(w[j+11]));
			   else if(j==4 | j==5)
				   mux2 m2(.a(w[(2*j)+3]),.b(w[(2*j)+4]),.s(w[9]),.y(w[j+11]));
			   else
				   mux2 m3(.a(w[(2*j)+3]),.b(w[(2*j)+4]),.s(w[10]),.y(w[17]));
		   end
	   endgenerate
	  endmodule
