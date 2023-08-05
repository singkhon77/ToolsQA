*** Settings ***
Documentation  Practice Automation Test
Library  SeleniumLibrary
Library  RequestsLibrary
Library  String
Library  OperatingSystem

*** Keywords ***
Open Web
    Open Browser       ${url}      firefox
#    Maximize Browser Window
Close Web
    Close All Browsers

Click
    [Arguments]     ${Locator}
    Wait Until Page Contains Element    ${Locator}
    Click Element   ${locator}
Input
    [Arguments]     ${Locator}  ${text}
    Wait Until Page Contains Element    ${Locator}
    Input Text   ${locator}     ${text}

*** Variables ***
${url}      https://demoqa.com
${url_checkbox}     https://demoqa.com/checkbox
