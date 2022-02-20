from buserkeywords import ApiCommon
from buserkeywords.ApiConst import RESOURCE_CONST


def resource_platform_list(dict_params, dict_asset=None):
    """平台列表。参数：# /ener-resource/platform/list?deviceType=AD_SCREEN
    返回值：#name=太龙广告屏;id=AD_SCREEN_REALTIME"""
    url = RESOURCE_CONST.CONFIG_PLATFORM_LIST
    response_object = ApiCommon.api_get_request(url, dict_params, dict_asset)
    if len(response_object) < 1:
        assert False, "第三方平台不能为空"
    elif dict_params['deviceType'] == 'LAMP':
        return response_object[1]
    else:
        return response_object[0]


def resource_platform_protocol_list(dict_params, dict_asset=None):
    """平台协议列表参数：/ener-resource/platform/protocol-list?platformId=AD_SCREEN_REALTIME
    返回值：id=AD_SCREEN_PROTOCOL_REALTIME;name=realtime"""
    url = RESOURCE_CONST.CONFIG_PLATFORM_PROTOCOL_LIST
    response_object = ApiCommon.api_get_request(url, dict_params, dict_asset)
    if len(response_object) < 1:
        assert False, "三方协议不能为空"
    return response_object[0]


def resource_category_attribute_list(dict_params, dict_asset=None):
    """类别属性列表参数：#/ener-resource/category-attribute/list?categoryId=1"""
    url = RESOURCE_CONST.CONFIG_CATEGORY_ATTRIBUTE_LIST
    return ApiCommon.api_get_request(url, dict_params, dict_asset)


def resource_category_list(dict_params, dict_asset=None):
    """类别表-列表查询参数：#/ener-resource/resourceCategory/list?type=ASSET&canAdd=true
    返回值：# assetType=AD_SCREEN;id=1;name=广告屏"""
    url = RESOURCE_CONST.CONFIG_CATEGORY_LIST
    return ApiCommon.api_get_request(url, dict_params, dict_asset)


def resource_resourceCategory_getbyid(dict_params, dict_asset=None):
    """类别表-根据id获取类别#/ener-resource/resourceCategory/getById?id=1
    返回值：# assetType=AD_SCREEN;id=1;name=广告屏"""
    url = RESOURCE_CONST.CONFIG_CATEGORY_GETBYID
    return ApiCommon.api_get_request(url, dict_params, dict_asset)


if __name__ == "__main__":
    resource_platform_list({"deviceType": "AD_SCREEN"})
