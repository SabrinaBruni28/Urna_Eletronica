module test(clock, digit, valid, start, state, next_state, finish, swap, digit1, digit2, vote_status, C1, C2, Nulo);

	input wire clock;
	
	input wire [3:0] digit;
	
	input wire valid;
	input wire start;
	input wire finish;
	input wire swap;
	
	output reg [3:0] digit1;
	output reg [3:0] digit2;
	
	output reg [1:0] vote_status;
	output reg [3:0] state;
	output reg [3:0] next_state;
	
	output reg [7:0] C1;
	output reg [7:0] C2;
	output reg [7:0] Nulo;
	 
	parameter S0 = 0; //Inicio do voto;
	parameter S1 = 1; //Entrada 1;
	parameter S2 = 2; //Entrada 2;
	parameter S3 = 3; //Entrada !1 e !2;
	parameter S4 = 4; //Entrada 3 apos S1 // voto valido
	parameter S5 = 5;// Entrada 2 apos S2 // voto valido
	parameter S6 = 6; // voto nulo
	
	always @(posedge clock)begin
	if(finish) state = S0;
	else if(start) 
	begin
		digit1 = 4'b1101;
		digit2 = 4'b1101;
		state = S0;
		C1 = 7'b0000000;
		C2 = 7'b0000000;
		Nulo = 7'b0000000;
	end
	else if(valid) 
	begin
		if(state == S0) digit1 = digit;
		else if(state == S1) digit2 = digit;
		else if(state == S2) digit2 = digit;
		else if(state == S3) digit2 = digit;
		if(state == S4) 
		begin
			digit1 = 4'b1101;
			digit2 = 4'b1101;
			if(swap) C2 <= C2 + 7'b0000001;
			else C1 <= C1 + 7'b0000001;
		end
		else if(state == S5) 
		begin
			digit1 = 4'b1101;
			digit2 = 4'b1101;
			if(swap) C1 <= C1 + 7'b0000001;
			else C2 <= C2 + 7'b0000001;
		end
		else if(state == S6) 
		begin
			digit1 = 4'b1101;
			digit2 = 4'b1101;
			Nulo <= Nulo + 7'b0000001;
		end
		state = next_state;
	end
end

always @(posedge valid)begin
	if(state == S0)
	begin
		vote_status = 2'b00;
		if(digit == 4'b0001) next_state = S1;
		else if (digit == 4'b0010) next_state = S2;
		else next_state = S3;
	end
	
	else if(state == S1)
	begin
		if(digit == 4'b0011) next_state = S4;
		else next_state = S6;
	end
	
	else if(state == S2)
	begin
		if(digit == 4'b0010) next_state = S5;
		else next_state = S6;
	end
	
	else if(state == S3)
	begin
		next_state = S6;
	end
	
	else if(state == S4)
	begin 
		vote_status = 2'b01;
		next_state = S0;
	end	
	else if(state == S5)
	begin
		vote_status = 2'b01;
		next_state = S0;
	end
	else if(state == S6)
	begin
		vote_status = 2'b10;
		next_state = S0;
	end

end


endmodule
