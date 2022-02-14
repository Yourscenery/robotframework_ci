*** Settings ***
Resource          ../../9ShareResource.txt

*** Test Cases ***
camera_success_delete
    [Setup]    camera_success_data_delete
    [Template]    camera_edit_delete
    ${delete success single}    删除成功
    ${delete success multiple}    删除成功

camera_fail_delete
    [Setup]    camera_fail_data_delete
    [Template]    camera_edit_delete
    #${delete ids empty}    设备编号为空
    ${delete ids error}    要删除的设备不存在

*** keywords ***
camera_success_data_delete
    ${returnValue0}=    camera_edit_add_oneData    ds0
    set suite variable    &{delete success single}    ids[]=${returnValue0}[id]
    ${returnValue1}=    camera_edit_add_oneData    ds1
    ${returnValue2}=    camera_edit_add_oneData    ds2
    set suite variable    &{delete success multiple}    ids[]=${returnValue1}[id],${returnValue2}[id]

camera_fail_data_delete
    set suite variable    &{delete ids empty}    ids[]=${empty}
    set suite variable    &{delete ids error}    ids[]=idserror
