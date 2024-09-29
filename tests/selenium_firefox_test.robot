*** Settings ***
Documentation     This  test file is used to make a quick test
...               with selenium agent image
...               It checks that a website is correclty launch with
...               a chosen browser like : chrome, firefox, edge

Suite Setup       Open website     ${URL}    ${FIREFOX}
Suite Teardown    Close all browsers

Resource          keywords.robot


*** Variables ***
${FIREFOX}    headlessfirefox
${URL}        https://github.com/


*** Test Cases ***
User launch a website
    [Documentation]    This test is used to open github website with a chosen browser
    sleep    40
    the website application is correctly launched
    Log To Console    Firefox launch sucess


