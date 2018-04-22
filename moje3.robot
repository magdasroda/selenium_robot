*** Settings ***
Library  SSHLibrary
Suite Setup  Open Connection And Log In
Suite Teardown  Close All Connections
Library Selenium2Library

*** Variables ***
${MESSAGE}  Hello everyone!
${REMOTE_HOST}  localhost
${REMOTE_USERNAME}  tester
${REMOTE_PASSWORD}  adam

${SERVER}  localhost:7272
${BROWSER}  Firefox
${DELAY}  0
${VALID USER}  testerwsb_11
${VALID PASSWORD}  adam1234

${LOGIN URL}  http://${SERVER}/
${WELCOME URL}  http://${SERVER}/welcome.html
${ERROR URL}  http://${SERVER}/error.html


*** Test Cases ***
My Test
  my log 01

My Test 2
  my log 02

My Test SSH 01
  Open Connection And Log In

My Test 007
  Open Connection And Log In
  ${output}=    Execute command    uname -a
  Should contain  ${output}    GNU/Linux


*** Keywords ***
My Log 01
  log to console  ${MESSAGE}

My Log 02
  log to console  Bye bye

Open Connection And Log In
  Open Connection  ${REMOTE_HOST}
  Login  ${REMOTE_USERNAME}  ${REMOTE_PASSWORD}

Open Browser To Login Page
  Open Browser  ${LOGIN URL}  ${BROWSER}
  Maximize Browser Window
  Set Selenium Speed  ${DELAY}
  Login Page Should Be Open

Login Page Should Be Open
  Title Should Be  Login Page

Go To Login Page
  Go To  ${LOGIN URL}
  Login Page Should Be Open

Input Username
  [Arguments]  ${username}
  Input Text  username_field  ${username}

Input Password
  [Arguments]  ${password}
  Input Text  username_field  ${password}

Submit Credentials
  click Button  login_button

Welcome Page Should Be Open
  Location Should Be  ${WELCOME URL}
  title Shoud Be  Welcome Page
