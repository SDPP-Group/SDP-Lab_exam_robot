*** Settings ***
Library    SeleniumLibrary
Library    RequestsLibrary

*** Keywords ***
Is 1 Honor
    [Arguments]    ${x}
    ${response}=    Get    http://localhost:5000/is1honor/${x}    expected_status=any
    RETURN    ${response}

*** Test Cases ***
test x is 3dot6
    ${resp}=    Is 1 Honor    3.6
    Status Should Be    200
    ${res}=    Set Variable    ${resp.json()['result']}
    Should Be Equal    ${res}    ${True}

test x is 3dot5
    ${resp}=    Is 1 Honor    3.5
    Status Should Be    200
    ${res}=    Set Variable    ${resp.json()['result']}
    Should Be Equal    ${res}    ${True}

test x is 3dot4
    ${resp}=    Is 1 Honor    3.4
    Status Should Be    200
    ${res}=    Set Variable    ${resp.json()['result']}
    Should Be Equal    ${res}    ${False}