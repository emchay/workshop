*** Test Cases ***
Scalar
    #Create a variable as a single value
    ${username}    Set variable    Mary
    ${password}    Set Variable    welcome!
    log    Hello ${username} and ${password}
    log    Nice to meet you
    
List
    [Tags]    smokeTest
    #Create a variable as a list
    @{username}    Create List    John	Peter	Patrick
    Log Many    @{username} 
    log    ${username[1]}
    
Dictionary
    #Create a variable as a dictionary
    &{user1}    Create Dictionary    name=Mary    surname=welcome1
    &{user2}    Create Dictionary    name=Peter    surname=welcome2
    log    ${user1.name}
    log    ${user2.surname}
    
Set keywords
    #Using "Set Variavle" keyword
    ${hi}    Set Variable     Hello, world!   
    ${hi2}     Set Variable     I said: ${hi}   
    ${var1}     ${var2}     Set Variable     Hello    world 
    @{list}   Set Variable     ${hi}    ${hi2}
    ${item1}     ${item2}    Set Variable     @{list}  
