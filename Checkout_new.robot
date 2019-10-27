*** Settings ***
Library    SeleniumLibrary    
Library    String    
#Suite Setup    eCommerce Suite Setup
Resource    ../resources/common.resource

#*** Keywords ***
#eCommerce Suite Setup
 #   Open Browser    url=${URL}    browser=${browser}
 #   Maximize Browser Window
#eCommerce Test Setup
 #   Delete All Cookies

*** Variables ***
${URL}    http://automationpractice.com/index.php
${browser}    Chrome

*** Test Cases ***
A normal user checkout and get calculated price and shipping fee
    #Open Browser    url=${URL}    browser=${browser}
    #Maximize Browser Window
    #Mouse Over    xpath: (//div[@class="product-image-container"])[2]
    #Wait Until Element Is Visible    css:ul#homefeatured a[data-id-product="1"]  
    Click Link    css:ul#homefeatured a[data-id-product="1"]
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
    #Close Browser
    
    

    
    
