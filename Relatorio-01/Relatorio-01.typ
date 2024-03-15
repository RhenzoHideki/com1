#import "../typst-ifsc/templates/article.typ": article


  #show: doc => article(
    title: "Laboratorio 01",
    subtitle: "	Sistemas de comunicação I (COM029007)",
    // Se apenas um autor colocar , no final para indicar que é um array
    authors:("Rhenzo Hideki Silva Kajikawa",),
    date: "20 de Setembro de 2023",
    doc,
  )
= Introdução
Este labotatório tem como objetivo revisar os conceitos de sinais de espectro. Tem-se como objetivo de entender e analisar os sinais nos dominios do tempo e frequência. 

Nos exercicios apresentados foram apresentados ideias de composição e manipulação de sinais , mudança de dominios do tempo e da frequência, e a utilização de filtros ideais e reais para a recuperação dos sinais originais.

= Desenvolvimento
== Conceitos teóricos utilizados no relatório
A utilização de conceitos básicos de sinais e sistemas, utilizando sistmeas lineares e invariantes no tempo. A analise de sinais tanto no dominio do tempo quanto na frequencia e as suas devidas manipulações.

A aplicação da Transformada de Fourier permite a análise de sinais no domínio da frequência, decompondo um sinal em suas componentes de frequência e possibilitando a compreensão da distribuição espectral do sinal.

A autocorrelação desempenha um papel na análise ao identificar padrões temporais e calcular a similaridade entre diferentes partes do sinal.

Os filtros são utilizados para observar características e aplicações dos sinais, modificando suas características, atenuando certas frequências ou realçando outras.

== Exercicio 01
 Comando da questão:

  + Gerar um sinal s(t) composto pela somatória de 3 senos com amplitudes de 6V, 2V e 4V e frequências de 1, 3 e 5 kHz, respectivamente.

  + Plotar em uma figura os três cossenos e o sinal 's ' no domínio do tempo e da frequência.

  + Utilizando a função 'norm', determine a potência média do sinal 's'.

 + Utilizando a função 'pwelch', plote a Densidade Espectral de Potência do sinal 's'.  

#pagebreak()
=== Resultados Exercicio 01
#figure(
  image("./Figuras/E1/DomTemp.svg",width:130%),
  caption: [
     Sinais gerados no dominio do tempo \ Fonte: Elaborada pelo autor
  ],
  supplement: "Figura"
);

  Na Figura 1 são apresentados os 4 gráficos que foram pedidos pela questão. Estes estão sendo apresentados no dominio do tempo.
  Os graficos são cossenos de 6V , 2V e 4V e frequências de 1, 3 e 5 kHz , respectivamente, além do sinal $s(t)$ que foi gerado a partir da soma dos 3 cossenos anteriores 


#figure(
  image("./Figuras/E1/DomFreq.svg",width:130%),
  caption: [
     Sinais gerados no dominio da frequência \ Fonte: Elaborada pelo autor
  ],
  supplement: "Figura"
);

  Na Figura 2 são apresentados os 4 sinais anteriores da Figura 1 , porém agora foram apresentados no dominio da frequência. É possível ver de forma mais clara que o 4 sinal ($s(t)$) é o resultado da soma dos outros 3 sinais ,apenas analizando as componentes da frequencia.
#figure(
  image("./Figuras/E1/pwelch.svg",width:90%),
    caption: [
     Sinais gerados com a função pwelch \ Fonte: Elaborada pelo autor
  ],
  supplement: "Figura"
);

  
  A Figura 3 mostra o resultado da função pwelch, esta que retorna a densidade espectral de potência do sinal. Assim mostrando onde está a distribuição de energia do sinais nas frequência.

#pagebreak()
== Exercicio 02
+ Gerar um sinal s(t) composto pela somatória de 3 senos com amplitudes de 5V, 5/3V e 1V e frequências de 1, 3 e 5 kHz, respectivamente.
+ Plotar em uma figura os três cossenos e o sinal 's ' no domínio do tempo e da frequência
+ Gerar 3 filtros ideais:
  + Passa baixa (frequência de corte em 2kHz)
  + Passa alta (banda de passagem acima de 4kHz)
  + Passa faixa (banda de passagem entre 2 e 4kHz)
+ Plotar em uma figura a resposta em frequência dos 3 filtros
+ Passar o sinal s(t) através dos 3 filtros e plotar as saídas, no domínio do tempo e da frequência, para os 3 casos

#pagebreak()
=== Resultados Exercicio 02
#figure(
  image("./Figuras/E2/DomTemp.svg",width:130%),
    caption: [
     Sinais gerados no dominio do tempo \ Fonte: Elaborada pelo autor
  ],
  supplement: "Figura"
  
);
  Na Figura 4 são apresentados os 4 gráficos que foram pedidos pela questão. Estes estão sendo apresentados no dominio do tempo.
  Os graficos são cossenos de 5V , $5/3$V e 1V e frequências de 1, 3 e 5 kHz , respectivamente, além do sinal $s(t)$ que foi gerado a partir da soma dos 3 cossenos anteriores 



#figure(
  image("./Figuras/E2/DomFreq.svg",width:130%),
    caption: [
     Sinais gerados no dominio da frequência \ Fonte: Elaborada pelo autor
  ],
  supplement: "Figura"
);

  Na Figura 5 são apresentados os 4 sinais anteriores da Figura 4 , porém agora foram apresentados no dominio da frequência. É possível ver de forma mais clara que o 4 sinal ($s(t)$) é o resultado da soma dos outros 3 sinais ,apenas analizando as componentes da frequencia.

#figure(
  image("./Figuras/E2/Filtros.svg",width:130%),
    caption: [
     Graficos dos Filtros  \ Fonte: Elaborada pelo autor
  ],
  supplement: "Figura"

);
Na Figura 6 são apresentados 3 filtros , em vermelho um filtro passa baixa de 2kHz , em verde um filto passa alta de 4kHz e por fim em azul um filtro passa faixa de 2 a 4 kHz.

#pagebreak()
#figure(
  image("./Figuras/E2/SinaisFiltrados.svg",width:130%), 
    caption: [
     Sinais Filtrados em ambos dominios \ Fonte: Elaborada pelo autor
  ],
  supplement: "Figura"
);
Na Figura 7 é apresentado o sinal s(t) filtrado pelos 3 filtros anteriores , cada um sendo mostrado a o resultado no dominio da frequencia a esquerda e no dominio do tempo a direita

#pagebreak()
== Exercicio 03
+ Gerar um vetor representando um ruído com distribuição normal utilizando a função 'randn' do matlab. Gere 1 segundo de ruído considerando um tempo de amostragem de 1/10k.
+ Plotar o histograma do ruído para observar a distribuição Gaussiana. Utilizar a função 'histogram'
+ Plotar o ruído no domínio do tempo e da frequência Utilizando a função 'xcorr', plote a função de autocorrelação do ruído.
+ Utilizando a função 'filtro=fir1(50,(1000*2)/fs)', realize uma operação de filtragem passa baixa do ruído. Para visualizar a resposta em frequência do filtro projetado, utilize a função 'freqz'.
+ Plote, no domínio do tempo e da  frequência, a saída do filtro e o histograma do sinal filtrado

#pagebreak()
=== Resultados Exercicio 03  
#figure(
  image("./Figuras/E3/hist.svg",width:130%), 
    caption: [
     Histograma gerado pelo randn \ Fonte: Elaborada pelo autor
  ],
  supplement: "Figura"
);
Figura 8 mostra o histograma gerado por um randn , com intuito de simular um ruido branco.

#figure(
  image("./Figuras/E3/domTempFreq.svg",width:130%), 
    caption: [
     Sinais Filtrados em ambos dominios \ Fonte: Elaborada pelo autor
  ],
  supplement: "Figura"

);
A figura 9 mostra o ruido branco gerado pelo rand , tanto no dominio do tempo quanto no dominio da frequencia.


#figure(
  image("./Figuras/E3/xcorr.svg",width:130%), 
    caption: [
     Grafico gerado pelo xcorr \ Fonte: Elaborada pelo autor
  ],
  supplement: "Figura"
);
Na figura 10 é mostrado o resultado gerado pela função xcorr, seu intuito é de calcular a relação cruzada do sinal.

#figure(
  image("./Figuras/E3/filtro.svg",width:130%), 
    caption: [
     Gráfico dos filtros \ Fonte: Elaborada pelo autor
  ],
  supplement: "Figura"

);
Figura 11 mostra como é o comportamento do filtro passa baixa que geramos com base no comando 'filtro=fir1(50,(1000*2)/fs)'. 

#figure(
  image("./Figuras/E3/SinalFiltrado.svg",width:130%), 
    caption: [
     Sinal Filtrado \ Fonte: Elaborada pelo autor
  ],
  supplement: "Figura"

);

Na Figura 12 é possivel ver o ruido branco no dominio do tempo e da frequência após aplicarmos o filtro passa baixo no ruido.

#figure(
  image("./Figuras/E3/histFiltrado.svg",width:130%), 
    caption: [
     Histograma do sinal filtrado \ Fonte: Elaborada pelo autor
  ],
  supplement: "Figura"

);
A figura 13 é um histograma do ruido branco após ser aplicado o filtro.   

= Conclusão
Neste laboratório, foram explorados conceitos fundamentais de sinais e sistemas, com a aplicação prática na análise e manipulação de sinais nos domínios do tempo e da frequência. Através dos exercícios realizados, foi possível compreender a composição de sinais complexos, a importância da amostragem e taxa de amostragem, bem como o papel crucial da Transformada de Fourier na análise espectral de sinais.

Os resultados obtidos nos exercícios demonstraram a aplicação prática dos conceitos teóricos estudados. A visualização dos sinais no domínio do tempo e da frequência, juntamente com a análise da densidade espectral de potência, proporcionou uma compreensão mais profunda da distribuição de energia dos sinais nas diferentes frequências. A aplicação dos filtros ideais e a análise dos sinais filtrados destacaram a importância dos filtros na manipulação e recuperação de sinais originais, ressaltando a necessidade de escolher o filtro adequado para cada aplicação.

Desta forma o laboratório foi essencial para solidificar o entendimento sobre sinais e sistemas, proporcionando uma base sólida para a análise e processamento de sinais em diversas aplicações. O conhecimento adquirido neste laboratório é fundamental para futuros estudos e aplicações práticas no campo da engenharia de sistemas e processamento de sinais.