*** Settings ***
Documentation    This file is a ressource file where keywords are
...              gathering.   

Library    SeleniumLibrary


*** Variables ***
${GITHUB_TITLE}    .//button/span[contains(text(),'Search')] 


*** Keywords ***
Open a Web site
    [Documentation]    This keyword is used to open a website with Chrome browser
    [Arguments]   ${URL}
    ${options}=  Evaluate  sys.modules['selenium.webdriver'].ChromeOptions()  sys
    Call Method  ${options}  add_argument  --disable-notifications
    Call Method  ${options}  add_argument  --disable-infobars
    Call Method  ${options}  add_argument  --disable-extensions
    Call Method  ${options}  add_argument  --no-sandbox
    Call Method  ${options}  add_argument  --headless
    Call Method  ${options}  add_argument  --disable-gpu
    Call Method  ${options}  add_argument  --disable-dev-shm-usage
    Open Browser  ${URL}  Chrome  options=${options}
    #Maximize Browser Window
    Set Window Size    1920    1080

the website application is correctly launched
    [Documentation]    This keyword is used to check if the website is
    ...                succefuly launched
    Log To Console      Launch github  wesite
    Wait Until Element Is Visible    xpath:${GITHUB_TITLE}     5      
    capture page screenshot
