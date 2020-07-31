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

# Keywors: receber novo pedido 

Dado que "${cooker_email}" é a minha conta de cozinheiro
    Set Test Variable       ${cooker_email}

    ${cooker_token}=        Get Api Login           ${cooker_email}
    Set Test Variable           ${cooker_token}

E "${customer_email}" é o email do meu cliente
    Set Test Variable       ${customer_email}

    ${customer_token}=        Get Api Login           ${customer_email}
    Set Test Variable        ${customer_token}

E que "${product}" está cadastrado no meu dashboard
    Set Test Variable       ${product}

    &{payload}=        Create Dictionary       name=${product}     plate=Tipo      price=20.00

    ${image_file}=     Get Binary File         ${EXECDIR}/resources/images/lasanha.jpg
    &{files}=          Create Dictionary       thumbnail=${image_file}

    &{headers}=        Create Dictionary       user_id=${cooker_token}

    Create Session    api            ${api_url}
    ${resp}=          Post Request   api       /products    files=${files}      data=${payload}     headers=${headers}
    Status Should Be  200            ${resp}

    ${id_product}         Convert To String      ${resp.json()['_id']}
    Set Test Variable     ${id_product}

    Go To       ${base_url}
    
    Input Text      ${FIELD_EMAIL}    ${cooker_email}
    Click Element   ${BTN_ENTER}

    Wait Until Page Contains Element      ${DIV_DASH}

Quando o cliente solicita o preparo desse prato

    &{headers}=       Create Dictionary         Content-Type=application/json   user_id=${customer_token}
    &{payload}=       Create Dictionary         payment=Dinheiro

    Create Session    api            ${api_url}
    ${resp}=          Post Request   api       /products/${id_product}/orders    data=${payload}     headers=${headers}
    Status Should Be  200            ${resp}

Então devo receber uma notificação de pedido desse produto
    ${expected_message}    Convert To String       ${customer_email} está solicitando o preparo do seguinte prato: ${product}.
    Wait Until Page Contains        ${expected_message}    5

E posso aceitar ou rejeitar esse pedido
    Wait Until Page Contains        ACEITAR     5
    Wait Until Page Contains        REJEITAR    5