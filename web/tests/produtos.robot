***Settings***
Documentation       Cadastro de produtos/pratos
...                 Sendo um cozinheiro amador
...                 Quero cadastrar meus melhores pratos
...                 Para que eu possa cozinha-los para outras pessoas

Resource            ../resources/base.robot

Test Setup      Login Session       cleberol@gmail.com
Test Teardown   Close Session

***Variables***
&{lasanha}=          img=lasanha.jpg  nome=Lasanha bolonhesa      tipo=Massas   preco=25.00
&{strogonoff}=       img=strogonoff.jpg  nome=Strogonoff de frango      tipo=Frango   preco=22,00
&{batatinha}=        nome=Batatinha sem foto      tipo=Batata   preco=20,00

***Test Cases***
Novo prato
    Dado que "${lasanha}" é um novo prato a ser cadastrado
    Quando realizo o cadastro desse prato
    Então devo vizualizar o novo prato no dashboard

Cadastro com preço inválido
    Dado que "${strogonoff}" é um novo prato a ser cadastrado
    Quando realizo o cadastro desse prato
    Então devo ver a seguinte mensagem "Use ponto ao invés de virgulas :/"

Cadastro sem foto
    Dado que "${batatinha}" é um novo prato a ser cadastrado
    Quando realizo o cadastro desse prato sem foto
    Então devo ver a seguinte mensagem "Seu prato precisa de uma foto muito bonita!"

Exclusão de prato
    Dado que "${lasanha}" é um novo prato a ser excluido
    Quando realizo a exclusão desse prato
    Então devo vizualizar o prato excluido no dashboard