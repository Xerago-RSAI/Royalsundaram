*** Settings ***
Test Teardown    Close Browser
Library    SeleniumLibrary 
*** Variables ***
${SMCPartner}    http://10.100.20.34:9190/web/guest/common/products/getquote?agentcode=BA505764

*** Keywords ***
Jenkins
    
    ${chrome_options} =     Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chrome_options}   add_argument    headless
    Call Method    ${chrome_options}   add_argument    disable-gpu
    Call Method    ${chrome_options}   add_argument    no-sandbox
    Create WebDriver  Chrome  chrome_options=${chrome_options}
    Go To    ${SMCPartner}
    Maximize Browser Window   
    Set Browser Implicit Wait    15s

*** Test Cases ***
Check the list of products in the SMC partner
    [Documentation]    Check the products  visible or not SMC Insurance Brokers Pvt Ltd.
    
    Jenkins      
    Element Should Not Be Visible  xpath=.//div[@title='Lifeline Health Insurance']
    Log    Life Line product is disable in SMC partner 
    
    Element Should Be Visible    xpath=.//div[@title='Gruh Surakasha Home Insurance']
    ${Gruh_Surakasha}=    Get Text    xpath=.//div[@title='Gruh Surakasha Home Insurance'] 
    Log     ${Gruh_Surakasha} is Present 
       
    Element Should Be Visible    xpath=.//div[@title='Car Insurance (Brand New and Rollover)']
    ${car}=    Get Text    xpath=.//div[@title='Car Insurance (Brand New and Rollover)'] 
    Log     ${car} is Present 
     
    Element Should Be Visible    xpath=.//div[@title='Individual Personal Accident Insurance']
    ${Individual}=    Get Text    xpath=.//div[@title='Individual Personal Accident Insurance'] 
    Log     ${Individual} is Present
     
    Element Should Be Visible    xpath=.//div[@title='InstaRenew']
    ${InstaRenew}=    Get Text    xpath=.//div[@title='InstaRenew'] 
    Log     ${InstaRenew} is Present
     
    Element Should Be Visible    xpath=.//div[@title='Family Plus Health Insurance']
    ${Family_Plus}=    Get Text    xpath=.//div[@title='Family Plus Health Insurance'] 
    Log     ${Family_Plus} is Present 
    
    Element Should Be Visible    xpath=.//div[@title='Commercial Vehicle Insurance']
    ${Commercial}=    Get Text    xpath=.//div[@title='Commercial Vehicle Insurance'] 
    Log     ${Commercial} is Present
    
    Element Should Be Visible    xpath=.//div[@title='Two Wheeler (Brand New and Rollover)']
    ${Two_Wheeler}=    Get Text    xpath=.//div[@title='Two Wheeler (Brand New and Rollover)'] 
    Log     ${Two_Wheeler} is Present
    
    