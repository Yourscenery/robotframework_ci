*** Settings ***
Resource          ../9ShareResource.txt

*** Test Cases ***
gis_otherAll
    #刚进入
    rbac_center-point
    bright_getRateOfLighting
    #点击灯杆,获取设备id
    ${respLighting}=    lighting_getLightingListById    lightingid=45ac3e414d617eaf674902fb46df564b    #${lightingId}
    ${sensorId}    set variable    ${respLighting}[0][sensorid]    #工控机id
    ${adscreenId}    set variable    ${respLighting}[0][adscreenid]    #广告屏id
    ${cardNumber}    set variable    ${respLighting}[0][cardNumber]    #广告屏cardNumber
    ${cameraId}    set variable    ${respLighting}[0][cameraid]    #摄像头id
    ${alarmboxId}    set variable    ${respLighting}[0][alarmboxid]    #一键报警id
    ${sponId}    set variable    ${respLighting}[0][sponId]    #世邦id
    ${brightId}    set variable    ${respLighting}[0][brightDeviceId]    #灯具id
    ${brightNodeId}    set variable    ${respLighting}[0][nodeId]    #灯具nodeId

gis_adscreen_device-recordlist-on-start-stop-screenshot
    ####点广告屏
    #${query data adscreen}    create list    ${cardNumber}    ${empty}    errorcardNumber
    #${query data device}    create list    ${id}    ${empty}    errorid
    #${query data status}    create list    ${deviceId}    ${empty}    errordeviceId
    ##${query data message}    create list    成功    不能为空    错误
    #${query data message status}    create list    查询成功    不能为空    查询失败
    : FOR    ${i}    IN RANGE    3
    \    #ad-screen_program-record_list    cardNumber=${item}    ${query data message}[${i}]
    \    #ad-screen_program_screen-on    cardNumber=${item}    ${query data message}[${i}]
    \    #ad-screen_program_start    cardNumber=${item}    ${query data message}[${i}]
    \    #ad-screen_program_stop    cardNumber=${item}    ${query data message}[${i}]
    \    #ad-screen_screenshot    cardNumber=${item}    ${query data message}[${i}]
    \    #ad-screen_status    deviceId=${query data status}[${i}]    ${query data message status}[${i}]
    \    #ad-screen_device    ${query data device}[${i}]    ${query data message}[${i}]
    \    log    循环第【${i}】次

gis_camera_getById_getPlatformParam&alarm_getById&envir_find_getByDevId&lighting_getAdsListByLightingLike_getLampsListByLighting_getLightingListById
    #${query data camera}    create list    ${cameraId}    ${empty}    error${id}
    #${query data alarm}    create list    ${id}    ${empty}    error${id}
    #${query data lighting}    create list    ${lightingid}    ${empty}    error${lightingid}
    ####点击传感器
    #${query data envir}    create list    ${sensorId}    ${empty}    error${deviceId}
    #${query data deviceName}    create list    ${deviceName}    ${empty}    error${deviceName}
    #${query data message}    create list    查询成功    不能为空    查询失败
    : FOR    ${i}    IN RANGE    3
    \    #alarm_getById    id=${query data alarm}[${i}]    ${query data message}[${i}]    #一键报警
    \    #camera_getPlatformParam    lightingid=${query data lighting}[${i}]    #点摄像头
    \    #camera_getById    id=${query data camera}[${i}]    ${query data message}[${i}]    #点摄像头
    \    #envir_find    id=${query data envir}[${i}]    #工控机
    \    #envir_weather_getByDevId    deviceId=${query data envir}[${i}]    #工控机
    \    #lighting_getAdsListByLightingLike    deviceName=${query data deviceName}[${i}]    #灯杆
    \    #lighting_getLampsListByLighting    lightingid=${query data lighting}[${i}]    #灯杆
    \    log    循环第【${i}】次

gis_bright_nb_control
    [Setup]    gis_bright_nb_control_data
    [Template]    bright_nb_control
    ${gis bright open}    大灯开成功
    ${gis bright close}    大灯关成功
    ${gis bright adjust}    调光成功
    ${gis deviceId empty}    大灯开成功
    ${gis deviceId error}    大灯开成功
    ${gis nodeId empty}    无此灯具
    ${gis nodeId error}    无此灯具
    ${gis platformId empty}    Platform Not Load
    ${gis platformId error}    Platform Not Load
    ${gis cmd empty}    服务异常
    ${gis cmd error}    服务异常
    ${gis value empty}    大灯开成功
    ${gis value error}    服务异常

gis_bright_nb_lightingRead
    [Setup]    gis_bright_nb_lightingRead_data
    [Template]    bright_nb_lightingRead
    ${gis bright success}    ${true}
    ${gis bright nodeId empty}    ${false}
    ${gis bright nodeId error}    ${false}
    ${gis bright cmd empty}    ${true}
    ${gis bright cmd error}    ${true}

gis_lighting_getLightingList
    [Setup]    gis_lighting_getLightingList_data
    [Template]    lighting_getLightingList
    ${gis lighting exist}    0
    ${gis lighting projectid empty}    0
    ${gis lighting projectid error}    0
    ${gis lighting areaid empty}    0
    ${gis lighting areaid error}    0
    ${gis lighting lightingid empty}    0
    ${gis lighting lightingid error}    0

*** keywords ***
gis_bright_nb_control_data
    #cmd,2-开灯；3-关；6-调光；value-灯亮度
    ${deviceId}    set variable    57120693700000831029D
    ${nodeId}    set variable    00000831029D
    ${platformId}    set variable    66
    set suite variable    &{gis bright open}    deviceId=${deviceId}    nodeId=${nodeId}    platformId=${platformId}    cmd=2
    set suite variable    &{gis bright close}    deviceId=${deviceId}    nodeId=${nodeId}    platformId=${platformId}    cmd=3    value=0
    set suite variable    &{gis bright adjust}    deviceId=${deviceId}    nodeId=${nodeId}    platformId=${platformId}    cmd=6    value=20
    set suite variable    &{gis deviceId empty}    deviceId=${empty}    nodeId=${nodeId}    platformId=${platformId}    cmd=2
    set suite variable    &{gis deviceId error}    deviceId=errordeviceId    nodeId=${nodeId}    platformId=${platformId}    cmd=2
    set suite variable    &{gis nodeId empty}    deviceId=${deviceId}    nodeId=${empty}    platformId=${platformId}    cmd=2
    set suite variable    &{gis nodeId error}    deviceId=${deviceId}    nodeId=errornodeId    platformId=${platformId}    cmd=2
    set suite variable    &{gis platformId empty}    deviceId=${deviceId}    nodeId=${nodeId}    platformId=${empty}    cmd=2
    set suite variable    &{gis platformId error}    deviceId=${deviceId}    nodeId=${nodeId}    platformId=errorplatformId    cmd=2
    set suite variable    &{gis cmd empty}    deviceId=${deviceId}    nodeId=${nodeId}    platformId=${platformId}    cmd=${empty}
    set suite variable    &{gis cmd error}    deviceId=${deviceId}    nodeId=${nodeId}    platformId=${platformId}    cmd=errorcmd
    set suite variable    &{gis value empty}    deviceId=${deviceId}    nodeId=${nodeId}    platformId=${platformId}    cmd=2    value=${empty}
    set suite variable    &{gis value error}    deviceId=${deviceId}    nodeId=${nodeId}    platformId=${platformId}    cmd=2    value=errorvalue

gis_bright_nb_lightingRead_data
    ${nodeId}    set variable    00000831029D
    set suite variable    &{gis bright success}    nodeId=${nodeId}    cmd=18
    set suite variable    &{gis bright nodeId empty}    nodeId=${EMPTY}    cmd=18
    set suite variable    &{gis bright nodeId error}    nodeId=errornodeId    cmd=18
    set suite variable    &{gis bright cmd empty}    nodeId=${nodeId}    cmd=${EMPTY}
    set suite variable    &{gis bright cmd error}    nodeId=${nodeId}    cmd=errorcmd

gis_lighting_getLightingList_data
    set suite variable    &{gis lighting exist}    projectid=${G_PROJECT_ID}    areaid=${G_AREA_ID}
    set suite variable    &{gis lighting projectid empty}    projectid=${EMPTY}    areaid=${G_AREA_ID}
    set suite variable    &{gis lighting projectid error}    projectid=errorprojectid    areaid=${G_AREA_ID}
    set suite variable    &{gis lighting areaid empty}    projectid=${G_PROJECT_ID}    areaid=${EMPTY}
    set suite variable    &{gis lighting areaid error}    projectid=${G_PROJECT_ID}    areaid=errorareaid
    set suite variable    &{gis lighting lightingid empty}    projectid=${G_PROJECT_ID}    areaid=${EMPTY}    lightingid=${empty}
    set suite variable    &{gis lighting lightingid error}    projectid=${G_PROJECT_ID}    areaid=error${G_AREA_ID}    lightingid=errorlightingid
