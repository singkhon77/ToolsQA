*** Settings ***
Documentation  Handle spacific alerts
Resource  ../../Resources/Resource.robot
Suite Setup     Open Web
Suite Teardown  Close Web

*** Keywords ***


*** Variables ***


*** Test Cases ***
Verify Home Page
    Wait Until Page Contains Element    //a/img[@src='/images/Toolsqa.jpg']
Go to Alert,Frame&Windows Menu
    Click   //div/h5[text()='Alerts, Frame & Windows']
    Page Should Contain Element    //div/div/div[text()='Alerts, Frame & Windows']
    Page Should Contain     Please select an item from left to start practice
Click Alerts tab
    Click   //span[text()='Alerts']
    Page Should Contain Element   //div/div/div[1]/div[text()='Alerts']
See Alert btn
    Click   //button[@id='alertButton']
    Sleep   1s
    ${msg}=  Handle Alert
#    Log To Console  ${msg}
    Should Contain	${msg}	You clicked a button
Alert should be present after click btn in 5s
    Click   //button[@id='timerAlertButton']
    Sleep   1s
    ${msg}=  Handle Alert    timeout=6
    #    Log To Console  ${msg}
    Should Contain	${msg}  This alert appeared after 5 seconds
Confirm btn
    Click   //button[@id='confirmButton']
    Sleep   1s
    ${msg}=  Handle Alert
    #    Log To Console  ${msg}
    Should Contain	${msg}  Do you confirm action?
    Page Should Contain Element     //span[text()='You selected '][text()='Ok']
alert with promt box
    Click   //button[@id='promtButton']
    Sleep   1s
    ${msg}=  Input Text Into Alert      text=someting
    Sleep   2s
    Page Should Contain Element     //span[text()='You entered '][text()='someting']



