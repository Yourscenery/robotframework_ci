*** Settings ***
Resource          ../../9ShareResource.txt

*** Test Cases ***
alarm_success_query
    [Setup]    alarm_success_data_query
    [Template]    alarm_edit_query
    ${query first page}    0
    ${query second page}    0
    ${query size 50}    0
    ${query deviceName}    0

alarm_fail_query
    [Setup]    alarm_fail_data_query
    [Template]    alarm_edit_query
    ${query not exist deviceName}    0

*** keywords ***
alarm_success_data_query
    set suite variable    &{query first page}    projectId=${G_PROJECT_ID}    areaId=${G_AREA_ID}      size=10    current=1
    set suite variable    &{query second page}    projectId=${G_PROJECT_ID}    areaId=${G_AREA_ID}      size=10    current=2
    set suite variable    &{query size 50}    projectId=${G_PROJECT_ID}    areaId=${G_AREA_ID}      size=50    current=1
    set suite variable    &{query deviceName}    projectId=${G_PROJECT_ID}    areaId=${G_AREA_ID}      size=10    current=1
    ...    deviceName=22

alarm_fail_data_query
    set suite variable    &{query not exist deviceName}    projectId=${G_PROJECT_ID}      size=10    current=1    deviceName=not exist
