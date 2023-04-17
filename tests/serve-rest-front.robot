*** Settings ***
Resource        ../resources/serve-rest-front.resource
Suite Setup     Cadastrar Usuário e Logar
Suite Teardown  Close Browser  ALL
Default Tags    serve_rest_tests


*** Test Cases ***
Login com sucesso Serve Rest Front
    [Tags]  login
    Abrir o navegador
    Ir para o site Serve Rest Front
    Preencher os dados do novo usuário e cadastrar
    Conferir usuário cadastrado com sucesso

Desafio: Conferir se o novo usuário é mostrado na listagem de usuários
    [Tags]  lista_usuario
    Abrir o Site Serve Rest Front Logado
    Acessar a Lista de usuários
    Conferir que o usuário aparece na listagem

Bora praticar mais: Cadastro e Consulta de Produtos
    [Tags]  cad_produto
    Abrir o Site Serve Rest Front Logado
    Cadastrar um novo produto
    Conferir que o produto aparece na listagem

Exemplo utilizando Requisições HTTP
    [Tags]  http
    Abrir o navegador
    Ir para o site Serve Rest Front
    Criar usuário via API
    Logar com o usuário cadastrado via API

Exemplo Utilizando o Storage Armazenado no Contexto
    [Tags]  storage_contexto
    Abrir o Site Serve Rest Front Logado
    Acessar a Lista de usuários