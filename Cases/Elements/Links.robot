*** Settings ***
Documentation  Test Link
Resource  ../../Resources/Resource.robot
Suite Setup     Open Web
Suite Teardown  Close Web

*** Keywords ***
Click Link
    ${id1}=    Generate Random String   1   12
    Click   //div/p[${id1}]/a
    Switch Window	MAIN
    Page Should Contain Element   //div/div/div[1]/div[text()='Links']
Click Link1
    ${id1}=    Generate Random String   1   3
    Click   //div/p[${id1}]/a
    Page Should Contain    Link has responded with staus 201 and status text Created


*** Variables ***


*** Test Cases ***
Verify Home Page
    Wait Until Page Contains Element    //a/img[@src='/images/Toolsqa.jpg']
Go to Elements Menu
    Click   //div/h5[text()='Elements']
    Page Should Contain Element    //div/div/div[text()='Elements']
    Page Should Contain     Please select an item from left to start practice
Click Links tab
    Click   //span[text()='Links']
    Page Should Contain Element   //div/div/div[1]/div[text()='Links']
Click Links to Open New Tab
    Click Link
Click Links to Send API Call
    Click Link1
















