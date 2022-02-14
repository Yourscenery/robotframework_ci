*** Settings ***
Resource          ../../9ShareResource.txt

*** Test Cases ***
alarm_overview_success_getAlarmListByLighting
    [Setup]    alarm_overview_getAlarmListByLighting
    [Template]    alarm_overview_success_data_getAlarmListByLighting
    ${query first page}    0
    ${query second page}    0
    ${query size 50}    0
    ${query deviceName}    0

alarm_overview_fail_getAlarmListByLighting
    [Setup]    alarm_overview_getAlarmListByLighting
    [Template]    alarm_overview_fail_data_getAlarmListByLighting
    ${query not exist deviceName}

alarm_overview_status
    ${alarmId}=    alarm_overview_getAlarmListByLighting
    ${status success single}    ids[]=${alarmId}
    ${status ids empty}    ids[]=${empty}
    ${status ids error}    ids[]=345${alarmId}
    alarm_overview_status  ${status success single}
    alarm_overview_protect  ${status success single}
    alarm_overview_relieve  ${status success single}
    alarm_overview_status  ${status ids empty}
    alarm_overview_protect  ${status ids empty}
    alarm_overview_relieve  ${status ids empty}
    alarm_overview_status  ${status ids error}
    alarm_overview_protect  ${status ids error}
    alarm_overview_relieve  ${status ids error}
    
alarm_overview_others
    alarm_overview_status_num

*** keywords ***
alarm_overview_success_data_getCameraListByLighting
    set suite variable    &{query first page}   size=10     current=1   deviceAlias=
    set suite variable    &{query second page}   size=10     current=2   deviceAlias=
    set suite variable    &{query size 50}   size=50     current=1   deviceAlias=
    set suite variable    &{query deviceName}   size=10     current=1   deviceAlias=22

alarm_overview_fail_data_getCameraListByLighting
    set suite variable    &{query not exist deviceName}   size=10     current=1   deviceAlias=not exist
