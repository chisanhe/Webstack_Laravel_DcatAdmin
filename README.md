# Laravel Webstack 网址导航 
 网址导航项目，用于收集工作、生活、学习中常用的网址，方便随时访问，搭建属于自己的网址导航或者说书签系统 \

 可任意修改源代码，搭建属于自己的网址导航项目

### 一、项目部署
1. 克隆项目
```bash
git clone https://github.com/chisanhe/Webstack_Laravel_DcatAdmin.git
```
2. 安装依赖，cd 进入项目目录
```bash
$ composer install
```
3. 导入 sql

创建属于你的数据库，导入项目目录下的 webstack.sql 文件

4. 环境变量文件.env 修改
```bash
...
# 数据库配置修改
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=
DB_USERNAME=root
DB_PASSWORD=
```
5. 生成应用密钥
```bash
php artisan key:generate
```
6.web服务器设置项目 public 目录为根目录，env中修改项目域名APP_URL, 否则后台图片显示会有问题。

7. nginx 需要设置伪静态
```nginx
location / { 
    try_files $uri $uri/ /index.php$is_args$query_string; 
}
```
8. 部署完成
- 前台访问 http://your-domain.com
- 后台访问 http://your-domain.com/admin \
账号：admin \
密码：admin

### 二、项目功能
#### 1. 后台功能
- 网址分类管理
- 网址管理(其中有个字段标记了网址访问状态，写死了 200，请根据自己业务去实现)
- 前台blade模版中 SEO 相关设置（含百度统计JS 配置）、上传logo等
- 后台可自行实现，展示浏览量明细（可扩展多图表）

#### 2. 前台功能
- 网址分类展示
- 网址预览（增加了浏览量统计）

### 三、运行软件及版本
    - Laravel 8.75
    - Laravel 后台扩展：dcat admin
    - MySQL > 8.0
    - PHP > 7.4
  
### 四、参考的 git 项目，感谢：
[Webstack网址导航](https://github.com/WebStackPage/WebStackPage.github.io) \


[WebStack-Laravel（laravel5+，laravel admin）](https://github.com/ReoTok/WebStack-Laravel)

### 五、项目截图
#### 1. 前台
![img.png](/public/assets/img/readme/img.png)

#### 2. 后台
- 分类管理
![img.png](/public/assets/img/readme/img1.png)
- 网址管理
  ![img.png](/public/assets/img/readme/img2.png)
- SEO 设置
  ![img.png](/public/assets/img/readme/img3.png)
