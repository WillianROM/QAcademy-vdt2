*** Settings ***
Documentation                  Login tests

Resource                       ${EXECDIR}/resources/main.resource

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
