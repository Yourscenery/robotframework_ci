*** Settings ***
Resource          ../../9ShareResource.txt

*** Test Cases ***
lighting_success_delete
    [Setup]    lighting_success_data_delete
    [Template]    lighting_edit_delete
    #${delete success single}    灯杆删除成功
    ${delete success multiple}    灯杆删除成功

lighting_fail_delete
    [Setup]    lighting_fail_data_delete
    [Template]    lighting_edit_delete
    ${delete lightingIds empty}    灯杆id不能为空
    #${delete lightingIds error}    灯杆删除成功

*** keywords ***
lighting_success_data_delete
    #${lightingId}=    lighting_edit_add_oneData    ds0
    #set suite variable    &{delete success single}    lightingIds[]=${lightingId}
    ${lightingId1}=    lighting_edit_add_oneData    ds1
    ${lightingId2}=    lighting_edit_add_oneData    ds2
    set suite variable    &{delete success multiple}    lightingIds[]=${lightingId1},${lightingId2}

lighting_fail_data_delete
    set suite variable    &{delete lightingIds empty}    lightingIds[]=${empty}
    set suite variable    &{delete lightingIds error}    lightingIds[]=errorlightingid
