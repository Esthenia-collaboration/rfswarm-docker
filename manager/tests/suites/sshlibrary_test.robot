*** Settings ***
Documentation   This suite aims to test ssh agent well connection
...   positive test: the robot running on the agent and connect succefully to an SSH server
...   negative test: the robot running on the agent to connect to SSH server with the wrong access connection
...   The failure message has to be from the ssh library

Resource         ssh_keywords.robot


*** Variables ***

${SSHSERVER}        ssh_server
${FAKESSHSERVER}    http://fakeconnection.test
${LOGIN}            manageruser
${PWD}              managerpwd

*** Test Cases ***

Passing ssh connection   
    Given ssh connection is setup    ${SSHSERVER}
    When User enter credentials  ${LOGIN}  ${PWD} 
    Then ssh connection has been established
    And Close ssh connection

Failing ssh connection
    Given ssh connection is setup     ${FAKESSHSERVER}
    Then ssh connection has not been established     ${LOGIN}  ${PWD} 
    And Close ssh connection



