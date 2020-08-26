*** Settings ***

Library           SeleniumLibrary

    
*** Variables ***
${browser}     http://aspdev.xerago.com/asp/web/
${options}     driver


*** Keywords ***
First Name
     Input Text    xpath=.//input[@id='txtFName']    Harish
    
Last Name
     Input Text    xpath=.//input[@id='txtLName']    Hari 
    
Gender
     Click Element    xpath=//label[@for='male']  
      
QUOTE ID   
     ${Quote}=    Get Text    xpath=//h5[@class='amt-sub-text quoteId-txt']
     Log To Console    ${Quote} 
      
Your Premium Plan     
     ${Gst}=    Get Text    xpath=//span[@class='amt-text premimumm-amt']
     Log To Console    ${Gst}

* Test Cases *
STP Individual flow with Daughter as Insured 
       
     Set Selenium Speed    .5
     Open Browser     ${browser}   chrome 
     maximize Browser Window
     Set Browser Implicit Wait    50s     
     
     
        # GetQuote Page   
    Click Element    xpath=.//i[@class='rs-icon icon-plus']
        # Select Daughter
    Click Element    xpath=.//input[@id='chkDaughter']   
       # Click Submit Button    
    Click Element    xpath=(.//button[text()='SUBMIT'])[1] 
        # Have you covered all children?
    Click Element    xpath=//label[@for='Yes_q1']    
      
        # Have you covered all children? click Submit
    Click Element    xpath=(//button[text()='SUBMIT'])[2]    
          
    
        # Enter Firstname & Lastname
    First Name
    Last Name
   
        # Select Gender
    Gender       
     
          # Select DOB in 65 Years old
    Click Element    xpath=.//input[@id='txtDOB']             
    Click Element    xpath=//th[@class="datepicker-switch"]
    Click Element    xpath=(//th[@class="datepicker-switch"])[2]
    Click Element    xpath=(//th[@class="prev"])[3]
    Click Element    xpath=(//th[@class="prev"])[3]
    Click Element    xpath=(//th[@class="prev"])[3]
    Click Element    xpath=(//th[@class="prev"])[3]
    Click Element    xpath=(//th[@class="prev"])[3]
    Click Element    //span[@class="year"]
    Click Element    //span[@class="month focused"]
    Click Element    xpath=(//td[@class="day"])[3]
    Sleep    5s      
    
        # Click Drop-Down for Daughter
    Click Element    xpath=(//h5[@class='mb-0'])[3]    
    
        # Select Daughter DOB in 18 Years old
    Click Element    xpath=.//input[@id='txtDOBDaughter1']
    Click Element    //th[@class="datepicker-switch"]
    Click Element    xpath=(//th[@class="datepicker-switch"])[2]
    Click Element    xpath=(//th[@class="prev"])[3]
    Click Element    xpath=(//th[@class="prev"])[3]
    Click Element    xpath=(//span[@class="year"])[2]
    Click Element    xpath=(//span[@class="month"])[7]
    Click Element    xpath=(//td[@class="day"])[29]
    
    
  
        # Print text Select (your preferred Sum Insured) 
    ${name}=    Get Text    xpath=.//label[@for='rangePreferredSum']
    Log To Console    ${name}       
    Sleep    3s    
    
        # Page Scroll
    Execute JavaScript    window.scrollTo(700, document.body.scrollHeight)
    
     # Select your preferred Sum Insured in 1Lakhs  
    Click Element    xpath=(//div[@class="slider-handle min-slider-handle round"])[2]
    Click Element    xpath=(.//div[@class='slider-tick-label'])[1]
    Sleep    5s
       
        # Enter the Ph no
    Input Text    xpath=.//input[@id='edit-mobile-no']    9940613572
        # Enter the Gmail id
    Input Text    xpath=.//input[@id='edit-email']    xyz@gmail.com        
    
        # Click Get Quote Button
    Click Element    xpath=.//input[@value='GET QUOTE'] 
    
        # Your policy summary Page                  
        # Get Quote   
    QUOTE ID
    
        # Your Premium Plan 
      ${Gst}=    Get Text    xpath=(//span[@class='premimumm-amt amt-text'])[2]
     Log To Console    ${Gst}
    
        # Click the Proceed button
    Click Element    xpath=.//span[text()='PROCEED']       
    
        # Details of the Insured page
        # Select Hight & Weight
    Select From List By Index    id=selfddIHeight    3
    Input Text    id=sleftxtWight    67   
    Execute JavaScript    window.scrollTo(700, document.body.scrollHeight) 
    
       # Click Drop-Down Daughter
    Click Element    xpath=(//h5[@class='mb-0'])[3]     
        # Fill the Daughter Details   
    Input Text    id=DaughterFName1    Kirthi
    Input Text    id=DaughterLName1    Suresh  
    
        # Scroll Down
    Execute JavaScript    window.scrollTo(700, document.body.scrollHeight)
    
       # Select Daughter Hight & Weight
    Select From List By Index    id=dagtddIHeight1    3
    Input Text    id=dagttxtWight1    67   
              
              
       # Get Quote & Your Premium Plan  
    QUOTE ID
    Your Premium Plan
    
        # Click proceed button
    Click Element    xpath=.//span[text()='PROCEED']  
    
        # Medical Questions Page
        # Choose Medical Questions as No   
    Click Element    xpath=//label[@for='No_q1']    
    Click Element    xpath=//label[@for='No_q3']  
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=//label[@for='No_q4'] 
    Click Element    xpath=//label[@for='No_q5'] 
    Click Element    xpath=//label[@for='No_q6'] 
    Click Element    xpath=//label[@for='No_q7'] 
    
       # Get Quote & Your Premium Plan   
    QUOTE ID
    Your Premium Plan
             
         # Click proceed button
    Click Element    xpath=//span[@class='quote-button medical-sbmt']       
    
        # Proposer Details Page
        # Select Indian or Foregin National
    Click Element    xpath=//label[@for='Indian']
    
        # Enthe the Address1 & Address2
    Input Text    xpath=//textarea[@id='edit-address1']    Chennai Chennai Chennai
    Input Text    xpath=//textarea[@id='edit-address2']    City City City
    
        # Enter Pincode & Pancard   
    Input Text    xpath=.//input[@id='edit-pincode']    600095    
    Input Text    xpath=//input[@id='edit-pan']    BJTPB9087A
        
        # Enter the City
    Input Text    xpath=//input[@id='edit-city']    Chennai
    
        # Nominee Details
    Select From List By Index    xpath=//select[@id='edit-relation']    4
    
        # Enter Firstname & Lastname
    Input Text    xpath=//input[@id='edit-nomineefirstname']    Deepak
    Input Text    xpath=//input[@id='edit-nomineelastname']    Tharun
    
        # Choose Nominee DOB 
    Click Element    xpath=//input[@id='txtDOBnominee']    
    Click Element    xpath=(//td[@class="day"])[17]
                   
        # Select TPA
    Click Element    xpath=(//span)[7]
        # Click Terms and Conditions
    Click Element    //input[@name="declaration"]         
         
         # Get Quote & Your Premium Plan   
    QUOTE ID
    Your Premium Plan
         # Click proceed button
    Click Element    id=proceedProposer  
    Sleep    20s    
    
        # OTP page                  
    Input Text    xpath=//input[@id='digit-1']    1  
    Input Text    xpath=//input[@id='digit-2']    2 
    Input Text    xpath=//input[@id='digit-3']    3  
    Input Text    xpath=//input[@id='digit-4']    4  
    Input Text    xpath=//input[@id='digit-5']    5  
    Input Text    xpath=//input[@id='digit-6']    6
    
         
         # Click proceed button
    Click Element    xpath=//button[text()='VERIFY']    
    
        # Your coverage is ready page
        # Get Quote & Your Premium Plan   
    QUOTE ID
    Your Premium Plan
    
    Click Element    xpath=//a[text()='PAY']
    Click Element    xpath=//img[@alt='BillDesk']
    Click Element    xpath=//button[text()='PAY']              
    
    
    
        
    