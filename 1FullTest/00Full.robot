*** Settings ***
Resource          ../9ShareResource.txt

*** Test Cases ***
lighting
    [Template]
    ${time}=    get_time_no_year
    set suite variable    ${s_time}    ${time}
    ###灯杆、工控机、灯具、广告屏、摄像头、一键呼叫、音柱，新增-查询-更新-绑定-控制-操作-解绑-删除
    ###---灯杆---###
    #${lightingId}=    lighting_edit_add_oneData    ###新增
    set suite variable    ${s_lightingId}    ${lightingId}
    #lighting_query_update
    #log    控制    ###

camera
    ###---摄像头---###
    #${cameraId}=    camera_edit_add_oneData    ###新增
    set suite variable    ${s_cameraId}    ${cameraId}
    ${queryCamera}    create dictionary    projectId=${G_PROJECT_ID}    tag=add    size=10    current=1    #deviceName=22
    ${updateCamera}    create dictionary    id=${s_cameraId}    projectId=${G_PROJECT_ID}    areaId=${G_AREA_ID}    deviceName=${G_TIME}摄us    deviceNumber=${G_TIME}
    ...    deviceIp=2.2.2.9    devicePort=2228    deviceAccount=admin    devicePassword=123456    remark=${G_TIME}摄us
    #camera_edit_query    ${queryCamera}    ###查询
    #camera_edit_update    ${updateCamera}    ###更新
    log    控制    ###

alarm
    ###---一键呼叫---###

envir
    ###---工控机---###

delete
    ###---【删除】灯杆、工控机、灯具、广告屏、摄像头、一键呼叫、音柱---###
    #all_devices_delete

*** Keywords ***
lighting_query_update
    [Arguments]    ${lightingId}
    ${queryLighting}    create dictionary    projectid=${G_PROJECT_ID}    areaid=${G_AREA_ID}    size=10    current=1    lightingname=
    ${updateLighting}    create dictionary    lightingid=${s_lightingId}    projectid=${G_PROJECT_ID}    areaid=${G_AREA_ID}    lightingname=us${s_time}    lightingmodel=${s_time}
    ...    longitude=120.1118552    latitude=30.1836952    remark=us${s_time}    address=浙江省杭州市西湖区转塘街道杭州西湖风景名胜区
    lighting_edit_query    ${queryLighting}    ###查询
    lighting_edit_update    ${updateLighting}    ###更新
    ${queryLighting}    create dictionary    projectid=${G_PROJECT_ID}    areaid=${G_AREA_ID}    size=10    current=1    lightingname=us杆${s_time}
    lighting_edit_query    ${queryLighting}    ###查询

camera_query_update

all_devices_delete
    [Documentation]    所有设备删除
    ${deleteLighting}    create dictionary    lightingIds[]=${s_lightingId}
    lighting_edit_delete    ${deleteLighting}    ###灯杆删除
    ${deleteCamera}    create dictionary    ids[]=${s_cameraId}
    camera_edit_delete    ${deleteCamera}    ###摄像头删除
