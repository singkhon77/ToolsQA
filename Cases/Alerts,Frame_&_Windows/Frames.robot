*** Settings ***
Documentation  Handle Frames
Resource  ../../Resources/Resource.robot
Suite Setup     Open Web
Suite Teardown  Close Web

*** Keywords ***


*** Variables ***
${text}     Sample Iframe page There are 2 Iframes in this page. Use browser inspecter or firebug to check out the HTML source. In total you can switch between the parent frame, which is this window, and the two frames below
${text1}    This is a sample page
${text2}    This is a sample page

*** Test Cases ***
Verify Home Page
    Wait Until Page Contains Element    //a/img[@src='/images/Toolsqa.jpg']
Go to Alert,Frame&Windows Menu
    Click   //div/h5[text()='Alerts, Frame & Windows']
    Page Should Contain Element    //div/div/div[text()='Alerts, Frame & Windows']
    Page Should Contain     Please select an item from left to start practice
Click Frames tab
    Click   //span[text()='Frames']
    Page Should Contain Element   //div/div/div[1]/div[text()='Frames']
verify parent frame
    Current Frame Should Contain    ${text}
verify frame1
    Select Frame    //iframe[@id='frame1']
    Current Frame Should Contain    ${text1}
    Unselect Frame
verify frame2
    Select Frame    //iframe[@id='frame2']
    Current Frame Should Contain    ${text2}




