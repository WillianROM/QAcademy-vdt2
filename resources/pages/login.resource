*** Settings ***
Documentation        Login Page

#Importação da biblioteca Browser
Library              Browser

*** Keywords ***
Go To Login Page
    New Page         https://trade-sticker-dev.vercel.app/

Submit Credentials
    [Arguments]      ${email}        ${password}
    Fill Text        css=input[name='email']               ${email} 
    Fill Text        css=input[name='password']            ${password}
    Click            css=button >> text=Entrar

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