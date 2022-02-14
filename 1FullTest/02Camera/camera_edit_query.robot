*** Settings ***
Resource          ../../9ShareResource.txt

*** Test Cases ***
camera_success_pageCondition
    [Setup]    camera_success_data_pageCondition
    [Template]    camera_edit_pageCondition
    ${query first page}    成功
    ${query second page}    成功
    ${query size 50}    成功
    ${query deviceName}    成功

camera_fail_pageCondition
    [Setup]    camera_fail_data_pageCondition
    [Template]    camera_edit_pageCondition
    ${query not exist deviceName}    成功

*** keywords ***
camera_success_data_pageCondition
    set suite variable    &{query first page}    projectId=${G_PROJECT_ID}    size=10    current=1    tag=add    orderTemplate=createTime:desc
    set suite variable    &{query second page}    projectId=${G_PROJECT_ID}    size=10    current=2    tag=add    orderTemplate=createTime:desc
    set suite variable    &{query size 50}    projectId=${G_PROJECT_ID}    size=50    current=1    tag=add    orderTemplate=createTime:desc
    set suite variable    &{query deviceName}    projectId=${G_PROJECT_ID}    size=10    current=1    likeTemplate=deviceAlias:2020227,deviceNumber:2020227    orMatch=true
    ...    tag=add

camera_fail_data_pageCondition
    set suite variable    &{query not exist deviceName}    projectId=${G_PROJECT_ID}    size=10    current=1    tag=add    likeTemplate=deviceAlias:not exist,deviceNumber:not exist
    ...    orMatch=true
