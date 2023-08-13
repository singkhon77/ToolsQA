*** Settings ***
Documentation  Handle Modal Dialogs
Resource  ../../Resources/Resource.robot
Suite Setup     Open Web
Suite Teardown  Close Web

*** Keywords ***


*** Variables ***
${text1}     Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
${text2}    The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.
${text3}    It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).

*** Test Cases ***
Verify Home Page
    Wait Until Page Contains Element    //a/img[@src='/images/Toolsqa.jpg']
Go to Widgets Menu
    Click   //div/h5[text()='Widgets']
    Page Should Contain Element    //div/div/div[text()='Widgets']
    Page Should Contain     Please select an item from left to start practice
Click Accordian tab
    Execute JavaScript    window.scrollTo(0,500)
    Click   //span[text()='Accordian']
    Page Should Contain Element   //div/div/div[1]/div[text()='Accordian']
verify card1
    Page Should Contain     ${text1}
    Element Should Be Visible   //div[@id='section1Content']
    Sleep   1s
Verify card2
    Click   //div[@id='section2Heading']
    Page Should Contain     ${text2}
    Element Should Be Visible   //div[@id='section2Content']
    Sleep   1s
Verify card3
    Execute JavaScript    window.scrollTo(0,500)
    Click   //div[@id='section3Heading']
    Page Should Contain     ${text3}
    Element Should Be Visible   //div[@id='section3Content']
    Sleep   2s




