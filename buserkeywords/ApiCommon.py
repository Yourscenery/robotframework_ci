"""
通过接口请求；
放myrequest里不合适：同类型请求会有不同处理；
"""
from cpublickeywords import myrequest


# from buserkeywords.resource import smartdevice
#
#
# class public_params(object):
#     def __init__(self):
#         self._smartdevice_id = {"adscreen": None, "ipc": None, "lamp": None, "weather_station": None,
#                                 "synthesis_device_box": None, "landscape_lamp": None, "lamp_pole": None,
#                                 "camera": None, "broadcast": None, "manhole_cover": None, "smoke_detector": None,
#                                 "press_to_alarm": None}
#
#     def get_smartdevice_id(self, key):
#         if self._smartdevice_id:
#             self._smartdevice_id[key] = smartdevice.resource_smartDevice_add_oneData_by_type(key)
#         return self._smartdevice_id[key]
#
#     def set_smartdevice_id(self, key, value):
#         self._smartdevice_id[key] = value


def api_get_request(url, dict_params=None, dict_assets=None, dict_headers=None):
    """get类型的查询（page\list\query）接口中转站；返回：字典类型的response所有值"""
    api_response = myrequest.__http_request('get', url, dict_params, dict_assets, dict_headers)
    if (dict_assets is None and api_response['success']) or (dict_assets is not None and dict_assets['success']):
        return api_response['object']


def api_post_request(url, dict_params=None, dict_assets=None, dict_headers=None):
    """post类型的请求接口中转站；返回：字典类型的response所有值"""
    api_response = myrequest.__http_request('post', url, dict_params, dict_assets, dict_headers)
    if (dict_assets is None and api_response['success']) or (dict_assets is not None and dict_assets['success']):
        return api_response['object']


def api_put_request(url, dict_params=None, dict_assets=None, dict_headers=None):
    """put类型的请求接口中转站；返回：字典类型的response所有值"""
    api_response = myrequest.__http_request('put', url, dict_params, dict_assets, dict_headers)
    if (dict_assets is None and api_response['success']) or (dict_assets is not None and dict_assets['success']):
        return api_response['object']


def api_delete_request(url, dict_params=None, dict_assets=None, dict_headers=None):
    """delete类型的请求接口中转站；返回：字典类型的response所有值"""
    api_response = myrequest.__http_request('delete', url, dict_params, dict_assets, dict_headers)
    if (dict_assets is None and api_response['success']) or (dict_assets is not None and dict_assets['success']):
        return api_response['object']


def api_file_request(url, dict_params=None, dict_assets=None, dict_headers=None):
    """文件上传请求接口中转站；返回：字典类型的response所有值"""
    api_response = myrequest.__http_request('files', url, dict_params, dict_assets, dict_headers)
    if (dict_assets is None and api_response['success']) or (dict_assets is not None and dict_assets['success']):
        return api_response['object']
