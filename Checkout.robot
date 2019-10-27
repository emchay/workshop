*** Settings ***
Library    SeleniumLibrary    
Library    String    
Test Setup    eCommerce Test Setup

*** Keywords ***
eCommerce Test Setup
    Open Browser    url=${URL}    browser=${browser}
    #Maximize Browser Window  

*** Variables ***
${URL}    http://automationpractice.com/index.php
${browser}    Chrome

*** Test Cases ***
A normal user checkout and get calculated price and shipping fee
    #Open Browser    url=${URL}    browser=${browser}
    #Maximize Browser Window
    #Mouse Over    xpth: (//div[@class="product-image-container"])[2]
    Click Link    css:ul#homefeatured a[data-id-product="2"]
    #Sleep    5 seconds
    Wait Until Element Is Visible    css:a[title="Proceed to checkout"]    
    Click Link    css:a[title="Proceed to checkout"]
    #Click Link    partial link:Proceed to checkout
    Wait Until Page Contains    Shopping-cart summary      
      
    ${totalProductPrice}=    Get Text    id:total_product
    #Should Be Equal As Strings    $27.00    ${totalProductPrice}
    ${totalProductPrice}=  Replace String    ${totalProductPrice}    $    ${empty}  
    Should Be Equal As Strings    27.00    ${totalProductPrice}
    Convert To Number    ${totalProductPrice}
    
    ${totalShippingFee}=    Get Text    id:total_shipping
    ${totalShippingFee}=  Replace String    ${totalShippingFee}    $    ${empty} 
    Should Be Equal As Strings    2.00    ${totalShippingFee}
    Convert To Number    ${totalShippingFee}
     
    ${totalPriceWithoutTax}=    Get Text    id:total_price_without_tax
    ${totalPriceWithoutTax}=  Replace String    ${totalPriceWithoutTax}    $    ${empty}
    Should Be Equal As Strings    29.00    ${totalPriceWithoutTax}
    Convert To Number    ${totalPriceWithoutTax}
    
    ${totalPrice}=    Get Text    id:total_price
    ${totalPrice}=  Replace String    ${totalPrice}    $    ${empty}
    Should Be Equal As Strings    29.00    ${totalPrice}
    #Should Be Equal As Strings    ${totalProductPrice}+${totalShippingFee}    ${totalPrice}
    Close Browser
    
    

    
    
