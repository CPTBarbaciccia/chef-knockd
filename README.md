# chef-knockd (Pre-Alpha)

Cookbook to install and configure knock-server

Knock is a tool developed and maintained by Judd Vinet (https://github.com/jvinet)
  link: http://www.zeroflux.org/projects/knock
  git:  https://github.com/jvinet/knock

Dependencies:
  - libpcap
  - build-essential

At the moment, this cookbook only sets 'opencloseSSH' configure option
and works only on rhel distributions.


## Attributes

```
default['knockd']['logfile'] = '/var/log/knockd.log'
default['knockd']['interface'] = 'eth0'
default['knockd']['sequence'] = '2222,3333,4444'
default['knockd']['start_cmd'] = '/sbin/iptables -I INPUT 1 -m state --state NEW,ESTABLISHED,RELATED -s %IP% -p tcp --dport ssh -j ACCEPT'
default['knockd']['seq_time'] = 15
default['knockd']['cmd_time'] = 20
default['knockd']['tcpflags'] = 'syn'
default['knockd']['stop_cmd'] = '/sbin/iptables -D INPUT -m state --state NEW,ESTABLISHED,RELATED -s %IP% -p tcp --dport ssh -j ACCEPT'
```


TO DO:
[ ] Auto-identification default interface (by ohai)
[ ] Compile knock source by chef
[ ] Adding option and configure choice
[ ] Complete the README.md (Documentation)
