# coding=utf-8
# Author: wzl
import json
import datetime


def get_time_no_year():
    time_stamp = datetime.datetime.now()
    return time_stamp.strftime('%m%d%H%M%S')

# def diy_judge_two_val_are_equal(first_val, second_val, msg=None):
#     """
#     返回first_val与second_val值是相等
#     robotframework使用set variable if判断object是否等于None,会出现语法错误，试过convert to string 等没用
#     """
#     is_true = first_val == second_val
#     if is_true:
#         print(msg)
#     return is_true


def diy_judge_val_type(param):
    """
    判断值检测字符串是否只由数字组成。
    """
    param_type = type(param)
    b_param = "false"
    if param_type == str or param_type == int or param_type == float:
        b_param = param.isdigit()
    elif param_type == list or param_type == tuple or param_type == dict:
        return "参数值类型，不正确"
    elif type(param) == bool:
        b_param = "false"

    print(b_param)
    return b_param


def diy_modify_dict_value(dict_param, dict_modify_key_value):
    for key in dict_modify_key_value:
        print(key + ':' + dict_modify_key_value[key])
        if key in dict_param:
            dict_param[key] = dict_modify_key_value[key]
        else:
            print(key + "不在" + dict_param + "里，请确认")
            break
    return dict_param


def sql_data_to_str(sql_data):
    """
    【接口测试完后删除数据】数据库获取设备id，并转换成{'id':'id,id,id,id'}格式用于删除接口
    """
    if sql_data:
        str_id = []
        for ids in sql_data:
            for id in ids:
                str_id.append(str(id))
        return ",".join(str_id)
    else:
        print("参数sql_data值为空")
        return None


def count():
    countlist = [1, 2, 3, 4, 5, 1, 2, 3, 1, 1, '1', '2',
                 'a', 'a', 'a', [1, 2, 3], {'a': '1', 'b': 2}, (1, '1', '2')]
    for t in countlist:
        type_t = type(t)
        if type_t in (list, tuple):
            countlist = countlist+list(t)
            countlist.remove(t)
        elif type_t == dict:
            countlist = countlist+list(t.values())
            countlist.remove(t)
        elif type_t not in (int, str):
            print("列表值不在类型int,str,list,dict,tuple里面")
    print(countlist)
    set_list = list(set(countlist))
    num = 0
    temp = ''
    max = []
    for item in set_list:
        time = countlist.count(item)
        if time > num:
            num = time
            temp = item
            max.clear()
        elif time == num:
            max.append(item)
    max.append(temp)
    print("出现最多的值是%s,出现了%s次" % (max, num))

"""
[ok]1、去掉response的值
[手动]2、去掉名字 [a|s|d|f]
[ok]3、除get类型外，请求体从params换成body
[ok]4、{{baseUrl}}/后面加上服务名
        {{baseUrl}}/
        {{baseUrl}}/ener-rbac/
[手动]5、"path": [   后面 加上"服务名",
        "path": [
        "path": ["ener-rbac",
[ok]6、"key": "access_token",   换成   "key": "Authorization",
                            换成   "value": "{{authorization}}"
"""
def replace_json(path,service_name):
    if not path:
        print("path不能为空")
        return True
    replace_read = ""
    with open(path, encoding='utf-8') as read:
        baseurl = "{{baseUrl}}/"
        replace_baseurl = "{{baseUrl}}/{0}/".format(service_name)
        access_key = "\"key\": \"access_token\""
        replace_access_key = "\"key\": \"Authorization\""
        access_value = "<string>"
        replace_access_value = "{{authorization}}"

        for line in read:
            if baseurl in line and replace_baseurl not in line:
                line = line.replace(baseurl,replace_baseurl)
                # print(line)
            if access_key in line and replace_access_key not in line:
                line = line.replace(access_key,replace_access_key)
                # print(line)
            if access_value in line and replace_access_value not in line:
                line = line.replace(access_value,replace_access_value)
                # print(line)
            replace_read += line
        dict_read = json.loads(replace_read)
        for sub in dict_read['item']:  # 第一层文件夹列表（项目名）
            print(sub['name'])
            # if 'item' in sub.keys():
            # for son in sub['item']:     #第二层文件夹列表（大模块名）
            if 'item' in sub.keys():
                for subson in sub['item']:  # 第三层文件夹列表（具体接口）
                    subsonkey = subson.keys()
                    #1、去掉response的值
                    if 'response' in subsonkey:  # 清空字典中response的值
                        subson['response'] = []
                    else:
                        print('第三层文件夹列表（具体接口）下没response')
                    #3、除get类型外，请求体从params换成body
                    if 'request' in subsonkey:  # 清空字典中response的值
                        request_body = subson['request']
                        if request_body['method'] != 'GET' and 'query' in request_body['url'].keys():
                            query = request_body['url']['query']
                            del subson['request']['url']['query']
                            if 'body' in request_body.keys():
                                print('该接口params和body都有，不做任何处理。接口是：' +
                                      subson['name'])
                            else:
                                request_body['body'] = {
                                    'mode': 'urlencoded', 'urlencoded': query}
                                print("params转换body成功"+subson['name'])

                    else:
                        print('第三层文件夹列表（具体接口）下没response')
            else:
                print('第二层文件夹列表（大模块名）下没item')
        print('read data--ok')

    with open(path, 'w+', encoding='utf-8') as write:
        json.dump(dict_read, write, ensure_ascii=False)
        print('write data--ok')






if __name__ == "__main__":
    # print(diy_get_project_area_id())
    # diy_judge_two_val_are_equal('a', 'a')
    # diy_judge_val_type([3, 4, 5, 6])
    # diy_join_two_list()
    # a = [(622,), (623,), (624,), (625,), (626,), (628,), (629,), (630,), (631,)]
    # b = [('036641a409d181da003c365eace81e9e',),('1b1abc18454c33c51af8b35cdc1774f9',), ('32f92073b384195d80e54ab9194c732d',)]
    # print(diy_sql_data_to_str(a))
    # obj=[{"createTime":1582089839000,"updateTime":1582089839000,"deleted":"false","departmentName":"null","orgid":"69b21aa63ef6e7a27eedc894f0ea7f10","name":"test","parentid":"null","orglevel":"0","belongTo":"","projectMap":"null","termOfValidity":0,"enable":"true","country":"中国","province":"北京市","city":"朝阳区","longitude":120.184133,"latitude":30.167078,"departmentId":"e81e3bc35fae2d486fc5877ddb92e77d","mapUrl":"null","hasAuth":"true","children":[{"createTime":1595298170000,"updateTime":1595298170000,"deleted":"false","departmentName":"null","orgid":"21171fbc33803e0e2725dd8321549c64","name":"2020721","parentid":"69b21aa63ef6e7a27eedc894f0ea7f10","orglevel":"1","belongTo":"null","projectMap":"null","termOfValidity":0,"enable":"true","country":"null","province":"null","city":"null","longitude":120.050933,"latitude":30.300887,"departmentId":"e81e3bc35fae2d486fc5877ddb92e77d","mapUrl":"null","hasAuth":"true","children":[]},{"createTime":1585535601000,"updateTime":1585535601000,"deleted":"false","departmentName":"null","orgid":"386418b52faee1683a33760d14e319eb","name":"testarea","parentid":"69b21aa63ef6e7a27eedc894f0ea7f10","orglevel":"1","belongTo":"null","projectMap":"null","termOfValidity":0,"enable":"true","country":"null","province":"null","city":"null","longitude":120.176681,"latitude":30.236399,"departmentId":"e81e3bc35fae2d486fc5877ddb92e77d","mapUrl":"null","hasAuth":"true","children":[]}]},{"createTime":1589945276000,"updateTime":1590116485000,"deleted":"false","departmentName":"null","orgid":"f31f58334f3c178382c1d7df2b34e88c","name":"杭州测试","parentid":"null","orglevel":"0","belongTo":"","projectMap":"null","termOfValidity":0,"enable":"true","country":"中国","province":"北京市","city":"朝阳区","longitude":120.109985,"latitude":30.225215,"departmentId":"root","mapUrl":"null","hasAuth":"true","children":[{"createTime":1590116509000,"updateTime":1590116509000,"deleted":"false","departmentName":"null","orgid":"172e9c8d06ed0acbbe7aac13b98ebe2c","name":"南京","parentid":"f31f58334f3c178382c1d7df2b34e88c","orglevel":"1","belongTo":"null","projectMap":"null","termOfValidity":0,"enable":"true","country":"null","province":"null","city":"null","longitude":120.296753,"latitude":30.43104,"departmentId":"root","mapUrl":"null","hasAuth":"true","children":[]},{"createTime":1589945286000,"updateTime":1589945286000,"deleted":"false","departmentName":"null","orgid":"2e8dcb8715e6640f03c42e257e900819","name":"杭州","parentid":"f31f58334f3c178382c1d7df2b34e88c","orglevel":"1","belongTo":"null","projectMap":"null","termOfValidity":0,"enable":"true","country":"null","province":"null","city":"null","longitude":120.098999,"latitude":30.285713,"departmentId":"root","mapUrl":"null","hasAuth":"true","children":[]}]}]

    # diy_get_project_area_id(obj,'test','testarea')
    # replace_json("C:\\Users\\wzl\\Desktop\\ener-datadapter.postman_collection.json","ener-datadapter")
    # print(get_time_no_year())
    pass

