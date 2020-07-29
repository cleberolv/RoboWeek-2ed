***Settings***
Documentation       Estrutura base do projeto e importações

Library     OperatingSystem
Library     SeleniumLibrary

Resource    elements.robot
Resource    keywords.robot
Resource    helpers.robot

***Variables***
${base_url}         http://ninjachef-qaninja-io.umbler.net
${api_url}          http://ninjachef-api-qaninja-io.umbler.net

***Keywords***
## Hooks
Open Session
    Open Browser    about:blank     chrome

Close Session
    Capture Page Screenshot
    Close Browser