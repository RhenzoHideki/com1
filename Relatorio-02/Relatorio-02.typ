#import "../typst-ifsc/templates/article.typ": article


  #show: doc => article(
    title: "Laboratorio 01",
    subtitle: "	Sistemas de comunicação I (COM029007)",
    // Se apenas um autor colocar , no final para indicar que é um array
    authors:("Rhenzo Hideki Silva Kajikawa",),
    date: "17 de março de 2024",
    doc,
  )