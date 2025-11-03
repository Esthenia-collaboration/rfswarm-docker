*** Settings ***
Documentation    This file is a ressource file where ssh keywords related are
...              gathering.   

Library    SSHLibrary   


*** Keywords ***
ssh connection is setup
    [Arguments]      ${sshserver}
     ${status}=    Run Keyword And Return Status  Open Connection	${sshserver}
     IF    not ${status} 
         Fail     "Impossible to open ssh connection"
     ELSE
         Log To Console     "Connected"    
     END

User enter credentials
    [Arguments]   ${login}  ${pwd}
    ${status}=    Run Keyword And Return Status  Login  ${login}  ${pwd}
    IF    not ${status} 
         Fail     "Fail user connection"
    ELSE
         Log To Console     "user has been connected"    
    END

ssh connection has been established
    ${output}=    Execute Command    uname -a
    Log To Console   "connection output is:${output}"
    Should Not Be Empty      ${output}
    Log    Result: ${output}

ssh connection has not been established
    [Arguments]   ${login}  ${pwd}
    ${status}=    Run Keyword And Return Status   User enter credentials    ${login}  ${pwd}
    IF    not ${status} 
         Log To Console     "Fail ssh user connection"
    ELSE
         Fail    "user has been connected. This is not what is expected"    
    END 

Close ssh connection
    Close Connection 
