*** Settings ***
Documentation     This  test file is used to make a quick test
...               with selenium agent image
Suite setup       Open a website     ${URL}
Suite Teardown    Close all browsers

Resource          keywords.robot


*** Variables ***
${URL}        http://www.google.com
${BROWSER}    /usr/bin/chromedriver
${research bar}    //*[@id="APjFqb"]
${search term}     docker


*** Test Cases ***
User launch a website
    [Documentation]    This test is used to open a google  website
    the wesite application is correctly launched


