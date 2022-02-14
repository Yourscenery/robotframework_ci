*** Settings ***
Resource          ../../9ShareResource.txt

*** Test Cases ***
door_success_delete
    [Setup]    door_success_data_delete
    [Template]    door_edit_delete
    ${delete success single}    删除门禁设备
    ${delete success multiple}    删除门禁设备

door_fail_delete
    [Setup]    door_fail_data_delete
    [Template]    door_edit_delete
    ${delete ids empty}    删除门禁设备
    #${delete ids error}    该门禁设备不存在

*** keywords ***
door_success_data_delete
    ${doorId}=    door_edit_add_oneData    d
    set suite variable    &{delete success single}    ids[]=${doorId}
    ${doorId1}=    door_edit_add_oneData    ds1
    ${doorId2}=    door_edit_add_oneData    ds2
    set suite variable    &{delete success multiple}    ids[]=${doorId1},${doorId2}

door_fail_data_delete
    set suite variable    &{delete ids empty}    ids[]=${empty}
    set suite variable    &{delete ids error}    ids[]=345error
