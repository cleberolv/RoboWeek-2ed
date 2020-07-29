***Settings***
Documentation       Configurações utilizadas para iniciar uma sessao com o Appium Server

Resource    keywords.robot

Library     AppiumLibrary

***Keywords*** 
#Hooks
Open Session
    Open Application        http://localhost:4723/wd/hub        
    ...     automationName=UiAutomator2
    ...     platformName=Android
    ...     deviceName=Emulator
    ...     app=${CURDIR}/app/ninjachef.apk
    ...     udid=emulator-5554
    ...     noSign=false
    ...     adbExecTimeout=120000

Close Session
    Capture Page Screenshot
    Close Application