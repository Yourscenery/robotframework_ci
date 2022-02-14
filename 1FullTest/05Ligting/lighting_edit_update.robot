*** Settings ***
Resource          ../../9ShareResource.txt

*** Test Cases ***
lighting_success_update
    [Setup]    lighting_success_data_update
    [Template]    lighting_edit_update
    ${update success deviceName}    灯杆修改成功

lighting_fail_update
    [Setup]    lighting_fail_data_update
    [Template]    lighting_edit_update
    ${update empty projectid}    灯杆修改成功
    ${update error projectid}    服务异常
    ${update error areaId}    服务异常
    ${update empty areaId}    灯杆修改成功
    ${update empty lightingname}    灯杆修改成功
    #${update empty longitude}    灯杆修改成功
    #${update empty latitude}    灯杆修改成功

*** keywords ***
lighting_success_data_update
    ${lightingID}=    lighting_edit_add_oneData    us
    ${time}=    get_time_no_year
    set suite variable    &{update success deviceName}    lightingid=${lightingID}    projectid=${G_PROJECT_ID}    areaid=${G_AREA_ID}    lightingname=us${time}    lightingmodel=${time}
    ...    longitude=120.1118552    latitude=30.1836952    remark=us${time}    address=浙江省杭州市西湖区转塘街道杭州西湖风景名胜区

lighting_fail_data_update
    ${lightingID}=    lighting_edit_add_oneData    uf
    #项目id空
    ${time}=    get_time_no_year
    set suite variable    &{update empty projectid}    lightingid=${lightingID}    projectid=${empty}    areaid=${G_AREA_ID}    lightingname=uf杆${time}    lightingmodel=${time}
    ...    longitude=120.19203    latitude=30.192175    remark=uf${time}    address=浙江省杭州市滨江区长河街道滨兴路1734号
    #项目id错误
    ${time}=    get_time_no_year
    set suite variable    &{update error projectid}    lightingid=${lightingID}    projectid=error${G_PROJECT_ID}    areaid=${G_AREA_ID}    lightingname=uf杆${time}    lightingmodel=${time}
    ...    longitude=120.19203    latitude=30.192175    remark=uf${time}    address=浙江省杭州市滨江区长河街道滨兴路1734号
    #区域id错误
    ${time}=    get_time_no_year
    set suite variable    &{update error areaId}    lightingid=${lightingID}    projectid=${G_PROJECT_ID}    areaid=error${G_AREA_ID}    lightingname=uf杆${time}    lightingmodel=${time}
    ...    longitude=120.19203    latitude=30.192175    remark=uf${time}    address=浙江省杭州市滨江区长河街道滨兴路1734号
    #区域id空
    ${time}=    get_time_no_year
    set suite variable    &{update empty areaId}    lightingid=${lightingID}    projectid=${G_PROJECT_ID}    areaid=${empty}    lightingname=uf杆${time}    lightingmodel=${time}
    ...    longitude=120.19203    latitude=30.192175    remark=uf${time}    address=浙江省杭州市滨江区长河街道滨兴路1734号
    #设备名称空
    ${time}=    get_time_no_year
    set suite variable    &{update empty lightingname}    lightingid=${lightingID}    projectid=${G_PROJECT_ID}    areaid=${G_AREA_ID}    lightingname=${empty}    lightingmodel=${time}
    ...    longitude=120.19203    latitude=30.192175    remark=uf${time}    address=浙江省杭州市滨江区长河街道滨兴路1734号
    #经度空
    ${time}=    get_time_no_year
    set suite variable    &{update empty longitude}    lightingid=${lightingID}    projectid=${G_PROJECT_ID}    areaid=${G_AREA_ID}    lightingname=uf杆${time}    lightingmodel=${time}
    ...    longitude=${empty}    latitude=30.192175    remark=uf${time}    address=浙江省杭州市滨江区长河街道滨兴路1734号
    #纬度空
    ${time}=    get_time_no_year
    set suite variable    &{update empty latitude}    lightingid=${lightingID}    projectid=${G_PROJECT_ID}    areaid=${G_AREA_ID}    lightingname=uf杆${time}    lightingmodel=${time}
    ...    longitude=120.19203    latitude=${empty}    remark=uf${time}    address=浙江省杭州市滨江区长河街道滨兴路1734号
