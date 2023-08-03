*** Settings ***
Documentation  Test Broken Links and Image
Resource  ../../Resources/Resource.robot
Suite Setup     Open Web
Suite Teardown  Close Web

*** Keywords ***
Check Broken Image
    [Arguments]  ${Locator}
    Page Should Contain Image   ${Locator}
    Element should be visible   ${Locator}

Check Valid Link
    [Arguments]  ${Locator}
    Page Should Contain Link    ${Locator}
    ${link_href}=  Get element attribute      ${Locator}    href
#    Log To Console  ${img_src}
    ${status}=   GET     ${link_href}
    Log To Console  ${status}


*** Variables ***
${Valid_img}    //div/img[1]
${Broken_img}    //div/img[2]
${Valid_Link}   //div/div[2]/a[1]
${Invalid_Link}   //div/div[2]/a[2]

*** Test Cases ***
Verify Home Page
    Wait Until Page Contains Element    //a/img[@src='/images/Toolsqa.jpg']
Go to Elements Menu
    Click   //div/h5[text()='Elements']
    Page Should Contain Element    //div/div/div[text()='Elements']
    Page Should Contain     Please select an item from left to start practice
Click Broken Links tab
    Execute JavaScript    window.scrollTo(0,500)
    Click   //span[text()='Broken Links - Images']
    Page Should Contain Element   //div/div/div[1]/div[text()='Broken Links - Images']
Check img
    Check Broken Image  ${Valid_img}
    Run Keyword And Expect Error
    ...     STARTS:The element '${Broken_img}' should be visible,
    ...     Check Broken Image  ${Broken_img}
Check Link
    Check Valid Link    ${Valid_Link}
    Run Keyword And Expect Error
    ...     STARTS:HTTPError:
    ...     Check Valid Link    ${Invalid_Link}














