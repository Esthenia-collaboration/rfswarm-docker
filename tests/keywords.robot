*** Settings ***
Documentation    This file is e ressource file where keywords are
...              gathering.   

Library    SeleniumLibrary


*** Variables ***
${DOWNLOADDIRECTORY}    /scr/
${BROWSER}              /usr/bin/chromedriver
${SEARCH FORM}         .//form
${RESEARCH_BAR}        //*[@id="APjFqb"]  
${INPUT_TEXTE}         healthy 


*** Keywords ***
Open a Web site
    [Documentation]    This keyword is used to open a website with Selenium browser
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

the wesite application is correctly launched
    [Documentation]    This keyword is used to check if the website is
    ...                succefuly launched
    Log To Console      Launch google  wesite
    Click Button    xpath://*[@id="L2AGLb"]
    Sleep    3
    Wait Until Element Is Visible    xpath:${SEARCH FORM}     5    
    Wait Until Element Is Visible    xpath:${RESEARCH_BAR}    5     
    capture page screenshot

a user makes a query in the google search bar


the search term is succefuly found in the current page
