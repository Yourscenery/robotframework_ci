*** Settings ***
Resource          ../../9ShareResource.txt

*** Test Cases ***
door_overview_success_pagecondition
    [Setup]    door_overview_success_data_pagecondition
    [Template]    door_overview_pagecondition
    ${query first page}    0
    ${query second page}    0
    ${query size 50}    0
    ${query deviceName}    0
    ${query order acsdevname}    0
    ${query order acsdevindexcode}    0
    ${query order acsdevtypedesc}    0
    ${query order isonline}    0
    ${query isonline}    0

door_overview_countByUser
    door_overview_countByUser

*** keywords ***
door_overview_success_data_pagecondition
    set suite variable    &{query first page}    orderTemplate=createTime:ASC    size=10    current=1
    set suite variable    &{query second page}    orderTemplate=createTime:ASC    size=10    current=2
    set suite variable    &{query size 50}    orderTemplate=createTime:ASC    size=50    current=1
    set suite variable    &{query deviceName}    likeTemplate=acsdevname=122,acsdevtypedesc=122    orMatch=true    orderTemplate=createTime:ASC    size=10    current=1
    set suite variable    &{query order acsdevname}    orderTemplate=acsdevname:ASC    size=10    current=1
    set suite variable    &{query order acsdevindexcode}    orderTemplate=acsdevindexcode:ASC    size=10    current=1
    set suite variable    &{query order acsdevtypedesc}    orderTemplate=acsdevtypedesc:ASC    size=10    current=1
    set suite variable    &{query order isonline}    orderTemplate=isonline:ASC    size=10    current=1
    set suite variable    &{query isonline}    orderTemplate=createTime:ASC    size=10    current=1    isonline=1
