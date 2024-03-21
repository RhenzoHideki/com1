#import "../typst-ifsc/templates/article.typ": article


  #show: doc => article(
    title: "Laboratorio 02",
    subtitle: "	Sistemas de comunicação I (COM029007)",
    // Se apenas um autor colocar , no final para indicar que é um array
    authors:("Rhenzo Hideki Silva Kajikawa",),
    date: "17 de março de 2024",
    doc,
  )

  = Introdução
Este labotatório tem como objetivo a pratica dos diferentes modos de modulação apresentados no capitulo estudado. Estas modulações são a AM DSB-TC e AM DSB-SC.

Com isso pode-se ver a diferença entre as modulações tanto quando é tratada a soma dos diferentes sinais , quanto a transmissão do sinal e a após isso a demodulação do sinal para recupera-los.

= Desenvolvimento
== Conceitos teóricos utilizados no relatório
Nesse laboratório foram utilizados conceitos de deslocamento e de modulações analógicas dos sinais para simular uma transmissão.

A aplicação de deslocamentos para enviar mais de um sinal em diferentes bandas de frequências. mostra a importância de modular o sinal.

A utilização de filtros permite que quando fosse enviado ou quando fosse demodulado o sinal , não houve interferência de sinais entre si.
== Exercicio 01
 Comando da questão:
+ Realizar um processo de modulação AM DSB e AM DSB-SC
+ Para o caso da modulação AM DSB-SC, realizar o processo de demodulação utilizando a função 'fir1'
+ Para o caso da modulaçao AM DSB, variar o 'fator de modulação' (0.25; 0.5; 0.75 e 1 e 1.5) e observar os efeitos no sinal modulado

#pagebreak()
=== Resultados Exercicio 01
#figure(
  image("./Figuras/E1/SinalEPortadora.svg",width:100%),
  caption: [
     Sinais gerados para a questão \ Fonte: Elaborada pelo autor
  ],
  supplement: "Figura"
);

A figura mostras os sinais $m(t)$ o sinal transmitido em vermelho , e $c(t)$ a portadora em verde.

#figure(
  image("./Figuras/E1/dsb-sc.svg",width:90%),
  caption: [
     Sinais utilizando modulação AM DSC-SC\ Fonte: Elaborada pelo autor
  ],
  supplement: "Figura"
);

A figura mostra a modulação feita no sinal utilizando AM DSB-SC 

#figure(
  image("./Figuras/E1/025-dsb-tc.svg",width:90%),
  caption: [
     Sinais utilizando modulação AM DSC-TC com fator 0.25\ Fonte: Elaborada pelo autor
  ],
  supplement: "Figura"
);
#figure(
  image("./Figuras/E1/050-dsb-tc.svg",width:90%),
  caption: [
     Sinais utilizando modulação AM DSC-TC com fator 0.5\ Fonte: Elaborada pelo autor
  ],
  supplement: "Figura"
);
#figure(
  image("./Figuras/E1/075-dsb-tc.svg",width:90%),
  caption: [
     Sinais utilizando modulação AM DSC-TC com fator 0.75\ Fonte: Elaborada pelo autor
  ],
  supplement: "Figura"
);
#figure(
  image("./Figuras/E1/100-dsb-tc.svg",width:90%),
  caption: [
     Sinais utilizando modulação AM DSC-TC com fator 1.00\ Fonte: Elaborada pelo autor
  ],
  supplement: "Figura"
);
#figure(
  image("./Figuras/E1/125-dsb-tc.svg",width:90%),
  caption: [
     Sinais utilizando modulação AM DSC-TC com fator 1.25\ Fonte: Elaborada pelo autor
  ],
  supplement: "Figura"
);

Da figura 3 a 7 temos 5 modulações AM DSB-TC , porém a diferença entre elas é o fator de modulação que foi alterado em cada um, variando de 0.25 até 1.25 incrementando 0.25 cada vez. Nesses gráficos é possivel observar os efeitos dessas variações alterando o valor da banda do sinal localizado no meio das frequencia

#figure(
  image("./Figuras/E1/025-dsb-tc-filtrado.svg",width:90%),
  caption: [
     Sinais utilizando modulação AM DSC-TC com fator 0.25\ Fonte: Elaborada pelo autor
  ],
  supplement: "Figura"
);
#figure(
  image("./Figuras/E1/050-dsb-tc-filtrado.svg",width:90%),
  caption: [
     Sinais utilizando modulação AM DSC-TC com fator 0.5\ Fonte: Elaborada pelo autor
  ],
  supplement: "Figura"
);
#figure(
  image("./Figuras/E1/075-dsb-tc-filtrado.svg",width:90%),
  caption: [
     Sinais utilizando modulação AM DSC-TC com fator 0.75\ Fonte: Elaborada pelo autor
  ],
  supplement: "Figura"
);
#figure(
  image("./Figuras/E1/100-dsb-tc-filtrado.svg",width:90%),
  caption: [
     Sinais utilizando modulação AM DSC-TC com fator 1.00\ Fonte: Elaborada pelo autor
  ],
  supplement: "Figura"
);
#figure(
  image("./Figuras/E1/125-dsb-tc-filtrado.svg",width:90%),
  caption: [
     Sinais utilizando modulação AM DSC-TC com fator 1.25\ Fonte: Elaborada pelo autor
  ],
  supplement: "Figura"
);
Da figura 8 a 12 temos 5 modulações AM DSB-TC são os sinais restaurados. São todos sinais restaurados que passaram por um filtro e osciladores para restarar o sinal o mais próximo do original.  

#pagebreak()
== Exercicio 02
Comando da questão:
+ Gerar 3 sinais (cosenos) nas frequências 1k, 2k e 3k
+ Realizar a multiplexação dos sinais para as frequências 10k,12k e 14k para a transmissão em um canal de comunicação
+ Recuperar os sinais originais

#pagebreak()
=== Resultados Exercicio 02
#figure(
  image("./Figuras/E2/sinais.svg",width:130%),
    caption: [
     Sinais gerados no dominio do tempo e da frequência \ Fonte: Elaborada pelo autor
  ],
  supplement: "Figura"
  
);
A figura 13 são os 3 sinais gerados pedidos pela questão , sendo o lado esquedo da imagem o domínio do tempo e na esquerda no domínio da frequência. Já as cores representa o mesmo sinal nos diferentes domínios.

#figure(
  image("./Figuras/E2/sinaisDeslocados.svg",width:100%),
    caption: [
     Sinais Deslocados \ Fonte: Elaborada pelo autor
  ],
  supplement: "Figura"
  
);
Nessa figura foi deslocado os sinais. O sinal de 1 kHz foi deslocado em 10kHz , o sinal de 2kHz foi deslocado em 12 KHz, o sinal de 3kHz foi deslocado em 14 kHz.

#figure(
  image("./Figuras/E2/SinalFiltradoMeiaBanda.svg",width:100%),
    caption: [
     Sinais Deslocados e meia banda \ Fonte: Elaborada pelo autor
  ],
  supplement: "Figura"
  
);
Nessa figura os sinais deslocados tiveram metade de sua banda filtrada antes de serem somados no sinal final.

#figure(
  image("./Figuras/E2/SinaisSomados.svg",width:100%),
    caption: [
     Sinais Deslocados e meia banda \ Fonte: Elaborada pelo autor
  ],
  supplement: "Figura"
  
);
Nessa figura foram somados os 3 sinais. Mostrando encima o sinal no domínio do tempo e em baixo no domínio da frequência.
#figure(
  image("./Figuras/E2/sinalRecuperado1k.svg",width:80%),
    caption: [
     Sinais de 1kHz recuperado \ Fonte: Elaborada pelo autor
  ],
  supplement: "Figura"
  
);
#figure(
  image("./Figuras/E2/sinalRecuperado2k.svg",width:80%),
    caption: [
     Sinais de 2kHz recuperado \ Fonte: Elaborada pelo autor
  ],
  supplement: "Figura"
  
);
#figure(
  image("./Figuras/E2/sinalRecuperado3k.svg",width:80%),
    caption: [
     Sinais de 3kHz recuperado \ Fonte: Elaborada pelo autor
  ],
  supplement: "Figura"
  
);

As figuras 17,18 e 19 são os sinais recuperados a partir do sinal resultante da soma dos 3 sinais deslocados e filtrados em meia banda. Sendo esses recupedos da mesma forma , passando pelos deslocamentos que sofreram anteriormente e sendo filtrados.



= Conclusão
A prática realizada neste laboratório proporcionou uma compreensão mais profunda sobre as modulações AM, principalmente DSB-TC e DSB-SC. Através da simulação de transmissões e demodulações, foi possível observar as diferenças entre essas modulações, tanto na soma dos sinais quanto na transmissão e recuperação dos mesmos. 

A utilização de filtros mostrou-se essencial para evitar interferências entre os sinais durante a transmissão e demodulação. Os resultados dos exercícios demonstraram claramente os efeitos da variação do fator de modulação na modulação AM DSB-TC, alterando a banda do sinal e sua frequência central. Além disso, a multiplexação de sinais e sua recuperação demonstraram a viabilidade e eficácia desses métodos em sistemas de comunicação.