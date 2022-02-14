*** Settings ***
Resource          ../../9ShareResource.txt

*** Test Cases ***
door_success_pageCondition
    [Setup]    door_success_data_pageCondition
    [Template]    door_edit_pageCondition
    ${query first page}    0
    ${query second page}    0
    ${query size 50}    0
    ${query deviceName}    0

door_fail_pageCondition
    [Setup]    door_fail_data_pageCondition
    [Template]    door_edit_pageCondition
    ${query not exist deviceName}    0

*** keywords ***
door_success_data_pageCondition
    set suite variable    &{query first page}    projectId=${G_PROJECT_ID}    size=10    current=1    orderTemplate=createtime:desc
    set suite variable    &{query second page}    projectId=${G_PROJECT_ID}    size=10    current=2    orderTemplate=createtime:desc
    set suite variable    &{query size 50}    projectId=${G_PROJECT_ID}    size=50    current=1    orderTemplate=createtime:desc
    set suite variable    &{query deviceName}    projectId=${G_PROJECT_ID}    size=10    current=1    likeTemplate=acsdevname:122,acsdevindexcode:122,acsdevtypedesc:122    orMatch=true

door_fail_data_pageCondition
    set suite variable    &{query not exist deviceName}    projectId=${G_PROJECT_ID}    size=10    current=1    likeTemplate=acsdevname:not exist,acsdevindexcode:not exist,acsdevtypedesc:not exist    orMatch=true
