*** Settings ***
Documentation     This  test file is used to check
...               selenium chrome agent image correct operation
...               It checks that a website is correclty launch with
...               a chosen browser as : chrome

Suite setup       Open Website     ${URL}  ${BROWSER}
Suite Teardown    Close all browsers

Resource          keywords.robot

*** Variables ***
${URL}        https://hub.docker.com/r/estheniacollaboration/rfswarm-agent-seleniumlibrary-chrome 
${BROWSER}    Chrome


*** Test Cases ***
User launch a website
    [Documentation]    This test is used to open github  website
    Website application has been correctly launched    ${URL}
    Log To Console    ${BROWSER} launch sucess
    sleep    40
