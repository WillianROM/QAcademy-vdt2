*** Settings ***
Documentation        Login tests

#Importação da biblioteca Browser
Library    Browser

*** Variables ***
${header_title}        Aquela figurinha incrível a um clique de distância.

*** Test Cases ***
Deve logar com sucesso
    New Browser      headless=false
    New Page         https://trade-sticker-dev.vercel.app/
    
    Fill Text        css=input[name='email']               papito@gmail.com
    Fill Text        css=input[name='password']            vaibrasil
    Click            css=button >> text=Entrar
    
    Get Text         css=div.header-content > Strong        ==       ${header_title}

    Sleep            10