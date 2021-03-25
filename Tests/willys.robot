*** Settings ***
Documentation          This is some basic information about the whole test suite.
#Resource                ..//Resources/keywords.robot
Library                 SeleniumLibrary
#Test Setup              Begin Web Test
#Test Teardown           End Web Test
Test Teardown            Close Browser

*** Keywords ***

*** Test Cases ***
User can access website and search for the product
    [Documentation]                  This is some basic info about the test
    [Tags]                           Test 1
    open browser                     about:blank        chrome
    Set Browser Implicit Wait         5
    Go to                            https://www.willys.se
   #Set Browser Implicit Wait         5
    Wait until page contains         Handla billig mat online
    Input Text                       id:selenium--search-items-input     kiwi
    Press keys                       xpath://*[@id="selenium--search-items-input"]     RETURN
    Press keys                       xpath://*[@id="selenium--search-items-input"]     RETURN
    Wait until page contains         Sökord: kiwi

    Close Browser


      #INFOTIV.NET
      #Sleep  3s
     #Press Keys        //*[@id="bookS90pass5"]         RETURN
     #Sleep  3s
     #Alert Should Be Present     Text=You need to be logged in to continue.   action=ACCEPT

    # Page Should Contain     id=bookV40pass5
     #Page Should Contain             Confirm booking of Volvo S90
     #Input Text           id=cardNum              1234567812345678
     #Input Text            id=fullName             visa


     #Press Keys          //*[@id="ms-list-1"]         RETURN
     #Click Element        //*[@id="ms-opt-4"]         RETURN
     #Sleep   3s
     #Press Keys          //*[@id="ms-list-2"]         RETURN
     #Click Element        //*[@id="ms-opt-6"]         RETURN
  #   Press Keys           //*[@id="carSelect3"]       RETURN
   #  Page Should Contain   You need to be logged in to continue.
     #${message}=  Handle Alert   action= ACCEPT  timeout=2s