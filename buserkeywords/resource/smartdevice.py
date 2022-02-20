# -*- coding: utf-8 -*-


import json
from buserkeywords.resource import configuration, asset
from buserkeywords.ApiConst import RESOURCE_CONST
from buserkeywords import ApiCommon
from cpublickeywords import tools


def __resource_smartDevice_add_get_prepare_data(dict_params, category_id, category_type):
    '''智能设备添加前准备数据
    准备数据：类别接口-->平台接口-->平台协议接口-->类别属性接口
    # 【categoryId=】：设备类别信息，/ener-resource/resourceCategory/list?type=ASSET&canAdd=true；id: 1, name: 广告屏；id: 11, name: 摄像头；id: 21, name: 广播；id: 31, name: 井盖；id: 41, name: 烟感；id: 51, name: 一键报警；id: 61, name: 工控机；id: 71, name: 智能灯具；id: 91, name: 单灯控制器；id: 101, name: 气象站；id: 111, name: 电表；id: 121, name: 水表；id: 131, name: 综合设备箱；id: 141, name: 景观灯；id: 1000, name: 灯杆
    # 【platformid、platformName=】：第三方平台信息，/ener-resource/platform/list?deviceType=AD_SCREEN
    # 【platformProtocolId、platformProtocolName=】第三方平台协议信息，/ener-resource/platform/protocol-list?platformId=AD_SCREEN_REALTIME
    # 【content=】：类别属性信息，/ener-resource/category-attribute/list?categoryId=1；功能信息、技术信息、外观信息
    # # categoryUseCount: 1000，类别引用次数
    # # controlType: null，控制类别
    # # controllable: false，是否可以控制
    # # createTime: 1611285201000
    # # defaultValue: null，默认值
    # # deleted: false
    # # editable: false，可编辑的，属性值是否可编辑
    # # enabled: true，禁用/启用
    # # fixed: true，固定，是否可以编辑删除该属性字段
    # # formItemType: "Input"
    # # groupId: 22，分组id
    # # groupName: "技术信息"，分组名称
    # # groupType: "ASSET"，分组类型
    # # id: 2001
    # # locationType: "PAGE"，位置类型，PAGE/MODAL
    # # name: "platformResourceId"，名称
    # # required: false，是否必填
    # # showOnApp: false，是否在app显示
    # # showed: ["ADD", "EDIT", "INFO"]，添加、编辑、查看时是否显示
    # # statistical: false，是否统计
    # # subGroupId: null
    # # subGroupName: null
    # # title: "三方平台设备号"
    # # type: "STRING"，STRING字符串/ENUM枚举
    # # unit: null，单位
    # # uploaded: false，是否是上报字段
    # # value: null
    # # valueTemplate: null，值模板
    '''
    ### 修改动态属性值
    time = tools.get_time_no_year()
    dict_object = configuration.resource_category_attribute_list({"categoryId": category_id})
    for i, item in enumerate(dict_object):
        # print(i, item['locationType'], item['type'], item['showed'], item['value'])
        if item['locationType'] == 'PAGE' and 'ADD' in item['showed']:
            if item['type'] in ['STRING', 'INTEGER', 'FLOAT']:
                # if item['reqired'] == True:    pass
                item['value'] = time
            elif item['type'] == 'BOOLEAN':
                item['value'] = True
            elif item['type'] == 'ENUM':
                item['value'] = 1
            else:
                print("文本类型（type）：'STRING', 'INTEGER', 'FLOAT', 'BOOLEAN', 'ENUM'不在这五种范围内")
        elif item['locationType'] == 'PAGE' and 'EDIT' in item['showed']:
            print("locationType是PAGE，且showed是EDIT")
        else:
            print("locationType不是PAGE，且showed不是ADD或EDIT")
    print("content内容自动输入完成")

    ###修改固定属性值
    list_platform = configuration.resource_platform_list({"deviceType": category_type})
    platform_id = list_platform['id']
    platform_name = list_platform['name']

    list_platform_protocol = configuration.resource_platform_protocol_list({"platformId": platform_id})
    platform_protocol_id = list_platform_protocol['id']
    platform_protocol_name = list_platform_protocol['name']

    dict_params['smartDeviceType'] = category_type
    dict_params['categoryId'] = category_id
    dict_params['platformId'] = platform_id
    dict_params['platformName'] = platform_name
    dict_params['platformProtocolId'] = platform_protocol_id
    dict_params['platformProtocolName'] = platform_protocol_name
    dict_params['content'] = json.dumps(dict_object)

    return dict_params


def resource_smartDevice_add_oneData(mark='a'):
    """固定数据新增一个智能设备数据，用于更新、删除接口使用"""
    print("---新增一条智能设备数据并获取其id---")
    # time = tools.get_time_no_year()
    # dict_params = {"deviceName": "o%s摄%s" % (mark, time)}
    # sid = resource_smartDevice_add(dict_params)
    # return sid


def resource_smartDevice_add(dict_params, category_id, category_type, dict_asset=None):
    dict_params = __resource_smartDevice_add_get_prepare_data(dict_params, category_id, category_type)
    url = RESOURCE_CONST.SMARTDEVICE_ADD
    response_object = ApiCommon.api_post_request(url, dict_params, dict_asset)
    if response_object is not None:
        sid = response_object['id']
        print(sid)
        ###供其他模块使用设备id
        # public_params.set_smartdevice_id(category_type, sid)
        # 数据库断言--获取每列的值拼接作为where语句
        # tableFromWhere="smartDeviceTableName WHERE id={0} and device_name={1}".format(api_response['id'],api_response['deviceName'])
        # assert_resp_db_add_or_update(smartDevice apikey and dbkey,dict_params,tableFromWhere)
        # ELSE
        #     print("***pass【没新增成功不走数据库断言】***")
        return sid


def resource_smartDevice_edit(str_id, str_name, dict_asset=None):
    dict_params = asset.resource_asset_getbyid({"id": str_id})
    dict_params['name'] = str_name
    dict_params['content'] = json.dumps(asset.resource_attribute_value_asset_content({"id": str_id}))

    url = RESOURCE_CONST.SMARTDEVICE_EDIT
    response_object = ApiCommon.api_put_request(url, dict_params, dict_asset)
    # 数据库断言--获取每列的值拼接作为where语句
    if response_object is not None:
        sid = response_object['id']
        print(sid)
        # 数据库断言--获取每列的值拼接作为where语句
        # tableFromWhere="{2} WHERE id={0} and device_name={1}".format(api_response['id'],api_response['deviceName'],smartDeviceTableName)
        # assert_resp_db_add_or_update(smartDevice apikey and dbkey,dict_params,tableFromWhere)
        # ELSE
        #     print("***pass【没更新成功不走数据库断言】***")
        return sid


def resource_smartDevice_page(dict_params, dict_asset=None):
    """资产数据接口
    /ener-resource/asset/page?categoryId=1&name=2021115&platformId=AD_SCREEN_REALTIME&isRelated=&platformProtocolId=AD_SCREEN_PROTOCOL_REALTIME&current=1&type=SMART_DEVICE"""
    url = RESOURCE_CONST.ASSET_PAGE
    return ApiCommon.api_get_request(url, dict_params, dict_asset)


def resource_smartDevice_deleteBatch(dict_params, dict_asset=None):
    url = RESOURCE_CONST.SMARTDEVICE_DELETEBATCH
    response_object = ApiCommon.api_delete_request(url, dict_params, dict_asset)

    # ##数据库断言
    # if response_object is not None:
    #     smartdevice_id = dict_params['id']
    #     ##数据库断言--获取每列的值拼接作为where语句
    #     tableSelectFrom="select id, deleted from {0}".format(smartDeviceTableName)
    #     assert_resp_db_delete(tableSelectFrom,id,ids)
    # ELSE
    #     print("***pass【没删除成功不走数据库断言】***")


def resource_smartDevice_getAssociatedSmartDevicePage(dict_params, dict_asset=None):
    """智能设备关联设备选择界面参数：#/ener-resource/smartDevice/getAssociatedSmartDevicePage?current=1&size=999999&smartDeviceType=LAMP_POLE    """
    url = RESOURCE_CONST.SMARTDEVICE_GETASSOCIATEDSMARTDEVICEPAGE
    return ApiCommon.api_get_request(url, dict_params, dict_asset)


def resource_smartDevice_getFault(dict_params=None, dict_asset=None):
    """资产表-状态枚举参数：#/ener-resource/smartDevice/getFault返回值：# type=NORMAL;name=正常;value=NORMAL;"""
    url = RESOURCE_CONST.SMARTDEVICE_GETFAULT
    return ApiCommon.api_get_request(url, dict_params, dict_asset)


def resource_smartDevice_getAssetsBySpaceId(dict_params, dict_asset=None):
    """资产表-状态枚举参数：#/ener-resource/smartDevice/getAssetsBySpaceId?categoryIds=1&current=1&name=006&size=10&spaceIds=1"""
    url = RESOURCE_CONST.SMARTDEVICE_GETASSETSBYSPACEID
    return ApiCommon.api_get_request(url, dict_params, dict_asset)


def resource_smartDevice_camera_query(dict_params=None, dict_asset=None):
    """智能设备摄像头-查询(不分页)参数：#/ener-resource/smartDevice/camera/query"""
    url = RESOURCE_CONST.SMARTDEVICE_CAMERA_QUERY
    return ApiCommon.api_get_request(url, dict_params, dict_asset)


def resource_smartDevice_camera_panoramics(dict_params=None, dict_asset=None):
    """全景摄像头-查询(不分页)参数：#/ener-resource/smartDevice/camera/panoramics"""
    url = RESOURCE_CONST.SMARTDEVICE_CAMERA_PANORAMICS
    return ApiCommon.api_get_request(url, dict_params, dict_asset)


if __name__ == "__main__":
    # query_first_page={"categoryId":"1","name":"2021115","platformId":"AD_SCREEN_REALTIME","isRelated":None,"platformProtocolId":"AD_SCREEN_PROTOCOL_REALTIME","fault":"NORMAL","current":"1","type":"SMART_DEVICE"}
    # resource_smartDevice_page(query_first_page)
    pass
