module Display(
		input [3:0] dig1,
		
		output reg [6:0] display1
);
	always @(dig1)
		case(dig1)
		4'b0000:
			display1 = 7'b1000000;
			
		4'b0001:
			display1 = 7'b1111001;
			
		4'b0010:
			display1 = 7'b0100100;
			
		4'b0011:
			display1 = 7'b0110000;
			
		4'b0100:
			display1 = 7'b0011001;
			
		4'b0101:
			display1 = 7'b0010010;
			
		4'b0110:
			display1 = 7'b0000010;
			
		4'b0111:
			display1 = 7'b1111000;
			
		4'b1000:
			display1 =7'b0000000;
			
		4'b1001:
			display1 = 7'b0010000;
			
		4'b1111:
			display1 = 7'b1111111;
		4'b1101:
			display1 = 7'b1110111;
		endcase
endmodule