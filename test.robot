*** Settings ***
Library    SeleniumLibrary
# Suite Teardown    Close Browser
*** Variables ***
${browser}    chrome
${url}    http://localhost:8069/web/login
${expected_result}     Podcasts ไทย
${username}    admin
${password}    admin
${db}    //a[contains(.,'PRE_GOLIVE_020920')]
${purchase_module}    //a[@data-menu-xmlid="purchase.menu_purchase_root" and @class="nav-link"]

### Create Quotation
${create_buttom}    //button[@class='btn btn-primary o_list_button_add']/span[@class='d-none d-sm-inline' and contains(.,'Create')]
${vendor}    ACTONA DIRECT LIMITED
${input_vendor}    //input[@placeholder="N﻿a﻿m﻿e﻿,﻿ ﻿T﻿I﻿N﻿,﻿ ﻿E﻿m﻿a﻿i﻿l﻿,﻿ ﻿o﻿r﻿ ﻿R﻿e﻿f﻿e﻿r﻿e﻿n﻿c﻿e"]
${product_one}    //td[@class='o_field_x2many_list_row_add' and contains(.,'Add')]
${product_one_name}


*** Keywords ***
Open browser google.com
    Open Browser     ${url}     ${browser}
Choose DB
    Click Element    ${db}
Login system with usernem and password
    Input Text    name=login    ${username}
    Input Password    name=password    ${password}
    Submit Form
    Wait Until Page Contains    Inbox    timeout=10
Click Menu Purchase
    Click Element    ${purchase_module}
Click Create Purchase
    Wait Until Page Contains    Requests for Quotation
    Click Element    ${create_buttom}
Create Request For Quotation Should Get Request For Quotation
    Wait Until Page Contains    Requests for Quotation    timeout=10
    Sleep    2
    Input Text    ${input_vendor}    ${vendor}
    Wait Until Element Contains    //ul[@class="ui-autocomplete ui-front ui-menu ui-widget ui-widget-content o_partner_autocomplete_dropdown"]//li[1]    ${vendor}
    Click Element    //ul[@class="ui-autocomplete ui-front ui-menu ui-widget ui-widget-content o_partner_autocomplete_dropdown"]//li[1]
    Click Element    ${product_one}
    Sleep    2
    Input Text    //div[@class='o_field_widget o_field_many2one o_required_modifier' and @name="product_id"]    1157187 ชุดปลอกผ้านวมเตียงคู่ Sateen DAGMAR DBF        
    
# รอผลลัพธ์
#     Wait Until Page Contains    ${test}

*** Test Cases ***
Search case
   Open browser google.com
   Choose DB
   Login system with usernem and password
   Click Menu Purchase
   Click Create Purchase
   Create Request For Quotation Should Get Request For Quotation
#    รอผลลัพธ์