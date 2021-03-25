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

User Select Date
     Press Keys         id=reset                 RETURN
     Input Text         id=start                   04/21/2021
     Input Text         id=end                      04/24/2021
User Click Continue
     Click Element      ${CONTINUE_BUTTON}

User Scroll the Page and Select car
     Wait Until Element Is Visible       //*[@id="bookS90pass5"]
     Element Should Be Visible              //*[@id="bookS90pass5"]
     Press Keys                          //*[@id="bookS90pass5"]        RETURN

User Fill Up The Information
     Wait Until Element Is Visible         //*[@id="questionText"]
     Element Should Be Visible            //*[@id="questionText"]
     Input Text                          id=cardNum                      1234567812345678
     Input Text                         id=fullName                        anacarin
     #month Selction
     Click Element                      //*[@id="confirmSelection"]/form/select[1]
      Wait Until Element Is Visible           //*[@id="month6"]
      Element Should Be Visible                //*[@id="month6"]
      Click Element                           //*[@id="month6"]
      #year
      Click Element                       //*[@id="confirmSelection"]/form/select[2]
      Wait Until Element Is Visible           //*[@id="month2022"]
      Element Should Be Visible                //*[@id="month2022"]
      Click Element                           //*[@id="month2022"]
     Input Text                           id=cvc             234

User Confirm Booking
     Press Keys                         //*[@id="confirm"]         RETURN
     Should be Equal                  ${CONFIRM_URL}   ${CONFIRM_URL}

User Click MyPage To See Details
     Click Element         //*[@id="mypage"]
     Should be Equal        ${MYPAGE_URL}          ${MYPAGE_URL}

User Sign out
     Click Element           //*[@id="logout"]

Should Close the browser
   Close Browser