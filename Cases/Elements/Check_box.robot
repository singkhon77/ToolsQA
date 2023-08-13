*** Settings ***
Documentation  Test TextBox Elements
Resource  ../../Resources/Resource.robot
Suite Setup     Open Web
Suite Teardown  Close Web

*** Keywords ***
CheckBox
    [Arguments]  ${check_box}   ${display}
    ${bool} =	Generate Random String	1	01
#    Log To Console  ${bool}
    Run Keyword If  ${bool}==1    Click   //span[text()='${check_box}']
    Run Keyword If  ${bool}==1    Page Should Contain Element    //span[text()='${display}']

CheckFolder
    Page Should Contain     notes
    Page Should Contain     commands
CheckTopFolder
    Page Should Contain     desktop
    Page Should Contain     documents
    Page Should Contain     downloads



*** Variables ***

*** Test Cases ***
Verify Home Page
    Wait Until Page Contains Element    //a/img[@src='/images/Toolsqa.jpg']
Go to Elements Menu
    Click   //div/h5[text()='Elements']
    Page Should Contain Element    //div/div/div[text()='Elements']
    Page Should Contain     Please select an item from left to start practice
Click Check Box tab
    Click   //span[text()='Check Box']
    Page Should Contain Element   //div/div/div[1]/div[text()='Check Box']
Click Expand All
    Click   //button[@title='Expand all']
Check Box
#    RandomCBFile
    CheckBox  Notes     notes
    CheckBox  Commands    commands
#    CheckFolder
    ${Desktop}=     Run Keyword And Return Status    CheckFolder
#    Log To Console  ${Desktop}
    Run Keyword If  ${Desktop}==True    Page Should Contain Element    //span[text()='desktop']

    Execute JavaScript    window.scrollTo(0,400)
#    Sleep   5s
#    RandomCBFolder
    CheckBox  Documents     documents
    CheckBox  Downloads     downloads
#    CheckTopFolder
    ${Home}=     Run Keyword And Return Status    CheckTopFolder
#    Log To Console  ${Home}
    Run Keyword If  ${Home}==True    Page Should Contain Element    //span[text()='home']








