## 什么是ipsec?

### IPSEC协议工作在IP层，在IP层对数据包进行加密和验证
- 机密性：IPSec的发送方加密，接收方解密
- 完整性：IPSec保证收到的数据没有被篡改
- 认证：IPSec接收方验证发送方身份
- 抗重播：IPSec的接收方可以检测并拒绝到重播的IP包
  
### ESP头
- 协议号：50
- ip头 -> ESP头
- 加密/解密 + 数据认证 + 完整性 + 防重放
- [ESP协议](https://handbook.fortinet.com.cn/VPN%E6%8A%80%E6%9C%AF/IPSec_VPN/IPSec_VPN%E5%8E%9F%E7%90%86.html#ipsec%E5%AE%89%E5%85%A8%E5%8D%8F%E8%AE%AE)

### AH头
- 数据认证 + 完整性 + 防重放

### SPD
- 哪些流量可以被ESP处理
- SPD的条目可以基于源IP地址、目标IP地址、协议类型、端口号等标识符来匹配数据包，然后根据匹配结果来执行相应的安全策略

### SADB
- 如何加密/解密
- 生成时机：IPsec会话已经建立，生成（Security Association，SA）条目
- 内容：加密算法、认证算法、密钥等
- 作用：保护IP数据包的机密性、完整性和认证
- 如何使用：在发送和接收数据包时，系统会根据SADB中的安全关联信息来执行相应的加密和认证操作

### 报文封装

#### 传输模式和隧道模式
- https://handbook.fortinet.com.cn/VPN%E6%8A%80%E6%9C%AF/IPSec_VPN/IPSec_VPN%E5%8E%9F%E7%90%86.html#%E5%B0%81%E8%A3%85%E6%A8%A1%E5%BC%8F

#### 隧道模式
- 隧道模式主要应用于VPN网关之间或主机与VPN网关之间的通信，用来保护VPN网关后面的网络
- Typically used for VPNs

#### 传输模式
- Typically used for host-host IPsec

### IKE协议
- udp端口：500
- udp头 -> ike头
- 它为IPsec协商建立SA，并把协商好的参数交给IPsec，IPsec使用IKE建立的SA对IP报文加密或认证
- [IKE协议](https://handbook.fortinet.com.cn/VPN%E6%8A%80%E6%9C%AF/IPSec_VPN/IPSec_VPN%E5%8E%9F%E7%90%86.html#ike%E5%8D%8F%E8%AE%AE)

#### ike协议和esp协议
- ike协商出esp协议需要用的加密参数
- esp协议用这些参数对报文加密/解密
#### sps和sas
- ike协商出sps和sas
- sps根据报文src_addr，dst_addr等信息找出哪些包需要通过ipsec隧道
- 确定一个包要通过ipsec隧道以后，查找sas找出加密/解密报文需要用到的参数

### ipsec和strongswan
1. linux通过xfrm框架实现了ipsec
2. xfrm框架实现一个ipsec vpn隧道需要用到sps(哪些包需要通过隧道发送), sas(对报文如何封装)
3. strongswan的charon通过ike协议，在vpn两端协商出sps和sas
4. strongswan自己在用户空间保存ike_sa
5. strongswan将sps和sas通过Netlink socket下发给xfrm框架

![linux-ipsec-impl1](https://github.com/tjyx111/note/assets/140045445/efcdc40b-7d8f-4399-8408-489de38acc73)



  

