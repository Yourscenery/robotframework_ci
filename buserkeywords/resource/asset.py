from buserkeywords import ApiCommon
from buserkeywords.ApiConst import RESOURCE_CONST


def resource_asset_getbyid(dict_params, dict_asset=None):
    """资产表-根据id获取类别
    参数：#/ener-resource/asset/getById?id=35968 """
    url = RESOURCE_CONST.ASSET_GETBYID
    return ApiCommon.api_get_request(url, dict_params, dict_asset)


def resource_attribute_value_asset_content(dict_params, dict_asset=None):
    """根据资产id获得对应扩展属性
    参数：#/ener-resource/attribute-value/asset/content?id=35968"""
    url = RESOURCE_CONST.ASSET_ATTRIBUTEVALUE_ASSET_CONTENT
    return ApiCommon.api_get_request(url, dict_params, dict_asset)
