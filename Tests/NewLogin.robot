*** Setting ***
Documentation                   This is some basic infor about the whole test suite
Library                         SeleniumLibrary
Test Teardown                   Close Browser
*** Variables ***
${URL}                        http://rental35.infotiv.net/
${BROWSER}                    chrome
${URL}                        http://rental35.infotiv.net/
${CREATE_USER_BUTTON}         //*[@id="createUser"]
${FNAME_TEXTBOX}              //*[@id="name"]
${LNAME_TEXTBOX}              //*[@id="last"]
${PHONENO_TEXTBOX}            //*[@id="phone"]
${EMAIL_TEXTBOX}              //*[@id="emailCreate"]
${CONFIRM_EMAIL_TEXTBOX}      //*[@id="confirmEmail"]
${PASSWORD_TEXTBOX}           //*[@id="passwordCreate"]
${CONFIRM_PASSWORD_TEXTBOX}   //*[@id="confirmPassword"]
${CREATE_BUTTON}              //*[@id="create"]
${SUCCESS_LOGIN_LEBEL}        //*[@id="welcomePhrase"]
${CONTINUE_BUTTON}            //*[@id="continue"]
${CONFIRM_URL}                http://rental35.infotiv.net/webpage/html/gui/updateAvailability.php?fullName=master
${MYPAGE_URL}                 http://rental35.infotiv.net/webpage/html/gui/myPage.php
${LOGOUT}                     //*[@id="logout"]

*** Test Cases ***
User can create a new user by providing available and correct username and password
    [Documentation]                  Create a new user
    [Tags]                           TestGherkin 3
    Given User Opens an Application
    Then User Enter Email and Password
    Then Verify Login Success Message
    Then User Select Date
    Then User Click Continue
    Then User Scroll the Page and Select car
    Then User Fill Up The Information
    Then User Confirm Booking
    Then User Click MyPage To See Details
    Then User Sign out
    And Should Close the browser
*** Keywords ***
User Opens an Application
    Open browser                     ${URL}                          ${BROWSER}
   
User Enter Email and Password
    Click Element                    ${LOGIN_TEXTBOX}
    Input Text                       ${LOGIN_TEXTBOX}                ana.carin@gmail.com
    Click Element                    ${PASSWORD_TEXTBOX}
    Input Text                       ${PASSWORD_TEXTBOX}             anacarin
Verify Login Success Message
    Wait Until Element Is Visible    ${SUCCESS_LOGIN_LEBEL}
    Element Should Be Visible        ${SUCCESS_LOGIN_LEBEL}
User Select Date
     Press Keys         id=reset                 RETURN
     Input Text         id=start                   04/24/2021
     Input Text         id=end                     04/25/2021
User Click Continue
     Click Element      ${CONTINUE_BUTTON}
User Scroll the Page and Select car
     Wait Until Element Is Visible       //*[@id="bookS90pass5"]
     Element Should Be Visible           //*[@id="bookS90pass5"]
     Press Keys                          //*[@id="bookS90pass5"]        RETURN
User Fill Up The Information
     Wait Until Element Is Visible       //*[@id="questionText"]
     Element Should Be Visible           //*[@id="questionText"]
     Input Text                          id=cardNum                      1230067812245678
     Input Text                          id=fullName                        anacarin
     #month Selction
     Click Element                       //*[@id="confirmSelection"]/form/select[1]
      Wait Until Element Is Visible      //*[@id="month6"]
      Element Should Be Visible          //*[@id="month6"]
      Click Element                      //*[@id="month6"]
      #year
      Click Element                      //*[@id="confirmSelection"]/form/select[2]
      Wait Until Element Is Visible      //*[@id="month2022"]
      Element Should Be Visible          //*[@id="month2022"]
      Click Element                      //*[@id="month2022"]
     Input Text                          id=cvc             234
User Confirm Booking
     Press Keys                         //*[@id="confirm"]         RETURN
     Should be Equal                    ${CONFIRM_URL}   ${CONFIRM_URL}
User Click MyPage To See Details
     Click Element                     //*[@id="mypage"]
     Should be Equal                   ${MYPAGE_URL}          ${MYPAGE_URL}
User Sign out
     Click Element                     //*[@id="logout"]
Should Close the browser
     Close Browser
     
