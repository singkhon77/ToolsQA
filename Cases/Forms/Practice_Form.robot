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
    Click   //div/h5[text()='Forms']
    Page Should Contain Element    //div/div/div[text()='Forms']
    Page Should Contain     Please select an item from left to start practice
Click Dynamic Properties tab
    Execute JavaScript    window.scrollTo(0,500)
    Click   //span[text()='Practice Form']
    Page Should Contain Element   //div/div/div[1]/div[text()='Practice Form']
Input Form
#    Execute JavaScript    window.scrollTo(0,200)
    Input   //input[@id='firstName']    SK
    Input   //input[@id='lastName']     KT
    Input   //input[@id='userEmail']     SK@test.com
    Click   //div/label[text()='Male']
    Input   //input[@id='userNumber']   0987654321
    Click   //div/input[@id='dateOfBirthInput']
    Select From List By Index  //div/div[1]/select     8
    Select From List By Index  //div/div[2]/select     140
    Click   //div[3]/div[text()='11']
    Click   //div[@id='subjectsWrapper']/div[2]
    Press Keys  None    C+o+m
    Sleep   1s
    Press Keys  None    RETURN
    Click    //input[@id='hobbies-checkbox-1']
    Click    //input[@id='hobbies-checkbox-3']
    Sleep   5s

















