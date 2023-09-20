
## 已知问题
### kcsp注册需要的参数
- 环境变量：`KCSP_ADDRESS`
### kcsp_register.php运行方式
- 在trp-manager-proxy容器的docker-start.sh中运行
### kcsp_register.php运行命令
- `php kcsp_register.php &`
### 注册流程
![image](https://github.com/tjyx111/note/assets/140045445/103f1441-9d2b-4299-92ce-71b4d1edd5b5)
### 注册状态文件
- /trp-manager-proxy/kcsp/register_stat
### 关键事件
- kcsp_register.php 运行
- kcsp_register 成功
- kcsp_register 失败

## 待确认问题
### 注册
- tmp需要把（增加/删除/修改）接口注册到kcsp平台？


