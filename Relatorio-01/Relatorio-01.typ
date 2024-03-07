#import "../typst-ifsc/templates/article.typ": article


  #show: doc => article(
    title: "Relatorio 01",
    subtitle: "Processos Estocásticos (PRE029006)",
    // Se apenas um autor colocar , no final para indicar que é um array
    authors:("Rhenzo Hideki Silva Kajikawa",),
    date: "20 de Setembro de 2023",
    doc,
  )

= Exercicio 01
 Comando da questão:

  + Gerar um sinal s(t) composto pela somatória de 3 senos com amplitudes de 6V, 2V e 4V e frequências de 1, 3 e 5 kHz, respectivamente.

  + Plotar em uma figura os três cossenos e o sinal 's ' no domínio do tempo e da frequência.

  + Utilizando a função 'norm', determine a potência média do sinal 's'.

 + Utilizando a função 'pwelch', plote a Densidade Espectral de Potência do sinal 's'.  

  == Resultados
/*
#figure(
  image("./Figuras/DomTemp.svg",width:80%),
);*/

  A Figura 1 mostra 4 gráficos. Esses sendo os 3 sinal no dominio do tempo com amplitudes de 6V, 2V e 4V e frequências de 1, 3 e 5 kHz, respectivamente e por fim a soma dos 3 cossenos

/*
#figure(
  image("./Figuras/DomFreq.svg",width:80%),
);
*/
  A Figura 2 mostra 4 gráficos. Esses sendo os 3 sinal no dominio da frequência com amplitudes de 6V, 2V e 4V e frequências de 1, 3 e 5 kHz, respectivamente e por fim a soma dos 3 cossenos  
/*
#figure(
  image("./Figuras/pwelch.svg",width:80%),
);
*/
  
  A Figura 3 mostra o sinal $S(f)$ de forma mais proxima ao real, pois não é um impulso preciso na frequência. 
= Exercicio 02 

/*
#figure(
  image("./Figuras/DomTemp.svg",width:80%),
);*/

/*
#figure(
  image("./Figuras/DomTemp.svg",width:80%),
);*/

/*
#figure(
  image("./Figuras/DomTemp.svg",width:80%),
);*/

/*
#figure(
  image("./Figuras/DomTemp.svg",width:80%),
);*/

= Exercicio 03