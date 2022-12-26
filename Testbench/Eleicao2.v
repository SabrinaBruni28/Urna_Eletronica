`include "FSM.v"
`include "Display1.v"
`include "Display2.v"
module Eleicao;
	
	reg clk = 0;
	reg [3:0] digit = 0;
	reg valid = 0;
	reg finish = 0;
	reg start = 0;
	reg swap = 0;
	
	wire [3:0] dig1;
	wire [3:0] dig2;
	
	wire [1:0] vote_status;
	wire [3:0] state;
	wire [7:0] C1;
	wire [7:0] C2;
	wire [7:0] Nulo;
	wire [7:0] contC1;
	wire [7:0] contC2;
	wire [7:0] contNulo;
	wire [3:0] next_state;
	
	wire [6:0] display1;
	wire [6:0] display2;
	wire [6:0] dis1;
	wire [6:0] dis2;
	wire [6:0] displayCem;
	wire [6:0] displayDez;
	wire [6:0] displayUm;	
	
	test t(
		.clock(clk), 
		.digit(digit), 
		.valid(valid),
		.finish(finish),
		.start(start),
		.swap(swap),
		
		.digit1(dig1),
		.digit2(dig2),
		.vote_status(vote_status),
		.state(state),
		.C1(C1),
		.C2(C2),
		.Nulo(Nulo)
		);
	
	Display d1(
		.dig1(dig1),
		.display1(dis1)
		);
	
	Display d2(
		.dig1(dig2),
		.display1(dis2)
		);
	
	Display2 um(
		.clock(clk),
		.finish(finish),
		.start(start),
		.c1(C1),
		.c2(C2),
		.nulo(Nulo),	
		.display1(display1),
		.display2(display2),
		.displayCem(displayCem),
		.displayDez(displayDez),
		.displayUm(displayUm)
		);
	
	always #1 clk = ~clk;
	
	always
	begin
		#1 $display("  %b   |   %b  |   %b   |    %b   |   %b   | %b |      %b     |  %b  | %b | %b |%d |%d | %d  |  %0t", clk, swap, valid, finish, start, state, vote_status, digit, dig1, dig2, C1, C2, Nulo, $time);
	end
	
	//always #1 $display("clk: %b", clk);
	
	initial begin
		#0 $dumpfile("apuracao.vcd");
		#0 $dumpvars(0, Eleicao);
		#0 $display("Clock | Swap | Valid | Finish | Start |  State  | Vote Status | Digito | dig1 | dig2 | C1 | C2 | Nulo | Time ");
		
		//Inicio da primeira eleicao
			//t = 0
			#0 $display("Inicio da primeira eleicao");
			#0 start = 1;
			#0 valid = 1;
			
			//t = 2
			#2 valid = 0;
			#0 start = 0;
		
		//Insercao do digito 9
			//t = 4
			#2 $display("\n\nInsercao do digito 9");
			#0 digit = 9;
			#0 valid = 1;
			
			//t = 6
			#2 valid = 0;
		
		//Insercao do dígito 1
			//t = 8
			#2 $display("Insercao do digito 1");
			#0 digit = 1;
			#0 valid = 1;
			
			//t = 10
			#2 valid = 0;
		
		//Confirmacao do voto 91
			//t = 12
			#2 $display("Confirmacao do voto 91");
			#0 valid = 1;
			
			//t = 14
			#2 valid = 0;
		
		//Insercao do digito 1
			//t = 16
			#2 $display("\n\nInsercao do digito 1");
			#0 digit = 1;
			#0 valid = 1;
			
			//t = 18
			#2 valid = 0;
		
		//Insercao do digito 3
			//t = 20
			#2 $display("Insercao do digito 3");
			#0 digit = 3;
			#0 valid = 1;
			
			//t = 22
			#2 valid = 0;
		
		//Confirmacao do voto 13
			//t = 24
			#2 $display("Confirmacao do voto 13");
			#0 valid = 1;
			
			//t = 26
			#2 valid = 0;
		
		//Finalizacao da eleicao 1, exibicao dos votos do lula
			//t = 28
			#2 $display("\n\nFinalizacao da eleicao 1, exibicao dos votos do lula");
			#0 finish = 1;
			
			//t = 30
			#2 finish = 0;
		
		//Exibicao dos votos do bolsonaro
			//t = 32
			#2 $display("Exibicao dos votos do bolsonaro");
			#0 finish = 1;
			
			//t = 34
			#2 finish = 0;
		
		//Exibicao dos votos nulos
			//t = 36
			#2 $display("Exibicao dos votos nulos");
			#0 finish = 1;
			
			//t = 38
			#2 finish = 0;
		
		//Início da segunda eleicao
			//t = 40
			#2 $display("\n\nInicio da segunda eleicao");
			#0 start = 1;
			#0 valid = 1;
			
			//t = 42
			#2 valid = 0;
			#0 start = 0;
		
		//Insercao do digito 5
			//t = 44
			#2 $display("\n\nInsercao do digito 5");
			#0 digit = 5;
			#0 valid = 1;
			
			//t = 46
			#2 valid = 0;
		
		//Insercao do digito 1
			//t = 48
			#2 $display("Insercao do digito 1");
			#0 digit = 1;
			#0 valid = 1;
			
			//t = 50
			#2 valid = 0;
		
		//Confirmacao do voto 51
			//t = 52
			#2 $display("Confirmacao do voto 51");
			#0 valid = 1;
			
			//t = 54
			#2 valid = 0;
		
		//Insercao do digito 1
			//t = 56
			#2 $display("\n\nInsercao do digito 1");
			#0 digit = 1;
			#0 valid = 1;
			
			//t = 58
			#2 valid = 0;
		
		//Insercao do digito 3
			//t = 60
			#2 $display("Insercao do digito 3");
			#0 digit = 3;
			#0 valid = 1;
			
			//t = 62
			#2 valid = 0;
		
		//Confirmacao do voto 13
			//t = 64
			#2 $display("Confirmacao do voto 13");
			#0 valid = 1;
			
			//t = 66
			#2 valid = 0;
		
		//Insercao do digito 2
			//t = 68
			#2 $display("\n\nInsercao do digito 2");
			#0 digit = 2;
			#0 valid = 1;
			
			//t = 70
			#2 valid = 0;
		
		//Insercao do digito 2
			//t = 72
			#2 $display("Insercao do digito 2");
			#0 valid = 1;
			
			//t = 74
			#2 valid = 0;
		
		//Confirmacao do voto 22
			//t = 76
			#2 $display("Confirmacao do voto 22");
			#0 valid = 1;
			
			//t = 78
			#2 valid = 0;
		
		//Insercao do digito 1
			//t = 80
			#2 $display("\n\nInsercao do digito 1");
			#0 digit = 1;
			#0 valid = 1;
			
			//t = 82
			#2 valid = 0;
		
		//Insercao do digito 3
			//t = 84
			#2 $display("Insercao do digito 3");
			#0 digit = 3;
			#0 valid = 1;
			
			//t = 86
			#2 valid = 0;
		
		//Confirmacao do voto 13
			//t = 88
			#2 $display("Confirmacao do voto 13");
			#0 valid = 1;
			
			//t = 90
			#2 valid = 0;
		
		//Insercao do digito 2
			//t = 92
			#2 $display("\n\nInsercao do digito 2");
			#0 digit = 2;
			#0 valid = 1;
			
			//t = 94
			#2 valid = 0;
		
		//Insercao do digito 0
			//t = 96
			#2 $display("Insercao do digito 0");
			#0 digit = 0;
			#0 valid = 1;
			
			//t = 98
			#2 valid = 0;
		
		//Confirmacao do voto 20
			//t = 100
			#2 $display("Confirmacao do voto 20");
			#0 valid = 1;
			
			//t = 102
			#2 valid = 0;
		
		//Insercao do digito 1
			//t = 104
			#2 $display("\n\nInsercao do digito 1");
			#0 digit = 1;
			#0 valid = 1;
			
			//t = 106
			#2 valid = 0;
		
		//Insercao do digito 2
			//t = 108
			#2 $display("Insercao do digito 2");
			#0 digit = 2;
			#0 valid = 1;
			
			//t = 110
			#2 valid = 0;
		
		//Confirmacao do voto 12
			//t = 112
			#2 $display("Confirmacao do voto 12");
			#0 valid = 1;
			
			//t = 114
			#2 valid = 0;
		
		//Insercao do digito 1 e ativacao do swap
			//t = 116
			#2 $display("\n\nInsercao do digito 1 e ativacao do swap");
			#0 swap = 1;
			#0 digit = 1;
			#0 valid = 1;
			
			//t = 118
			#2 valid = 0;
		
		//Insercao do dígito 3
			//t = 120
			#2 $display("Insercao do digito 3");
			#0 digit = 3;
			#0 valid = 1;
			
			//t = 122
			#2 valid = 0;
		
		//Confirmacao do voto 13 com swap ativo
			//t = 124
			#2 $display("Confirmacao do voto 13 (swapped)");
			#0 valid = 1;
			
			//t = 126
			#2 valid = 0;
		
		//Insercao do digito 2
			//t = 128
			#2 $display("\n\nInsercao do digito 2 (swap ainda ativo)");
			#0 digit = 2;
			#0 valid = 1;
			
			//t = 130
			#2 valid = 0;
		
		//Insercao do digito 3
			//t = 132
			#2 $display("Insercao do digito 2");
			#0 digit = 2;
			#0 valid = 1;
			
			//t = 134
			#2 valid = 0;
		
		//Confirmacao do voto 13 com swap ativo
			//t = 136
			#2 $display("Confirmacao do voto 22 (swapped)");
			#0 valid = 1;
			
			//t = 138
			#2 valid = 0;
		
		//Finalizacao da eleicao 2, exibicao dos votos do lula
			//t = 140
			#2 $display("\n\nFinalizacao da eleicao 2, exibicao dos votos do lula");
			#0 finish = 1;
			
			//t = 142
			#2 finish = 0;
		
		//Exibicao dos votos do bolsonaro
			//t = 144
			#2 $display("Exibicao dos votos do bolsonaro");
			#0 finish = 1;
			
			//t = 146
			#2 finish = 0;
		
		//Exibicao dos votos nulos
			//t = 148
			#2 $display("Exibicao dos votos nulos");
			#0 finish = 1;
			
			//t = 150
			#2 finish = 0;
				
		//Fim da simulacao
			//t = 152
			#2 $finish;
	end

endmodule
