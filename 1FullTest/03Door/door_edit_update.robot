*** Settings ***
Resource          ../../9ShareResource.txt

*** Test Cases ***
door_success_update
    [Setup]    door_success_data_update
    [Template]    door_edit_update
    ${update success deviceName}    修改门禁设备

door_fail_update
    [Setup]    door_fail_data_update
    [Template]    door_edit_update
    ${update error projectid}    修改门禁设备    ${none}
    ${update empty projectId}    修改门禁设备    ${none}
    ${update error areaId}    修改门禁设备    ${none}
    ${update empty areaId}    修改门禁设备    ${none}
    ${update empty acsdevname}    修改门禁设备    ${none}
    ${update empty acsdevip}    修改门禁设备    ${none}
    #${update empty acsdevport}    修改门禁设备    ${none}
    #${update empty devUsername}    修改门禁设备    ${none}
    #${update empty devPassword}    修改门禁设备    ${none}
    #${update empty acsdevtypecode}    修改门禁设备    ${none}
    #${update empty acsdevtypename}    修改门禁设备    ${none}
    #${update empty acsdevindexcode}    该门禁设备不存在    ${none}

*** keywords ***
door_success_data_update
    ${time}=    get_time_no_year
    ${doorProperty}=    door_edit_property_list    2
    ${dictdataCode}    ${dictdataValue}    split string    ${doorProperty}    ,
    ${doorID}=    door_edit_add_oneData    Us
    set suite variable    &{update success deviceName}    acsdevindexcode=${doorID}    projectId=${G_PROJECT_ID}    areaId=${G_AREA_ID}    acsdevname=us门${time}    acsdevtypedesc=us型号
    ...    acsdevport=8888    acsdevip=2.2.2.2    acsdevtypecode=${dictdataCode}    acsdevtypename=${dictdataValue}    devUsername=admin    devPassword=123456
    ...    remark=us门${time}

door_fail_data_update
    ${doorProperty}=    door_edit_property_list    2
    ${dictdataCode}    ${dictdataValue}    split string    ${doorProperty}    ,
    ${doorID}=    door_edit_add_oneData    Uf
    #项目id错误
    ${time}=    get_time_no_year
    set suite variable    &{update error projectid}    projectId=error${G_PROJECT_ID}    areaId=${G_AREA_ID}    acsdevname=uf门${time}    acsdevindexcode=${doorID}    acsdevtypedesc=型号
    ...    acsdevport=23    acsdevip=192.168.2.2    acsdevtypecode=${dictdataCode}    acsdevtypename=${dictdataValue}    devUsername=admin    devPassword=123456
    ...    remark=uf门${time}
    #项目id空
    ${time}=    get_time_no_year
    set suite variable    &{update empty projectId}    projectId=${empty}    areaId=${G_AREA_ID}    acsdevname=uf门${time}    acsdevindexcode=${doorID}    acsdevtypedesc=型号
    ...    acsdevport=23    acsdevip=192.168.2.2    acsdevtypecode=${dictdataCode}    acsdevtypename=${dictdataValue}    devUsername=admin    devPassword=123456
    ...    remark=uf门${time}
    #区域id错误
    ${time}=    get_time_no_year
    set suite variable    &{update error areaId}    projectId=${G_PROJECT_ID}    areaId=error${G_AREA_ID}    acsdevname=uf门${time}    acsdevindexcode=${doorID}    acsdevtypedesc=型号
    ...    acsdevport=23    acsdevip=192.168.2.2    acsdevtypecode=${dictdataCode}    acsdevtypename=${dictdataValue}    devUsername=admin    devPassword=123456
    ...    remark=uf门${time}
    #区域id空
    ${time}=    get_time_no_year
    set suite variable    &{update empty areaId}    projectId=${G_PROJECT_ID}    areaId=${empty}    acsdevname=uf门${time}    acsdevindexcode=${doorID}    acsdevtypedesc=型号
    ...    acsdevport=23    acsdevip=192.168.2.2    acsdevtypecode=${dictdataCode}    acsdevtypename=${dictdataValue}    devUsername=admin    devPassword=123456
    ...    remark=uf门${time}
    #设备名称空
    ${time}=    get_time_no_year
    set suite variable    &{update empty acsdevname}    projectId=${G_PROJECT_ID}    areaId=${G_AREA_ID}    acsdevname=${empty}    acsdevindexcode=${doorID}    acsdevtypedesc=型号
    ...    acsdevport=23    acsdevip=192.168.2.2    acsdevtypecode=${dictdataCode}    acsdevtypename=${dictdataValue}    devUsername=admin    devPassword=123456
    ...    remark=uf门${time}
    #设备编号空
    ${time}=    get_time_no_year
    set suite variable    &{update empty acsdevindexcode}    projectId=${G_PROJECT_ID}    areaId=${G_AREA_ID}    acsdevname=uf门${time}    acsdevindexcode=${empty}    acsdevtypedesc=型号
    ...    acsdevport=23    acsdevip=192.168.2.2    acsdevtypecode=${dictdataCode}    acsdevtypename=${dictdataValue}    devUsername=admin    devPassword=123456
    ...    remark=uf门${time}
    #设备ip空
    ${time}=    get_time_no_year
    set suite variable    &{update empty acsdevip}    projectId=${G_PROJECT_ID}    areaId=${G_AREA_ID}    acsdevname=uf门${time}    acsdevindexcode=${doorID}    acsdevtypedesc=型号
    ...    acsdevport=23    acsdevip=${empty}    acsdevtypecode=${dictdataCode}    acsdevtypename=${dictdataValue}    devUsername=admin    devPassword=123456
    ...    remark=uf门${time}
    #设备端口号空
    ${time}=    get_time_no_year
    set suite variable    &{update empty acsdevport}    projectId=${G_PROJECT_ID}    areaId=${G_AREA_ID}    acsdevname=uf门${time}    acsdevindexcode=${doorID}    acsdevtypedesc=型号
    ...    acsdevport=${empty}    acsdevip=192.168.2.2    acsdevtypecode=${dictdataCode}    acsdevtypename=${dictdataValue}    devUsername=admin    devPassword=123456
    ...    remark=uf门${time}
    #设备账号空
    ${time}=    get_time_no_year
    set suite variable    &{update empty devUsername}    projectId=${G_PROJECT_ID}    areaId=${G_AREA_ID}    acsdevname=uf门${time}    acsdevindexcode=${doorID}    acsdevtypedesc=型号
    ...    acsdevport=23    acsdevip=192.168.2.2    acsdevtypecode=${dictdataCode}    acsdevtypename=${dictdataValue}    devUsername=${empty}    devPassword=123456
    ...    remark=uf门${time}
    #设备密码空
    ${time}=    get_time_no_year
    set suite variable    &{update empty devPassword}    projectId=${G_PROJECT_ID}    areaId=${G_AREA_ID}    acsdevname=uf门${time}    acsdevindexcode=${doorID}    acsdevtypedesc=型号
    ...    acsdevport=23    acsdevip=192.168.2.2    acsdevtypecode=${dictdataCode}    acsdevtypename=${dictdataValue}    devUsername=admin    devPassword=${empty}
    ...    remark=uf门${time}
    #设备类型编号空
    ${time}=    get_time_no_year
    set suite variable    &{update empty acsdevtypecode}    projectId=${G_PROJECT_ID}    areaId=${G_AREA_ID}    acsdevname=uf门${time}    acsdevindexcode=${doorID}    acsdevtypedesc=型号
    ...    acsdevport=23    acsdevip=192.168.2.2    acsdevtypecode=${empty}    acsdevtypename=${dictdataValue}    devUsername=admin    devPassword=123456
    ...    remark=uf门${time}
    #设备类型名空
    ${time}=    get_time_no_year
    set suite variable    &{update empty acsdevtypename}    projectId=${G_PROJECT_ID}    areaId=${G_AREA_ID}    acsdevname=uf门${time}    acsdevindexcode=${doorID}    acsdevtypedesc=型号
    ...    acsdevport=23    acsdevip=192.168.2.2    acsdevtypecode=${dictdataCode}    acsdevtypename=${empty}    devUsername=admin    devPassword=123456
    ...    remark=uf门${time}
