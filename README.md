# Urna_Eletronica
## Trabalho 2 - ISLD
Uma Máquina de Estados Finitos (Finite State Machine) é um modelo matemático
amplamente utilizado na representação do comportamento de sistemas computacionais e
circuitos lógicos em geral. O modelo pode ser genericamente descrito como uma máquina
abstrata que sempre deve estar em algum de seus finitos estados, um por vez. O estado no
qual a máquina se encontra em dado instante é conhecido como estado atual. Todos os
estados armazenam informações sobre o passado, isto é, as mudanças ocorridas desde o
início do sistema até o presente momento. Uma transição indica uma mudança de estado e
é descrita através de uma condição que precisa ser realizada para que tal transição ocorra.
Uma ação é a descrição de uma atividade que deve ser realizada em um determinado
momento.

Diante das conjecturas da atual desconfiança do modelo eleitoral brasileiro, este
trabalho prático consiste no projeto e implementação de uma Máquina de Estados Finitos
que simule o comportamento de uma Urna Eletrônica maliciosa, que pode ou não transferir
o voto para o candidato correto. A FSM deverá ser responsável por receber o número de
um candidato e concluir se o voto é válido ou não, de acordo com as especificações abaixo:

A urna possui dois candidatos;
Os votos são contabilizados individualmente;
Os candidatos são identificados através de números de 2 dígitos, os números
fictícios dos candidatos deverão ser escolhidos pelos integrantes do grupo.
Qualquer voto destinado a um número inválido (diferente dos números dos
candidatos cadastrados) é contabilizado como nulo;
O pleito elege um único candidato. Isso significa que um eleitor pode votar em
somente um dos dois candidatos disponíveis.


A linguagem de descrição de hardware Verilog deverá ser utilizada para descrever o circuito
tanto em ambiente virtual (simulação) quanto em ambiente físico (FPGA). Ao final, seu design deverá
ser capaz de receber um número, dígito por dígito, concluir se o número corresponde a um voto
válido ou nulo, contabilizar a informação e apresentar os resultados finais.
Atenção: A Máquina de Estados Finitos deve ser projetada de forma a permitir que os votos
sejam lidos, processados e contabilizados até que o sinal de controle finish seja ativado. Construa
seus estados de forma que tal comportamento seja permitido.

### Etapas do desenvolvimento

O texto abaixo apresenta as etapas a serem consideradas no processo de desenvolvimento do
trabalho prático:
● Elaboração de um diagrama de transição de estados que apresente o comportamento do
circuito utilizando a ferramenta JFlap ou similar;

● Codificação do módulo da máquina de estados em Verilog HDL;

● Elaboração e simulação dos módulos em Verilog através da ferramenta Icarus Verilog;

● Visualização das formas de onda resultantes através da ferramenta GTKWave;

● Implementação do design criado no Kit de FPGA DE2-115 da Altera, utilizando os switches
como elementos de entrada e os displays de 7 segmentos e/ou os LEDs como elementos de
saída. 

Todos os passos descritos acima deverão ser documentados em um único relatório.
O texto deverá conter introdução, desenvolvimento, resultados, conclusão e as
referências bibliográficas utilizadas
