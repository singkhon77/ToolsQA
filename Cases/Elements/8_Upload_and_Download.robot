*** Settings ***
Documentation  Test Broken Links and Image
Resource  ../../Resources/Resource.robot
Suite Setup     Open Web
Suite Teardown  Close Web

*** Keywords ***
Check Download btn is work fine
    Click   //div/a[@id='downloadButton']
    Wait Until Keyword Succeeds     1min    5sec    File Should Exist   ${download_path}/sampleFile.jpeg
    Remove File     ${download_path}/sampleFile.jpeg

Check Upload btn is work fine
    Choose File     //input[@id='uploadFile']   ${upload_file_path}
    Page Should Contain    ${upload_file_name}

*** Variables ***
${download_path}    /Users/macbookpro/Downloads
${upload_file_path}     /Users/macbookpro/PycharmProjects/ToolsQA/Resources/${upload_file_name}
${upload_file_name}     test.png

*** Test Cases ***
Verify Home Page
    Wait Until Page Contains Element    //a/img[@src='/images/Toolsqa.jpg']
Go to Elements Menu
    Click   //div/h5[text()='Elements']
    Page Should Contain Element    //div/div/div[text()='Elements']
    Page Should Contain     Please select an item from left to start practice
Click Upload and Download tab
    Execute JavaScript    window.scrollTo(0,500)
    Click   //span[text()='Upload and Download']
    Page Should Contain Element   //div/div/div[1]/div[text()='Upload and Download']
Check Download btn
    Check Download btn is work fine
Check Upload btn
    Check Upload btn is work fine














