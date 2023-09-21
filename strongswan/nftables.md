- [nftables快速开始](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/8/html/securing_networks/getting-started-with-nftables_securing-networks#doc-wrapper)

### table和chain区别
- table是一个network namespace
- table包含chains
- chains包含rulers

### nftables
- 没有预先定义的tables和chains
- 必须由用户显示定义tables和chains
- 默认tables是net_init
