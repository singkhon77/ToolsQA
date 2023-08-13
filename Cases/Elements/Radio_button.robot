*** Settings ***
Documentation  Test TextBox Elements
Resource  ../../Resources/Resource.robot
Suite Setup     Open Web
Suite Teardown  Close Web

*** Keywords ***
Choose YES
    Click   //label[text()='Yes']
    Page Should Contain Element     //p/span[text()='Yes']
Choose INPRESSIVE
    Click   //label[text()='Impressive']
    Page Should Contain Element     //p/span[text()='Impressive']
Radio Button
    ${bool} =	Generate Random String	1	01
#    Log To Console  ${bool}
    Run Keyword If  ${bool}==1    Choose YES
    Run Keyword If  ${bool}==0    Choose INPRESSIVE

*** Variables ***

*** Test Cases ***
Verify Home Page
    Wait Until Page Contains Element    //a/img[@src='/images/Toolsqa.jpg']
Go to Elements Menu
    Click   //div/h5[text()='Elements']
    Page Should Contain Element    //div/div/div[text()='Elements']
    Page Should Contain     Please select an item from left to start practice
Click Radio btn tab
    Click   //span[text()='Radio Button']
    Page Should Contain Element   //div/div/div[1]/div[text()='Radio Button']
Disabled Choice
    Element Should Be Disabled  //input[@id='noRadio']
Select Radio Button
    Radio Button










