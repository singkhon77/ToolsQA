*** Settings ***
Documentation  Handle Date Picker
Resource  ../../Resources/Resource.robot
Suite Setup     Open Web
Suite Teardown  Close Web

*** Keywords ***

*** Variables ***

*** Test Cases ***
Verify Home Page
    Wait Until Page Contains Element    //a/img[@src='/images/Toolsqa.jpg']
Go to Widgets Menu
    Click   //div/h5[text()='Widgets']
    Page Should Contain Element    //div/div/div[text()='Widgets']
    Page Should Contain     Please select an item from left to start practice
Click Date Picker tab
    Execute JavaScript    window.scrollTo(0,500)
    Click   //span[text()='Date Picker']
    Page Should Contain Element   //div/div/div[1]/div[text()='Date Picker']
    Sleep   2s
Verify Date Picker work normaly
    Click   //input[@id='datePickerMonthYearInput']
#    select month
    Select From List By Index   //div[1]/select     8
#    Select year
    Select From List By Value   //div[2]/select     1997
#    Select date
    Click   //div[2]/div[text()='11']
    ${date1}=   Get Value   //input[@id='datePickerMonthYearInput']
    Log To Console  ${date1}
Verify Date and time picker work narmaly
    Click   //input[@id='dateAndTimePickerInput']
    Press Keys  None    COMMAND+A
    Press Keys  None    DELETE
    Input   //input[@id='dateAndTimePickerInput']   September 11, 1997 02:30 AM
    Press Keys  None    RETURN
    ${date2}=   Get Value   //input[@id='dateAndTimePickerInput']
    Log To Console  ${date2}






