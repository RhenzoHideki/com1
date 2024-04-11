#import "@preview/klaro-ifsc-sj:0.1.0": report


#show: doc => report(
  title: "Relatório 04",
  subtitle: "	Sistemas de comunicação I (COM029007)",
  // Se apenas um autor colocar , no final para indicar que é um array
  authors:("Rhenzo Hideki Silva Kajikawa",),
  date: "17 de março de 2024",
  doc,
)

= Introdução
Este relatório abrange as seções 9.1 a 9.4 do livro "Software Defined Radio Using MATLAB & Simulink and the RTL-SDR", detalhando aspectos teóricos e práticos da Modulação em Frequência (FM). Serão abordados temas como a história da FM, a matemática da FM e o Índice de Modulação, a largura de banda do sinal FM e a demodulação FM. Além disso, serão apresentadas conclusões sobre os tópicos discutidos.

#pagebreak()
= Conteúdo teórico
== 9.1 História do Padrão FM

A Modulação em Frequência (FM) foi concebida por Edwin Howard Armstrong em 1933 como uma solução para os problemas de ruído estático em transmissões de AM. Armstrong, renomado professor da Columbia University e engenheiro elétrico, contribuiu significativamente para o campo do rádio, desenvolvendo processos como a regeneração e o receptor super-heteródino. Apesar de suas contribuições, Armstrong enfrentou disputas legais que culminaram em seu suicídio em 1954. A popularização da FM ocorreu nas décadas de 1960 e 1970, superando as estações de AM em número.

== 9.2 Matemática da FM e o Índice de Modulação

A modulação FM é fundamentada em conceitos matemáticos, com destaque para o Oscilador Controlado por Tensão (VCO) como gerador de sinais FM. As equações que descrevem a modulação FM relacionam a frequência de modulação, a constante de modulação FM e o sinal de informação, resultando em sinais cujas variações de frequência são proporcionais à amplitude do sinal de informação. Além disso, a modulação FM com um sinal de informação composto por várias frequências é abordada, evidenciando como a composição espectral do sinal de informação influencia a largura de banda do sinal FM.

== 9.3 Largura de Banda do Sinal FM

A largura de banda do sinal FM é determinada pelo índice de modulação, permitindo classificá-la em estreita (NFM) ou larga (WFM). A NFM, com pequeno desvio de frequência, permite simplificações matemáticas. Já a WFM, com desvio de frequência maior e usada em estações de rádio comerciais, possui largura de banda teoricamente infinita, mas limitada na prática por padrões regulatórios. A regra de Carson é discutida para estimar a largura de banda necessária para transmitir o sinal FM com distorção mínima.

== 9.4 Demodulação FM Usando Diferenciação

A demodulação FM pode ser realizada diferenciando o sinal recebido, gerando um sinal que, após detecção de envelope, revela a informação original. Esse processo é um método padrão para demodular sinais FM, aproveitando as propriedades matemáticas da diferenciação para extrair a modulação de frequência como variações de amplitude.

#pagebreak()
= Desenvolvimento
O capitulo a seguir irá detalhar os resultados obtidos sobre a modulação e demodulação trabalhada em sala.

#figure(
  image("./Figuras/Sinais.png",width:100%),
  caption: [
     Sinais genéricos gerados \ Fonte: Elaborada pelo autor
  ],
  supplement: "Figura"
);
O primeiro sinal é o sinal que será modulado.
\ O segundo sinal é o sinal da portadora
\ O Terceiro sinal é o sinal modulado , utilizando a modulação fm. como aprendido na aula utilizamos a equação $ s_t = A_c.*cos(2*pi*f_c*t + T_s*k_0*integral m(t) dif t) $ para modular o sinal

#figure(
  image("./Figuras/frequencia.png",width:100%),
  caption: [
     Frequência dos sinais gerados \ Fonte: Elaborada pelo autor
  ],
  supplement: "Figura"
);

Nesta figura é possivel ver o dominio da frequência dos respectivos sinais comentados da figura 1. Onde a primeira parte em azul está parte da demodulação podendo se ver a alteração na frequência e amplitude em relação ao sinal em vermelho, a segunda parte é o dominio da frequência.

#figure(
  image("./Figuras/sinaisRestaurado.png",width:100%),
  caption: [
     Sinais Restaurados \ Fonte: Elaborada pelo autor
  ],
  supplement: "Figura"
);
Na figura 3 é possivel ver parte do processo de demodulação.

= Conclusão
Com base nos estudos realizados nas seções 9.1 a 9.4, pode-se concluir que a Modulação em Frequência (FM) é uma técnica importante no campo das telecomunicações, tendo sido desenvolvida como uma solução para os problemas de ruído estático em transmissões de AM. A matemática da FM envolve equações que descrevem a relação entre a frequência de modulação, a constante de modulação FM e o sinal de informação, resultando em sinais com variações de frequência proporcionais à amplitude do sinal de informação. A largura de banda do sinal FM é influenciada pelo índice de modulação, podendo ser classificada em estreita (NFM) ou larga (WFM). A demodulação FM pode ser realizada através da diferenciação do sinal recebido, gerando um sinal que, após detecção de envelope, revela a informação original. Este processo é um método padrão para demodular sinais FM, aproveitando as propriedades matemáticas da diferenciação para extrair a modulação de frequência como variações de amplitude.