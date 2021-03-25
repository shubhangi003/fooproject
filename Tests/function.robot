*** Settings ***
Documentation    This is the test information about login function of http://rental35.infotiv.net/
Library          SeleniumLibrary
Test Teardown      Close Browser

*** Variables ***
${URL}               http://rental35.infotiv.net/
${BROWSER}           Chrome
${URL1}              http://rental35.infotiv.net/webpage/html/gui/myPage.php

*** Test Cases ***


Make a booking of car
      [Documentation]    This is the information about user login in system  and book a car
       [Tags]            Functional Test

      Given user Login Infotiv
      AND User Select Date
      Then user press continue button
     Scroll Element Into View    //*[@id="carSelection"]



    Wait Until Element Is Visible       //*[@id="bookS90pass5"]
     Element Should Be Visible              //*[@id="bookS90pass5"]
     Press Keys                          //*[@id="bookS90pass5"]        RETURN
     #Book a car
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

        Input Text                        id=cvc             234
       Press Keys      //*[@id="confirm"]      RETURN

      #Press Keys          //*[@id="mypage"]       RETURN

      Set Browser Implicit Wait               5
      Press Keys                             id=logout                 RETURN
      Should be Equal               ${URL1}     ${URL1}







*** Keywords ***

user Login Infotiv
     Open Browser    about:blank     ${BROWSER}
     Go To           ${URL}
     Wait Until Page Contains         Infotiv Car Rental
     Input Text                       id=email                 ana.carin@gmail.com
     Input Text                       id=password               anacarin
     Press Keys                       //*[@id="login"]         RETURN
     Wait until page contains         When do you want to make your trip?

User Logout from account
     Press Keys                  //*[@id="logout"]          RETURN

User Select Date
     Press Keys         id=reset                 RETURN
     Input Text         id=start                    04/12/2021
     Input Text         id=end                      04/15/2021

User Press Continue Button
     Press Keys         id=continue                 RETURN

User Select CarType from list
     Press Keys          //*[@id="ms-list-1"]         RETURN
     Click Element        //*[@id="ms-opt-4"]         RETURN
     Sleep   3s

User Select Number of Passenger
     Press Keys          //*[@id="ms-list-2"]         RETURN
     Click Element        //*[@id="ms-opt-6"]         RETURN
     Press Keys           //*[@id="carSelect3"]       RETURN






