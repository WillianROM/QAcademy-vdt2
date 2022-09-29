*** Settings ***
Library   Browser

*** Variables ***
${slogan}        Conectando colecionadores de figurinhas da copa.

*** Test Cases ***
Deve validar o slogan da home page
    New Browser         headless=false
    New Page            https://trade-sticker-dev.vercel.app/
    Get Text            div.logo-container h2    contains    ${slogan}
    Take Screenshot