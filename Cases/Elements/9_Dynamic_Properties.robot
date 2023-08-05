*** Settings ***
Documentation  Test Broken Links and Image
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
Click Dynamic Properties tab
    Execute JavaScript    window.scrollTo(0,500)
    Click   //span[text()='Dynamic Properties']
    Page Should Contain Element   //div/div/div[1]/div[text()='Dynamic Properties']
Verify Dynamic id text
    Page Should Contain Element     //div/div[2]/p[text()='This text has random Id']
Verify Static Btn
    Page Should Contain Element     //div/div[2]/button[@id='enableAfter']
Verify Color Change Btn
    Page Should Contain Element     //div/div[2]/button[@id='colorChange']
Verify Visible after 5s Btn
    Wait Until Keyword Succeeds     1min    1sec    Page Should Contain Element     //div/div[2]/button[@id='visibleAfter']
















