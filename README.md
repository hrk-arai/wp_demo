### Wordpress自動構築デモ

* 出来上がる構成
  - Wordpressサーバ(1台構成)
    * nginx
    * php
    * mysql

* 対象OS
  - CentOS 6系

* 前提条件
  - iptables等の設定は行っていないので、有効化されている場合には事前にhttpのポートを空けておく

* 事前作業
  - インスタンスを起動しておく

* 作業手順

```
# 構築対象のホストにSSHでrootログインして以下を実施(rootがNGの場合には、必要に応じてsudo)
$ curl -L http://www.opscode.com/chef/install.sh | sudo bash
$ git clone https://github.com/hrk-arai/wp_demo.git chef-repo
$ cd chef-repo
$ chef-solo -c solo.rb -j solo.json -o recipe[wordpress::default];
```
