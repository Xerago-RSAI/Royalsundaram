*** Settings ***
Test Teardown    Close Browser
Library    SeleniumLibrary 
*** Variables ***
${SMCPartner}    http://10.100.20.34:9190/web/guest/common/products/getquote?agentcode=BA505764

*** Keywords ***


*** Test Cases ***
Check the list of products in the SMC partner
    [Documentation]    Check the products  visible or not SMC Insurance Brokers Pvt Ltd.
    Open Browser    ${SMCPartner}    chrome
    Maximize Browser Window      
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
    
    