*** Settings ***
Documentation     This  test file is used to check
...               selenium firefox agent image correct operation
...               It checks that a website is correclty launch with
...               a chosen browser as : firefox

Suite Setup       Open Website     ${URL}    ${BROWSER}
Suite Teardown    Close all browsers

Resource          keywords.robot


*** Variables ***
${BROWSER}    headlessfirefox
${URL}        https://hub.docker.com/r/estheniacollaboration/rfswarm-agent-seleniumlibrary-chrome 


*** Test Cases ***
User launch a website
    [Documentation]    This test is used to open github website with a chosen browser
    sleep    40
    Website application has been correctly launched    ${URL}
    Log To Console    ${BROWSER} launch sucess
    sleep    40
