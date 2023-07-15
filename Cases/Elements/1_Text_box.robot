*** Settings ***
Documentation  Test TextBox Elements
Resource  ../../Resources/Resource.robot
Suite Setup     Open Web
Suite Teardown  Close Web

*** Keywords ***


*** Variables ***
${name}             TestName
${email}            Email@test.com
${Current_Add}      123 St.123 Destin FL 12345
${Permanent_Add}    Same As Current Address

*** Test Cases ***
Verify Home Page
    Wait Until Page Contains Element    //a/img[@src='/images/Toolsqa.jpg']
Go to Elements Menu
    Click   //div/h5[text()='Elements']
    Page Should Contain Element    //div/div/div[text()='Elements']
    Page Should Contain     Please select an item from left to start practice
#Click Element Side tab
#    Click   //div[@class='header-wrapper']/div[text()='Elements']
#    Sleep   1s
Click Text Box tab
    Click   //span[text()='Text Box']
    Page Should Contain Element   //div/div/div[1]/div[text()='Text Box']
Input Form
#    Input Full Name Field
    Input   //input[@id='userName']     ${name}
#    Input Email Field
    Input   //input[@id='userEmail']     ${email}
#    Input current Address Field
    Input   //textarea[@id='currentAddress']     ${Current_Add}
#    Input permanent Address Field
    Input   //textarea[@id='permanentAddress']     ${Permanent_Add}
#    Submit form
    Execute JavaScript    window.scrollTo(0,100)
    Click   //button[@id='submit']
Verify input text
    Wait Until Page Contains Element     //*[@id="output"]/div[1]/p[4]
    Page Should Contain     Name:${name}
    Page Should Contain     Email:${email}
    Page Should Contain     Current Address :${Current_Add}
    Page Should Contain     Permananet Address :${Permanent_Add}




