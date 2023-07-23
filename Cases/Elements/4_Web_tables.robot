*** Settings ***
Documentation  Test TextBox Elements
Resource  ../../Resources/Resource.robot
Suite Setup     Open Web
Suite Teardown  Close Web

*** Keywords ***

*** Variables ***
${name}         A
${edit_name}    Aa
${lastname}     B
${email}        A@B.co
${age}          20
${salary}       10000
${department}   123/45  Th  50000

*** Test Cases ***
Verify Home Page
    Wait Until Page Contains Element    //a/img[@src='/images/Toolsqa.jpg']
Go to Elements Menu
    Click   //div/h5[text()='Elements']
    Page Should Contain Element    //div/div/div[text()='Elements']
    Page Should Contain     Please select an item from left to start practice
Click Web Tables tab
    Click   //span[text()='Web Tables']
    Page Should Contain Element   //div/div/div[1]/div[text()='Web Tables']
Add record to table
    Click   //button[@id='addNewRecordButton']
    Wait Until Page Contains Element     //div[@id='registration-form-modal']
    Input   //input[@id='firstName']    ${name}
    Input   //input[@id='lastName']     ${lastname}
        Input   //input[@id='age']     ${age}
    Input   //input[@id='userEmail']     ${email}
    Input   //input[@id='salary']     ${salary}
    Input   //input[@id='department']     ${department}
    Click   //button[@id='submit']
Search
    Input   //input[@id='searchBox']    ${email}
Verify content
    Element Should Contain  //div[@role='rowgroup'][1]/div[@role='row']/div[1]    ${name}
    Element Should Contain  //div[@role='rowgroup'][1]/div[@role='row']/div[2]    ${lastname}
    Element Should Contain  //div[@role='rowgroup'][1]/div[@role='row']/div[3]    ${age}
    Element Should Contain  //div[@role='rowgroup'][1]/div[@role='row']/div[4]    ${email}
    Element Should Contain  //div[@role='rowgroup'][1]/div[@role='row']/div[5]    ${salary}
    Element Should Contain  //div[@role='rowgroup'][1]/div[@role='row']/div[6]    ${department}
Edit record
    Click   //div[@role='rowgroup'][1]/div[@role='row']/div[7]/div/span[1]
    Input   //input[@id='firstName']    ${edit_name}
    Click   //button[@id='submit']
    Element Should Contain  //div[@role='rowgroup'][1]/div[@role='row']/div[1]    ${edit_name}
Delete record
    Click   //div[@role='rowgroup'][1]/div[@role='row']/div[7]/div/span[2]
    Page Should Contain Element     //div[text()='No rows found']















