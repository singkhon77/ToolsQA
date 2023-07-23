*** Settings ***
Documentation  Test TextBox Elements
Resource  ../../Resources/Resource.robot
Suite Setup     Open Web
Suite Teardown  Close Web

*** Keywords ***

*** Variables ***


*** Test Cases ***
Verify Home Page
    Wait Until Page Contains Element    //a/img[@src='/images/Toolsqa.jpg']
Go to Elements Menu
    Click   //div/h5[text()='Elements']
    Page Should Contain Element    //div/div/div[text()='Elements']
    Page Should Contain     Please select an item from left to start practice
Click Buttons tab
    Click   //span[text()='Buttons']
    Page Should Contain Element   //div/div/div[1]/div[text()='Buttons']
Bouble Click btn
    Wait Until Page Contains Element    //button[@id='doubleClickBtn']
    Double Click Element   //button[@id='doubleClickBtn']
    Page Should Contain    You have done a double click
Right Click btn
    Wait Until Page Contains Element    //button[@id='rightClickBtn']
    Open Context Menu   //button[@id='rightClickBtn']
    Page Should Contain    You have done a right click
Dynamic btn
    Click   //div/div[3]/button
    Page Should Contain    You have done a dynamic click
















