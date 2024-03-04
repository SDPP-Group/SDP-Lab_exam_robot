*** Settings ***
Library    SeleniumLibrary
Library    RequestsLibrary

*** Keywords ***
Is Prime
    [Arguments]    ${x}
    ${response}=    Get    http://localhost:5000/is_prime/${x}    expected_status=any
    RETURN    ${response}

*** Test Cases ***
True When X is 17
    ${resp}=    Is Prime    17
    Status Should Be    200
    ${res}=    Set Variable    ${resp.json()['result']}
    Should Be Equal    ${res}    true

False When X is 36
    ${resp}=    Is Prime    36
    Status Should Be    200
    ${res}=    Set Variable    ${resp.json()['result']}
    Should Be Equal    ${res}    false

False When X is 13219
    ${resp}=    Is Prime    13219
    Status Should Be    200
    ${res}=    Set Variable    ${resp.json()['result']}
    Should Be Equal    ${res}    true