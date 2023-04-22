*** Settings ***
Library     Browser
Library     FakerLibrary


*** Variables ***
${BROWSER}      chromium
${HEADLES}      ${False}
${URL}          https://front.serverest.dev
${name}=        Fabianofda 


*** Keywords ***
Abrir o Navegador
    New Browser    browser=${BROWSER}    headless=${HEADLES}    #slowMo=0.5
    New Context    viewport={'width': 1280, 'height': 720}

Ir para o site front serve rest
    New Page    url=${URL}
    ${title}    Get Title        ==    Front - ServeRest

Preencher dados de castro de um novo usuario     ${EMAIL}=   FakerLibrary.Email 
    Click                css=a[data-testid="cadastrar"]
    Fill Text            css=input[data-testid='nome']            ${name}
    Fill Text            css=input[data-testid='email']           ${EMAIL}
    Fill Text            css=input[data-testid='password']        pwd123
    Check Checkbox       css=input[data-testid="checkbox"]
    Click                css=button[data-testid="cadastrar"]

Conferir usuario cadastrado
    Wait For Elements State    css=h1          visible
    Get Text                   css=h1    ==    Bem Vindo ${name}
    Get Element States         css=button[data-testid="logout"]    validate    value & visible
    
