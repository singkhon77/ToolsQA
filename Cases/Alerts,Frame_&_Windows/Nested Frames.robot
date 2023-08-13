*** Settings ***
Documentation  Handle Nested Frames
Resource  ../../Resources/Resource.robot
Suite Setup     Open Web
Suite Teardown  Close Web

*** Keywords ***


*** Variables ***
${text}     Sample Nested Iframe page. There are nested iframes in this page. Use browser inspecter or firebug to check out the HTML source. In total you can switch between the parent frame and the nested child frame.
${text1}    Parent frame
${text2}    Child Iframe

*** Test Cases ***
Verify Home Page
    Wait Until Page Contains Element    //a/img[@src='/images/Toolsqa.jpg']
Go to Alert,Frame&Windows Menu
    Click   //div/h5[text()='Alerts, Frame & Windows']
    Page Should Contain Element    //div/div/div[text()='Alerts, Frame & Windows']
    Page Should Contain     Please select an item from left to start practice
Click Nested Frames tab
    Execute JavaScript    window.scrollTo(0,500)
    Click   //span[text()='Nested Frames']
    Page Should Contain Element   //div/div/div[1]/div[text()='Nested Frames']
    Sleep   2s
verify Curent frame
    Current Frame Should Contain    ${text}
verify frame1
    Select Frame    //iframe[@id='frame1']
    Current Frame Should Contain   ${text1}
verify frame2
    Select Frame    //html/body/iframe[@srcdoc]
    Current Frame Should Contain    ${text2}




