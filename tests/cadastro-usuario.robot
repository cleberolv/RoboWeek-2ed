***Settings***
Documentation       Suite dos testes de cadastro

Resource        ../resources/base.robot

Test Setup      Open Session
Test Teardown   Close Session

***Test Cases***
Realizar cadastro simples
    Dado que acesso a página principal
    Quando submeto o meu email "cleberol@gmail.com"
    Então devo ser autenticado

Cadastro com email incorreto
    Dado que acesso a página principal
    Quando submeto o meu email "cleberr&.co"
    Então devo ver a mensagem "Oops. Informe um email válido!"

Cadastro com email não informado
    Dado que acesso a página principal
    Quando submeto o meu email "${EMPTY}"
    Então devo ver a mensagem "Oops. Informe um email válido!"