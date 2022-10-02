*** Settings ***
Documentation                        Arquivo principal do projeto

#Importação da biblioteca Browser
Library                              Browser

Resource                             pages/login.resource
Resource                             pages/dash.resource

*** Keywords ***
Do Login
    Go To Login Page
    Submit Credentials               papito@gmail.com    vaibrasil
    User Logger In

Start Test
        New Browser                  headless=false

Finish Test
        #Thinking Time
        Sleep                        1
        Take Screenshot