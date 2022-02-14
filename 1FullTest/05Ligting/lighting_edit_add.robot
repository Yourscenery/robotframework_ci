*** Settings ***
Resource          ../../9ShareResource.txt

*** Test Cases ***
lighting_success_add
    [Setup]    lighting_success_data_add
    [Template]    lighting_edit_add
    ${add success data}    灯杆新增成功

lighting_fail_add
    [Setup]    lighting_fail_data_add
    [Template]    lighting_edit_add
    #${add empty projectid}    灯杆新增成功
    #${add error projectid}    服务异常
    #${add error areaId}    服务异常
    #${add empty areaId}    灯杆新增成功
    ${add empty lightingname}    灯杆名称不能为空
    ${add empty longitude}    服务异常
    ${add empty latitude}    服务异常

*** keywords ***
lighting_success_data_add
    ${time}=    get_time_no_year
    set suite variable    &{add success data}    projectid=${G_PROJECT_ID}    areaid=${G_AREA_ID}    lightingname=af杆${time}    lightingmodel=${time}    longitude=120.19203
    ...    latitude=30.192175    remark=af${time}    address=浙江省杭州市滨江区长河街道滨兴路1734号

lighting_fail_data_add
    #项目id空
    ${time}=    get_time_no_year
    set suite variable    &{add empty projectid}    projectid=${empty}    areaid=${G_AREA_ID}    lightingname=af杆${time}    lightingmodel=${time}    longitude=120.19203
    ...    latitude=30.192175    remark=af${time}    address=浙江省杭州市滨江区长河街道滨兴路1734号
    #项目id错误
    ${time}=    get_time_no_year
    set suite variable    &{add error projectid}    projectid=error${G_PROJECT_ID}    areaid=${G_AREA_ID}    lightingname=af杆${time}    lightingmodel=${time}    longitude=120.19203
    ...    latitude=30.192175    remark=af${time}    address=浙江省杭州市滨江区长河街道滨兴路1734号
    #区域id错误
    ${time}=    get_time_no_year
    set suite variable    &{add error areaId}    projectid=${G_PROJECT_ID}    areaid=error${G_AREA_ID}    lightingname=af杆${time}    lightingmodel=${time}    longitude=120.19203
    ...    latitude=30.192175    remark=af${time}    address=浙江省杭州市滨江区长河街道滨兴路1734号
    #区域id空
    ${time}=    get_time_no_year
    set suite variable    &{add empty areaId}    projectid=${G_PROJECT_ID}    areaid=${empty}    lightingname=af杆${time}    lightingmodel=${time}    longitude=120.19203
    ...    latitude=30.192175    remark=af${time}    address=浙江省杭州市滨江区长河街道滨兴路1734号
    #设备名称空
    ${time}=    get_time_no_year
    set suite variable    &{add empty lightingname}    projectid=${G_PROJECT_ID}    areaid=${G_AREA_ID}    lightingname=${empty}    lightingmodel=${time}    longitude=120.19203
    ...    latitude=30.192175    remark=af${time}    address=浙江省杭州市滨江区长河街道滨兴路1734号
    #经度空
    ${time}=    get_time_no_year
    set suite variable    &{add empty longitude}    projectid=${G_PROJECT_ID}    areaid=${G_AREA_ID}    lightingname=af杆${time}    lightingmodel=${time}    longitude=${empty}
    ...    latitude=30.192175    remark=af${time}    address=浙江省杭州市滨江区长河街道滨兴路1734号
    #纬度空
    ${time}=    get_time_no_year
    set suite variable    &{add empty latitude}    projectid=${G_PROJECT_ID}    areaid=${G_AREA_ID}    lightingname=af杆${time}    lightingmodel=${time}    longitude=120.19203
    ...    latitude=${empty}    remark=af${time}    address=浙江省杭州市滨江区长河街道滨兴路1734号
