***Settings***
Documentation       Palavras chaves de automação dos comportamentos

# Keywors: Autenticação

***Keywords***
Dado que acesso a página principal
    Go To           ${base_url}

Quando submeto o meu email "${email}"
    Input Text      ${FIELD_EMAIL}    ${email}
    Click Element   ${BTN_ENTER}

Então devo ser autenticado
    Wait Until Page Contains Element      ${DIV_DASH}

Então devo ver a mensagem "${expect_message}"
    Wait Until Element Contains     ${DIV_ALERT}     ${expect_message}

# Keywors: Cadastro de pratos

Dado que "${product}" é um novo prato a ser cadastrado
    Set Test Variable     ${product}  

Quando realizo o cadastro desse prato
    Wait Until Element Is Visible   ${BTN_ADD}   5
    Click Element                   ${BTN_ADD}

    Choose File         ${FIELD_PHOTO}        ${CURDIR}/images/${product['img']}

    Input Text          ${FIELD_NAME}        ${product['nome']} 
    Input Text          ${FIELD_TYPE}        ${product['tipo']} 
    Input Text          ${FIELD_PRICE}       ${product['preco']}
    Click Element       ${BTN_REGISTER}

Quando realizo o cadastro desse prato sem foto
    Wait Until Element Is Visible   ${BTN_ADD}   5
    Click Element                   ${BTN_ADD}

    Input Text          ${FIELD_NAME}        ${product['nome']} 
    Input Text          ${FIELD_TYPE}        ${product['tipo']} 
    Input Text          ${FIELD_PRICE}       ${product['preco']}
    Click Element       ${BTN_REGISTER}

Então devo visualizar o novo prato no dashboard
    Wait Until Element Contains     ${DIV_LIST}     ${product['nome']} 

Então devo ver a seguinte mensagem "${error_message}"
    Wait Until Element Contains     ${DIV_ALERT}     ${error_message}

# Keywors: Exclusão de pratos

Dado que "${product}" é um prato a ser excluido
    Set Test Variable     ${product}

Quando realizo a exclusão desse prato
    Wait Until Element Is Visible   ${BTN_REMOVE}   5
    Click Element                   ${BTN_REMOVE}

Então devo visualizar o prato excluido no dashboard
    Wait Until Element Does Not Contain     ${DIV_LIST}     ${product['nome']}