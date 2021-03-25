*** Settings ***
Documentation    This is the test information about login function of http://rental35.infotiv.net/
Library          SeleniumLibrary
Test Teardown      Close Browser

*** Variables ***
${URL}               http://rental35.infotiv.net/
${BROWSER}           Chrome

*** Test Cases ***
Date Selection and Logout
    [Tags]            checking reset and back button
    Login Infotiv
    Date Selection
    Press Keys         id=continue            RETURN
    Press Keys         id=backToDateButton      RETURN
    Press Keys         id=reset                  RETURN
    Logout from account





Login with correct credential
    [Tags]    Test1
    Open Browser To Login
    Verify Page loaded
    Input Username          ana.carin@gmail.com
    Input Password          anacarin
    Submit Credentials
    #Verify message
    Close Browser

Login with incorrect credential
    [Tags]    Test2
    Open Browser To Login
    Verify Page loaded
    Input Username          ana.carin
    Input Password          anacarin
    Submit Credentials
    Error Message1
    Close Browser

Login with wrong password
    [Tags]    Test3
    Open Browser To Login
    Verify Page loaded
    Input Username          ana.carin@gmail.com
    Input Password          anaca123
    Submit Credentials
    Error Message1
    Close Browser

Open MyPage First_Time
    [Tags]    Test4
    Login Infotiv
    Verify Mypage Button
    Close Browser

Logout from Myaccount
    [Tags]    Test5
    Login Infotiv
    Logout from account
    Close Browser

*** Keywords ***
Open Browser To Login
  Open Browser    about:blank     ${BROWSER}
  Go To           ${URL}

Verify Page loaded
   Wait Until Page Contains         Infotiv Car Rental
   #Title Should be                  Infotiv Car Rental


Input Username
  [Arguments]   ${email}
  Input Text    id=email    ${email}

Input Password
   [Arguments]   ${password}
    Input Text   id=password   ${password}

Submit Credentials
    Press Keys               //*[@id="login"]      RETURN

Verify message
    Wait Until Page Contains   When do you want to make your trip?

Error Message1
     Wait until page contains         Wrong e-mail or password

Error Message2
     Set Browser Implicit Wait         5
     Wait until page contains         ! Please fill out this field.

Login Infotiv
     Open Browser    about:blank     ${BROWSER}
     Go To           ${URL}
     Wait Until Page Contains         Infotiv Car Rental
     Input Text                       id=email             ana.carin@gmail.com
     Input Text                       id=password               anacarin
     Press Keys                       //*[@id="login"]      RETURN

     Wait until page contains         When do you want to make your trip?


Verify Mypage Button
     Press Keys                       //*[@id="mypage"]     RETURN
     Press Keys                        //*[@id="hide"]       RETURN
     Press Keys                         //*[@id="show"]      RETURN


Logout from account
     Press Keys                  //*[@id="logout"]          RETURN

Date Selection
     Press Keys         id=reset                 RETURN
     Input Text         id=start                   04/22/2021
     Input Text         id=end                      04/24/2021

