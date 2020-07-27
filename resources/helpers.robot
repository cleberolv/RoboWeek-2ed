***Settings***
Documentation       Arquivo de palavras chaves de apoio

***Keywords***
Login Session
    [Arguments]     ${email}
    base.Open Session

    Go To           ${base_url}
    Input Text      ${FIELD_EMAIL}    ${email}
    Click Element   ${BTN_ENTER}

    Wait Until Page Contains Element      ${DIV_DASH}