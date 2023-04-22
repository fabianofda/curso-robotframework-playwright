*** Settings ***
Resource    ../resources/serve-rest-front.resource
    

*** Test Cases ***
Login com sucesso Serve Rest Front
    Abrir o Navegador
    Ir para o site front serve rest
    Preencher dados de castro de um novo usuario
    Confeir usuario cadastrado