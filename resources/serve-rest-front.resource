*** Settings ***
Library     Browser
Library     FakerLibrary


*** Variables ***
${BROWSER}      chromium
${HEADLES}      ${False}
${URL}          https://front.serverest.dev
${NAME}         Fabiano Fda


*** Keywords ***
Open Google Chrome Browser
    New Browser    browser=${BROWSER}    headless=${HEADLES}    #slowMo=0.5
    New Context    viewport={'width': 1280, 'height': 720}

Go to Website Front Serve Rest
    New Page    url=${URL}
    ${title}    Get Title    ==    Front - ServeRest

Fill in the Data to Register a New User
    ${EMAIL}    FakerLibrary.Email
    Set Global Variable    ${EMAIL}
    Click    css=a[data-testid="cadastrar"]
    Fill Text    css=input[data-testid='nome']    ${NAME}
    Fill Text    css=input[data-testid='email']    ${EMAIL}
    Fill Text    css=input[data-testid='password']    pwd123
    Check Checkbox    css=input[data-testid="checkbox"]
    Click    css=button[data-testid="cadastrar"]

Check registered user
    Wait For Elements State    css=h1    visible
    Get Text    css=h1    ==    Bem Vindo ${NAME}
    Get Element States    css=button[data-testid="logout"]    validate    value & visible

Register new user
    Open Google Chrome Browser
    Go to Website Front Serve Rest
    Fill in the Data to Register a New User
    Check registered user

Access the User List
    Click    css=a[data-testid='listarUsuarios']

Check that the user appears in the list
    ${elemento_email}    Get Table Cell Element    css=table    "Email"    "${EMAIL}"
    Get Text    ${elemento_email}    ==    ${EMAIL}
    Take Screenshot    fullPage=${true}
