*** Settings ***
Documentation  Handle Autocomplet input field
Resource  ../../Resources/Resource.robot
Suite Setup     Open Web
Suite Teardown  Close Web

*** Keywords ***


*** Variables ***

*** Test Cases ***
Verify Home Page
    Wait Until Page Contains Element    //a/img[@src='/images/Toolsqa.jpg']
Go to Widgets Menu
    Click   //div/h5[text()='Widgets']
    Page Should Contain Element    //div/div/div[text()='Widgets']
    Page Should Contain     Please select an item from left to start practice
Click Auto Complete tab
    Execute JavaScript    window.scrollTo(0,500)
    Click   //span[text()='Auto Complete']
    Page Should Contain Element   //div/div/div[1]/div[text()='Auto Complete']
Verify multiple input is work fine
    Input   //input[@id='autoCompleteMultipleInput']    Re
    Sleep   1s
    Press keys  None    ENTER
    Input   //input[@id='autoCompleteMultipleInput']    Gre
    Sleep   1s
    Press keys  None    ENTER
    Input   //input[@id='autoCompleteMultipleInput']    Blu
    Sleep   1s
    Press keys  None    ENTER
    Input   //input[@id='autoCompleteMultipleInput']    Whi
    Sleep   1s
    Press keys  None    ENTER
    Click   //*[@id="autoCompleteMultipleContainer"]/div/div[1]/div[4]/div[2]
Verify single input is work fine
    Input   //input[@id='autoCompleteSingleInput']    Bla
    Sleep   1s
    Press keys  None    ENTER
    Sleep   2s



