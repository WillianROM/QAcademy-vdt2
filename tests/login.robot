*** Settings ***
Documentation                  Login tests

#Importação da biblioteca Browser
Library    Browser

*** Variables ***


*** Keywords ***
Go To Login Page
    New Browser      headless=false
    New Page         https://trade-sticker-dev.vercel.app/

Submit Credentials
    [Arguments]      ${email}        ${password}
    Fill Text        css=input[name='email']               ${email} 
    Fill Text        css=input[name='password']            ${password}
    Click            css=button >> text=Entrar

User Logger In
    ${header_title}
    ...    Set Variable
    ...    Aquela figurinha incrível a um clique de distância.

     Get Text         css=div.header-content > Strong        ==       ${header_title}

Here You Get Page Source
    #Pegar a fonte da página para poder pegar o elemento Toast:
    Sleep           1
    ${temp}         Get Page Source
    Log             ${temp}

Toast Message Should Be
    [Arguments]    ${expected_message}
    #Depois que foi pego o elemento toast usando a fonte da página utilizado anteriormente, monte uma variável:
    ${locator}      Set Variable    css= div.Toastify__toast-body div >> text=${expected_message}

    #Aguardar o elemento estar vísível, nesse caso em até 3 segundo:
    Wait For Elements State     ${locator}      visible    3



*** Test Cases ***
Deve logar com sucesso
    Go To Login Page
    Submit Credentials         papito@gmail.com    vaibrasil
    User Logger In
    Sleep                      5

Não deve logar com senha incorreta
    #robot -d ./logs -i inv_pass tests/login.robot 
    [Tags]                     inv_pass
    
    Go To Login Page
    Submit Credentials         papito@gmail.com    abc123
    Here You Get Page Source
    Toast Message Should Be    Credenciais inválidas, tente novamente!
