*** Settings ***
Resource          ../../9ShareResource.txt

*** Test Cases ***
camera_overview_success_pagecondition
    [Setup]    camera_overview_success_data_pagecondition
    [Template]    camera_overview_pagecondition
    ${query first page}    成功
    ${query second page}    成功
    ${query size 50}    成功
    ${query deviceName}    成功
    ${query order lightingName}    成功
    ${query order deviceAlias}    成功
    ${query order modelNumber}    成功
    ${query order state}    成功
    ${query state}    成功

camera_overview_status
    #camera_overview_status    ids[]=${cameraId}
    ${query empty id}    create dictionary    ids[]=${empty}
    ${query error id}    create dictionary    ids[]=errorcameraId
    camera_overview_status    ${query empty id}    服务异常
    camera_overview_status    ${query error id}    None

camera_overview_status_num
    camera_overview_status_num

*** keywords ***
camera_overview_success_data_pagecondition
    set suite variable    &{query first page}    orderTemplate=createTime:desc    size=10    current=1
    set suite variable    &{query second page}    orderTemplate=createTime:desc    size=10    current=2
    set suite variable    &{query size 50}    orderTemplate=createTime:desc    size=50    current=1
    set suite variable    &{query deviceName}    likeTemplate=deviceAlias:3,deviceNumber:3    orMatch=true    orderTemplate=createTime=desc    size=10    current=1
    set suite variable    &{query order lightingName}    orderTemplate=lightingName:desc    size=10    current=1
    set suite variable    &{query order deviceAlias}    orderTemplate=deviceAlias:desc    size=10    current=1
    set suite variable    &{query order modelNumber}    orderTemplate=modelNumber:desc    size=10    current=1
    set suite variable    &{query order state}    orderTemplate=state:desc    size=10    current=1
    set suite variable    &{query state}    orderTemplate=createTime:desc    size=10    current=1    state=1
