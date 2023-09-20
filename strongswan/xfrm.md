
- [使用ip xfrm手动配置ipsec](https://taoshu.in/net/manual-ipsec-ip-xfrm.html)

### 注意
- 配置路由
```
ip route add 192.168.92.0/24 via 192.168.93.203 # 默认路由好像不生效，需要指明目的网段的路由
```
