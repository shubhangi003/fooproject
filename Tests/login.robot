*** Setting ***
Documentation                   This is some basic infor about the whole test suite
Library                         SeleniumLibrary
Test Teardown                   Close Browser

*** Variables ***
${URL}                          https://rental35.infotiv.net/
${BROWSER}                      Chrome
${LOGIN_TEXTBOX}                //*[@id="email"]
${PASSWORD_TEXTBOX}             //*[@id="password"]
${LOGIN_BUTTON}                 //*[@id="login"]
${SUCCESS_LOGIN_LEBEL}          //*[@id="welcomePhrase"]
${LOGIN_ERROR_LEBEL}            //*[@id="signInError"]
*** Test Cases ***
Login With Invalid Credential
    [Documentation]    This is Basic information about
     ...               test when user give invalid credential it display error message
    [Tags]   Invalid Login Test
    Given User Opens An Application
    When User Enter Invalid Password
    Then Error Message Display

Login With Valid Credential
    [Documentation]   This is Basic information aboutWhen user give
     ...              invalid credential it display error message
    [Tags]             Valid Login Test
    Given User Opens An Application
    WHEN USER ENTER EMAIL AND PASSWORD
    AND User Click Login Button
    Then Verify Login Success Message
    Then Close current browser

Book A car Without Logged In
    [Documentation]   This is Basic information about When user try
     ...               to book car without logging in then it display error message
    [Tags]             Valid Login Test
    Given User Open Browser
    When User Select Date
    And User Click Continue
    And User Try to Book a Car
    Then Application Should Display Error Message



*** Keywords ***
User Opens An Application
    Open browser                     ${URL}                          ${BROWSER}
User Enter Email and Password
    Click Element                    ${LOGIN_TEXTBOX}
    Input Text                       ${LOGIN_TEXTBOX}                ana.carin@gmail.com
    Click Element                    ${PASSWORD_TEXTBOX}
    Input Text                       ${PASSWORD_TEXTBOX}             anacarin
User Click Login Button
    Click Element                    ${LOGIN_BUTTON}
Verify Login Success Message
    Wait Until Element Is Visible    ${SUCCESS_LOGIN_LEBEL}
    Element Should Be Visible        ${SUCCESS_LOGIN_LEBEL}
User Enter Invalid Password
    Input Text                       ${LOGIN_TEXTBOX}                 ana.carin@gmail.com
    Input Text                       ${PASSWORD_TEXTBOX}               aaaaaaaa
    Click Element                    ${LOGIN_BUTTON}
Error Message Display
    Wait Until Element Is Visible    ${LOGIN_ERROR_LEBEL}
    Element Should Be Visible        ${LOGIN_ERROR_LEBEL}
Close current browser
   Close Browser
User Open Browser
    Open browser                     ${URL}                          ${BROWSER}
User Select Date
     Click Element      id=start
     Input Text         id=start                   04/22/2021
     Click Element      id=end
     Input Text         id=end                      04/25/2021
     Page Should Contain              When do you want to make your trip?
User Click Continue
     Click Element        //*[@id="continue"]
User Try to Book a Car
     Click Element        //*[@id="bookQ7pass5"]
Application Should Display Error Message
     Sleep  5s
     Alert Should Be Present     You need to be logged in to continue.
User Click MyPage To See Details
     Click Element         //*[@id="mypage"]
User Click Show History
     Set Browser Implicit Wait         5
     Click Element          //*[@id="show"]
User Click Hide History
      Click Element         //*[@id="hide"]