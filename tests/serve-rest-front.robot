*** Settings ***
Resource    ../resources/serve-rest-front.resource


*** Test Cases ***
Login com sucesso Serve Rest Front
    Open Google Chrome Browser
    Go to Website Front Serve Rest
    Fill in the Data to Register a New User
    Check registered user

Challenge: Conferir se o novo usuário é mostrado na listagem de usuários
    Register new user
    Access the User List
    Check that the user appears in the list
