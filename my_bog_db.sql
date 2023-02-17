/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80028
 Source Host           : localhost:3306
 Source Schema         : my_bog_db

 Target Server Type    : MySQL
 Target Server Version : 80028
 File Encoding         : 65001

 Date: 17/02/2023 20:32:54
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for generator_test
-- ----------------------------
DROP TABLE IF EXISTS `generator_test`;
CREATE TABLE `generator_test`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `test` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '测试字段',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for jdbc_test
-- ----------------------------
DROP TABLE IF EXISTS `jdbc_test`;
CREATE TABLE `jdbc_test`  (
  `type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of jdbc_test
-- ----------------------------
INSERT INTO `jdbc_test` VALUES ('com.zaxxer.hikari.HikariDataSource', 'hikari数据源');
INSERT INTO `jdbc_test` VALUES ('org.apache.commons.dbcp2.BasicDataSource', 'dbcp2数据源');
INSERT INTO `jdbc_test` VALUES ('test', '测试类');
INSERT INTO `jdbc_test` VALUES ('类别2', '测试类2');

-- ----------------------------
-- Table structure for tb_admin_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_admin_user`;
CREATE TABLE `tb_admin_user`  (
  `admin_user_id` int(0) NOT NULL AUTO_INCREMENT COMMENT '管理员id',
  `login_user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '管理员登陆名称',
  `login_password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '管理员登陆密码',
  `nick_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '管理员显示昵称',
  `locked` tinyint(0) NULL DEFAULT 0 COMMENT '是否锁定 0未锁定 1已锁定无法登陆',
  PRIMARY KEY (`admin_user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_admin_user
-- ----------------------------
INSERT INTO `tb_admin_user` VALUES (1, 'zsblog', 'd2230c158503301ef3fdf6f3e8a7b9c5', 'zs', 0);

-- ----------------------------
-- Table structure for tb_blog
-- ----------------------------
DROP TABLE IF EXISTS `tb_blog`;
CREATE TABLE `tb_blog`  (
  `blog_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '博客表主键id',
  `blog_title` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '博客标题',
  `blog_sub_url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '博客自定义路径url',
  `blog_cover_image` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '博客封面图',
  `blog_content` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '博客内容',
  `blog_category_id` int(0) NOT NULL COMMENT '博客分类id',
  `blog_category_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '博客分类(冗余字段)',
  `blog_tags` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '博客标签',
  `blog_status` tinyint(0) NOT NULL DEFAULT 0 COMMENT '0-草稿 1-发布',
  `blog_views` bigint(0) NOT NULL DEFAULT 0 COMMENT '阅读量',
  `enable_comment` tinyint(0) NOT NULL DEFAULT 0 COMMENT '0-允许评论 1-不允许评论',
  `is_deleted` tinyint(0) NOT NULL DEFAULT 0 COMMENT '是否删除 0=否 1=是',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`blog_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_blog
-- ----------------------------
INSERT INTO `tb_blog` VALUES (1, '我是十三', 'about', '/admin/dist/img/rand/33.jpg', '## About me\n\n我是十三，一名Java开发者，技术一般，经历平平，但是也一直渴望进步，同时也努力活着，为了人生不留遗憾，也希望能够一直做着自己喜欢的事情，得闲时分享心得、分享一些浅薄的经验，等以后老得不能再老了，就说故事已经讲完了,不去奢求圆满。\n\n相信浏览这段话的你也知道，学习是一件极其枯燥而无聊的过程，甚至有时候显得很无助，我也想告诉你，成长就是这样一件残酷的事情，任何成功都不是一蹴而就，需要坚持、需要付出、需要你的毅力，短期可能看不到收获，因为破茧成蝶所耗费的时间不是一天。\n\n## Contact\n\n- 我的邮箱：2449207463@qq.com\n- QQ技术交流群：796794009\n- 我的网站：http://13blog.site\n\n## Quote\n\n- Steve Jobs\n\n> Stay hungry,Stay foolish\n\n- Kahlil Gibran\n\n>The FIRST TIME WHEN I saw her being meek that she might attain height.<br>\nThe SECOND TIME WHEN I saw her limping BEFORE the crippled.<br>\nThe third TIME WHEN she was given TO choose BETWEEN the hard AND the easy, AND she chose the easy.<br>\nThe fourth TIME WHEN she COMMITTED a wrong, AND comforted herself that others also COMMIT wrong.<br>\nThe fifth TIME WHEN she forbore FOR weakness, AND attributed her patience TO strength.<br>\nThe sixth TIME WHEN she despised the ugliness of a face, AND knew NOT that it was ONE of her own masks.<br>\nAND the seventh TIME WHEN she sang a song of praise, AND deemed it a virtue.', 0, '默认分类', '世界上有一个很可爱的人,现在这个人就在看这句话', 1, 222, 0, 1, '2017-03-12 00:31:15', '2018-11-12 00:31:15');
INSERT INTO `tb_blog` VALUES (2, '文章总目录', '', '/admin/dist/img/rand/13.jpg', '<h2 id=\"springboot2\">23 个实验带你轻松玩转 Spring Boot</h2>\n\n- [**开篇词：《23 个实验带你轻松玩转 Spring Boot》导读**](https://www.shiyanlou.com/courses/1274)\n- [第02课：Spring Boot 项目开发环境搭建](https://www.shiyanlou.com/courses/1274)\n- [第03课：快速构建 Spring Boot 应用](https://www.shiyanlou.com/courses/1274)\n- [第04课：Spring Boot 基础功能开发](https://www.shiyanlou.com/courses/1274)\n- [第05课：Spring Boot 项目开发之 web 项目开发讲解](https://www.shiyanlou.com/courses/1274)\n- [第06课：Spring Boot 整合 JSP 开发 web 项目](https://www.shiyanlou.com/courses/1274)\n- [第07课：模板引擎介绍及 Spring Boot 整合 Thymeleaf](https://www.shiyanlou.com/courses/1274)\n- [第08课：Thymeleaf 语法详解](https://www.shiyanlou.com/courses/1274)\n- [第09课：FreeMarker 模板引擎整合使用教程](https://www.shiyanlou.com/courses/1274)\n- [第10课：Spring Boot 处理文件上传及路径回显](https://www.shiyanlou.com/courses/1274)\n- [第11课：Spring Boot 自动配置数据源及操作数据库](https://www.shiyanlou.com/courses/1274)\n- [第12课：Spring Boot 整合 Druid 数据源](https://www.shiyanlou.com/courses/1274)\n- [第13课：Spring Boot 整合 MyBatis 操作数据库](https://www.shiyanlou.com/courses/1274)\n- [第14课：Spring Boot 中的事务处理](https://www.shiyanlou.com/courses/1274)\n- [第15课：Spring Boot 整合 Redis 操作缓存模块](https://www.shiyanlou.com/courses/1274)\n- [第16课：Spring Boot 项目开发之实现定时任务](https://www.shiyanlou.com/courses/1274)\n- [第17课：Spring Boot 自定义错误页面](https://www.shiyanlou.com/courses/1274)\n- [第18课：Spring Boot 集成 Swagger 生成接口文档](https://www.shiyanlou.com/courses/1274)\n- [第19课：Spring Boot 项目打包部署介绍](https://www.shiyanlou.com/courses/1274)\n- [第20课：Spring Boot Admin 介绍及整合使用](https://www.shiyanlou.com/courses/1274)\n- [第21课：Spring Boot 资讯管理信息系统开发实战(一)](https://www.shiyanlou.com/courses/1274)\n- [第22课：Spring Boot 资讯管理信息系统开发实战(二)](https://www.shiyanlou.com/courses/1274)\n- [第23课：Spring Boot 资讯管理信息系统开发实战(三)](https://www.shiyanlou.com/courses/1274)\n- [第24课：Spring Boot 资讯管理信息系统开发实战(四)](https://www.shiyanlou.com/courses/1274)\n\n<h2 id=\"springboot1\">Spring Boot 入门及前后端分离项目实践</h2>\n\n* [开篇词：SpringBoot入门及前后端分离项目实践导读](https://www.shiyanlou.com/courses/1244)\n* [第02课：快速认识 Spring Boot 技术栈](https://www.shiyanlou.com/courses/1244)\n* [第03课：开发环境搭建](https://www.shiyanlou.com/courses/1244)\n* [第04课：快速构建 Spring Boot 应用](https://www.shiyanlou.com/courses/1244)\n* [第05课：Spring Boot 之基础 web 功能开发](https://www.shiyanlou.com/courses/1244)\n* [第06课：Spring Boot 之数据库连接操作](https://www.shiyanlou.com/courses/1244)\n* [第07课：Spring Boot 整合 MyBatis 操作数据库](https://www.shiyanlou.com/courses/1244)\n* [第08课：Spring Boot 处理文件上传及路径回显](https://www.shiyanlou.com/courses/1244)\n* [第09课：Spring Boot 项目实践之前后端分离详解](https://www.shiyanlou.com/courses/1244)\n* [第10课：Spring Boot 项目实践之 API 设计](https://www.shiyanlou.com/courses/1244)\n* [第11课：Spring Boot 项目实践之登录模块实现](https://www.shiyanlou.com/courses/1244)\n* [第12课：Spring Boot 项目实践之分页功能实现](https://www.shiyanlou.com/courses/1244)\n* [第13课：Spring Boot 项目实践之jqgrid分页整合](https://www.shiyanlou.com/courses/1244)\n* [第14课：Spring Boot 项目实践之编辑功能实现](https://www.shiyanlou.com/courses/1244)\n* [第15课：Spring Boot 项目实践之用户管理模块实现](https://www.shiyanlou.com/courses/1244)\n* [第16课：Spring Boot 项目实践之图片管理模块](https://www.shiyanlou.com/courses/1244)\n* [第17课：Spring Boot 项目实践之富文本编辑器介绍及整合](https://www.shiyanlou.com/courses/1244)\n* [第18课：Spring Boot 项目实践之信息管理模块实现](https://www.shiyanlou.com/courses/1244)\n\n<h2 id=\"ssm4\">从零开始搭建一个精美且实用的管理后台</h2>\n\n- [SSM 搭建精美实用的管理系统](http://gitbook.cn/m/mazi/comp/column?columnId=5b4dae389bcda53d07056bc9&sceneId=22778a708b0f11e8974b497483da0812)\n- [导读：自己动手实现 JavaWeb 后台管理系统](https://gitbook.cn/gitchat/column/5b4dae389bcda53d07056bc9/topic/5b4db47e9bcda53d07056f5f)\n- [第01课：Spring MVC+ Spring + Mybatis “三大框架”介绍](https://gitbook.cn/gitchat/column/5b4dae389bcda53d07056bc9/topic/5b4db5b89bcda53d070590de)\n- [第02课：前期准备工作及基础环境搭建](https://gitbook.cn/gitchat/column/5b4dae389bcda53d07056bc9/topic/5b4eb8e701d18a561f341b72)\n- [第03课：三大框架的整合](https://gitbook.cn/gitchat/column/5b4dae389bcda53d07056bc9/topic/5b4ee11c01d18a561f342c0f)\n- [第04课：Tomcat 8 安装部署及功能改造](https://gitbook.cn/gitchat/column/5b4dae389bcda53d07056bc9/topic/5b4f1335dbb1436093a6ca17)\n- [第05课：产品设计之搭建精美实用的后台管理系统](https://gitbook.cn/gitchat/column/5b4dae389bcda53d07056bc9/topic/5b4f1b35dbb1436093a6cc7a)\n- [第06课：前端选型 AdminLTE3](https://gitbook.cn/gitchat/column/5b4dae389bcda53d07056bc9/topic/5b4f1b70dbb1436093a6cc87)\n- [第07课：登录模块的系统设计和实现](https://gitbook.cn/gitchat/column/5b4dae389bcda53d07056bc9/topic/5b4f1b80dbb1436093a6cc8e)\n- [第08课：使用 JqGrid 插件实现分页功能](https://gitbook.cn/gitchat/column/5b4dae389bcda53d07056bc9/topic/5b4f1b92dbb1436093a6cc93)\n- [第09课：弹框组件整合——完善添加和修改功能](https://gitbook.cn/gitchat/column/5b4dae389bcda53d07056bc9/topic/5b4f1bbddbb1436093a6cc9b)\n- [第10课：图片管理模块](https://gitbook.cn/gitchat/column/5b4dae389bcda53d07056bc9/topic/5b4f1bd0dbb1436093a6cca1)\n- [第11课：多图上传与大文件分片上传、断点续传](https://gitbook.cn/gitchat/column/5b4dae389bcda53d07056bc9/topic/5b4f1bdedbb1436093a6cca2)\n- [第12课：文件导入导出功能](https://gitbook.cn/gitchat/column/5b4dae389bcda53d07056bc9/topic/5b4f1beddbb1436093a6cca8)\n- [第13课：富文本信息管理模块](https://gitbook.cn/gitchat/column/5b4dae389bcda53d07056bc9/topic/5b4f1c00dbb1436093a6ccae)\n- [第14课：SweetAlert 插件整合及搜索功能实现](https://gitbook.cn/gitchat/column/5b4dae389bcda53d07056bc9/topic/5b4f1c11dbb1436093a6ccb1)\n- [第15课：项目发布——Linux 命令及发布流程](https://gitbook.cn/gitchat/column/5b4dae389bcda53d07056bc9/topic/5b4f1c21dbb1436093a6ccb6)\n- [第16课：项目优化篇之日志输出](https://gitbook.cn/gitchat/column/5b4dae389bcda53d07056bc9/topic/5b4f1c30dbb1436093a6ccbb)\n- [第17课：项目优化之单元测试](https://gitbook.cn/gitchat/column/5b4dae389bcda53d07056bc9/topic/5b4f1c3fdbb1436093a6ccc1)\n- [第18课：项目优化之数据库连接池](https://gitbook.cn/gitchat/column/5b4dae389bcda53d07056bc9/topic/5b4f1c50dbb1436093a6ccca)\n- [第19课：项目优化之 Druid 整合](https://gitbook.cn/gitchat/column/5b4dae389bcda53d07056bc9/topic/5b4f1c65dbb1436093a6cccd)\n- [第20课：项目优化之缓存整合](https://gitbook.cn/gitchat/column/5b4dae389bcda53d07056bc9/topic/5b4f1c7cdbb1436093a6ccd6)\n- [第21课：网站架构演进及 Nginx 介绍](https://gitbook.cn/gitchat/column/5b4dae389bcda53d07056bc9/topic/5b4f1c8bdbb1436093a6ccda)\n- [第22课：Nginx + Tomcat 集群搭建](https://gitbook.cn/gitchat/column/5b4dae389bcda53d07056bc9/topic/5b4f1c9ddbb1436093a6cce2)\n- [第23课：Nginx 动静分离](https://gitbook.cn/gitchat/column/5b4dae389bcda53d07056bc9/topic/5b4f1cb7dbb1436093a6cceb)\n\n<h2 id=\"ssm3\">SSM整合进阶篇</h2>\n\n- [Spring+SpringMVC+MyBatis+easyUI整合进阶篇（一）设计一套好的RESTful API](http://www.cnblogs.com/han-1034683568/p/7196345.html)\n- [Spring+SpringMVC+MyBatis+easyUI整合进阶篇（二）RESTful API实战笔记(接口设计及Java后端实现)](http://www.cnblogs.com/han-1034683568/p/7300547.html)\n- [Spring+SpringMVC+MyBatis+easyUI整合进阶篇（三）使用ajax方法实现form表单的提交](http://www.cnblogs.com/han-1034683568/p/7199168.html)\n- [Spring+SpringMVC+MyBatis+easyUI整合进阶篇（四）RESTful实战(前端代码修改)](http://www.cnblogs.com/han-1034683568/p/7552007.html)\n- [Spring+SpringMVC+MyBatis+easyUI整合进阶篇（五）记录一下从懵懂到理解RESTful的过程](http://www.cnblogs.com/han-1034683568/p/7569870.html)\n- [Spring+SpringMVC+MyBatis+easyUI整合进阶篇（六）一定要RESTful吗？](http://www.cnblogs.com/han-1034683568/p/7663641.html)\n- [Spring+SpringMVC+MyBatis+easyUI整合进阶篇（七）一次线上Mysql数据库崩溃事故的记录](http://www.cnblogs.com/han-1034683568/p/7787659.html)\n- [Spring+SpringMVC+MyBatis+easyUI整合进阶篇（八）线上Mysql数据库崩溃事故的原因和处理](http://www.cnblogs.com/han-1034683568/p/7822237.html)\n- [Spring+SpringMVC+MyBatis+easyUI整合进阶篇（九）Linux下安装redis及redis的常用命令和操作](http://www.cnblogs.com/han-1034683568/p/7862188.html)\n- [Spring+SpringMVC+MyBatis+easyUI整合进阶篇（十）easyUI整合KindEditor详细教程](http://www.cnblogs.com/han-1034683568/p/7930542.html)\n- [Spring+SpringMVC+MyBatis+easyUI整合进阶篇（十一）redis密码设置、安全设置](http://www.cnblogs.com/han-1034683568/p/7978577.html)\n- [Spring+SpringMVC+MyBatis+easyUI整合进阶篇（十二）Spring集成Redis缓存](http://www.cnblogs.com/han-1034683568/p/7994231.html)\n- [Spring+SpringMVC+MyBatis+easyUI整合进阶篇（十三）MyBatis+MySQL返回插入的主键id](http://www.cnblogs.com/han-1034683568/p/8305122.html)\n- [Spring+SpringMVC+MyBatis+easyUI整合进阶篇（十四）Redis正确的使用姿势](http://www.cnblogs.com/han-1034683568/p/8406497.html)\n- [Spring+SpringMVC+MyBatis+easyUI整合进阶篇（十五）阶段总结](http://www.cnblogs.com/han-1034683568/p/9069008.html)\n\n<h2 id=\"idea\">Intellij IDEA相关笔记</h2>\n\n- [如何查看IntelliJ IDEA的版本信息](http://www.cnblogs.com/han-1034683568/p/9135192.html)\n- [Plugin \'Lombok Plugin\' is incompatible with this installation](http://www.cnblogs.com/han-1034683568/p/9135074.html)\n- [IDEA安装Lombok插件失败的解决方案](http://www.cnblogs.com/han-1034683568/p/9134980.html)\n- [Intellij IDEA debug模式下项目启动慢/无法启动的事件解决过程记录](http://www.cnblogs.com/han-1034683568/p/8603588.html)\n- [Intellij IDEA查看所有断点](http://www.cnblogs.com/han-1034683568/p/8603110.html)\n- [IntelliJ IDEA 报错：Error:java: 未结束的字符串文字](http://www.cnblogs.com/han-1034683568/p/6439723.html)\n- [IntelliJ IDEA 常用快捷键mac版](http://www.cnblogs.com/han-1034683568/p/6492342.html)\n\n<h2 id=\"diary\">日常手记</h2>\n\n- [开启mac上印象笔记的代码块](http://www.cnblogs.com/han-1034683568/p/9021263.html)\n- [程序员，你怎么这么忙？](http://www.cnblogs.com/han-1034683568/p/8968959.html)\n- [新购阿里云服务器ECS创建之后无法ssh连接的问题处理](http://www.cnblogs.com/han-1034683568/p/8856560.html)\n- [CentOS 7.2:Failed to start IPv4 firewall with iptables](http://www.cnblogs.com/han-1034683568/p/8854613.html)\n- [JDK8 stream toMap() java.lang.IllegalStateException: Duplicate key异常解决(key重复)](http://www.cnblogs.com/han-1034683568/p/8624447.html)\n- [我在博客园的这一年小记](http://www.cnblogs.com/han-1034683568/p/8443428.html)\n- [记录一下我的2017年阅读书单](http://www.cnblogs.com/han-1034683568/p/8432261.html)\n- [2017总结](http://www.cnblogs.com/han-1034683568/p/8337394.html)\n- [微信公众号问题：{\"errcode\":40125,\"errmsg\":\"invalid appsecret, view more at http:\\/\\/t.cn\\/LOEdzVq, hints: [ req_id: kL8J90219sg58 ]\"}](http://www.cnblogs.com/han-1034683568/p/8286777.html)\n- [git删除本地分支](http://www.cnblogs.com/han-1034683568/p/8241369.html)\n- [阿里巴巴Java开发规约插件p3c详细教程及使用感受](http://www.cnblogs.com/han-1034683568/p/7682594.html)\n- [阿里官方Java代码规范标准《阿里巴巴Java开发手册 终极版 v1.3.0》下载](http://www.cnblogs.com/han-1034683568/p/7680354.html)\n- [程序员视角：鹿晗公布恋情是如何把微博搞炸的？](http://www.cnblogs.com/han-1034683568/p/7642213.html)\n- [could not resolve host: github.com 问题解决办法](http://www.cnblogs.com/han-1034683568/p/6457894.html)\n- [使用git恢复未提交的误删数据](http://www.cnblogs.com/han-1034683568/p/6444937.html)\n- [springboot开启access_log日志输出](http://www.cnblogs.com/han-1034683568/p/6963144.html)\n- [Error: Cannot find module \'gulp-clone\'问题的解决](http://www.cnblogs.com/han-1034683568/p/6479288.html)\n- [Markdown语法讲解及MWeb使用教程](http://www.cnblogs.com/han-1034683568/p/6556348.html)\n- [javax.net.ssl.SSLHandshakeException: No appropriate protocol (protocol is disabled or cipher suites are inappropriate)](http://www.cnblogs.com/han-1034683568/p/7009096.html)\n- [org.springframework.data.redis.serializer.SerializationException: Cannot serialize;](http://www.cnblogs.com/han-1034683568/p/7994322.html)\n\n<h2 id=\"13blog\">My Blog</h2>\n\n- [Docker+SpringBoot+Mybatis+thymeleaf的Java博客系统开源啦](http://www.cnblogs.com/han-1034683568/p/6840493.html)\n- [My-Blog搭建过程：如何让一个网站从零到可以上线访问](http://www.cnblogs.com/han-1034683568/p/6885545.html)\n- [将数据的初始化放到docker中的整个工作过程(问题记录)](http://www.cnblogs.com/han-1034683568/p/6941313.html)\n- [利用Dockerfile构建mysql镜像并实现数据的初始化及权限设置](http://www.cnblogs.com/han-1034683568/p/6941337.html)\n- [解决Docker容器时区及时间不同步的问题](http://www.cnblogs.com/han-1034683568/p/6957132.html)\n- [Java开源博客My-Blog之docker容器组件化修改](http://www.cnblogs.com/han-1034683568/p/7102765.html)\n- [运行shell脚本时报错\"\\[\\[ : not found\"解决方法](http://www.cnblogs.com/han-1034683568/p/7211392.html)\n- [shell脚本中字符串的常见操作及\"command not found\"报错处理(附源码)](http://www.cnblogs.com/han-1034683568/p/7217047.html)\n- [Java开源博客My-Blog之mysql容器重复初始化的严重bug修复过程](http://www.cnblogs.com/han-1034683568/p/7231895.html)\n- [Mybatis-Generator生成Mapper文件中if test=\"criteria.valid\"的问题解答](http://www.cnblogs.com/han-1034683568/p/7281474.html)\n- [Springboot与Thymeleaf模板引擎整合基础教程](http://www.cnblogs.com/han-1034683568/p/7520012.html)\n- [thymeleaf模板引擎调用java类中的方法](http://www.cnblogs.com/han-1034683568/p/7527564.html)\n\n<h2 id=\"message-attack\">短信接口攻击事件</h2>\n\n- [短信发送接口被恶意访问的网络攻击事件(一)紧张的遭遇战险胜](http://www.cnblogs.com/han-1034683568/p/6973269.html)\n- [短信发送接口被恶意访问的网络攻击事件(二)肉搏战-阻止恶意请求](http://www.cnblogs.com/han-1034683568/p/7001785.html)\n- [短信发送接口被恶意访问的网络攻击事件(三)定位恶意IP的日志分析脚本](http://www.cnblogs.com/han-1034683568/p/7040417.html)\n- [短信发送接口被恶意访问的网络攻击事件(四)完结篇--搭建WAF清理战场](http://www.cnblogs.com/han-1034683568/p/7090409.html)\n\n<h2 id=\"read\">读书笔记</h2>\n\n- [《实战java高并发程序设计》源码整理及读书笔记](http://www.cnblogs.com/han-1034683568/p/6918160.html)\n- [《大型网站技术架构:核心原理与案例分析》读书笔记](http://www.cnblogs.com/han-1034683568/p/7597564.html)\n- [大型网站技术架构(二)--大型网站架构演化](http://www.cnblogs.com/han-1034683568/p/8423447.html)\n- [大型网站技术架构(三)--架构模式](http://www.cnblogs.com/han-1034683568/p/8677349.html)\n- [大型网站技术架构(四)--核心架构要素](http://www.cnblogs.com/han-1034683568/p/9049758.html)\n\n<h2 id=\"ssm2\">SSM整合优化篇</h2>\n\n- [Spring+SpringMVC+MyBatis+easyUI整合优化篇（一）System.out.print与Log](http://www.cnblogs.com/han-1034683568/p/6637914.html)\n- [Spring+SpringMVC+MyBatis+easyUI整合优化篇（二）Log4j讲解与整合](http://www.cnblogs.com/han-1034683568/p/6641808.html)\n- [Spring+SpringMVC+MyBatis+easyUI整合优化篇（三）代码测试](http://www.cnblogs.com/han-1034683568/p/6642306.html)\n- [Spring+SpringMVC+MyBatis+easyUI整合优化篇（四）单元测试实例](http://www.cnblogs.com/han-1034683568/p/6649077.html)\n- [Spring+SpringMVC+MyBatis+easyUI整合优化篇（五）结合MockMvc进行服务端的单元测试](http://www.cnblogs.com/han-1034683568/p/6653620.html)\n- [Spring+SpringMVC+MyBatis+easyUI整合优化篇（六）easyUI与富文本编辑器UEditor整合](http://www.cnblogs.com/han-1034683568/p/6664660.html)\n- [Spring+SpringMVC+MyBatis+easyUI整合优化篇（七）图片上传功能](http://www.cnblogs.com/han-1034683568/p/6692150.html)\n- [Spring+SpringMVC+MyBatis+easyUI整合优化篇（八）代码优化整理小记及个人吐槽](http://www.cnblogs.com/han-1034683568/p/6706158.html)\n- [Spring+SpringMVC+MyBatis+easyUI整合优化篇（九）数据层优化-jdbc连接池简述、druid简介](http://www.cnblogs.com/han-1034683568/p/6719298.html)\n- [Spring+SpringMVC+MyBatis+easyUI整合优化篇（十）数据层优化-整合druid](http://www.cnblogs.com/han-1034683568/p/6725191.html)\n- [Spring+SpringMVC+MyBatis+easyUI整合优化篇（十一）数据层优化-druid监控及慢sql记录](http://www.cnblogs.com/han-1034683568/p/6730869.html)\n- [Spring+SpringMVC+MyBatis+easyUI整合优化篇（十二）数据层优化-explain关键字及慢sql优化](http://www.cnblogs.com/han-1034683568/p/6758578.html)\n- [Spring+SpringMVC+MyBatis+easyUI整合优化篇（十三）数据层优化-表规范、索引优化](http://www.cnblogs.com/han-1034683568/p/6768807.html)\n- [Spring+SpringMVC+MyBatis+easyUI整合优化篇（十四）谈谈写博客的原因和项目优化](http://www.cnblogs.com/han-1034683568/p/6782019.html)\n\n<h2 id=\"ssm1\">SSM整合基础篇</h2>\n\n- [Spring+SpringMVC+MyBatis+easyUI整合基础篇（一）项目简述及技术选型介绍](http://www.cnblogs.com/han-1034683568/p/6440090.html)\n- [Spring+SpringMVC+MyBatis+easyUI整合基础篇（二）牛刀小试](http://www.cnblogs.com/han-1034683568/p/6440157.html)\n- [Spring+SpringMVC+MyBatis+easyUI整合基础篇（三）搭建步骤](http://www.cnblogs.com/han-1034683568/p/6476827.html)\n- [Spring+SpringMVC+MyBatis+easyUI整合基础篇（四）代码简化](http://www.cnblogs.com/han-1034683568/p/6476852.html)\n- [Spring+SpringMVC+MyBatis+easyUI整合基础篇（五）讲一下maven](http://www.cnblogs.com/han-1034683568/p/6486117.html)\n- [Maven构建项目速度太慢的解决办法](http://www.cnblogs.com/han-1034683568/p/6498637.html)\n- [Spring+SpringMVC+MyBatis+easyUI整合基础篇（六）maven整合SSM](http://www.cnblogs.com/han-1034683568/p/6507186.html)\n- [Spring+SpringMVC+MyBatis+easyUI整合基础篇（七）JDBC url的连接参数](http://www.cnblogs.com/han-1034683568/p/6512215.html)\n- [Spring+SpringMVC+MyBatis+easyUI整合基础篇（八）mysql中文查询bug修复](http://www.cnblogs.com/han-1034683568/p/6517344.html)\n- [Spring+SpringMVC+MyBatis+easyUI整合基础篇（九）版本控制](http://www.cnblogs.com/han-1034683568/p/6540079.html)\n- [Spring+SpringMVC+MyBatis+easyUI整合基础篇（十）SVN搭建](http://www.cnblogs.com/han-1034683568/p/6545751.html)\n- [Spring+SpringMVC+MyBatis+easyUI整合基础篇（十一）SVN服务器进阶](http://www.cnblogs.com/han-1034683568/p/6551498.html)\n- [Spring+SpringMVC+MyBatis+easyUI整合基础篇（十二）阶段总结](http://www.cnblogs.com/han-1034683568/p/6562092.html)', 24, '日常随笔', '目录', 1, 16, 0, 1, '2019-04-24 15:42:23', '2019-04-24 15:42:23');
INSERT INTO `tb_blog` VALUES (3, 'Spring+SpringMVC+MyBatis整合系列(easyUI、AdminLte3)', '', '/admin/dist/img/rand/36.jpg', '## 实战篇（付费教程）\n\n- [SSM 搭建精美实用的管理系统](http://gitbook.cn/m/mazi/comp/column?columnId=5b4dae389bcda53d07056bc9&sceneId=22778a708b0f11e8974b497483da0812)\n- [导读：自己动手实现 JavaWeb 后台管理系统](https://gitbook.cn/gitchat/column/5b4dae389bcda53d07056bc9/topic/5b4db47e9bcda53d07056f5f)\n- [第01课：Spring MVC+ Spring + Mybatis “三大框架”介绍](https://gitbook.cn/gitchat/column/5b4dae389bcda53d07056bc9/topic/5b4db5b89bcda53d070590de)\n- [第02课：前期准备工作及基础环境搭建](https://gitbook.cn/gitchat/column/5b4dae389bcda53d07056bc9/topic/5b4eb8e701d18a561f341b72)\n- [第03课：三大框架的整合](https://gitbook.cn/gitchat/column/5b4dae389bcda53d07056bc9/topic/5b4ee11c01d18a561f342c0f)\n- [第04课：Tomcat 8 安装部署及功能改造](https://gitbook.cn/gitchat/column/5b4dae389bcda53d07056bc9/topic/5b4f1335dbb1436093a6ca17)\n- [第05课：产品设计之搭建精美实用的后台管理系统](https://gitbook.cn/gitchat/column/5b4dae389bcda53d07056bc9/topic/5b4f1b35dbb1436093a6cc7a)\n- [第06课：前端选型 AdminLTE3](https://gitbook.cn/gitchat/column/5b4dae389bcda53d07056bc9/topic/5b4f1b70dbb1436093a6cc87)\n- [第07课：登录模块的系统设计和实现](https://gitbook.cn/gitchat/column/5b4dae389bcda53d07056bc9/topic/5b4f1b80dbb1436093a6cc8e)\n- [第08课：使用 JqGrid 插件实现分页功能](https://gitbook.cn/gitchat/column/5b4dae389bcda53d07056bc9/topic/5b4f1b92dbb1436093a6cc93)\n- [第09课：弹框组件整合——完善添加和修改功能](https://gitbook.cn/gitchat/column/5b4dae389bcda53d07056bc9/topic/5b4f1bbddbb1436093a6cc9b)\n- [第10课：图片管理模块](https://gitbook.cn/gitchat/column/5b4dae389bcda53d07056bc9/topic/5b4f1bd0dbb1436093a6cca1)\n- [第11课：多图上传与大文件分片上传、断点续传](https://gitbook.cn/gitchat/column/5b4dae389bcda53d07056bc9/topic/5b4f1bdedbb1436093a6cca2)\n- [第12课：文件导入导出功能](https://gitbook.cn/gitchat/column/5b4dae389bcda53d07056bc9/topic/5b4f1beddbb1436093a6cca8)\n- [第13课：富文本信息管理模块](https://gitbook.cn/gitchat/column/5b4dae389bcda53d07056bc9/topic/5b4f1c00dbb1436093a6ccae)\n- [第14课：SweetAlert 插件整合及搜索功能实现](https://gitbook.cn/gitchat/column/5b4dae389bcda53d07056bc9/topic/5b4f1c11dbb1436093a6ccb1)\n- [第15课：项目发布——Linux 命令及发布流程](https://gitbook.cn/gitchat/column/5b4dae389bcda53d07056bc9/topic/5b4f1c21dbb1436093a6ccb6)\n- [第16课：项目优化篇之日志输出](https://gitbook.cn/gitchat/column/5b4dae389bcda53d07056bc9/topic/5b4f1c30dbb1436093a6ccbb)\n- [第17课：项目优化之单元测试](https://gitbook.cn/gitchat/column/5b4dae389bcda53d07056bc9/topic/5b4f1c3fdbb1436093a6ccc1)\n- [第18课：项目优化之数据库连接池](https://gitbook.cn/gitchat/column/5b4dae389bcda53d07056bc9/topic/5b4f1c50dbb1436093a6ccca)\n- [第19课：项目优化之 Druid 整合](https://gitbook.cn/gitchat/column/5b4dae389bcda53d07056bc9/topic/5b4f1c65dbb1436093a6cccd)\n- [第20课：项目优化之缓存整合](https://gitbook.cn/gitchat/column/5b4dae389bcda53d07056bc9/topic/5b4f1c7cdbb1436093a6ccd6)\n- [第21课：网站架构演进及 Nginx 介绍](https://gitbook.cn/gitchat/column/5b4dae389bcda53d07056bc9/topic/5b4f1c8bdbb1436093a6ccda)\n- [第22课：Nginx + Tomcat 集群搭建](https://gitbook.cn/gitchat/column/5b4dae389bcda53d07056bc9/topic/5b4f1c9ddbb1436093a6cce2)\n- [第23课：Nginx 动静分离](https://gitbook.cn/gitchat/column/5b4dae389bcda53d07056bc9/topic/5b4f1cb7dbb1436093a6cceb)\n\n## 进阶篇（免费开源）\n\n- [Spring+SpringMVC+MyBatis+easyUI整合进阶篇（一）设计一套好的RESTful API](http://www.cnblogs.com/han-1034683568/p/7196345.html)\n- [Spring+SpringMVC+MyBatis+easyUI整合进阶篇（二）RESTful API实战笔记(接口设计及Java后端实现)](http://www.cnblogs.com/han-1034683568/p/7300547.html)\n- [Spring+SpringMVC+MyBatis+easyUI整合进阶篇（三）使用ajax方法实现form表单的提交](http://www.cnblogs.com/han-1034683568/p/7199168.html)\n- [Spring+SpringMVC+MyBatis+easyUI整合进阶篇（四）RESTful实战(前端代码修改)](http://www.cnblogs.com/han-1034683568/p/7552007.html)\n- [Spring+SpringMVC+MyBatis+easyUI整合进阶篇（五）记录一下从懵懂到理解RESTful的过程](http://www.cnblogs.com/han-1034683568/p/7569870.html)\n- [Spring+SpringMVC+MyBatis+easyUI整合进阶篇（六）一定要RESTful吗？](http://www.cnblogs.com/han-1034683568/p/7663641.html)\n- [Spring+SpringMVC+MyBatis+easyUI整合进阶篇（七）一次线上Mysql数据库崩溃事故的记录](http://www.cnblogs.com/han-1034683568/p/7787659.html)\n- [Spring+SpringMVC+MyBatis+easyUI整合进阶篇（八）线上Mysql数据库崩溃事故的原因和处理](http://www.cnblogs.com/han-1034683568/p/7822237.html)\n- [Spring+SpringMVC+MyBatis+easyUI整合进阶篇（九）Linux下安装redis及redis的常用命令和操作](http://www.cnblogs.com/han-1034683568/p/7862188.html)\n- [Spring+SpringMVC+MyBatis+easyUI整合进阶篇（十）easyUI整合KindEditor详细教程](http://www.cnblogs.com/han-1034683568/p/7930542.html)\n- [Spring+SpringMVC+MyBatis+easyUI整合进阶篇（十一）redis密码设置、安全设置](http://www.cnblogs.com/han-1034683568/p/7978577.html)\n- [Spring+SpringMVC+MyBatis+easyUI整合进阶篇（十二）Spring集成Redis缓存](http://www.cnblogs.com/han-1034683568/p/7994231.html)\n- [Spring+SpringMVC+MyBatis+easyUI整合进阶篇（十三）MyBatis+MySQL返回插入的主键id](http://www.cnblogs.com/han-1034683568/p/8305122.html)\n- [Spring+SpringMVC+MyBatis+easyUI整合进阶篇（十四）Redis正确的使用姿势](http://www.cnblogs.com/han-1034683568/p/8406497.html)\n- [Spring+SpringMVC+MyBatis+easyUI整合进阶篇（十五）阶段总结](http://www.cnblogs.com/han-1034683568/p/9069008.html)\n\n\n## 优化篇（免费开源）\n\n- [Spring+SpringMVC+MyBatis+easyUI整合优化篇（一）System.out.print与Log](http://www.cnblogs.com/han-1034683568/p/6637914.html)\n- [Spring+SpringMVC+MyBatis+easyUI整合优化篇（二）Log4j讲解与整合](http://www.cnblogs.com/han-1034683568/p/6641808.html)\n- [Spring+SpringMVC+MyBatis+easyUI整合优化篇（三）代码测试](http://www.cnblogs.com/han-1034683568/p/6642306.html)\n- [Spring+SpringMVC+MyBatis+easyUI整合优化篇（四）单元测试实例](http://www.cnblogs.com/han-1034683568/p/6649077.html)\n- [Spring+SpringMVC+MyBatis+easyUI整合优化篇（五）结合MockMvc进行服务端的单元测试](http://www.cnblogs.com/han-1034683568/p/6653620.html)\n- [Spring+SpringMVC+MyBatis+easyUI整合优化篇（六）easyUI与富文本编辑器UEditor整合](http://www.cnblogs.com/han-1034683568/p/6664660.html)\n- [Spring+SpringMVC+MyBatis+easyUI整合优化篇（七）图片上传功能](http://www.cnblogs.com/han-1034683568/p/6692150.html)\n- [Spring+SpringMVC+MyBatis+easyUI整合优化篇（八）代码优化整理小记及个人吐槽](http://www.cnblogs.com/han-1034683568/p/6706158.html)\n- [Spring+SpringMVC+MyBatis+easyUI整合优化篇（九）数据层优化-jdbc连接池简述、druid简介](http://www.cnblogs.com/han-1034683568/p/6719298.html)\n- [Spring+SpringMVC+MyBatis+easyUI整合优化篇（十）数据层优化-整合druid](http://www.cnblogs.com/han-1034683568/p/6725191.html)\n- [Spring+SpringMVC+MyBatis+easyUI整合优化篇（十一）数据层优化-druid监控及慢sql记录](http://www.cnblogs.com/han-1034683568/p/6730869.html)\n- [Spring+SpringMVC+MyBatis+easyUI整合优化篇（十二）数据层优化-explain关键字及慢sql优化](http://www.cnblogs.com/han-1034683568/p/6758578.html)\n- [Spring+SpringMVC+MyBatis+easyUI整合优化篇（十三）数据层优化-表规范、索引优化](http://www.cnblogs.com/han-1034683568/p/6768807.html)\n- [Spring+SpringMVC+MyBatis+easyUI整合优化篇（十四）谈谈写博客的原因和项目优化](http://www.cnblogs.com/han-1034683568/p/6782019.html)\n\n\n## 基础篇（免费开源）\n\n- [Spring+SpringMVC+MyBatis+easyUI整合基础篇（一）项目简介](http://www.cnblogs.com/han-1034683568/p/6440090.html)\n- [Spring+SpringMVC+MyBatis+easyUI整合基础篇（二）牛刀小试](http://www.cnblogs.com/han-1034683568/p/6440157.html)\n- [Spring+SpringMVC+MyBatis+easyUI整合基础篇（三）搭建步骤](http://www.cnblogs.com/han-1034683568/p/6476827.html)\n- [Spring+SpringMVC+MyBatis+easyUI整合基础篇（四）代码简化](http://www.cnblogs.com/han-1034683568/p/6476852.html)\n- [Spring+SpringMVC+MyBatis+easyUI整合基础篇（五）讲一下maven](http://www.cnblogs.com/han-1034683568/p/6486117.html)\n- [Spring+SpringMVC+MyBatis+easyUI整合基础篇（六）maven整合SSM](http://www.cnblogs.com/han-1034683568/p/6507186.html)\n- [Spring+SpringMVC+MyBatis+easyUI整合基础篇（七）JDBC url的连接参数](http://www.cnblogs.com/han-1034683568/p/6512215.html)\n- [Spring+SpringMVC+MyBatis+easyUI整合基础篇（八）mysql中文查询bug修复](http://www.cnblogs.com/han-1034683568/p/6517344.html)\n- [Spring+SpringMVC+MyBatis+easyUI整合基础篇（九）版本控制](http://www.cnblogs.com/han-1034683568/p/6540079.html)\n- [Spring+SpringMVC+MyBatis+easyUI整合基础篇（十）SVN搭建](http://www.cnblogs.com/han-1034683568/p/6545751.html)\n- [Spring+SpringMVC+MyBatis+easyUI整合基础篇（十一）SVN服务器进阶](http://www.cnblogs.com/han-1034683568/p/6551498.html)\n- [Spring+SpringMVC+MyBatis+easyUI整合基础篇（十二）阶段总结](http://www.cnblogs.com/han-1034683568/p/6562092.html)\n\n\n推荐一下自己的达人课，感兴趣的朋友可以看一下：[SSM搭建精美实用的管理系统](http://gitbook.cn/m/mazi/comp/column?columnId=5b4dae389bcda53d07056bc9&sceneId=22778a708b0f11e8974b497483da0812)', 0, '默认分类', 'Spring,SpringMVC,MyBatis,easyUI,AdminLte3', 1, 57, 0, 1, '2019-04-24 15:46:15', '2019-04-24 15:46:15');
INSERT INTO `tb_blog` VALUES (4, 'SpringBoot系列教程', '', '/admin/dist/img/rand/29.jpg', '<h2 id=\"springboot2\">23 个实验带你轻松玩转 Spring Boot</h2>\n\n- [**开篇词：《23 个实验带你轻松玩转 Spring Boot》导读**](https://www.shiyanlou.com/courses/1274)\n- [第02课：Spring Boot 项目开发环境搭建](https://www.shiyanlou.com/courses/1274)\n- [第03课：快速构建 Spring Boot 应用](https://www.shiyanlou.com/courses/1274)\n- [第04课：Spring Boot 基础功能开发](https://www.shiyanlou.com/courses/1274)\n- [第05课：Spring Boot 项目开发之 web 项目开发讲解](https://www.shiyanlou.com/courses/1274)\n- [第06课：Spring Boot 整合 JSP 开发 web 项目](https://www.shiyanlou.com/courses/1274)\n- [第07课：模板引擎介绍及 Spring Boot 整合 Thymeleaf](https://www.shiyanlou.com/courses/1274)\n- [第08课：Thymeleaf 语法详解](https://www.shiyanlou.com/courses/1274)\n- [第09课：FreeMarker 模板引擎整合使用教程](https://www.shiyanlou.com/courses/1274)\n- [第10课：Spring Boot 处理文件上传及路径回显](https://www.shiyanlou.com/courses/1274)\n- [第11课：Spring Boot 自动配置数据源及操作数据库](https://www.shiyanlou.com/courses/1274)\n- [第12课：Spring Boot 整合 Druid 数据源](https://www.shiyanlou.com/courses/1274)\n- [第13课：Spring Boot 整合 MyBatis 操作数据库](https://www.shiyanlou.com/courses/1274)\n- [第14课：Spring Boot 中的事务处理](https://www.shiyanlou.com/courses/1274)\n- [第15课：Spring Boot 整合 Redis 操作缓存模块](https://www.shiyanlou.com/courses/1274)\n- [第16课：Spring Boot 项目开发之实现定时任务](https://www.shiyanlou.com/courses/1274)\n- [第17课：Spring Boot 自定义错误页面](https://www.shiyanlou.com/courses/1274)\n- [第18课：Spring Boot 集成 Swagger 生成接口文档](https://www.shiyanlou.com/courses/1274)\n- [第19课：Spring Boot 项目打包部署介绍](https://www.shiyanlou.com/courses/1274)\n- [第20课：Spring Boot Admin 介绍及整合使用](https://www.shiyanlou.com/courses/1274)\n- [第21课：Spring Boot 资讯管理信息系统开发实战(一)](https://www.shiyanlou.com/courses/1274)\n- [第22课：Spring Boot 资讯管理信息系统开发实战(二)](https://www.shiyanlou.com/courses/1274)\n- [第23课：Spring Boot 资讯管理信息系统开发实战(三)](https://www.shiyanlou.com/courses/1274)\n- [第24课：Spring Boot 资讯管理信息系统开发实战(四)](https://www.shiyanlou.com/courses/1274)\n\n<h2 id=\"springboot1\">Spring Boot 入门及前后端分离项目实践</h2>\n\n* [开篇词：SpringBoot入门及前后端分离项目实践导读](https://www.shiyanlou.com/courses/1244)\n* [第02课：快速认识 Spring Boot 技术栈](https://www.shiyanlou.com/courses/1244)\n* [第03课：开发环境搭建](https://www.shiyanlou.com/courses/1244)\n* [第04课：快速构建 Spring Boot 应用](https://www.shiyanlou.com/courses/1244)\n* [第05课：Spring Boot 之基础 web 功能开发](https://www.shiyanlou.com/courses/1244)\n* [第06课：Spring Boot 之数据库连接操作](https://www.shiyanlou.com/courses/1244)\n* [第07课：Spring Boot 整合 MyBatis 操作数据库](https://www.shiyanlou.com/courses/1244)\n* [第08课：Spring Boot 处理文件上传及路径回显](https://www.shiyanlou.com/courses/1244)\n* [第09课：Spring Boot 项目实践之前后端分离详解](https://www.shiyanlou.com/courses/1244)\n* [第10课：Spring Boot 项目实践之 API 设计](https://www.shiyanlou.com/courses/1244)\n* [第11课：Spring Boot 项目实践之登录模块实现](https://www.shiyanlou.com/courses/1244)\n* [第12课：Spring Boot 项目实践之分页功能实现](https://www.shiyanlou.com/courses/1244)\n* [第13课：Spring Boot 项目实践之jqgrid分页整合](https://www.shiyanlou.com/courses/1244)\n* [第14课：Spring Boot 项目实践之编辑功能实现](https://www.shiyanlou.com/courses/1244)\n* [第15课：Spring Boot 项目实践之用户管理模块实现](https://www.shiyanlou.com/courses/1244)\n* [第16课：Spring Boot 项目实践之图片管理模块](https://www.shiyanlou.com/courses/1244)\n* [第17课：Spring Boot 项目实践之富文本编辑器介绍及整合](https://www.shiyanlou.com/courses/1244)\n* [第18课：Spring Boot 项目实践之信息管理模块实现](https://www.shiyanlou.com/courses/1244)', 24, '日常随笔', 'SpringBoot,入门教程,实战教程,spring-boot企业级开发', 1, 12, 0, 1, '2019-05-13 09:58:54', '2019-05-13 09:58:54');
INSERT INTO `tb_blog` VALUES (5, 'springcloud总结', '', 'http://localhost:28083/admin/dist/img/rand/29.jpg', '# 版本选择\nspring-boot 2.6.13\nspring-cloud 2021.0.5\nspring-Alibaba 2021.0.4\n# 学习总结\n1. 完整微服务项目，首先需要maven父工程，pom文件中depedencyManagent为了统计各个jar包的版本号\n2. 通用模块，包括一些常用的工具包、entity对象等\n3. 注册中心(需要在主启动类增加服务发现注解@EnableDiscoveryClient)\n	C指强一致性，A值可用性，P指分区容错性\n	(1) eureka:AP模式，服务中心主启动类加@EnableEurekaServer,客户端		增加@EnableEurekaClient\n	(2) zookeeper：CP模式，\n	(3) consul：CP模式\n	(4) nacos：jar包启动，可以作为注册中心和配置中心\n4. 服务调用\n	openfeign：在主启动类增加@EnableFeignClients，在具体Service上加@FeignClient(value = \"服务名称\")\n5. 网关gateway\n	gateway:配置路由映射\n6. 总线\n	Rabbitmq: 当配置中心内容修该时，通知所有绑定的服务进行刷新,发送post请求\n7. 服务降级与服务熔端\n	Htstrix：可以在被调用模块的具体Service方法上增加@HystrixCommand，主启动类增加@EnableHystrix\n		也可以在调用者端controller配置回调方法以及降级配置\n	Sentlnel:jar包开启，可以sentinel dashboard可视化增加规则，流控、熔断等\n8. 分布式事务\n	seata:jar包开启并配置file.conf或者application.yml，和配置registry，service层需要增加@GlobalTransactional注解开启全局事务，统一提交与回滚;\n	包含三个模块:\n		TC:事务协调器，负责协调并驱动全局事务的提交与回滚\n		TM:负责开启全局事务，并最终发起全局提交或回滚的决议\n		RM:控制分支事务\n	处理过程:\n		TM 向 TC 申请开启一个全局事务，全局事务创建成功并生成一个全局唯一的 XID；\n		XID 在微服务调用链路的上下文中传播；\n		RM 向 TC 注册分支事务，将其纳入 XID 对应全局事务的管辖；\n		TM 向 TC 发起针对 XID 的全局提交或回滚决议；\n		TC 调度 XID 下管辖的全部分支事务完成提交或回滚请求。', 28, '回顾总结', 'springcloud', 1, 2, 0, 0, '2023-02-17 19:02:18', '2023-02-17 19:02:18');

-- ----------------------------
-- Table structure for tb_blog_category
-- ----------------------------
DROP TABLE IF EXISTS `tb_blog_category`;
CREATE TABLE `tb_blog_category`  (
  `category_id` int(0) NOT NULL AUTO_INCREMENT COMMENT '分类表主键',
  `category_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分类的名称',
  `category_icon` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分类的图标',
  `category_rank` int(0) NOT NULL DEFAULT 1 COMMENT '分类的排序值 被使用的越多数值越大',
  `is_deleted` tinyint(0) NOT NULL DEFAULT 0 COMMENT '是否删除 0=否 1=是',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`category_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_blog_category
-- ----------------------------
INSERT INTO `tb_blog_category` VALUES (20, 'About', '/admin/dist/img/category/10.png', 8, 1, '2018-11-12 00:28:49');
INSERT INTO `tb_blog_category` VALUES (22, 'SSM整合进阶篇', '/admin/dist/img/category/02.png', 19, 1, '2018-11-12 10:42:25');
INSERT INTO `tb_blog_category` VALUES (24, '日常随笔', '/admin/dist/img/category/06.png', 23, 0, '2018-11-12 10:43:21');
INSERT INTO `tb_blog_category` VALUES (25, 'java', '/admin/dist/img/category/02.png', 1, 0, '2023-02-17 18:45:25');
INSERT INTO `tb_blog_category` VALUES (26, '阅读心得', '/admin/dist/img/category/18.png', 1, 0, '2023-02-17 18:48:11');
INSERT INTO `tb_blog_category` VALUES (27, '自我管理', '/admin/dist/img/category/00.png', 1, 0, '2023-02-17 18:48:38');
INSERT INTO `tb_blog_category` VALUES (28, '回顾总结', '/admin/dist/img/category/09.png', 2, 0, '2023-02-17 18:48:50');

-- ----------------------------
-- Table structure for tb_blog_comment
-- ----------------------------
DROP TABLE IF EXISTS `tb_blog_comment`;
CREATE TABLE `tb_blog_comment`  (
  `comment_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `blog_id` bigint(0) NOT NULL DEFAULT 0 COMMENT '关联的blog主键',
  `commentator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '评论者名称',
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '评论人的邮箱',
  `website_url` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '网址',
  `comment_body` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '评论内容',
  `comment_create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '评论提交时间',
  `commentator_ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '评论时的ip地址',
  `reply_body` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '回复内容',
  `reply_create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '回复时间',
  `comment_status` tinyint(0) NOT NULL DEFAULT 0 COMMENT '是否审核通过 0-未审核 1-审核通过',
  `is_deleted` tinyint(0) NULL DEFAULT 0 COMMENT '是否删除 0-未删除 1-已删除',
  PRIMARY KEY (`comment_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_blog_comment
-- ----------------------------
INSERT INTO `tb_blog_comment` VALUES (26, 4, '十三', '224683568@qq.com', '', '第一条评论', '2019-05-13 10:12:19', '', '', '2019-05-12 21:13:31', 1, 1);

-- ----------------------------
-- Table structure for tb_blog_tag
-- ----------------------------
DROP TABLE IF EXISTS `tb_blog_tag`;
CREATE TABLE `tb_blog_tag`  (
  `tag_id` int(0) NOT NULL AUTO_INCREMENT COMMENT '标签表主键id',
  `tag_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标签名称',
  `is_deleted` tinyint(0) NOT NULL DEFAULT 0 COMMENT '是否删除 0=否 1=是',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`tag_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 134 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_blog_tag
-- ----------------------------
INSERT INTO `tb_blog_tag` VALUES (57, '世界上有一个很可爱的人', 0, '2018-11-12 00:31:15');
INSERT INTO `tb_blog_tag` VALUES (58, '现在这个人就在看这句话', 0, '2018-11-12 00:31:15');
INSERT INTO `tb_blog_tag` VALUES (66, 'Spring', 0, '2018-11-12 10:55:14');
INSERT INTO `tb_blog_tag` VALUES (67, 'SpringMVC', 0, '2018-11-12 10:55:14');
INSERT INTO `tb_blog_tag` VALUES (68, 'MyBatis', 0, '2018-11-12 10:55:14');
INSERT INTO `tb_blog_tag` VALUES (69, 'easyUI', 0, '2018-11-12 10:55:14');
INSERT INTO `tb_blog_tag` VALUES (127, '目录', 0, '2019-04-24 15:41:39');
INSERT INTO `tb_blog_tag` VALUES (128, 'AdminLte3', 0, '2019-04-24 15:46:16');
INSERT INTO `tb_blog_tag` VALUES (130, 'SpringBoot', 0, '2019-05-13 09:58:54');
INSERT INTO `tb_blog_tag` VALUES (131, '入门教程', 0, '2019-05-13 09:58:54');
INSERT INTO `tb_blog_tag` VALUES (132, '实战教程', 0, '2019-05-13 09:58:54');
INSERT INTO `tb_blog_tag` VALUES (133, 'spring-boot企业级开发', 0, '2019-05-13 09:58:54');
INSERT INTO `tb_blog_tag` VALUES (134, 'mysql', 0, '2023-02-17 18:49:45');
INSERT INTO `tb_blog_tag` VALUES (135, '面试', 0, '2023-02-17 18:49:55');
INSERT INTO `tb_blog_tag` VALUES (136, 'redis', 0, '2023-02-17 18:50:02');
INSERT INTO `tb_blog_tag` VALUES (137, '微服务', 0, '2023-02-17 18:50:11');
INSERT INTO `tb_blog_tag` VALUES (138, 'springcloud', 0, '2023-02-17 19:02:18');

-- ----------------------------
-- Table structure for tb_blog_tag_relation
-- ----------------------------
DROP TABLE IF EXISTS `tb_blog_tag_relation`;
CREATE TABLE `tb_blog_tag_relation`  (
  `relation_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '关系表id',
  `blog_id` bigint(0) NOT NULL COMMENT '博客id',
  `tag_id` int(0) NOT NULL COMMENT '标签id',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`relation_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 279 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_blog_tag_relation
-- ----------------------------
INSERT INTO `tb_blog_tag_relation` VALUES (266, 1, 57, '2019-05-13 09:45:42');
INSERT INTO `tb_blog_tag_relation` VALUES (267, 1, 58, '2019-05-13 09:45:42');
INSERT INTO `tb_blog_tag_relation` VALUES (269, 2, 127, '2019-05-13 09:56:49');
INSERT INTO `tb_blog_tag_relation` VALUES (270, 4, 130, '2019-05-13 09:58:54');
INSERT INTO `tb_blog_tag_relation` VALUES (271, 4, 131, '2019-05-13 09:58:54');
INSERT INTO `tb_blog_tag_relation` VALUES (272, 4, 132, '2019-05-13 09:58:54');
INSERT INTO `tb_blog_tag_relation` VALUES (273, 4, 133, '2019-05-13 09:58:54');
INSERT INTO `tb_blog_tag_relation` VALUES (274, 3, 66, '2019-05-13 10:07:27');
INSERT INTO `tb_blog_tag_relation` VALUES (275, 3, 67, '2019-05-13 10:07:27');
INSERT INTO `tb_blog_tag_relation` VALUES (276, 3, 68, '2019-05-13 10:07:27');
INSERT INTO `tb_blog_tag_relation` VALUES (277, 3, 69, '2019-05-13 10:07:27');
INSERT INTO `tb_blog_tag_relation` VALUES (278, 3, 128, '2019-05-13 10:07:27');
INSERT INTO `tb_blog_tag_relation` VALUES (280, 5, 138, '2023-02-17 19:02:32');

-- ----------------------------
-- Table structure for tb_config
-- ----------------------------
DROP TABLE IF EXISTS `tb_config`;
CREATE TABLE `tb_config`  (
  `config_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '配置项的名称',
  `config_value` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '配置项的值',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`config_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_config
-- ----------------------------
INSERT INTO `tb_config` VALUES ('footerAbout', 'zs personal blog.welcome!', '2018-11-11 20:33:23', '2023-02-17 10:53:36');
INSERT INTO `tb_config` VALUES ('footerCopyRight', '2021 zs', '2018-11-11 20:33:31', '2023-02-17 10:53:36');
INSERT INTO `tb_config` VALUES ('footerICP', '982162304@qq.com', '2018-11-11 20:33:27', '2023-02-17 10:53:36');
INSERT INTO `tb_config` VALUES ('footerPoweredBy', 'https://github.com/ShuaiZheng1219', '2018-11-11 20:33:36', '2023-02-17 10:53:36');
INSERT INTO `tb_config` VALUES ('footerPoweredByURL', 'https://github.com/ShuaiZheng1219', '2018-11-11 20:33:39', '2023-02-17 10:53:36');
INSERT INTO `tb_config` VALUES ('websiteDescription', 'zs_blog是SpringBoot2+Thymeleaf+Mybatis建造的个人博客网站.SpringBoot实战博客源码.个人博客搭建', '2018-11-11 20:33:04', '2023-02-17 10:51:29');
INSERT INTO `tb_config` VALUES ('websiteIcon', '/admin/dist/img/favicon.png', '2018-11-11 20:33:11', '2023-02-17 10:51:29');
INSERT INTO `tb_config` VALUES ('websiteLogo', '/admin/dist/img/logo2.png', '2018-11-11 20:33:08', '2023-02-17 10:51:29');
INSERT INTO `tb_config` VALUES ('websiteName', 'zs_blog', '2018-11-11 20:33:01', '2023-02-17 10:51:29');
INSERT INTO `tb_config` VALUES ('yourAvatar', '/admin/dist/img/13.png', '2018-11-11 20:33:14', '2023-02-17 10:51:41');
INSERT INTO `tb_config` VALUES ('yourEmail', 'zs19981219@163.com', '2018-11-11 20:33:17', '2023-02-17 10:51:41');
INSERT INTO `tb_config` VALUES ('yourName', 'zs', '2018-11-11 20:33:20', '2023-02-17 10:51:41');

-- ----------------------------
-- Table structure for tb_link
-- ----------------------------
DROP TABLE IF EXISTS `tb_link`;
CREATE TABLE `tb_link`  (
  `link_id` int(0) NOT NULL AUTO_INCREMENT COMMENT '友链表主键id',
  `link_type` tinyint(0) NOT NULL DEFAULT 0 COMMENT '友链类别 0-友链 1-推荐 2-个人网站',
  `link_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '网站名称',
  `link_url` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '网站链接',
  `link_description` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '网站描述',
  `link_rank` int(0) NOT NULL DEFAULT 0 COMMENT '用于列表排序',
  `is_deleted` tinyint(0) NOT NULL DEFAULT 0 COMMENT '是否删除 0-未删除 1-已删除',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`link_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_link
-- ----------------------------
INSERT INTO `tb_link` VALUES (1, 0, 'tqr', 'rqwe', 'rqw', 0, 1, '2018-10-22 18:57:52');
INSERT INTO `tb_link` VALUES (2, 2, '十三的GitHub', 'https://github.com/ZHENFENG13', '十三分享代码的地方', 1, 1, '2018-10-22 19:41:04');
INSERT INTO `tb_link` VALUES (3, 2, '十三的博客', 'http://13blog.site', '个人独立博客13blog', 14, 1, '2018-10-22 19:53:34');
INSERT INTO `tb_link` VALUES (4, 1, 'CSDN 图文课', 'https://gitchat.csdn.net', 'IT优质内容平台', 6, 1, '2018-10-22 19:55:55');
INSERT INTO `tb_link` VALUES (5, 2, '十三的博客园', 'https://www.cnblogs.com/han-1034683568', '最开始写博客的地方', 17, 1, '2018-10-22 19:56:14');
INSERT INTO `tb_link` VALUES (6, 1, 'CSDN', 'https://www.csdn.net/', 'CSDN-专业IT技术社区官网', 4, 1, '2018-10-22 19:56:47');
INSERT INTO `tb_link` VALUES (7, 0, '梁桂钊的博客', 'http://blog.720ui.com', '后端攻城狮', 1, 1, '2018-10-22 20:01:38');
INSERT INTO `tb_link` VALUES (8, 0, '猿天地', 'http://cxytiandi.com', '一个综合性的网站,以程序猿用户为主,提供各种开发相关的内容', 12, 1, '2018-10-22 20:02:41');
INSERT INTO `tb_link` VALUES (9, 0, 'Giraffe Home', 'https://yemengying.com/', 'Giraffe Home', 0, 1, '2018-10-22 20:27:04');
INSERT INTO `tb_link` VALUES (10, 0, '纯洁的微笑', 'http://www.ityouknow.com', '分享技术，分享生活', 3, 1, '2018-10-22 20:27:16');
INSERT INTO `tb_link` VALUES (11, 0, 'afsdf', 'http://localhost:28080/admin/links', 'fad', 0, 1, '2018-10-22 20:27:26');
INSERT INTO `tb_link` VALUES (12, 1, 'afsdf', 'http://localhost', 'fad1', 0, 1, '2018-10-24 14:04:18');
INSERT INTO `tb_link` VALUES (13, 0, '郭赵晖', 'http://guozh.net/', '老郭三分地', 0, 1, '2019-04-24 15:30:19');
INSERT INTO `tb_link` VALUES (14, 0, 'dalaoyang', 'https://www.dalaoyang.cn/', 'dalaoyang', 0, 1, '2019-04-24 15:31:50');
INSERT INTO `tb_link` VALUES (15, 0, 'mushblog', 'https://www.sansani.cn', '穆世明博客', 0, 1, '2019-04-24 15:32:19');
INSERT INTO `tb_link` VALUES (16, 1, '实验楼', 'https://www.shiyanlou.com/', '一家专注于IT技术的在线实训平台', 17, 1, '2019-04-24 16:03:48');
INSERT INTO `tb_link` VALUES (17, 2, '《SSM 搭建精美实用的管理系统》', 'https://gitbook.cn/gitchat/column/5b4dae389bcda53d07056bc9', 'Spring+SpringMVC+MyBatis实战课程', 18, 1, '2019-04-24 16:06:52');
INSERT INTO `tb_link` VALUES (18, 2, '《Spring Boot 入门及前后端分离项目实践》', 'https://www.shiyanlou.com/courses/1244', 'SpringBoot实战课程', 19, 1, '2019-04-24 16:07:27');
INSERT INTO `tb_link` VALUES (19, 2, '《玩转Spring Boot 系列》', 'https://www.shiyanlou.com/courses/1274', 'SpringBoot实战课程', 20, 1, '2019-04-24 16:10:30');

-- ----------------------------
-- Table structure for tb_test
-- ----------------------------
DROP TABLE IF EXISTS `tb_test`;
CREATE TABLE `tb_test`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `test_info` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '测试内容',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_test
-- ----------------------------
INSERT INTO `tb_test` VALUES (1, 'SpringBoot-MyBatis测试');

SET FOREIGN_KEY_CHECKS = 1;
