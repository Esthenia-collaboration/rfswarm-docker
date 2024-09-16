*** Settings ***
Documentation     This  test file is used to make a quick test
...               with selenium agent image
...               It checks that a website is correclty launch with
...               a chosen browser like : chrome, firefox, edge

Suite setup       Open website     ${URL}    ${FIREFOX}
Suite Teardown    Close all browsers

Resource          keywords.robot


*** Variables ***
${FIREFOX}    firefox
${URL}        https://github.com/


*** Test Cases ***
User launch a website
    [Documentation]    This test is used to open github website with a chosen browser
    the website application is correctly launched


