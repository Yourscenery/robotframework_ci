*** Settings ***
Resource          ../../9ShareResource.txt

*** Test Cases ***
alarm_success_delete
    [Setup]    alarm_success_data_delete
    [Template]    alarm_edit_delete
    ${delete success single}    删除成功
    #${delete success multiple}    删除成功

alarm_fail_delete
    [Setup]    alarm_fail_data_delete
    [Template]    alarm_edit_delete
    ${delete ids empty}    设备编号为空
    ${delete ids error}    不存在设备编号

*** keywords ***
alarm_success_data_delete
    ${alarmId}=    alarm_edit_add_oneData    ds0
    set suite variable    &{delete success single}    ids[]=${alarmId}
    #${alarmId1}=    alarm_edit_add_oneData    ds1
    #${alarmId2}=    alarm_edit_add_oneData    ds2
    #set suite variable    &{delete success multiple}    ids[]=${alarmId1},${alarmId2}

alarm_fail_data_delete
    #${alarmId}=    camera_edit_add_oneData    df
    #set suite variable    &{delete ids empty}    ids[]=${empty}
    #set suite variable    &{delete ids error}    ids[]=345${alarmId}
