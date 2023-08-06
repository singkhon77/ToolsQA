*** Settings ***
Documentation  Input Form and verify value in table
Resource  ../../Resources/Resource.robot
Suite Setup     Open Web
Suite Teardown  Close Web

*** Keywords ***


*** Variables ***
${name}                 SK
${last_name}            KT
${email}                SK@test.com
${phone_num}            0987654321
${address}              123 FL USA 54321

${upload_file_path}     /Users/macbookpro/PycharmProjects/ToolsQA/Resources/${upload_file_name}
${upload_file_name}     test.png

*** Test Cases ***
Verify Home Page
    Wait Until Page Contains Element    //a/img[@src='/images/Toolsqa.jpg']
Go to Elements Menu
    Click   //div/h5[text()='Forms']
    Page Should Contain Element    //div/div/div[text()='Forms']
    Page Should Contain     Please select an item from left to start practice
Click Dynamic Properties tab
    Execute JavaScript    window.scrollTo(0,500)
    Click   //span[text()='Practice Form']
    Page Should Contain Element   //div/div/div[1]/div[text()='Practice Form']
Input Form
#    Name : input
    Input   //input[@id='firstName']    ${name}
    Input   //input[@id='lastName']     ${last_name}
#    Email : input
    Input   //input[@id='userEmail']     ${email}
#    Gender : Select radio by click
    Click   //div/label[text()='Male']
#    Mobile : input
    Input   //input[@id='userNumber']   ${phone_num}
#    Date of Birth : Select m and y form list and click d
    Click   //div/input[@id='dateOfBirthInput']
    Select From List By Index  //div/div[1]/select     8
    Select From List By Index  //div/div[2]/select     140
    Click   //div[3]/div[text()='11']
#    Subjects : Type and select form list
    Click   //div[@id='subjectsWrapper']/div[2]
    Press Keys  None    C+o+m
    Sleep   1s
    Press Keys  None    RETURN
#    habbies : Select Check box and verify
    Click    //div[7]/div[2]/div[1]/label
    Checkbox Should Be Selected     //input[@id='hobbies-checkbox-1']
    Click    //div[7]/div[2]/div[3]/label
    Checkbox Should Be Selected     //input[@id='hobbies-checkbox-3']
#    Picture : Upload image
    Choose File     //input[@id='uploadPicture']     ${upload_file_path}
#    Current Address : input text
    Input   //div/textarea[@id='currentAddress']     ${address}
#    State and City : select list by Select list
    Execute JavaScript    window.scrollTo(0,300)

    Click   //div[text()='Select State']
    Press Keys  None    N+C+R
    Sleep   1s
    Press Keys  None    RETURN

    Click   //div[text()='Select City']
    Press Keys  None    D+e+l
    Sleep   1s
    Press Keys  None    RETURN

#    Submit form
    Sleep   1s
    Press Keys  None    RETURN
#    Verify values in table
    Wait Until Page Contains     Thanks for submitting the form
    Table Header Should Contain     //div/table    Label
    Table Header Should Contain     //div/table    Values
    Table Cell Should Contain   locator=//div/table     row=2   column=2    expected=${name} ${last_name}
    Table Cell Should Contain   locator=//div/table     row=3   column=2    expected=${email}
    Table Cell Should Contain   locator=//div/table     row=4   column=2    expected=Male
    Table Cell Should Contain   locator=//div/table     row=5   column=2    expected=${phone_num}
    Table Cell Should Contain   locator=//div/table     row=6   column=2    expected=11 September,2040
    Table Cell Should Contain   locator=//div/table     row=7   column=2    expected=Computer Science
    Table Cell Should Contain   locator=//div/table     row=8   column=2    expected=Sports, Music
    Table Cell Should Contain   locator=//div/table     row=9   column=2    expected=test.png
    Table Cell Should Contain   locator=//div/table     row=10   column=2    expected=${address}
    Table Cell Should Contain   locator=//div/table     row=11   column=2    expected=NCR Delhi

    Sleep   5s

















