*** Settings ***
Library    Browser


*** Variables ***
${BROWSER}         chromium
${HEADLESS}        ${false}


*** Keywords ***
Tirar Print
  Take Screenshot

Acessar "${site}"
  New Browser      browser=${BROWSER}  headless=${HEADLESS}
  New Page         url=${site}

Selecionar opção "${opcao}"
  Select Options By    id=dropdown    text    ${opcao}

Obter frase de dentro do iFrame
  ${text}  Get Text    id=mce_0_ifr >>> id=tinymce
  Log  ${text}

Conferindo valores em tabelas
  Click   id=table1 >> text=Last Name
  # Conferindo o valor de uma célula específica
  # Nesse exemplo pegamos o elemento que corresponde a
  # célula da segunda linha (indice 1) e segunda coluna (indice 1)
  ${elemento}  Get Table Cell Element    id=table1    1    1
  ${nome}      Get Text     ${elemento}  ==  Frank
  Log   ${nome}

  # Podemos também ir pelo nome da coluna que queremos obter o valor
  # passando um valor que exista na linha (em qualquer coluna)
  # No exemplo abaixo confiro se o First Name do e-mail fbach@yahoo.com é Frank
  ${elemento}  Get Table Cell Element    id=table1    "First Name"    "fbach@yahoo.com"
  ${nome}      Get Text     ${elemento}  ==  Frank
  Log   ${nome}

Clicar e ir para a nova página aberta
  Click  text="Click Here"
  Switch Page  NEW
  Get Text    h3  ==  New Window
  Tirar Print

Voltar para a página inicial
  [Arguments]  ${pagina_id}
  Switch Page  ${pagina_id}[0]
  Tirar Print