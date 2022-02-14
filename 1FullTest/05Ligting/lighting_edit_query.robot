*** Settings ***
Resource          ../../9ShareResource.txt

*** Test Cases ***
lighting_success_query
    [Setup]    lighting_success_data_query
    [Template]    lighting_edit_query
    ${query first page}    0
    ${query second page}    0
    ${query size 50}    0
    ${query deviceName}    0

lighting_fail_query
    [Setup]    lighting_fail_data_query
    [Template]    lighting_edit_query
    ${query not exist deviceName}    0

*** keywords ***
lighting_success_data_query
    set suite variable    &{query first page}    projectId=${G_PROJECT_ID}    areaid=${G_AREA_ID}    size=10    current=1    lightingname=
    set suite variable    &{query second page}    projectId=${G_PROJECT_ID}    areaid=${G_AREA_ID}    size=10    current=2    lightingname=
    set suite variable    &{query size 50}    projectId=${G_PROJECT_ID}    areaid=${G_AREA_ID}    size=50    current=1    lightingname=
    set suite variable    &{query deviceName}    projectId=${G_PROJECT_ID}    areaid=${G_AREA_ID}    size=10    current=1    lightingname=2020225

lighting_fail_data_query
    set suite variable    &{query not exist deviceName}    projectid=${G_PROJECT_ID}    areaid=${G_AREA_ID}    size=10    current=1    lightingname=not exist
