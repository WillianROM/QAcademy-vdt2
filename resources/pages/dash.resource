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

Search User
    [Arguments]      ${target}
    Fill Text        input[placeholder^=Busque]    ${target}
    Click            css=button >> text=Buscar

Select Sticker
    [Arguments]      ${name}
    Click            xpath=//img[@alt='${name}']/..

Get In Touch
    Click            xpath=//img[@alt="Whatsapp"]/..

Whatsapp Sticker Message
    [Arguments]    ${sticker_name}

    ${expected_message}    Set Variable
    ...    Oi, achei o seu contato no Trade Sticker. Estou interessado(a) na figurinha do ${sticker_name}, bora negociar?

    Switch Page    NEW

    Wait For Elements State
    ...        css=p << text=${expected_message}
    ...        visible
    ...        5000
    