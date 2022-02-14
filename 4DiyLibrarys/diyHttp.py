import requests
import json
import builtins
from diyPublicwords import *


def diy_http_request_rock_bottom(request_type, url, dic_params, dic_assert,
                                 content_type='application/x-www-form-urlencoded'):
    """returnKey=key.key.key变量dicParams为空时，传${none}
        dicAssert判断message（字符串）时,走should be equal as strings逻辑；判断total（digit）时，走should be true逻辑
    """
    print('---开始requestType请求 - --')
    headers = {'Content-Type' = contentType, 'Authorization' = G_AUTHORIZATION}
    url = 'http://223.95.112.109:9281/'+url
    if request_type == 'post':
        r = requests.post(url=url, data=dic_params, headers=headers)
    elif request_type == 'get':
        r = requests.get(url=url, data=dic_params, headers=headers)
    elif request_type == 'put':
        r = requests.put(url=url, data=dic_params, headers=headers)
    elif request_type == 'delete':
        r = requests.delete(url=url, data=dic_params, headers=headers)
    else:
        print(request_type+"不在post, get中，目前只有post, get, put, delete")

    print('---结束requestType请求 - -----开始断言---')
    if r.status_code!=200:
        pass
    print('RESPONSEURL'+r.url)
    print('RESPONSETEXT'+r.text)

    # 请求类型判断
    pass


def diy_http_request_return_value(dic_resp, return_key):
    split_Key = return_key.split(".")
    for key in split_Key
        dic_resp = dic_resp[key]
        # 判断dicResp是否为none
        b_resp_be_none = diy_judge_two_val_are_equal(dic_resp, None, msg="【/dicResp】不等于【${none}】才通过")
        if b_resp_be_none:
            break
    print(dic_resp)
    return dic_resp


def diy_http_post_return(url, dic_params, dic_assert, return_key,
                         content_type='application/x-www-form-urlencoded'):
    dic_resp = diy_http_request_rock_bottom(url, dic_params, dic_assert, return_key, content_type)
    return_value = diy_http_request_return_value(dic_resp, return_key)
    return return_value
    pass


def diy_http_post(url, dic_params, dic_assert,
                  content_type='application/x-www-form-urlencoded'):
    dic_resp = diy_http_request_rock_bottom(url, dic_params, dic_assert, return_key, content_type)


def diy_http_get_return(self):
    pass


def diy_http_get(self):
    pass


def diy_http_put_return(self):
    pass


def diy_http_put(self):
    pass


def diy_http_delete_return(self):
    pass


def diy_http_delete(self):
    pass


"""
*** Settings ***
Resource          ../9ShareResource.txt

*** Keywords ***
http_post_return
    [Arguments]    ${url}    ${dicParams}    ${dicAssert}    ${returnKey}    ${contentType}=application/x-www-form-urlencoded
    ${dicResp}=    http_request_rockbottom    post    ${url}    ${dicParams}    ${dicAssert}    ${contentType}
    ${httpReturnVal}=    http_request_returnval    ${dicResp}    ${returnKey}
    [Return]    ${httpReturnVal}

http_post
    [Arguments]    ${url}    ${dicParams}    ${dicAssert}    ${contentType}=application/x-www-form-urlencoded
    ${dicResp}=    http_request_rockbottom    post    ${url}    ${dicParams}    ${dicAssert}    ${contentType}

http_get_return
    [Arguments]    ${url}    ${dicParams}    ${dicAssert}    ${returnKey}    ${contentType}=application/x-www-form-urlencoded
    ${dicResp}=    http_request_rockbottom    get    ${url}    ${dicParams}    ${dicAssert}    ${contentType}
    ${httpReturnVal}=    http_request_returnval    ${dicResp}    ${returnKey}
    [Return]    ${httpReturnVal}

http_get
    [Arguments]    ${url}    ${dicParams}    ${dicAssert}    ${contentType}=application/x-www-form-urlencoded
    ${dicResp}=    http_request_rockbottom    get    ${url}    ${dicParams}    ${dicAssert}    ${contentType}

http_put_return
    [Arguments]    ${url}    ${dicParams}    ${dicAssert}    ${returnKey}    ${contentType}=application/x-www-form-urlencoded
    ${dicResp}=    http_request_rockbottom    put    ${url}    ${dicParams}    ${dicAssert}    ${contentType}
    ${httpReturnVal}=    http_request_returnval    ${dicResp}    ${returnKey}
    [Return]    ${httpReturnVal}

http_put
    [Arguments]    ${url}    ${dicParams}    ${dicAssert}    ${contentType}=application/x-www-form-urlencoded
    ${dicResp}=    http_request_rockbottom    put    ${url}    ${dicParams}    ${dicAssert}    ${contentType}

http_delete_return
    [Arguments]    ${url}    ${dicParams}    ${dicAssert}    ${returnKey}    ${contentType}=application/x-www-form-urlencoded
    ${dicResp}=    http_request_rockbottom    delete    ${url}    ${dicParams}    ${dicAssert}    ${contentType}
    ${httpReturnVal}=    http_request_returnval    ${dicResp}    ${returnKey}
    [Return]    ${httpReturnVal}

http_delete
    [Arguments]    ${url}    ${dicParams}    ${dicAssert}    ${contentType}=application/x-www-form-urlencoded
    ${dicResp}=    http_request_rockbottom    delete    ${url}    ${dicParams}    ${dicAssert}    ${contentType}

http_request_rockbottom
    [Arguments]    ${requestType}    ${url}    ${dicParams}    ${dicAssert}    ${contentType}=application/x-www-form-urlencoded
    [Documentation]    returnKey=key.key.key变量dicParams为空时，传${none}
    ...    dicAssert判断message（字符串）时,走should be equal as strings逻辑；判断total（digit）时，走should be true逻辑
    log    ---开始${requestType}请求---
    ${header}    create dictionary    Content-Type=${contentType}    Authorization=${G_AUTHORIZATION}
    create session    ener    ${G_IP}    #http://192.168.30.16:8899    #http://223.95.112.109:9281
    #请求类型判断
    ${response}=    run keyword if    '${requestType}'=='post'    post request    ener    ${url}    data=${dicParams}
    ...    headers=${header}
    ...    ELSE IF    '${requestType}'=='get'    get request    ener    ${url}    params=${dicParams}
    ...    headers=${header}
    ...    ELSE IF    '${requestType}'=='put'    put request    ener    ${url}    data=${dicParams}
    ...    headers=${header}
    ...    ELSE IF    '${requestType}'=='delete'    delete request    ener    ${url}    data=${dicParams}
    ...    headers=${header}
    ...    ELSE    fail    ${requestType}不在'post','get'中，目前只有'post','get','put','delete'
    log    ---结束${requestType}请求---开始断言---
    should be equal as integers    ${response.status_code}    200
    log    RESPONSEURL${response.url}
    log    RESPONSETEXT${response.text}
    ${dicResp}    set variable    ${response.json()}
    @{assertKey}    get dictionary keys    ${dicAssert}
    : FOR    ${key}    IN    @{assertKey}
    \    ${status}    Diy Judge Val Is Digit    ${dicAssert}[${key}]
    \    run keyword if    ${status}    should be true    ${dicAssert}[${key}]<=${dicResp}[${key}]    msg=应答的值要大于等于【${dicAssert}[${key}]】才通过
    \    ...    ELSE    should be equal as strings    ${dicAssert}[${key}]    ${dicResp}[${key}]    msg=【${key}】的值要等于【${dicAssert}[${key}]】才通过
    log    ---断言结束----
    [Return]    ${dicResp}

http_request_returnval
    [Arguments]    ${dicResp}    ${returnKey}
    @{splitKey}    split string    ${returnKey}    .
    : FOR    ${key}    IN    @{splitKey}
    \    ${dicResp}    set variable    ${dicResp}[${key}]
    \    ${bRespBeNone}    Diy Judge Two Val Are Equal    ${dicResp}    ${none}    msg=【/${dicResp}】不等于【${none}】才通过    #判断dicResp是否为none
    \    exit for loop if    ${bRespBeNone}
    log    ${dicResp}
    [Return]    ${dicResp}
"""
