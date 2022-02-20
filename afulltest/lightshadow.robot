*** Settings ***
Resource          ../fShareResource.txt

*** Test Cases ***
place_add
    ${category_list}=    lightshadow_placeCategory_list
    set suite variable    ${s_category_id}    ${category_list}[0][id]
    ${time}=    get time no year
    #${readfile}    evaluate    ("SnapRapid.jpg",open("afulltest/data/add-SnapRapid.jpg","rb"),"image/jpg")
    ${readfile}    evaluate    ("edit一群好奇的帝企鹅.jpg",open("afulltest/data/edit一群好奇的帝企鹅.jpg","rb"),"image/jpg")
    ${add_params}    create dictionary    coverImage=${readfile}    categoryId=${s_category_id}    name=场所${time}    description=场所${time}
    ${response_object}    lightshadow_place_add    ${add_params}
    set suite variable    ${s_place_id}    ${response_object}[id]

place_edit
    ${time}=    get time no year
    should not be empty    '${s_category_id}'    场所类型id不能为空
    should not be empty    '${s_place_id}'    场所id不能为空
    ${readfile}    evaluate    ("SnapRapid.jpg",open("afulltest/data/add-SnapRapid.jpg","rb"),"image/jpg")
    #${readfile}    evaluate    ("edit一群好奇的帝企鹅.jpg",open("afulltest/data/edit一群好奇的帝企鹅.jpg","rb"),"image/jpg")
    ${edit_params}    create dictionary    coverImage=${readfile}    id=${s_place_id}    categoryId=${s_category_id}    name=UPD场所${time}    description=UPD场所${time}
    lightshadow_place_edit    ${edit_params}

place_page
    ${params}    create dictionary    current=1    size=10
    lightshadow_place_page    ${params}

place_list
    should not be empty    '${s_category_id}'    场所类型id不能为空
    ${params}    create dictionary    categoryId=${s_category_id}
    lightshadow_place_list    ${params}

place_queryById
    should not be empty    '${s_place_id}'    场所id不能为空
    ${params}    create dictionary    id=${s_place_id}
    lightshadow_place_queryById    ${params}

place_spacePageAll
    ${params}    create dictionary    current=1    size=50
    ${unuse_space_list}=    lightshadow_place_spacePageAll    ${params}
    set suite variable    ${s_space_id}    ${unuse_space_list}[records][0][resourceId]
    ###获取场所里的空间，最好是有子空间的父空间
    ${records}    set variable    ${unuse_space_list}[records]
    #${len_records}    get length    ${records}
    #${type_r}    evaluate    type($records)
    FOR    ${item}    IN    @{records}
        #log    ${item}
        ${space_parentId}=    set variable if    ${item}[subCount]>0    ${item}[resourceId]
        Exit For Loop If    ${space_parentId}!=${none}
    END
    set suite variable    ${s_space_parentId}    ${space_parentId}

place_addSpaceRelation
    should not be empty    '${s_place_id}'    场所id不能为空
    ${space_id}    set variable if    ${s_space_parentId}==${none}    ${s_space_id}    ${s_space_parentId}
    ${params}    create dictionary    id=${s_place_id}    spaceIds=${space_id}
    lightshadow_place_addSpaceRelation    ${params}

place_spacePage
    should not be empty    '${s_place_id}'    场所id不能为空
    ${params}    create dictionary    id=${s_place_id}    current=1    size=10
    lightshadow_place_spacePage    ${params}

place_spaceListByParentId
    should not be empty    '${s_place_id}'    场所id不能为空
    should not be empty    '${s_space_parentId}'    父空间id不能为空
    ${params}    create dictionary    placeId=${s_place_id}    parentId=${s_space_parentId}
    lightshadow_place_spaceListByParentId    ${params}

place_spaceListByParentIdAll
    should not be empty    '${s_place_id}'    场所id不能为空
    should not be empty    '${s_space_parentId}'    父空间id不能为空
    ${params}    create dictionary    placeId=${s_place_id}    parentId=${s_space_parentId}
    lightshadow_place_spaceListByParentIdAll    ${params}

place_spaceCategoryList
    should not be empty    '${s_place_id}'    场所id不能为空
    ${params}    create dictionary    placeId=${s_place_id}
    lightshadow_place_spaceCategoryList    ${params}

place_assetPage
    should not be empty    '${s_place_id}'    场所id不能为空
    ${params}    create dictionary    id=${s_place_id}    current=1    size=10
    lightshadow_place_assetPage    ${params}

place_removeSpaceRelation
    should not be empty    '${s_place_id}'    场所id不能为空
    ${space_id}    set variable if    ${s_space_parentId}==${none}    ${s_space_id}    ${s_space_parentId}
    ${params}    create dictionary    id=${s_place_id}    spaceId=${space_id}
    lightshadow_place_removeSpaceRelation    ${params}

place_delete
    should not be empty    '${s_place_id}'    场所id不能为空
    ${params}    create dictionary    id=${s_place_id}
    lightshadow_place_delete    ${params}
