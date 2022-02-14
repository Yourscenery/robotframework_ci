*** Settings ***
Resource          ../../9ShareResource.txt

*** Test Cases ***
camera_success_add
    [Setup]    camera_success_data_add
    [Template]    camera_edit_add
    ${add success data}    新增成功

camera_fail_add
    [Setup]    camera_fail_data_add
    [Template]    camera_edit_add
    ${add projectId error}    新增失败    ${none}
    #${add projectId empty}    新增成功    ${none}
    ${add areaId error}    新增失败    ${none}
    #${add areaId empty}    新增成功    ${none}
    ${add deviceName empty}    要添加的设备名称,不能为空!!!    ${none}
    ${add deviceNumber empty}    要添加的设备编号,不能为空!!!    ${none}
    ${add deviceIp empty}    ip格式错误    ${none}
    ${add devicePort empty}    端口格式错误    ${none}

*** keywords ***
camera_success_data_add
    ${time}=    get_time_no_year
    set suite variable    &{add success data}    projectId=${G_PROJECT_ID}    areaId=${G_AREA_ID}    deviceName=as摄${time}    deviceNumber=${time}    deviceIp=2.2.2.9
    ...    devicePort=222    deviceAccount=admin    devicePassword=123456    remark=add${time}

camera_fail_data_add
    ${time}=    get_time_no_year
    set suite variable    &{add projectId error}    projectId=error${G_PROJECT_ID}    areaId=${G_AREA_ID}    deviceName=af摄${time}    deviceNumber=${time}    deviceIp=2.2.2.2
    ...    devicePort=222    deviceAccount=admin    devicePassword=123456    remark=add${time}
    ${time}=    get_time_no_year
    set suite variable    &{add projectId empty}    projectId=${EMPTY}    areaId=${G_AREA_ID}    deviceName=af摄${time}    deviceNumber=${time}    deviceIp=2.2.2.2
    ...    devicePort=222    deviceAccount=admin    devicePassword=123456    remark=add${time}
    ${time}=    get_time_no_year
    set suite variable    &{add areaId error}    projectId=error${G_PROJECT_ID}    areaId=error${G_AREA_ID}    deviceName=af摄${time}    deviceNumber=${time}    deviceIp=2.2.2.2
    ...    devicePort=222    deviceAccount=admin    devicePassword=123456    remark=add${time}
    ${time}=    get_time_no_year
    set suite variable    &{add areaId empty}    projectId=${G_PROJECT_ID}    areaId=${empty}    deviceName=af摄${time}    deviceNumber=${time}    deviceIp=2.2.2.2
    ...    devicePort=222    deviceAccount=admin    devicePassword=123456    remark=add${time}
    ${time}=    get_time_no_year
    set suite variable    &{add deviceName empty}    projectId=error${G_PROJECT_ID}    areaId=error${G_AREA_ID}    deviceName=${empty}    deviceNumber=${time}    deviceIp=2.2.2.2
    ...    devicePort=222    deviceAccount=admin    devicePassword=123456    remark=add${time}
    ${time}=    get_time_no_year
    set suite variable    &{add deviceNumber empty}    projectId=${G_PROJECT_ID}    areaId=${G_AREA_ID}    deviceName=af摄${time}    deviceNumber=${empty}    deviceIp=2.2.2.2
    ...    devicePort=222    deviceAccount=admin    devicePassword=123456    remark=add${time}
    ${time}=    get_time_no_year
    set suite variable    &{add deviceIp empty}    projectId=error${G_PROJECT_ID}    areaId=error${G_AREA_ID}    deviceName=af摄${time}    deviceNumber=${time}    deviceIp=${empty}
    ...    devicePort=222    deviceAccount=admin    devicePassword=123456    remark=add${time}
    ${time}=    get_time_no_year
    set suite variable    &{add devicePort empty}    projectId=${G_PROJECT_ID}    areaId=${G_AREA_ID}    deviceName=af摄${time}    deviceNumber=${time}    deviceIp=2.2.2.2
    ...    devicePort=${empty}    deviceAccount=admin    devicePassword=123456    remark=add${time}
    ${time}=    get_time_no_year
    set suite variable    &{add deviceAccount empty}    projectId=${G_PROJECT_ID}    areaId=${G_AREA_ID}    deviceName=af摄${time}    deviceNumber=${time}    deviceIp=2.2.2.2
    ...    devicePort=222    deviceAccount=${empty}    devicePassword=123456    remark=add${time}
    ${time}=    get_time_no_year
    set suite variable    &{add devicePassword empty}    projectId=${G_PROJECT_ID}    areaId=${G_AREA_ID}    deviceName=af摄${time}    deviceNumber=${time}    deviceIp=2.2.2.2
    ...    devicePort=222    deviceAccount=admin    devicePassword=${empty}    remark=add${time}
