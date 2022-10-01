*** Settings ***
Documentation        Dashboard Page

#Importação da biblioteca Browser
Library              Browser

*** Keywords ***
User Logger In
    ${header_title}
    ...    Set Variable
    ...    Aquela figurinha incrível a um clique de distância.

     Get Text         css=div.header-content > Strong        ==       ${header_title}