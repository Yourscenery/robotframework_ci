# -*- coding: utf-8 -*-

from buserkeywords import ApiCommon
from buserkeywords.ApiConst import LIGHTSHADOW_CONST
from cpublickeywords import tools


def lightshadow_place_add_oneData(mark='a'):
    """固定数据新增一个智能设备数据，用于更新、删除接口使用"""
    print("---新增一条智能设备数据并获取其id---")
    category_list = lightshadow_placeCategory_list
    category_id = category_list[0]['id']
    time = tools.get_time_no_year()
    readfile = ("edit一群好奇的帝企鹅.jpg", open("afulltest/data/edit一群好奇的帝企鹅.jpg", "rb"), "image/jpg")
    dict_params = {"coverImage": readfile, "categoryId": category_id, "name": "场所" + time, "description": "场所" +
    time}
    # place_id = lightshadow_place_add(dict_params)
    # return place_id


def lightshadow_place_add(dict_params, dict_asset=None):
    """
    Content-Disposition: form-data; name="coverImage"; filename="git.png"
    Content-Type: image/png	<file>
    Content-Disposition: form-data; name="categoryId"	29
    Content-Disposition: form-data; name="name"	2021-2-26
    Content-Disposition: form-data; name="description"	2021-2-26    """
    url = LIGHTSHADOW_CONST.PLACE_ADD
    response_object = ApiCommon.api_file_request(url, dict_params, dict_asset)
    print(response_object)
    if response_object is not None:
        return response_object
    else:
        assert False, 'response_object不能为空'


def lightshadow_place_edit(dict_params, dict_asset=None):
    """
    Content-Disposition: form-data; name="coverImage"; filename="git.png"
    Content-Type: image/png	<file>
    Content-Disposition: form-data; name="categoryId"	29
    Content-Disposition: form-data; name="name"	2021-2-26
    Content-Disposition: form-data; name="description"	2021-2-26    """
    url = LIGHTSHADOW_CONST.PLACE_EDIT
    response_object = ApiCommon.api_post_request(url, dict_params, dict_asset)
    if response_object is not None:
        place_id = response_object['id']
        print(place_id)
        return place_id


def lightshadow_place_delete(dict_params, dict_asset=None):
    """场所类型表-通过id删除/ener-lightshadow/place/delete?id=70"""
    url = LIGHTSHADOW_CONST.PLACE_DELETE
    ApiCommon.api_delete_request(url, dict_params, dict_asset)


def lightshadow_place_deleteBatch(dict_params, dict_asset=None):
    """场所类型表-通过ids批量删除/ener-lightshadow/place/deleteBatch?id=70"""
    url = LIGHTSHADOW_CONST.PLACE_DELETEBATCH
    ApiCommon.api_delete_request(url, dict_params, dict_asset)


def lightshadow_place_addSpaceRelation(dict_params, dict_asset=None):
    """场所-关联空间/ener-lightshadow/place/addSpaceRelation;id	70;spaceIds	401"""
    url = LIGHTSHADOW_CONST.PLACE_ADDSPACERELATION
    response_object = ApiCommon.api_post_request(url, dict_params, dict_asset)


def lightshadow_place_removeSpaceRelation(dict_params, dict_asset=None):
    """场所-删除关联空间/ener-lightshadow/place/removeSpaceRelation;id: 62;spaceId: 420"""
    url = LIGHTSHADOW_CONST.PLACE_REMOVESPACERELATION
    response_object = ApiCommon.api_post_request(url, dict_params, dict_asset)


def lightshadow_place_page(dict_params, dict_asset=None):
    """场所表-根据名称或者类型Id查询/ener-lightshadow/place/page?size=12&current=1&categoryId=29"""
    url = LIGHTSHADOW_CONST.PLACE_PAGE
    return ApiCommon.api_get_request(url, dict_params, dict_asset)


def lightshadow_place_list(dict_params, dict_asset=None):
    """根据场所类型Id查询所有场所/ener-lightshadow/place/list?categoryId=29"""
    url = LIGHTSHADOW_CONST.PLACE_LIST
    return ApiCommon.api_get_request(url, dict_params, dict_asset)


def lightshadow_place_assetPage(dict_params, dict_asset=None):
    """根据场所id查询关联的设备信息/ener-lightshadow/place/assetPage?id=70&size=10&current=1"""
    url = LIGHTSHADOW_CONST.PLACE_ASSETPAGE
    return ApiCommon.api_get_request(url, dict_params, dict_asset)


def lightshadow_place_queryById(dict_params, dict_asset=None):
    """场所-根据Id查询场所基本信息/ener-lightshadow/place/queryById?id=67"""
    url = LIGHTSHADOW_CONST.PLACE_QUERYBYID
    return ApiCommon.api_get_request(url, dict_params, dict_asset)


def lightshadow_place_spaceCategoryList(dict_params, dict_asset=None):
    """根据场所id查询关联的空间的类型列表/ener-lightshadow/place/spaceCategoryList?placeId=67"""
    url = LIGHTSHADOW_CONST.PLACE_SPACECATEGORYLIST
    return ApiCommon.api_get_request(url, dict_params, dict_asset)


def lightshadow_place_spaceListByParentId(dict_params, dict_asset=None):
    """根据父空间id查询已经关联场所的子空间列表/ener-lightshadow/place/spaceListByParentId?placeId=70&parentId=418"""
    url = LIGHTSHADOW_CONST.PLACE_SPACELISTBYPARENTID
    return ApiCommon.api_get_request(url, dict_params, dict_asset)


def lightshadow_place_spaceListByParentIdAll(dict_params, dict_asset=None):
    """根据父空间id查询子空间列表/ener-lightshadow/place/spaceListByParentIdAll?placeId=92&parentId=418"""
    url = LIGHTSHADOW_CONST.PLACE_SPACELISTBYPARENTIDALL
    return ApiCommon.api_get_request(url, dict_params, dict_asset)


def lightshadow_place_spacePage(dict_params, dict_asset=None):
    """根据场所id查询关联的空间信息/ener-lightshadow/place/spacePage?id=67&current=1&size=10"""
    url = LIGHTSHADOW_CONST.PLACE_SPACEPAGE
    response_object = ApiCommon.api_get_request(url, dict_params, dict_asset)
    if len(response_object['records']) < 1:
        return None
    else:
        return response_object


def lightshadow_place_spacePageAll(dict_params, dict_asset=None):
    """查询所有可关联场所的空间信息
    /ener-lightshadow/place/spacePageAll?current=1&size=10
    返回object['records']"""
    url = LIGHTSHADOW_CONST.PLACE_SPACEPAGEALL
    response_object = ApiCommon.api_get_request(url, dict_params, dict_asset)
    if len(response_object['records']) < 1:
        return None
    else:
        return response_object


def lightshadow_placeCategory_list(dict_asset=None):
    """场所类型表-查询可用类型列表
    ener-lightshadow/placeCategory/list"""
    url = LIGHTSHADOW_CONST.PLACECATEGORY_LIST
    response_object = ApiCommon.api_get_request(url, None, dict_asset)
    if len(response_object) < 1:
        return None
    else:
        return response_object


if __name__ == "__main__":
    # query_first_page={"categoryId":"1","name":"2021115","platformId":"AD_SCREEN_REALTIME","isRelated":None,"platformProtocolId":"AD_SCREEN_PROTOCOL_REALTIME","fault":"NORMAL","current":"1","type":"SMART_DEVICE"}
    # lightshadow_place_page(query_first_page)
    # lightshadow_placeCategory_list()
    pass
