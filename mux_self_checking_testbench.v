module tb;
wire y;
reg [2:0]s;
reg [7:0]i;
integer pass=0;
integer fail=0;
integer k=0;
mux8 dut(s,i,y);
initial begin
	for (k=0;k<2048;k=k+1) begin
	{s,i}=k;
	#1
$display("s=%b|i=%b|y=%b",s,i,y);
if(y==i[s])
	pass=pass+1;
else
	fail=fail+1;
end
$display("pass=%0d|fail=%0d",pass,fail);
end
endmodule


