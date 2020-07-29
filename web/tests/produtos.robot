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

***Test Cases***
Novo prato
    Dado que "${lasanha}" é um novo prato a ser cadastrado
    Quando realizo o cadastro desse prato
    Então devo vizualizar o novo prato no dashboard