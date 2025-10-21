*** Settings ***
Documentation    This file is a ressource file where keywords are
...              gathering.   

Library    SeleniumLibrary


*** Variables ***
${DOCKERHUB_SITE}     .//*/a[contains(text(),'estheniacollaboration')] 


*** Keywords ***
Open Website
    [Documentation]   This keyword is used to launch Chrome or firefox browser
    [Arguments]    ${url}    ${browser_name}
    IF   $browser_name == 'Chrome'
        ${chrome_options} =     Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
        Call Method    ${chrome_options}   add_argument    --headless
        Call Method    ${chrome_options}   add_argument    --disable-gpu
        Open Browser    ${url}   browser=${browser_name} 	options=${chrome_options}
    ELSE IF    $browser_name == 'headlessfirefox'
        Open Browser  ${url}    browser=${browser_name} 
    ELSE
        Log  The browser ${browser_name} is not Chrome neither headlessfirefox
    END   
    Maximize Browser Window
    sleep 	10
    Go To 	https://github.com/Esthenia-collaboration/rfswarm-docker/
    sleep 	10
    Capture Page Screenshot 
    Go To 	https://github.com/damies13/rfswarm
    Capture Page Screenshot
        
Website application has been correctly launched
    [Documentation]    This keyword is used to check if the website is
    ...                succefuly launched
    [Arguments]        ${url}
    Go To 	${url}
    sleep   10
    Wait Until Element Is Visible    xpath:${DOCKERHUB_SITE}     5      
    Capture page screenshots



ssh connection is establish
    [Arguments]      ${sshserver_IP}
     ${status}=    Run Keyword And Return Status  Open Connection	${sshserver_IP} prompt=$
     IF    not ${status} 
         Fail     "Impossible to open ssh connection"
     ELSE
         Log To Console     "Connected"    
     END

User enter credentials
    [Arguments]   ${login}  ${pwd}
    ${output}=	Login	${login}  ${pwd}

ssh connection has been established
    Log To Console   "connection output is:${output}"
    ${output}=    Execute Command    uname -a
    Should Not Be Empty      ${output}
    Log    Result: ${output}

ssh connection has not been established
    Log To Console  "Fail ssh connection"    



    