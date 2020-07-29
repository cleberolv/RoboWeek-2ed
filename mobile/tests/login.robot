***Settings***
Documentation           Testes de autenticação do app NinjaChef Mobile

Resource        ../resources/base.robot

Test Setup      Open Session
Test Teardown   Close Session

***Test Cases***
Acessar o cardapio
    Dado que desejo comer "Saladas"
    Quando entro com o email "cleberqa@gmail.com.br"
    Então vejo a lista de pratos por tipo