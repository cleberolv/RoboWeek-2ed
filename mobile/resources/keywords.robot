***Settings***
Documentation       Palavras chaves do projeto

***Keywords***
Dado que desejo comer "${dish}"
    Set Test Variable   ${dish}

Quando entro com o email "${email}"
    Wait Until Page Contains        Buscar Prato    15
    Input Text      accessibility_id=emailInput     ${email}
    Input Text      accessibility_id=plateInput     ${dish}
    Click Text      Buscar Prato

Então vejo a lista de pratos por tipo
    Wait Until Page Contains        Fome de ${dish}