*** Settings ***
Documentation        Aqui estarão presentes os primeiros testes automatizados Web.

Resource             ../resources/keywords/kws_webautomation.robot
Test Setup           Abrir navegador
Test Teardown        Fechar navegador

*** Test Cases ***
Caso de Teste 01: Pesquisar produto existente
    [Tags]            PESQUISAR
    Acessar a página home do site Automation Practice
    Digitar o nome do produto "Blouse" no campo de pesquisa
    Clicar no botão pesquisar
    Conferir se o produto "Blouse" foi listado no site