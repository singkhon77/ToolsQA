*** Settings ***
Documentation  Indentify Each Window : Note This file must open in chrome
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
Click Browser Windows tab
    Click   //span[text()='Browser Windows']
    Page Should Contain Element   //div/div/div[1]/div[text()='Browser Windows']
Check New Tab btn
    Click   //button[@id='tabButton']
    Switch Window    url=https://demoqa.com/sample
    Wait Until Page Contains     This is a sample page
    Sleep   2s
    Close window
Check New Window btn
    Switch Window   MAIN
    Click   //button[@id='windowButton']
    Sleep   2s
    Switch Window   NEW
    Wait Until Page Contains     This is a sample page
Check New Window Massage
    Switch Window   MAIN
    Click   //button[@id='messageWindowButton']
    Sleep   2s
