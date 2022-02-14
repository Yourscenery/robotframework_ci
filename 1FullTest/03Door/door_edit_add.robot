*** Settings ***
Resource          ../../9ShareResource.txt

*** Test Cases ***
door_success_add
    [Setup]    door_success_data_add
    [Template]    door_edit_add
    ${add success data}    新增门禁设备成功

door_fail_add
    [Setup]    door_fail_data_add
    [Template]    door_edit_add
    ${add error projectid}    新增门禁设备成功    ${none}
    ${add empty projectId}    新增门禁设备成功    ${none}
    ${add error areaId}    新增门禁设备成功    ${none}
    ${add empty areaId}    新增门禁设备成功    ${none}
    ${add empty acsdevname}    新增门禁设备成功    ${none}
    ${add empty acsdevindexcode}    新增门禁设备成功    ${none}
    ${add repetition acsdevindexcode}    新增门禁设备失败 请检查是否<设备编号>冲突失败    ${none}
    ${add empty acsdevip}    新增门禁设备成功    ${none}
    ${add empty acsdevport}    新增门禁设备成功    ${none}
    #${add empty devUsername}    新增门禁设备成功    ${none}
    #${add empty devPassword}    新增门禁设备成功    ${none}
    #${add empty acsdevtypecode}    新增门禁设备成功    ${none}
    #${add empty acsdevtypename}    新增门禁设备成功    ${none}

*** keywords ***
door_success_data_add
    ${time}=    get_time_no_year
    ${doorProperty}=    door_edit_property_list
    ${dictdataCode}    ${dictdataValue}    split string    ${doorProperty}    ,
    set suite variable    &{add success data}    projectId=${G_PROJECT_ID}    areaId=${G_AREA_ID}    acsdevname=af门${time}    acsdevindexcode=af${time}    acsdevtypedesc=型号
    ...    acsdevport=23    acsdevip=192.168.2.2    acsdevtypecode=${dictdataCode}    acsdevtypename=${dictdataValue}    devUsername=admin    devPassword=123456
    ...    remark=af门${time}

door_fail_data_add
    ${doorProperty}=    door_edit_property_list
    ${dictdataCode}    ${dictdataValue}    split string    ${doorProperty}    ,
    #项目id错误
    ${time}=    get_time_no_year
    set suite variable    &{add error projectid}    projectId=error${G_PROJECT_ID}    areaId=${G_AREA_ID}    acsdevname=af门${time}    acsdevindexcode=af${time}    acsdevtypedesc=型号
    ...    acsdevport=23    acsdevip=192.168.2.2    acsdevtypecode=${dictdataCode}    acsdevtypename=${dictdataValue}    devUsername=admin    devPassword=123456
    ...    remark=af门${time}
    #项目id空
    ${time}=    get_time_no_year
    set suite variable    &{add empty projectId}    projectId=${empty}    areaId=${G_AREA_ID}    acsdevname=af门${time}    acsdevindexcode=af${time}    acsdevtypedesc=型号
    ...    acsdevport=23    acsdevip=192.168.2.2    acsdevtypecode=${dictdataCode}    acsdevtypename=${dictdataValue}    devUsername=admin    devPassword=123456
    ...    remark=af门${time}
    #区域id错误
    ${time}=    get_time_no_year
    set suite variable    &{add error areaId}    projectId=${G_PROJECT_ID}    areaId=error${G_AREA_ID}    acsdevname=af门${time}    acsdevindexcode=af${time}    acsdevtypedesc=型号
    ...    acsdevport=23    acsdevip=192.168.2.2    acsdevtypecode=${dictdataCode}    acsdevtypename=${dictdataValue}    devUsername=admin    devPassword=123456
    ...    remark=af门${time}
    #区域id空
    ${time}=    get_time_no_year
    set suite variable    &{add empty areaId}    projectId=${G_PROJECT_ID}    areaId=${empty}    acsdevname=af门${time}    acsdevindexcode=af${time}    acsdevtypedesc=型号
    ...    acsdevport=23    acsdevip=192.168.2.2    acsdevtypecode=${dictdataCode}    acsdevtypename=${dictdataValue}    devUsername=admin    devPassword=123456
    ...    remark=af门${time}
    #设备名称空
    ${time}=    get_time_no_year
    set suite variable    &{add empty acsdevname}    projectId=${G_PROJECT_ID}    areaId=${G_AREA_ID}    acsdevname=${empty}    acsdevindexcode=af${time}    acsdevtypedesc=型号
    ...    acsdevport=23    acsdevip=192.168.2.2    acsdevtypecode=${dictdataCode}    acsdevtypename=${dictdataValue}    devUsername=admin    devPassword=123456
    ...    remark=af门${time}
    #设备编号重复
    set suite variable    &{add repetition acsdevindexcode}    projectId=${G_PROJECT_ID}    areaId=${G_AREA_ID}    acsdevname=afrepetition门${time}    acsdevindexcode=af${time}    acsdevtypedesc=型号
    ...    acsdevport=23    acsdevip=192.168.2.2    acsdevtypecode=${dictdataCode}    acsdevtypename=${dictdataValue}    devUsername=admin    devPassword=123456
    ...    remark=afrepetition门${time}
    #设备编号空
    ${time}=    get_time_no_year
    set suite variable    &{add empty acsdevindexcode}    projectId=${G_PROJECT_ID}    areaId=${G_AREA_ID}    acsdevname=af门${time}    acsdevindexcode=${empty}    acsdevtypedesc=型号
    ...    acsdevport=23    acsdevip=192.168.2.2    acsdevtypecode=${dictdataCode}    acsdevtypename=${dictdataValue}    devUsername=admin    devPassword=123456
    ...    remark=af门${time}
    #设备ip空
    ${time}=    get_time_no_year
    set suite variable    &{add empty acsdevip}    projectId=${G_PROJECT_ID}    areaId=${G_AREA_ID}    acsdevname=af门${time}    acsdevindexcode=af${time}    acsdevtypedesc=型号
    ...    acsdevport=23    acsdevip=${empty}    acsdevtypecode=${dictdataCode}    acsdevtypename=${dictdataValue}    devUsername=admin    devPassword=123456
    ...    remark=af门${time}
    #设备端口号空
    ${time}=    get_time_no_year
    set suite variable    &{add empty acsdevport}    projectId=${G_PROJECT_ID}    areaId=${G_AREA_ID}    acsdevname=af门${time}    acsdevindexcode=af${time}    acsdevtypedesc=型号
    ...    acsdevport=${empty}    acsdevip=192.168.2.2    acsdevtypecode=${dictdataCode}    acsdevtypename=${dictdataValue}    devUsername=admin    devPassword=123456
    ...    remark=af门${time}
    #设备账号空
    ${time}=    get_time_no_year
    set suite variable    &{add empty devUsername}    projectId=${G_PROJECT_ID}    areaId=${G_AREA_ID}    acsdevname=af门${time}    acsdevindexcode=af${time}    acsdevtypedesc=型号
    ...    acsdevport=23    acsdevip=192.168.2.2    acsdevtypecode=${dictdataCode}    acsdevtypename=${dictdataValue}    devUsername=${empty}    devPassword=123456
    ...    remark=af门${time}
    #设备密码空
    ${time}=    get_time_no_year
    set suite variable    &{add empty devPassword}    projectId=${G_PROJECT_ID}    areaId=${G_AREA_ID}    acsdevname=af门${time}    acsdevindexcode=af${time}    acsdevtypedesc=型号
    ...    acsdevport=23    acsdevip=192.168.2.2    acsdevtypecode=${dictdataCode}    acsdevtypename=${dictdataValue}    devUsername=admin    devPassword=${empty}
    ...    remark=af门${time}
    #设备类型编号空
    ${time}=    get_time_no_year
    set suite variable    &{add empty acsdevtypecode}    projectId=${G_PROJECT_ID}    areaId=${G_AREA_ID}    acsdevname=af门${time}    acsdevindexcode=af${time}    acsdevtypedesc=型号
    ...    acsdevport=23    acsdevip=192.168.2.2    acsdevtypecode=${empty}    acsdevtypename=${dictdataValue}    devUsername=admin    devPassword=123456
    ...    remark=af门${time}
    #设备类型名空
    ${time}=    get_time_no_year
    set suite variable    &{add empty acsdevtypename}    projectId=${G_PROJECT_ID}    areaId=${G_AREA_ID}    acsdevname=af门${time}    acsdevindexcode=af${time}    acsdevtypedesc=型号
    ...    acsdevport=23    acsdevip=192.168.2.2    acsdevtypecode=${dictdataCode}    acsdevtypename=${empty}    devUsername=admin    devPassword=123456
    ...    remark=af门${time}
