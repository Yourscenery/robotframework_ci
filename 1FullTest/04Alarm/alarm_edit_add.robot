*** Settings ***
Resource          ../../9ShareResource.txt

*** Test Cases ***
alarm_success_add
    [Setup]    alarm_success_data_add
    [Template]    alarm_edit_add
    ${add success data}    新增成功

alarm_fail_add
    [Setup]    alarm_fail_data_add
    [Template]    alarm_edit_add
    ${add projectId error}    新增失败
    ${add projectId empty}    新增成功
    ${add areaId error}    新增失败
    ${add areaId empty}    新增成功
    ${add deviceName empty}    要添加的设备名称不能为空
    ${add deviceNumber empty}    要添加的一键报警设备编号,不能为空!!!
    ${add deviceIp empty}    ip格式错误
    ${add devicePort empty}    端口格式错误

*** keywords ***
alarm_success_data_add
    ${time}=    get_time_no_year
    set suite variable    &{add success data}    projectId=${G_PROJECT_ID}    areaId=${G_AREA_ID}    deviceName=as一键${time}    deviceNumber=${time}    deviceIp=2.2.2.9
    ...    devicePort=222    deviceAccount=${time}    devicePassword=${time}    remark=add${time}

alarm_fail_data_add
    #项目id错误
    ${time}=    get_time_no_year
    set suite variable    &{add projectId error}    projectId=error${G_PROJECT_ID}    areaId=${G_AREA_ID}    deviceName=af一键${time}    deviceNumber=${time}    deviceIp=6.6.6.6
    ...    devicePort=222    deviceAccount=admin    devicePassword=123456    remark=add${time}
    #项目id空
    ${time}=    get_time_no_year
    set suite variable    &{add projectId empty}    projectId=${EMPTY}    areaId=${G_AREA_ID}    deviceName=af一键${time}    deviceNumber=${time}    deviceIp=6.6.6.6
    ...    devicePort=222    deviceAccount=admin    devicePassword=123456    remark=add${time}
    #区域id错误
    ${time}=    get_time_no_year
    set suite variable    &{add areaId error}    projectId=error${G_PROJECT_ID}    areaId=error${G_AREA_ID}    deviceName=af一键${time}    deviceNumber=${time}    deviceIp=6.6.6.6
    ...    devicePort=222    deviceAccount=admin    devicePassword=123456    remark=add${time}
    #区域id空
    ${time}=    get_time_no_year
    set suite variable    &{add areaId empty}    projectId=${G_PROJECT_ID}    areaId=${empty}    deviceName=af一键${time}    deviceNumber=${time}    deviceIp=6.6.6.6
    ...    devicePort=222    deviceAccount=admin    devicePassword=123456    remark=add${time}
    #设备名称空
    ${time}=    get_time_no_year
    set suite variable    &{add deviceName empty}    projectId=error${G_PROJECT_ID}    areaId=error${G_AREA_ID}    deviceName=${empty}    deviceNumber=${time}    deviceIp=6.6.6.6
    ...    devicePort=222    deviceAccount=admin    devicePassword=123456    remark=add${time}
    #设备编号空
    ${time}=    get_time_no_year
    set suite variable    &{add deviceNumber empty}    projectId=${G_PROJECT_ID}    areaId=${G_AREA_ID}    deviceName=af一键${time}    deviceNumber=${empty}    deviceIp=6.6.6.6
    ...    devicePort=222    deviceAccount=admin    devicePassword=123456    remark=add${time}
    #设备ip空
    ${time}=    get_time_no_year
    set suite variable    &{add deviceIp empty}    projectId=error${G_PROJECT_ID}    areaId=error${G_AREA_ID}    deviceName=af一键${time}    deviceNumber=${time}    deviceIp=${empty}
    ...    devicePort=222    deviceAccount=admin    devicePassword=123456    remark=add${time}
    #设备端口号空
    ${time}=    get_time_no_year
    set suite variable    &{add devicePort empty}    projectId=${G_PROJECT_ID}    areaId=${G_AREA_ID}    deviceName=af一键${time}    deviceNumber=${time}    deviceIp=6.6.6.6
    ...    devicePort=${empty}    deviceAccount=admin    devicePassword=123456    remark=add${time}
    #设备账号空
    ${time}=    get_time_no_year
    set suite variable    &{add deviceAccount empty}    projectId=${G_PROJECT_ID}    areaId=${G_AREA_ID}    deviceName=af一键${time}    deviceNumber=${time}    deviceIp=6.6.6.6
    ...    devicePort=222    deviceAccount=${empty}    devicePassword=123456    remark=add${time}
    #设备密码空
    ${time}=    get_time_no_year
    set suite variable    &{add devicePassword empty}    projectId=${G_PROJECT_ID}    areaId=${G_AREA_ID}    deviceName=af一键${time}    deviceNumber=${time}    deviceIp=6.6.6.6
    ...    devicePort=222    deviceAccount=admin    devicePassword=${empty}    remark=add${time}
