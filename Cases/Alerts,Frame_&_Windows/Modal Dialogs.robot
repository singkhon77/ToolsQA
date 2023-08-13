*** Settings ***
Documentation  Handle Modal Dialogs
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
Click Modal Dialogs tab
    Execute JavaScript    window.scrollTo(0,500)
    Click   //span[text()='Modal Dialogs']
    Page Should Contain Element   //div/div/div[1]/div[text()='Modal Dialogs']
Verify small modal
    Click   //button[@id='showSmallModal']
    Sleep   2s
    Page Should Contain Element     //div[text()='Small Modal']
    Click   //button[@id='closeSmallModal']
Verify large modal
    Click   //button[@id='showLargeModal']
    Sleep   2s
    Page Should Contain Element     //div[text()='Large Modal']
    Click   //button[@id='closeLargeModal']
    Sleep   2s



