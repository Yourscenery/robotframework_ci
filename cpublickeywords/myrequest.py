# -*- coding: utf-8 -*-
import os
import sys
# from cpublickeywords import CONSTS


base_dir = os.path.abspath(os.path.dirname(os.path.dirname(__file__)))
sys.path.append(base_dir)

import pymysql
import requests
from cpublickeywords.config import Config
from cpublickeywords import tools
import logging

ROBOT_LIBRARY_SCOPE = 'GLOBAL'
ASSERT = {"message": None, "success": True} #默认正确断言内容
# headers = {"Content-Type": "application/x-www-form-urlencoded", "client-type": "web"}
headers = {}
cfg = Config()
web_host = cfg.web_host
web_username = cfg.web_username
web_password = cfg.web_password



def get_web_token():
    dict_params = {'username': web_username, 'password': web_password}
    resp = requests.post(web_host + "/ener-rbac/login", data=dict_params,
                         headers={"Content-Type": "application/x-www-form-urlencoded", "client-type": "web"})
    assert resp.status_code == 200
    dict_resp = resp.json()
    print("请求地址：%s。\n应答内容：%s" % (resp.url, resp.text))
    assert dict_resp['success']
    print(tools.get_time_no_year())
    token = dict_resp['object']['token']
    if not token:
        assert False, "token不能为空，停止运行"
    else:
        print("token通过")
    cfg.set_conf('web', 'AUTHORIZATION', token)
    return token


def __http_request(method, url, dict_data, dict_assert, dict_headers):
    """ request请求封装
        dicAssert判断message（字符串）时,走should be equal as strings逻辑；判断total（digit）时，走should be true逻辑
    """

    if url is None:
        assert False, "url不能为空"
    if dict_assert is None:
        dict_assert = ASSERT
    if dict_headers is None:
        dict_headers={}

    print('======开始请求%s  %s=============\n请求内容：%s\n断言内容：%s' % (method, url, str(dict_data), str(dict_assert)))

    if url and web_host:
        url = "%s%s" % (web_host, url)
    else:
        raise NameError("url不能为空")

    dict_headers['Authorization'] = cfg.get_conf_by_key('web', 'AUTHORIZATION')
    # dict_headers['Authorization'] = get_web_token()
    response = ''
    dict_resp = ''
    try:
        if method == 'get':
            response = requests.get(url=url, params=dict_data, headers=dict_headers)
        elif method == 'post':
            response = requests.post(url=url, data=dict_data, headers=dict_headers)
        elif method == 'put':
            response = requests.put(url=url, data=dict_data, headers=dict_headers)
        elif method == 'delete':
            response = requests.delete(url=url, data=dict_data, headers=dict_headers)
        elif method == 'files':
            if 'coverImage' in dict_data:
                files_data = {"coverImage": dict_data['coverImage']}
                del dict_data['coverImage']
                response = requests.post(url=url, data=dict_data, files=files_data,
                                         headers=dict_headers)
            else:
                response = requests.post(url=url, data=dict_data, headers=dict_headers)
        else:
            assert '请求类型错误: 目前只有post, get, put, delete'

        print('请求地址：%s \n 应答内容：%s' % (response.url, response.text))
    except requests.RequestException as e:
        print('RequestException : %s' % e)
        return ()

    try:
        dict_resp = response.json()
    except Exception as e:
        print('解析应答body异常 : %s' % e)
    print('结束' + method + '请求-------开始断言')
    assert response.status_code == 200

    for key in dict_assert.keys():
        assert_val = dict_assert[key]
        resp_val = dict_resp[key]
        # if dict_assert[key].isdigit():
        #     assert assert_val <= resp_val, ('数字应答的值【%s】要大于等于【%s】才通过', (resp_val, assert_val))
        # else:
        assert assert_val == resp_val, ('文本应答的值【%s】要等于【%s】才通过' % (resp_val, assert_val))

    print('======断言通过\n\n')
    return dict_resp


def db_execute(sqlscript):
    # 连接数据库
    print("db_execute", sqlscript, host, port, user, password, database)
    db = pymysql.connect(host=host, port=int(port), user=user, passwd=password, db=database)

    # 获取游标
    cursor = db.cursor()
    try:
        cursor.execute(sqlscript)
        sql_data = cursor.fetchall()
        print("数据库查询成功")
        print(sql_data)
    except:
        print("Error: unable to fetch data")
    # 关闭连接c
    cursor.close()
    db.close()
    return sql_data


if __name__ == "__main__":
    # token = get_web_token()
    pass
