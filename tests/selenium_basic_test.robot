*** Settings ***
Documentation     This  test file is used to make a quick test
...               with selenium agent image
Suite setup       Open a website     ${URL}
Suite Teardown    Close all browsers

Resource          keywords.robot


*** Variables ***
${URL}        https://github.com/


*** Test Cases ***
User launch a website
    [Documentation]    This test is used to open github  website
    the website application is correctly launched


