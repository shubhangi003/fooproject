*** Settings ***
Documentation    This is the test information about login function of http://rental35.infotiv.net/
Library          SeleniumLibrary
Test Teardown      Close Browser

*** Keywords ***


*** Variables ***
#${URL}               http://rental35.infotiv.net/
#${BROWSER}           headlesschrome


*** Test Cases ***

Valid Login for infotiv car rental
    [Documentation]                  This is information about valid login test
    [Tags]                           Test 1
    Open browser                     about:blank        chrome     #${BROWSER}
    Go To                            http://rental35.infotiv.net/       #${URL}
    Wait Until Page Contains         Infotiv Car Rental
    Input Text                       id=email             ana.carin@gmail.com
    Input password                   id=password               anacarin
    Press Keys                       //*[@id="login"]      RETURN
    Wait until page contains         You are signed in as Ana
   # Wait until page contains         When do you want to make your trip?
    #Get Title                        id="userInfoTop"      You are signed in as Ana
    Press Keys                       //*[@id="logout"]      RETURN

    Close Browser


Invalid login for infotiv car rental
   [Documentation]                   This is information about invalid login test
    [Tags]                           Test 2
    Open browser                     about:blank        chrome     #${BROWSER}
    Go To                            http://rental35.infotiv.net/       #${URL}
    Wait Until Page Contains         Infotiv Car Rental
    Input Text                       id=email             ana.carin@gmail.com
    Input password                   id=password               aaaaaaaa
    Press Keys                       //*[@id="login"]      RETURN
    Wait until page contains         Wrong e-mail or password
    Close Browser



Login with wrong format
    [Tags]                           Test 3
    Open browser                     about:blank        chrome     #${BROWSER}
    Go To                            http://rental35.infotiv.net/       #${URL}
    Wait Until Page Contains         Infotiv Car Rental
    Input Text                       id=email             ana.carin
    Input password                   id=password          anacarin
    Press Keys                       //*[@id="login"]      RETURN
    Wait until page contains         Wrong e-mail or password

    Close Browser


