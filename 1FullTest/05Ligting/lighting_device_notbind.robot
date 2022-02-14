*** Settings ***
Resource          ../../9ShareResource.txt

*** Test Cases ***
lighting_success_binding_not
    [Setup]    lighting_success_data_device_notbinding
    [Template]    lighting_device_notbinding
    envir    ${envir success binding_not}    0
    bright    ${bright success binding_not}    0
    adscreen    ${adscreen success binding_not}    0
    camera    ${camera success binding_not}    0
    spon    ${spon success binding_not}    0

lighting_fail_binding_not
    [Setup]    lighting_fail_data_device_notbinding
    [Template]    lighting_device_notbinding
    envir    ${projectid is empty}    0
    bright    ${projectid is empty}    0
    adscreen    ${projectid is empty}    0
    camera    ${projectid is empty}    0
    spon    ${projectid is empty}    0

*** keywords ***
lighting_success_data_device_notbinding
    set suite variable    &{envir success binding_not}    projectid=${G_PROJECT_ID}    areaid=${G_AREA_ID}    size=1000
    set suite variable    &{bright success binding_not}    projectid=${G_PROJECT_ID}    areaid=${G_AREA_ID}    size=1000
    set suite variable    &{adscreen success binding_not}    projectid=${G_PROJECT_ID}    areaid=${G_AREA_ID}    size=1000
    set suite variable    &{camera success binding_not}    projectid=${G_PROJECT_ID}    areaid=${G_AREA_ID}    size=1000
    set suite variable    &{spon success binding_not}    projectid=${G_PROJECT_ID}    areaid=${G_AREA_ID}    size=1000

lighting_fail_data_device_notbinding
    set suite variable    &{projectid is empty}    projectid=${empty}    areaid=${G_AREA_ID}    size=1000
    set suite variable    &{areaid is empty}    projectid=${G_PROJECT_ID}    areaid=${empty}    size=1000
