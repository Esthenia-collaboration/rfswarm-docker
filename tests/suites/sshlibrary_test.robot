*** Settings ***
Documentation   This suite aims to test ssh agent well connection
...   positive test: the robot running on the agent and connect succefully to an SSH server
...   negative test: the robot running on the agent to connect to SSH server with the wrong access connection
...   The failure message has to be from the ssh library

Suite Teardown   Close All Connections 

Resource         keywords.robot


*** Variables ***

${LOGIN}            manageruser
${PWD}              managerpwd

*** Test Cases ***

Passing ssh connection   
    Given ssh connection is establish    ${RFS_SWARMMANAGER}
    When User enter credentials  ${LOGIN}  ${PWD} 
    Then ssh connection has been established

Failing ssh connection
    Given ssh connection is establish     https://fakeconnection.org
    When User enter credentials  ${LOGIN}  ${PWD} 
    Then ssh connection has not been established



