*** Settings ***
Resource          ../../9ShareResource.txt

*** Test Cases ***
park_door_list
    [Setup]    park_door_cases_list
    [Template]    park_door_list
    ${query success}    ${true}
    ${query projectId empty}    ${true}
    ${query projectId error}    ${true}
    ${query areaId empty}    ${true}
    ${query areaId error}    ${true}

park_door_event
    [Setup]    park_door_cases_event
    [Template]    park_door_event
    ${query first page}    0
    ${query second page}    0
    ${query size 50}    0
    ${query deviceName}    0
    ${query not exist deviceName}    0

park_door_control
    [Setup]    park_door_cases_control
    [Template]    park_door_control
    #${query success}    反控状态(0-常开 1-门闭 2-门开 3-常闭):1
    ${query doorIndexCodes empty}    反控状态(0-常开 1-门闭 2-门开 3-常闭):1
    ${query doorIndexCodes error}    设备不存在,请重新同步设备..
    #${query controlType empty}
    #${query controlType error}

*** keywords ***
park_door_cases_list
    set suite variable    &{query success}    projectId=${G_PROJECT_ID}    areaId=${G_AREA_ID}
    set suite variable    &{query projectId empty}    projectId=${empty}    areaId=${G_AREA_ID}
    set suite variable    &{query projectId error}    projectId=errorid    areaId=${G_AREA_ID}
    set suite variable    &{query areaId empty}    projectId=${G_PROJECT_ID}    areaId=${empty}
    set suite variable    &{query areaId error}    projectId=${G_PROJECT_ID}    areaId=errorid

park_door_cases_event
    set suite variable    &{query first page}    size=10    current=1    keyword=    startTime=1580745600000    endTime=1581004799000
    set suite variable    &{query second page}    size=10    current=2    keyword=    startTime=1580745600000    endTime=1581004799000
    set suite variable    &{query size 50}    size=50    current=1    keyword=    startTime=1580745600000    endTime=1581004799000
    set suite variable    &{query deviceName}    size=10    current=1    keyword=exist    startTime=1580745600000    endTime=1581004799000
    set suite variable    &{query not exist deviceName}    size=10    current=1    keyword=not exist    startTime=1580745600000    endTime=1581004799000

park_door_cases_control
    #(0-常开 1-门闭 2-门开 3-常闭)
    #set suite variable    &{query success}    doorIndexCodes[]=${doorindexcodes}    controlType=${type}
    set suite variable    &{query doorIndexCodes empty}    doorIndexCodes[]=${empty}    controlType=1
    set suite variable    &{query doorIndexCodes error}    doorIndexCodes[]=errorid    controlType=1
    #set suite variable    &{query controlType empty}    doorIndexCodes[]=${doorindexcodes}    controlType=${empty}
    #set suite variable    &{query controlType error}    doorIndexCodes[]=${doorindexcodes}    controlType=errortype
