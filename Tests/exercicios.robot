*** Settings ***
Documentation       Neste arquivo estarão presentes todos os exercícios de automação do curso prime hero

*** Variables ***
# Minha primeira variável do tipo dicionário
&{PESSOA}       
...     nome=Rodrigo
...     sobrenome=Augusto
...     idade=28
...     cpf=12345678911 
...     profissão=Analista de teste
...     carro=Fusca

@{FRUTAS}
...     Banana
...     Abacaxi
...     Limão
...     Jabuticaba

*** Test Cases ***
Cenario: imprimindo 6 informações de uma pessoa
    Log To Console      ${PESSOA.nome}
        Log To Console      ${PESSOA.sobrenome}
            Log To Console      ${PESSOA.idade}
                Log To Console      ${PESSOA.cpf}
                    Log To Console      ${PESSOA.profissão}
                        Log To Console      ${PESSOA.carro}

Cenario: imprimindo uma lista de frutas
    [Tags]      LISTA
    Log To Console      ${FRUTAS}
        Log To Console      ${FRUTAS[0]}
            Log To Console      ${FRUTAS[3]}

Cenario: Somando dois numeros
    [Tags]      SOMAR
    Somar dois numeros  10  10

Cenario: Email do usuario
    [Tags]      Email
    Email do usuario  Rodrigo  Augusto  28

Cenario: Contando de 0 a 9
    [Tags]      CONTAR
     FOR     ${COUNT}    IN RANGE    0   9
        Log To Console  ${COUNT}
    END
Cenario: Percorrendo lista de frutas
    [Tags]      FRUTAS
    Percorrer itens de uma lista

Cenario: Qual numero
    [Tags]      NUMERO
        Em qual numero estou

Cenario: mais de 1 pais
    [Tags]  PAISES
        Lista de paises

Cenario: Qua numero IF
    [Tags]      NUM
        contar se for 5 ou 8

*** Keywords ***
Somar dois numeros
    [Arguments]     ${NUM_A}        ${NUM_B}
    ${SOMA}     Evaluate        ${NUM_A}+${NUM_B}
    [Return]        ${SOMA}


Email do usuario
    [Arguments]     ${nome}     ${sobrenome}    ${idade}
    ${Email}    Catenate     ${nome}_${sobrenome}_${idade}@robot.com
    Log To Console      ${Email}

contar de 0 a 9
    FOR     ${COUNT}    IN RANGE    0   9
        Log To Console  ${COUNT}
    END

Percorrer itens de uma lista
    @{FRUTAS}   Create List     Banana      Caju        Abacaxi     Limão
    FOR     ${FRUTAS}   IN      @{FRUTAS}
        Log To Console      ${FRUTAS}
    END

Em qual numero estou
    FOR     ${COUNT}        IN RANGE    0   9
        Log To Console  Estou no numero ${COUNT}
    END

Lista de paises
    @{PAISES}   Create List     Brasil      Alemanha        Mexico      Bolivia
    FOR     ${PAISES}   IN  @{PAISES}
        Log To Console      ${PAISES}
    END

contar se for 5 ou 8
    FOR     ${COUNT}    IN RANGE    0   9
        IF  '${COUNT}'=='5'
            Log To Console  Estou no numero ${COUNT}
        ELSE IF     '${COUNT}'=='8'
            Log To Console  Estou no numero ${COUNT}
        ELSE
            Log To Console  Numero invalido
        END
    END
