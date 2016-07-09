What's ?
===============
chef で使用する s3cmd の cookbook です。

Usage
-----
cookbook なので berkshelf で取ってきて使いましょう。

* Berksfile
```ruby
source "https://supermarket.chef.io"

cookbook "s3cmd", git: "https://github.com/bageljp/cookbook-s3cmd.git"
```

```
berks vendor
```

#### Role and Environment attributes

* sample_role.rb
```ruby
override_attributes(
  "s3cmd" => {
    "install_flavor" => "src"
  }
)
```

Recipes
----------

#### s3cmd::default
yum or rpm or source のいずれかの方法で s3cmd をインストールする。
なお yum だとバージョンが古いので source を推奨。

Attributes
----------

主要なやつのみ。

#### s3cmd::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
  </tr>
  <tr>
    <td><tt>['s3cmd']['install_flavor']</tt></td>
    <td>yum or rpm or src</td>
    <td>通常はsrcで、rpmbuild済みのrpmを入れたい場合はrpm、yumを使用したい場合yumを記載。なおyumは古いのでsrcを推奨。</td>
  </tr>
  <tr>
    <td><tt>['s3cmd']['rpm']['url']</tt></td>
    <td>string</td>
    <td>rpmでインストールする場合にrpmが置いてあるURL。rpmbuildしたものをs3とかに置いておくといいかも。</td>
  </tr>
</table>

