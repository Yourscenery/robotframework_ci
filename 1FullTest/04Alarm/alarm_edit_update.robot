*** Settings ***
Resource          ../../9ShareResource.txt

*** Test Cases ***
alarm_success_update
    [Setup]    alarm_success_data_update
    [Template]    alarm_edit_update
    ${update success deviceName}    编辑成功

alarm_fail_update
    [Setup]    alarm_fail_data_update
    [Template]    alarm_edit_update
    #${update projectId error}    项目id错误
    #${update projectId empty}    项目id空
    #${update areaId error}    ip格式错误
    #${update areaId empty}    ip格式错误
    ${update deviceName empty}    一键报警设备名称不能为空!!!
    ${update deviceNumber empty}    设备编号不能更改
    ${update deviceIp empty}    ip格式错误
    #${update devicePort empty}    ip格式错误
    #${update deviceAccount empty}    ip格式错误
    #${update devicePassword empty}    ip格式错误

*** keywords ***
alarm_success_data_update
    ${time}=    get_time_no_year
    ${alarmId}=    alarm_edit_add_oneData    Us
    set suite variable    &{update success deviceName}    id=${doorId}    projectId=${G_PROJECT_ID}    areaId=${G_AREA_ID}    deviceName=us一键${time}    deviceIp=2.2.2.9
    ...    deviceNumber=${time}    devicePort=2228    deviceAccount=admin    devicePassword=123456    remark=update${time}

alarm_fail_data_update
    ${time}=    get_time_no_year
    ${alarmId}=    alarm_edit_add_oneData    uf
    #项目id错误
    set suite variable    &{update projectId error}    id=${cameraID}    projectId=error${G_PROJECT_ID}    areaId=${G_AREA_ID}    deviceName=uf摄${time}    deviceNumber=${time}
    ...    deviceIp=2.2.2.2    devicePort=222    deviceAccount=admin    devicePassword=123456    remark=update${time}
    #项目id空
    set suite variable    &{update projectId empty}    id=${cameraID}    projectId=${EMPTY}    areaId=${G_AREA_ID}    deviceName=uf摄${time}    deviceNumber=${time}
    ...    deviceIp=2.2.2.2    devicePort=222    deviceAccount=admin    devicePassword=123456    remark=update${time}
    #区域id错误
    set suite variable    &{update areaId error}    id=${cameraID}    projectId=error${G_PROJECT_ID}    areaId=error${G_AREA_ID}    deviceName=uf摄${time}    deviceNumber=${time}
    ...    deviceIp=2.2.2.2    devicePort=222    deviceAccount=admin    devicePassword=123456    remark=update${time}
    #区域id空
    set suite variable    &{update areaId empty}    id=${cameraID}    projectId=${G_PROJECT_ID}    areaId=${empty}    deviceName=uf摄${time}    deviceNumber=${time}
    ...    deviceIp=2.2.2.2    devicePort=222    deviceAccount=admin    devicePassword=123456    remark=update${time}
    #设备名称空
    set suite variable    &{update deviceName empty}    id=${cameraID}    projectId=error${G_PROJECT_ID}    areaId=error${G_AREA_ID}    deviceName=${empty}    deviceNumber=${time}
    ...    deviceIp=2.2.2.2    devicePort=222    deviceAccount=admin    devicePassword=123456    remark=update${time}
    #设备编号空
    set suite variable    &{update deviceNumber empty}    id=${cameraID}    projectId=${G_PROJECT_ID}    areaId=${G_AREA_ID}    deviceName=uf摄${time}    deviceNumber=${empty}
    ...    deviceIp=2.2.2.2    devicePort=222    deviceAccount=admin    devicePassword=123456    remark=update${time}
    #设备ip空
    set suite variable    &{update deviceIp empty}    id=${cameraID}    projectId=error${G_PROJECT_ID}    areaId=error${G_AREA_ID}    deviceName=uf摄${time}    deviceNumber=${time}
    ...    deviceIp=${empty}    devicePort=222    deviceAccount=admin    devicePassword=123456    remark=update${time}
    #设备端口号空
    set suite variable    &{update devicePort empty}    id=${cameraID}    projectId=${G_PROJECT_ID}    areaId=${G_AREA_ID}    deviceName=uf摄${time}    deviceNumber=${time}
    ...    deviceIp=2.2.2.2    devicePort=${empty}    deviceAccount=admin    devicePassword=123456    remark=update${time}
    #设备账号空
    set suite variable    &{update deviceAccount empty}    id=${cameraID}    projectId=${G_PROJECT_ID}    areaId=${G_AREA_ID}    deviceName=uf摄${time}    deviceNumber=${time}
    ...    deviceIp=2.2.2.2    devicePort=222    deviceAccount=${empty}    devicePassword=123456    remark=update${time}
    #设备密码空
    set suite variable    &{update deviceAccount empty}    id=${cameraID}    projectId=${G_PROJECT_ID}    areaId=${G_AREA_ID}    deviceName=uf摄${time}    deviceNumber=${time}
    ...    deviceIp=2.2.2.2    devicePort=222    deviceAccount=admin    devicePassword=${empty}    remark=update${time}
