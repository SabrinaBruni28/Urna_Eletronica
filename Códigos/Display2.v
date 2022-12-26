module Display2(
		input wire clock,
		input wire start,
		input wire finish,
		input wire [7:0] c1,
		input wire [7:0] c2,
		input	wire [7:0] nulo,	
		output reg [6:0] display1,
		output reg [6:0] display2,
		output reg [6:0] displayCem,
		output reg [6:0] displayDez,
		output reg [6:0] displayUm
);
	parameter S0 = 0; //LuLa;
	parameter S1 = 1; //Bozo;
	parameter S2 = 2; //Nulo;
	
	reg [6:0] next_state;
	reg [6:0] state;
	
	always @(posedge finish)
	begin
		if(finish)
			state = next_state;
	end
		
	always @(posedge clock)begin
		if(start)
		begin
			display1 <= 7'b1111111;
			display2 <= 7'b1111111;
			displayCem <= 7'b1111111;
			displayDez <= 7'b1111111;
			displayUm <= 7'b1111111;
			next_state = S0;
		end
		else if(finish)
		begin
		case(state)
		S0:
		begin
		//Exibição dos votos de Lula
		display1 <= 7'b1111001;
		display2 <= 7'b0110000;
					
					//Atribuição da centena
					case(c1 / 100)
						//Algarismos
						0: displayCem = 7'b1000000;
						1: displayCem = 7'b1111001;
						2: displayCem = 7'b0100100;
					endcase
					//Atribuição da dezena
					case((c1 % 100) / 10)
						//Algarismos
						0: displayDez = 7'b1000000;
						1: displayDez = 7'b1111001;
						2: displayDez = 7'b0100100;
						3: displayDez = 7'b0110000;
						4: displayDez = 7'b0011001;
						5: displayDez = 7'b0010010;
						6: displayDez = 7'b0000010;
						7: displayDez = 7'b1111000;
						8: displayDez = 7'b0000000;
						9: displayDez = 7'b0010000;
					endcase
					//Atribuição da unidade
					case((c1 % 100) % 10)
						//Algarismos
						0: displayUm = 7'b1000000;
						1: displayUm = 7'b1111001;
						2: displayUm = 7'b0100100;
						3: displayUm = 7'b0110000;
						4: displayUm = 7'b0011001;
						5: displayUm = 7'b0010010;
						6: displayUm = 7'b0000010;
						7: displayUm = 7'b1111000;
						8: displayUm = 7'b0000000;
						9: displayUm = 7'b0010000;
					endcase
					next_state = S1;
		end
		S1:
		begin
				//Exibição dos votos de Jair Genocida Bolsonaro
				display1 <= 7'b0100100;
				display2 <= 7'b0100100;
				
				//Atribuição da centena
				case(c2 / 100)
					//Algarismos
					0: displayCem = 7'b1000000;
					1: displayCem = 7'b1111001;
					2: displayCem = 7'b0100100;
				endcase
				//Atribuição da dezena
				case((c2 % 100) / 10)
					//Algarismos
					0: displayDez = 7'b1000000;
					1: displayDez = 7'b1111001;
					2: displayDez = 7'b0100100;
					3: displayDez = 7'b0110000;
					4: displayDez = 7'b0011001;
					5: displayDez = 7'b0010010;
					6: displayDez = 7'b0000010;
					7: displayDez = 7'b1111000;
					8: displayDez = 7'b0000000;
					9: displayDez = 7'b0010000;
				endcase
				//Atribuição da unidade
				case((c2 % 100) % 10)
					//Algarismos
					0: displayUm = 7'b1000000;
					1: displayUm = 7'b1111001;
					2: displayUm = 7'b0100100;
					3: displayUm = 7'b0110000;
					4: displayUm = 7'b0011001;
					5: displayUm = 7'b0010010;
					6: displayUm = 7'b0000010;
					7: displayUm = 7'b1111000;
					8: displayUm = 7'b0000000;
					9: displayUm = 7'b0010000;
				endcase
				next_state = S2;
			end
		S2:
			begin
				//Exibição dos votos anulados
				display1 <= 7'b1000000;
				display2 <= 7'b1000000; 
				
				//Atribuição da centena
				case(nulo / 100)
					//Algarismos
					0: displayCem = 7'b1000000;
					1: displayCem = 7'b1111001;
					2: displayCem = 7'b0100100;
				endcase
				//Atribuição da dezena
				case((nulo % 100) / 10)
					//Algarismos
					0: displayDez = 7'b1000000;
					1: displayDez = 7'b1111001;
					2: displayDez = 7'b0100100;
					3: displayDez = 7'b0110000;
					4: displayDez = 7'b0011001;
					5: displayDez = 7'b0010010;
					6: displayDez = 7'b0000010;
					7: displayDez = 7'b1111000;
					8: displayDez = 7'b0000000;
					9: displayDez = 7'b0010000;
				endcase
				//Atribuição da unidade
				case((nulo % 100) % 10)
					//Algarismos
					0: displayUm = 7'b1000000;
					1: displayUm = 7'b1111001;
					2: displayUm = 7'b0100100;
					3: displayUm = 7'b0110000;
					4: displayUm = 7'b0011001;
					5: displayUm = 7'b0010010;
					6: displayUm = 7'b0000010;
					7: displayUm = 7'b1111000;
					8: displayUm = 7'b0000000;
					9: displayUm = 7'b0010000;
				endcase
				next_state = S0;
				end
		endcase
		end
	end
endmodule