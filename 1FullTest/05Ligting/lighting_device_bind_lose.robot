*** Settings ***
Resource          ../../9ShareResource.txt

*** Test Cases ***
lighting_success_device_bind_lose
    [Setup]    lighting_success_data_device_bind_lose
    [Template]    lighting_device_bind_lose
    ###绑定设备
    ${envirid success bind or lose}    bind    灯杆绑定成功
    #${brightid success bind or lose}    bind    灯杆绑定成功
    ${adscreenid success bind or lose}    bind    灯杆绑定成功
    ${cameraid success bind or lose}    bind    灯杆绑定成功
    ${sponid success bind or lose}    bind    灯杆绑定成功
    ###解绑设备
    ${envirid success bind or lose}    lose    灯杆解绑成功
    #${brightid success bind or lose}    lose    灯杆解绑成功
    ${adscreenid success bind or lose}    lose    灯杆解绑成功
    ${cameraid success bind or lose}    lose    灯杆解绑成功
    ${sponid success bind or lose}    lose    灯杆解绑成功

lighting_fail_device_bind_lose
    [Setup]    lighting_fail_data_device_bind_lose
    [Template]    lighting_device_bind_lose
    ###绑定设备
    ${lighting is empty}    bind    灯杆id不能为空
    ${envirid is empty}    bind    灯杆绑定成功
    ${brightid is empty}    bind    灯杆绑定成功
    ${adscreenid is empty}    bind    灯杆绑定成功
    ${cameraid is empty}    bind    灯杆绑定成功
    ${sponid is empty}    bind    灯杆绑定成功
    ###解绑设备
    ${lighting is empty}    lose    灯杆id不能为空
    ${envirid is empty}    lose    灯杆解绑失败
    ${brightid is empty}    lose    灯杆解绑失败
    ${adscreenid is empty}    lose    灯杆解绑失败
    ${cameraid is empty}    lose    灯杆解绑失败
    ${sponid is empty}    lose    灯杆解绑失败

*** keywords ***
lighting_success_data_device_bind_lose
    #新增灯杆,新增绑定设备,获取id，判断接口值大于0
    ${lightingID}=    lighting_edit_add_oneData    us
    ${envirID}=    envir_edit_add_oneData    us
    #${brightID}=    bright_edit_add_oneData_nb    us
    ${adscreenID}=    adscreen_edit_add_oneData    us
    ${cameraObjectValue}=    camera_edit_add_oneData    us
    ${cameraID}=    set variable    ${cameraObjectValue}[id]
    ${sponID}=    spon_edit_add_oneData    us
    set suite variable    &{envirid success bind or lose}    lightingid=${lightingID}    sensorid=${envirID}
    #set suite variable    &{brightid success bind or lose}    lightingid=${lightingID}    lampsid=${brightID}
    set suite variable    &{adscreenid success bind or lose}    lightingid=${lightingID}    adscreenid=${adscreenID}
    set suite variable    &{cameraid success bind or lose}    lightingid=${lightingID}    cameraid=${cameraID}
    set suite variable    &{sponid success bind or lose}    lightingid=${lightingID}    sponId=${sponID}

lighting_fail_data_device_bind_lose
    ${lightingID}=    lighting_edit_add_oneData    uf
    ###灯杆id为空：灯杆id不能为空
    set suite variable    &{lighting is empty}    lightingid=${empty}    sensorid=${empty}
    ###设备id为空
    set suite variable    &{envirid is empty}    lightingid=${lightingID}    sensorid=${empty}
    set suite variable    &{brightid is empty}    lightingid=${lightingID}    lampsid=${empty}
    set suite variable    &{adscreenid is empty}    lightingid=${lightingID}    adscreenid=${empty}
    set suite variable    &{cameraid is empty}    lightingid=${lightingID}    cameraid=${empty}
    set suite variable    &{sponid is empty}    lightingid=${lightingID}    sponId=${empty}
