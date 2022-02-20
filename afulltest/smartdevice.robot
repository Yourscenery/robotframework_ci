*** Settings ***
Resource          ../fShareResource.txt

*** Variables ***
@{delete_ids}

*** Test Cases ***
adscreen_add
    ${time}=    get time no year
    ${add adscreen success}    create dictionary    categoryId=None    name=广告屏${time}    location=广告屏${time}    storageTime=1999-09-09    platformId=    platformName=    platformProtocolId=    platformProtocolName=    assetIds=    content=    model=    protocol=    manufacturerId=    maintenanceCycleId=    manufacturerName=
    ${adscreen_id}    resource_smartDevice_add    ${add adscreen success}    1    AD_SCREEN
    set suite variable    ${s_adscreen_id}    ${adscreen_id}
    append to list    ${delete_ids}    ${adscreen_id}

adscreen_edit
    ${time}=    get time no year
    should not be empty    '${s_adscreen_id}'    设备id不能为空
    resource_smartDevice_edit    ${s_adscreen_id}    UPD广告屏${time}

ipc_add
    ${time}=    get time no year
    ${add ipc success}    create dictionary    smartDeviceType=None    categoryId=None    name=工控机${time}    location=工控机${time}    storageTime=1999-09-09    platformId=    platformName=    platformProtocolId=    platformProtocolName=    assetIds=    content=    model=    protocol=    manufacturerId=    maintenanceCycleId=
    ...    manufacturerName=
    ${ipc_id}    resource_smartDevice_add    ${add ipc success}    61    IPC
    set suite variable    ${s_ipc_id}    ${ipc_id}
    append to list    ${delete_ids}    ${ipc_id}

ipc_edit
    ${time}=    get time no year
    should not be empty    '${s_ipc_id}'    设备id不能为空
    resource_smartDevice_edit    ${s_ipc_id}    UPD工控机${time}

lamp_add
    ${time}=    get time no year
    ${add lamp success}    create dictionary    smartDeviceType=None    categoryId=None    name=智能灯具${time}    location=智能灯具${time}    storageTime=1999-09-09    platformId=    platformName=    platformProtocolId=    platformProtocolName=    assetIds=    content=    model=    protocol=    manufacturerId=    maintenanceCycleId=
    ...    manufacturerName=
    ${lamp_id}    resource_smartDevice_add    ${add lamp success}    71    LAMP
    set suite variable    ${s_lamp_id}    ${lamp_id}
    append to list    ${delete_ids}    ${lamp_id}

lamp_edit
    ${time}=    get time no year
    should not be empty    '${s_lamp_id}'    设备id不能为空
    resource_smartDevice_edit    ${s_lamp_id}    UPD485灯具${time}

weather_station_add
    ${time}=    get time no year
    ${add weather_station success}    create dictionary    smartDeviceType=None    categoryId=None    name=气象站${time}    location=气象站${time}    storageTime=1999-09-09    platformId=    platformName=    platformProtocolId=    platformProtocolName=    assetIds=    content=    model=    protocol=    manufacturerId=    maintenanceCycleId=
    ...    manufacturerName=
    ${weather_station}    resource_smartDevice_add    ${add weather_station success}    101    WEATHER_STATION
    set suite variable    ${s_weather_station}    ${weather_station}
    append to list    ${delete_ids}    ${weather_station}

weather_station_edit
    ${time}=    get time no year
    should not be empty    '${s_weather_station}'    设备id不能为空
    resource_smartDevice_edit    ${s_weather_station}    UPD气象站${time}

synthesis_device_box_add
    ${time}=    get time no year
    ${add synthesis_device_box success}    create dictionary    smartDeviceType=None    categoryId=None    name=综合设备箱${time}    location=综合设备箱${time}    storageTime=1999-09-09    platformId=    platformName=    platformProtocolId=    platformProtocolName=    assetIds=    content=    model=    protocol=    manufacturerId=    maintenanceCycleId=
    ...    manufacturerName=
    ${synthesis_device_box_id}    resource_smartDevice_add    ${add synthesis_device_box success}    131    SYNTHESIS_DEVICE_BOX
    set suite variable    ${s_synthesis_device_box_id}    ${synthesis_device_box_id}
    append to list    ${delete_ids}    ${synthesis_device_box_id}

synthesis_device_box_edit
    ${time}=    get time no year
    should not be empty    '${s_synthesis_device_box_id}'    设备id不能为空
    resource_smartDevice_edit    ${s_synthesis_device_box_id}    UPD综合设备箱 ${time}

landscape_lamp_add
    ${time}=    get time no year
    ${add landscape_lamp success}    create dictionary    smartDeviceType=None    categoryId=None    name=景观灯${time}    location=景观灯${time}    storageTime=1999-09-09    platformId=    platformName=    platformProtocolId=    platformProtocolName=    assetIds=    content=    model=    protocol=    manufacturerId=    maintenanceCycleId=
    ...    manufacturerName=
    ${landscape_lamp_id}    resource_smartDevice_add    ${add landscape_lamp success}    141    LANDSCAPE_LAMP
    set suite variable    ${s_landscape_lamp_id}    ${landscape_lamp_id}
    append to list    ${delete_ids}    ${landscape_lamp_id}

landscape_lamp_edit
    ${time}=    get time no year
    should not be empty    '${s_landscape_lamp_id}'    设备id不能为空
    resource_smartDevice_edit    ${s_landscape_lamp_id}    UPD景观灯${time}

lamp_pole_add
    ${time}=    get time no year
    ${add lamp_pole success}    create dictionary    smartDeviceType=None    categoryId=None    name=灯杆${time}    location=灯杆${time}    storageTime=1999-09-09    platformId=    platformName=    platformProtocolId=    platformProtocolName=    assetIds=    content=    model=    protocol=    manufacturerId=    maintenanceCycleId=
    ...    manufacturerName=
    ${lamp_pole_id}    resource_smartDevice_add    ${add lamp_pole success}    1000    LAMP_POLE
    set suite variable    ${s_lamp_pole_id}    ${lamp_pole_id}
    append to list    ${delete_ids}    ${lamp_pole_id}

lamp_pole_edit
    ${time}=    get time no year
    should not be empty    '${s_lamp_pole_id}'    设备id不能为空
    resource_smartDevice_edit    ${s_lamp_pole_id}    UPD灯杆

page
    ${query first page}    create dictionary    categoryId=1    name=2021115    platformId=AD_SCREEN_REALTIME    isRelated=    platformProtocolId=AD_SCREEN_PROTOCOL_REALTIME    fault=NORMAL    current=1    type=SMART_DEVICE
    resource_smartDevice_page    ${query first page}

deleteBatch
    ${delete success}    create dictionary    ids=${delete_ids}
    resource_smartDevice_deleteBatch    ${delete success}
    log    pass

getAssociatedSmartDevicePage
    ${query first page}    create dictionary    current=1    size=999999    smartDeviceType=LAMP_POLE
    resource_smartDevice_getAssociatedSmartDevicePage    ${query first page}

getFault_list
    resource_smartDevice_getFault

getAssetsBySpaceId
    ${query first page}    create dictionary    categoryIds=1    current=1    name=006    size=10    spaceIds=1
    resource_smartDevice_getAssetsBySpaceId    ${query first page}

camera_query
    resource_smartDevice_camera_query

camera_panoramics_list
    resource_smartDevice_camera_panoramics
