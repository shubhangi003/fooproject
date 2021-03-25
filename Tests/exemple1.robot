*** Settings ***
Documentation                   This is some basic infor about the whole test suite
Library                         SeleniumLibrary
Test Teardown                   Close Browser

*** Variables ***
${URL}                          https://rental35.infotiv.net/
${BROWSER}                      Chrome

*** Test Cases ***
create a new user by providing available and correct username and password
   [Documentation]                  Create a new user
   [Tags]                           Test 1

    Open browser                     about:blank        chrome     #${BROWSER}
    Go To                            http://rental35.infotiv.net/       #${URL}
    Wait Until Page Contains         Infotiv Car Rental
    Press Keys                        //*[@id="createUser"]         RETURN
    Wait Until Page Contains          Create a new user
    Input Text                  id=name                            soni
    Input Text                  id=last                            lulla
    Input Text                  id=phone                           0234567845
    Input Text                  id=emailCreate                     sonial@gmail.com
    Input Text                  id=confirmEmail                    sonial@gmail.com
    Input Text                  id=passwordCreate                  sonia1290
    Input Text                  id=confirmPassword                 sonia1290
    Press Keys                  //*[@id="create"]                  RETURN
   # Wait Until Page Contains      What would you like to drive?
    Press Keys                       //*[@id="logout"]             RETURN