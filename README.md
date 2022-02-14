接口测试分层
--------------------------

修改说明：
日期                                         负责人            修改内容
2019年11月12日                       吴忠良             新增关键字及层级

1. 接口测试库
2. api
3. 自动化用例

树形结构图
│  README.txt
│
├─libraries
│  ├─enerlib
│  │      __init__.py
│  │
│  ├─rf-bright_business_keyword        ---服务专用关键字
│  ├─rf-rbac_business_keyword        ---服务专用关键字
│  │      登录.robot
│  │
│  └─public-keyword	                            ---公共关键字【数据库、excel的值解析还没写好】
│          database.robot	                            ---数据库关键字
│          excel.robot	                            ---excel关键字
│          http.robot                            ---http关键字
│          publickeywords.robot	              ---公共关键字【获取token，for多重循环等】
│
├─resources
│  ├─framework
│  │      framework_init.robot
│  │
│  ├─rf-bright                                    ---api
│  └─rf-rbac                                    ---api
│          登录.robot
│
└─testcases
    │  public-data.robot                                 ---公共数据
    │  testcase_init.robot



接口测试需要的关键字梳理
http库
	--post请求
	--get请求
	--put请求
	--delete请求
	--断言

database库
	--open
	--query
	--excute
	--close
	--查询结果解析成json\string等格式

excel库
	--读取
	--查询结果解析成json\string等格式
	
publickeywords库
	--获取token
	--for多重循环




