# coding=utf-8
# Author: wzl
import json


def diy_get_project_area_id(mul_list_dic, project_name, area_name):
    """
    mulListDic：多重list里还包含dict,dict里还包含list格式数据；
    mulListDic：是list，list[n][dict{list[n][orgid]}]；
    :return:{"projectid": projectid, "areaid": projectid}
    """
    # data = '[{"createTime":1575543377000,"updateTime":1575543377000,"deleted":False,"departmentName":None,"orgid":"cafb4ead68fdb01fa4397fb985e63b2d","name":"自动化测试项目","parentid":None,"orglevel":"0","belongTo":"","projectMap":None,"termOfValidity":0,"enable":True,"country":"中国","province":"浙江省","city":"杭州市","longitude":120.190963,"latitude":30.192924,"departmentId":"root","mapUrl":None,"hasAuth":True,"children":[{"createTime":1575543390000,"updateTime":1575543390000,"deleted":False,"departmentName":None,"orgid":"fc5ca039f78bd96a16fb416b5ba549f9","name":"自动化测试区域","parentid":"cafb4ead68fdb01fa4397fb985e63b2d","orglevel":"1","belongTo":None,"projectMap":None,"termOfValidity":0,"enable":True,"country":None,"province":None,"city":None,"longitude":120.193997,"latitude":30.191471,"departmentId":"root","mapUrl":None,"hasAuth":True,"children":[]}]},{"createTime":1569141729000,"updateTime":1574154293000,"deleted":False,"departmentName":None,"orgid":"ymy_project","name":"实验室设备","parentid":None,"orglevel":"0","belongTo":None,"projectMap":None,"termOfValidity":0,"enable":True,"country":"中国","province":"浙江省","city":"杭州市","longitude":120.19176,"latitude":30.193158,"departmentId":"root","mapUrl":None,"hasAuth":True,"children":[{"createTime":1569141799000,"updateTime":1574154328000,"deleted":False,"departmentName":None,"orgid":"ymy_area","name":"实验室调试","parentid":"ymy_project","orglevel":"1","belongTo":None,"projectMap":None,"termOfValidity":0,"enable":True,"country":"中国","province":"北京市","city":"海淀区","longitude":120.187829,"latitude":30.19713,"departmentId":"root","mapUrl":None,"hasAuth":True,"children":[]}]}]'
    # mulListDic = json.loads(data)
    # project_name = '自动化测试项目'
    # area_name = '自动化测试区域'
    # print(str(mul_list_dic)+"【】"+project_name+"【】"+area_name)
    str_mul_list_dic = str(mul_list_dic)
    returnval = {"projectid": 'None', "areaid": 'None'}
    if project_name not in str_mul_list_dic:
        # print('没有项目')
        return returnval
    for project in mul_list_dic:
        if project['name'] == project_name:
            project_id = project['orgid']
            if len(project['children']) > 0:
                for area in project['children']:
                    if area['name'] == area_name:
                        area_id = area['orgid']
                        break
                    else:
                        area_id = 'None'
                        break
            else:
                project_id = 'None'
    print(project_id + "------" + area_id)
    return_val = {"projectid": project_id, "areaid": area_id}
    return return_val


def diy_judge_two_val_are_equal(first_val, second_val, msg=None):
    """
    返回first_val与second_val值是相等
    robotframework使用set variable if判断object是否等于None,会出现语法错误，试过convert to string 等没用
    """
    is_true = first_val == second_val
    if is_true:
        print(msg)
    return is_true


def diy_judge_val_type(param):
    """
    判断值检测字符串是否只由数字组成。
    """
    param_type = type(param)
    b_param = False
    if param_type == str or param_type == int or param_type == float:
        b_param = param.isdigit()
    elif param_type == list or param_type == tuple or param_type == dict:
        return "参数值类型，不正确"
    elif type(param) == bool:
        b_param = False

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


def diy_join_two_list():
    print(
        "#分别转换成{1:'9fe4a20fc6363abe488a9ddb63a7ada0', 1: 'f2d6d31c39497906de0ae05550b74286'}")
    a = ('a4', 'a22', 'a33', 'a4')
    b = ('b33', 'b2', 'b11')
    print(dict(zip(a, b)))

    dictA = {'a1': 'b33', 'a2': 'b2', 'a3': 'b11'}
    dictB = {'a2': 'b2',  'a3': 'b11', 'a1': 'b33'}
    print(dictA == dictB)

    print("###  delete")
    list1 = [1]*2
    ids = 'f2d6d31c39497906de0ae05550b74286,9fe4a20fc6363abe488a9ddb63a7ada0'
    listids = ids.split(",")
    dictcasedata = dict(zip(listids, list1))
    dbdata = [(21, '9fe4a20fc6363abe488a9ddb63a7ada0'),
              (22, 'f2d6d31c39497906de0ae05550b74286')]
    dictdbdata = dict(dbdata)
    print(dictcasedata)
    print(dictdbdata)

    print("###  add+update")
    db_result_data = [('210d53447e14e6bb5fba1483549743db', '19bff81796d339965f50334bd746501a',
                       'as摄0324103154', '0324103154', '2.2.2.9', '222', 'admin', '123456', 'add0324103154')]
    key = ['id', 'projectId', 'areaId', 'deviceName', 'deviceNumber',
           'deviceIp', 'devicePort', 'deviceAccount', 'devicePassword', 'remark']
    key.remove('id')
    dictcasedata = dict(zip(key, db_result_data[0]))
    print(dictcasedata)

    print("##query")
    d1 = [ {"projectId": "210d53447e14e6bb5fba1483549743db", "areaId": "19bff81796d339965f50334bd746501a", "id": 206, "acsdevindexcode": "", "acsdevname": "af门0324103335", "acsdevtypedesc": "型号", "acsdevtypecode": "201926144 ", "acsdevtypename": "单门控制器", "acsdevip": "192.168.2.2", "acsdevport": "23", "acsdevcode": None, "regionindexcode": None, "treatytype": None, "createtime": 1585017224000, "updatetime": 1585017224000, "deleted": False, "isonline": True, "doorCtrlPoints": None, "longitude": None, "latitude": None, "devUsername": "admin", "devPassword": "123456", "remark": "af门0324103335"}, {"projectId": "210d53447e14e6bb5fba1483549743db", "areaId": "19bff81796d339965f50334bd746501a", "id": 208, "acsdevindexcode": "af0324103337", "acsdevname": "af门0324103337", "acsdevtypedesc": "型号", "acsdevtypecode": "201926144 ", "acsdevtypename": "单门控制器", "acsdevip": "192.168.2.2", "acsdevport": "", "acsdevcode": None, "regionindexcode": None, "treatytype": None, "createtime": 1585017225000, "updatetime": 1585017225000, "deleted": False, "isonline": True, "doorCtrlPoints": None, "longitude": None, "latitude": None, "devUsername": "admin", "devPassword": "123456", "remark": "af门0324103337"},{"projectId": "210d53447e14e6bb5fba1483549743db", "areaId": "19bff81796d339965f50334bd746501a", "id": 207, "acsdevindexcode": "af0324103336", "acsdevname": "af门0324103336", "acsdevtypedesc": "型号", "acsdevtypecode": "201926144 ", "acsdevtypename": "单门控制器", "acsdevip": "", "acsdevport": "23", "acsdevcode": None, "regionindexcode": None, "treatytype": None, "createtime": 1585017224000, "updatetime": 1585017224000, "deleted": False, "isonline": True, "doorCtrlPoints": None, "longitude": None, "latitude": None, "devUsername": "admin", "devPassword": "123456", "remark": "af门0324103336"}]


    #${db_result_data} = [(1, 'ods10324103347'), (1, 'ods20324103349')]	
    d2 = [{"projectId": "210d53447e14e6bb5fba1483549743db", "areaId": "19bff81796d339965f50334bd746501a", "id": 208, "acsdevindexcode": "af0324103337", "acsdevname": "af门0324103337", "acsdevtypedesc": "型号", "acsdevtypecode": "201926144 ", "acsdevtypename": "单门控制器", "acsdevip": "192.168.2.2", "acsdevport": "", "acsdevcode": None, "regionindexcode": None, "treatytype": None, "createtime": 1585017225000, "updatetime": 1585017225000, "deleted": False, "isonline": True, "doorCtrlPoints": None, "longitude": None, "latitude": None, "devUsername": "admin", "devPassword": "123456", "remark": "af门0324103337"}, {"projectId": "210d53447e14e6bb5fba1483549743db", "areaId": "19bff81796d339965f50334bd746501a", "id": 206, "acsdevindexcode": "", "acsdevname": "af门0324103335", "acsdevtypedesc": "型号", "acsdevtypecode": "201926144 ", "acsdevtypename": "单门控制器", "acsdevip": "192.168.2.2", "acsdevport": "23", "acsdevcode": None, "regionindexcode": None, "treatytype": None, "createtime": 1585017224000, "updatetime": 1585017224000, "deleted": False, "isonline": True, "doorCtrlPoints": None, "longitude": None, "latitude": None, "devUsername": "admin", "devPassword": "123456", "remark": "af门0324103335"}, {"projectId": "210d53447e14e6bb5fba1483549743db", "areaId": "19bff81796d339965f50334bd746501a", "id": 207, "acsdevindexcode": "af0324103336", "acsdevname": "af门0324103336", "acsdevtypedesc": "型号", "acsdevtypecode": "201926144 ", "acsdevtypename": "单门控制器", "acsdevip": "", "acsdevport": "23", "acsdevcode": None, "regionindexcode": None, "treatytype": None, "createtime": 1585017224000, "updatetime": 1585017224000, "deleted": False, "isonline": True, "doorCtrlPoints": None, "longitude": None, "latitude": None, "devUsername": "admin", "devPassword": "123456", "remark": "af门0324103336"}]
    
    if len(d1)==len(d2):
        for item in d1:
            if item in d2:
                print("up_in")
            else:
                print("down_in")
                break
    else:
        print("down_len")



# diy_judge_val_type([3,4,5,6])
# if __name__ == "__main__":
# print(get_projectid_areaid())
# judge_two_val_are_equal('a','a')
# diy_judge_val_is_digit("{"f":"d"}")
# diy_judge_val_is_digit("g6")

# diy_join_two_list()

