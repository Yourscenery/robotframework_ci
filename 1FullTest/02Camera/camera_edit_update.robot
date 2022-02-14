*** Settings ***
Resource          ../../9ShareResource.txt

*** Test Cases ***
camera_success_update
    [Setup]    camera_success_data_update
    [Template]    camera_edit_update
    ${update success deviceName}    编辑成功

camera_fail_update
    [Setup]    camera_fail_data_update
    [Template]    camera_edit_update
    ${update projectId error}    服务异常    ${none}
    ${update projectId empty}    编辑成功    ${none}
    ${update areaId error}    服务异常    ${none}
    ${update areaId empty}    编辑成功    ${none}
    ${update deviceName empty}    摄像头设备名称不能为空!!!    ${none}
    ${update deviceNumber empty}    摄像头设备编号不能为空!!!    ${none}
    ${update deviceNumber error}    设备编号不能更改    ${none}
    ${update deviceIp empty}    服务异常    ${none}
    ${update devicePort empty}    编辑成功    ${none}
    ${update deviceAccount empty}    编辑成功    ${none}
    ${update devicePassword empty}    编辑成功    ${none}

*** keywords ***
camera_success_data_update
    ${time}=    get_time_no_year
    ${objectValue}=    camera_edit_add_oneData    us
    set suite variable    &{update success deviceName}    id=${objectValue}[id]    projectId=${objectValue}[projectId]    areaId=${objectValue}[areaId]    deviceName=us摄${time}    deviceNumber=${objectValue}[deviceNumber]
    ...    deviceIp=2.2.2.9    devicePort=2228    deviceAccount=admin    devicePassword=123456    remark=update${time}

camera_fail_data_update
    ${time}=    get_time_no_year
    ${objectValue}=    camera_edit_add_oneData    uf
    ${cameraID}    set variable    ${objectValue}[id]
    ${deviceNumber}    set variable    ${objectValue}[deviceNumber]
    #项目id错误
    set suite variable    &{update projectId error}    id=${cameraID}    projectId=error${G_PROJECT_ID}    areaId=${G_AREA_ID}    deviceName=uf摄${time}    deviceNumber=${deviceNumber}
    ...    deviceIp=2.2.2.2    devicePort=222    deviceAccount=admin    devicePassword=123456    remark=update${time}
    #项目id空
    set suite variable    &{update projectId empty}    id=${cameraID}    projectId=${EMPTY}    areaId=${G_AREA_ID}    deviceName=uf摄${time}    deviceNumber=${deviceNumber}
    ...    deviceIp=2.2.2.2    devicePort=222    deviceAccount=admin    devicePassword=123456    remark=update${time}
    #区域id错误
    set suite variable    &{update areaId error}    id=${cameraID}    projectId=error${G_PROJECT_ID}    areaId=error${G_AREA_ID}    deviceName=uf摄${time}    deviceNumber=${deviceNumber}
    ...    deviceIp=2.2.2.2    devicePort=222    deviceAccount=admin    devicePassword=123456    remark=update${time}
    #区域id空
    set suite variable    &{update areaId empty}    id=${cameraID}    projectId=${G_PROJECT_ID}    areaId=${empty}    deviceName=uf摄${time}    deviceNumber=${deviceNumber}
    ...    deviceIp=2.2.2.2    devicePort=222    deviceAccount=admin    devicePassword=123456    remark=update${time}
    #设备名称空
    set suite variable    &{update deviceName empty}    id=${cameraID}    projectId=error${G_PROJECT_ID}    areaId=error${G_AREA_ID}    deviceName=${empty}    deviceNumber=${deviceNumber}
    ...    deviceIp=2.2.2.2    devicePort=222    deviceAccount=admin    devicePassword=123456    remark=update${time}
    #设备编号空
    set suite variable    &{update deviceNumber empty}    id=${cameraID}    projectId=${G_PROJECT_ID}    areaId=${G_AREA_ID}    deviceName=uf摄${time}    deviceNumber=${empty}
    ...    deviceIp=2.2.2.2    devicePort=222    deviceAccount=admin    devicePassword=123456    remark=update${time}
    #设备编号错误
    set suite variable    &{update deviceNumber error}    id=${cameraID}    projectId=${G_PROJECT_ID}    areaId=${G_AREA_ID}    deviceName=uf摄${time}    deviceNumber=error${deviceNumber}
    ...    deviceIp=2.2.2.2    devicePort=222    deviceAccount=admin    devicePassword=123456    remark=update${time}
    #设备ip空
    set suite variable    &{update deviceIp empty}    id=${cameraID}    projectId=error${G_PROJECT_ID}    areaId=error${G_AREA_ID}    deviceName=uf摄${time}    deviceNumber=${deviceNumber}
    ...    deviceIp=${empty}    devicePort=222    deviceAccount=admin    devicePassword=123456    remark=update${time}
    #设备端口号空
    set suite variable    &{update devicePort empty}    id=${cameraID}    projectId=${G_PROJECT_ID}    areaId=${G_AREA_ID}    deviceName=uf摄${time}    deviceNumber=${deviceNumber}
    ...    deviceIp=2.2.2.2    devicePort=${empty}    deviceAccount=admin    devicePassword=123456    remark=update${time}
    #设备账号空
    set suite variable    &{update deviceAccount empty}    id=${cameraID}    projectId=${G_PROJECT_ID}    areaId=${G_AREA_ID}    deviceName=uf摄${time}    deviceNumber=${deviceNumber}
    ...    deviceIp=2.2.2.2    devicePort=222    deviceAccount=${empty}    devicePassword=123456    remark=update${time}
    #设备密码空
    set suite variable    &{update devicePassword empty}    id=${cameraID}    projectId=${G_PROJECT_ID}    areaId=${G_AREA_ID}    deviceName=uf摄${time}    deviceNumber=${deviceNumber}
    ...    deviceIp=2.2.2.2    devicePort=222    deviceAccount=admin    devicePassword=${empty}    remark=update${time}
