-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 2018-10-18 17:36:42
-- 服务器版本： 10.1.13-MariaDB
-- PHP Version: 5.6.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `aimonitor`
--

-- --------------------------------------------------------

--
-- 表的结构 `dili_admins`
--

CREATE TABLE `dili_admins` (
  `uid` int(10) UNSIGNED NOT NULL,
  `username` varchar(16) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(10) NOT NULL,
  `email` varchar(100) NOT NULL,
  `role` smallint(5) UNSIGNED DEFAULT NULL,
  `status` tinyint(1) UNSIGNED DEFAULT '1' COMMENT '1=正常，2=冻结'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `dili_admins`
--

INSERT INTO `dili_admins` (`uid`, `username`, `password`, `salt`, `email`, `role`, `status`) VALUES
(1, 'admin', 'affe16ba3fb34913f88eaa1d7258d5a6cf32bf36', '24d8ffa015', 'hello@dilicms.com', 1, 1),
(2, 'wang', '4ab5c7d79fbdd0e22e263bd75593fa12af78e592', '2962058b12', 'wang@hanhouai.com', 2, 1);

-- --------------------------------------------------------

--
-- 表的结构 `dili_attachments`
--

CREATE TABLE `dili_attachments` (
  `aid` int(10) NOT NULL,
  `uid` smallint(10) NOT NULL DEFAULT '0',
  `model` mediumint(10) DEFAULT '0',
  `from` tinyint(1) DEFAULT '0' COMMENT '0:content model,1:cate model',
  `content` int(10) DEFAULT '0',
  `name` varchar(30) DEFAULT NULL,
  `folder` varchar(15) DEFAULT NULL,
  `realname` varchar(50) DEFAULT NULL,
  `type` varchar(10) DEFAULT NULL,
  `image` tinyint(1) DEFAULT '0',
  `posttime` int(11) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `dili_backend_settings`
--

CREATE TABLE `dili_backend_settings` (
  `id` int(11) NOT NULL,
  `backend_theme` varchar(15) DEFAULT NULL,
  `backend_lang` varchar(10) DEFAULT NULL,
  `backend_root_access` tinyint(1) UNSIGNED DEFAULT '1',
  `backend_access_point` varchar(20) DEFAULT 'admin',
  `backend_title` varchar(100) DEFAULT 'DiliCMS后台管理',
  `backend_logo` varchar(100) DEFAULT 'images/logo.gif',
  `plugin_dev_mode` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `backend_http_auth_on` tinyint(1) DEFAULT '0',
  `backend_http_auth_user` varchar(40) DEFAULT NULL,
  `backend_http_auth_password` varchar(40) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `dili_backend_settings`
--

INSERT INTO `dili_backend_settings` (`id`, `backend_theme`, `backend_lang`, `backend_root_access`, `backend_access_point`, `backend_title`, `backend_logo`, `plugin_dev_mode`, `backend_http_auth_on`, `backend_http_auth_user`, `backend_http_auth_password`) VALUES
(1, 'default', 'zh-cn', 1, '', '智能在线监测系统', 'images/AIMonitor_Logo_1.png', 0, 0, '', '');

-- --------------------------------------------------------

--
-- 表的结构 `dili_cate_fields`
--

CREATE TABLE `dili_cate_fields` (
  `id` mediumint(10) UNSIGNED NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `description` varchar(40) DEFAULT NULL,
  `model` smallint(10) UNSIGNED DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `length` smallint(10) UNSIGNED DEFAULT NULL,
  `values` tinytext,
  `width` smallint(10) DEFAULT NULL,
  `height` smallint(10) DEFAULT NULL,
  `rules` tinytext,
  `ruledescription` tinytext,
  `searchable` tinyint(1) UNSIGNED DEFAULT NULL,
  `listable` tinyint(1) UNSIGNED DEFAULT NULL,
  `order` int(5) UNSIGNED DEFAULT NULL,
  `editable` tinyint(1) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `dili_cate_fields`
--

INSERT INTO `dili_cate_fields` (`id`, `name`, `description`, `model`, `type`, `length`, `values`, `width`, `height`, `rules`, `ruledescription`, `searchable`, `listable`, `order`, `editable`) VALUES
(1, 'category_name', '分类名', 1, 'input', 10, '', 0, 0, 'required', '', 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- 表的结构 `dili_cate_models`
--

CREATE TABLE `dili_cate_models` (
  `id` mediumint(10) NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(40) NOT NULL,
  `perpage` varchar(2) NOT NULL,
  `level` tinyint(2) UNSIGNED NOT NULL DEFAULT '1',
  `hasattach` tinyint(1) NOT NULL DEFAULT '0',
  `built_in` tinyint(1) DEFAULT '0',
  `auto_update` tinyint(1) DEFAULT '0',
  `thumb_preferences` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `dili_cate_models`
--

INSERT INTO `dili_cate_models` (`id`, `name`, `description`, `perpage`, `level`, `hasattach`, `built_in`, `auto_update`, `thumb_preferences`) VALUES
(1, 'category', '文章分类', '6', 1, 0, 0, 0, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `dili_fieldtypes`
--

CREATE TABLE `dili_fieldtypes` (
  `k` varchar(20) NOT NULL,
  `v` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `dili_fieldtypes`
--

INSERT INTO `dili_fieldtypes` (`k`, `v`) VALUES
('int', '整形(INT)'),
('float', '浮点型(FLOAT)'),
('input', '单行文本框(VARCHAR)'),
('textarea', '文本区域(VARCHAR)'),
('select', '下拉菜单(VARCHAR)'),
('select_from_model', '下拉菜单(模型数据)(INT)'),
('linked_menu', '联动下拉菜单(VARCHAR)'),
('radio', '单选按钮(VARCHAR)'),
('radio_from_model', '单选按钮(模型数据)(INT)'),
('checkbox', '复选框(VARCHAR)'),
('checkbox_from_model', '复选框(模型数据)(VARCHAR)'),
('wysiwyg', '编辑器(TEXT)'),
('wysiwyg_basic', '编辑器(简)(TEXT)'),
('datetime', '日期时间(VARCHAR)'),
('content', '内容模型调用(INT)');

-- --------------------------------------------------------

--
-- 表的结构 `dili_menus`
--

CREATE TABLE `dili_menus` (
  `menu_id` tinyint(10) UNSIGNED NOT NULL,
  `class_name` varchar(20) NOT NULL,
  `method_name` varchar(30) NOT NULL,
  `menu_name` varchar(20) NOT NULL,
  `menu_level` tinyint(2) UNSIGNED DEFAULT '0',
  `menu_parent` tinyint(10) UNSIGNED DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `dili_menus`
--

INSERT INTO `dili_menus` (`menu_id`, `class_name`, `method_name`, `menu_name`, `menu_level`, `menu_parent`) VALUES
(1, 'system', 'home', '系统', 0, 0),
(2, 'system', 'home', '后台首页', 1, 1),
(3, 'system', 'home', '后台首页', 2, 2),
(4, 'setting', 'site', '系统设置', 1, 1),
(5, 'setting', 'site', '站点设置', 2, 4),
(6, 'setting', 'backend', '后台设置', 2, 4),
(7, 'system', 'password', '修改密码', 2, 4),
(8, 'system', 'cache', '更新缓存', 2, 4),
(9, 'model', 'view', '模型管理', 1, 1),
(10, 'model', 'view', '内容模型管理', 2, 9),
(11, 'category', 'view', '分类模型管理', 2, 9),
(12, 'plugin', 'view', '扩展管理', 1, 1),
(13, 'plugin', 'view', '插件管理', 2, 12),
(14, 'role', 'view', '权限管理', 1, 1),
(15, 'role', 'view', '用户组管理', 2, 14),
(16, 'user', 'view', '用户管理', 2, 14),
(17, 'content', 'view', '内容管理', 0, 0),
(18, 'content', 'view', '内容管理', 1, 17),
(19, 'category_content', 'view', '分类管理', 1, 17),
(20, 'module', 'run', '插件', 0, 0),
(21, 'database', 'index', '数据库管理', 1, 1),
(22, 'database', 'index', '数据库备份', 2, 21),
(23, 'database', 'recover', '数据库还原', 2, 21),
(24, 'database', 'optimize', '数据库优化', 2, 21),
(25, 'youyan', 'index', '油烟监测', 0, 0),
(26, 'yangchen', 'index', '扬尘监测', 0, 0),
(27, 'water', 'index', '水监测', 0, 0),
(28, 'youyan', 'all_data', '数据', 1, 25),
(29, 'youyan', 'all_device', '设备', 1, 25),
(30, 'yangchen', 'all_data', '数据', 1, 26),
(31, 'yangchen', 'all_device', '设备', 1, 26),
(32, 'youyan', 'all_data', '所有数据', 2, 28),
(33, 'youyan', 'all_device', '所有设备', 2, 29),
(34, 'yangchen', 'all_data', '所有数据', 2, 30),
(35, 'yangchen', 'all_device', '所有设备', 2, 31),
(36, 'water', 'all_data', '数据', 1, 27),
(37, 'water', 'all_device', '设备', 1, 27),
(38, 'water', 'all_data', '所有数据', 2, 36),
(39, 'water', 'all_device', '所有设备', 2, 37);

-- --------------------------------------------------------

--
-- 表的结构 `dili_models`
--

CREATE TABLE `dili_models` (
  `id` smallint(10) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(50) NOT NULL,
  `perpage` varchar(2) NOT NULL DEFAULT '10',
  `hasattach` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `built_in` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `thumb_preferences` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `dili_models`
--

INSERT INTO `dili_models` (`id`, `name`, `description`, `perpage`, `hasattach`, `built_in`, `thumb_preferences`) VALUES
(1, 'post', '文章', '10', 0, 0, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `dili_model_fields`
--

CREATE TABLE `dili_model_fields` (
  `id` mediumint(10) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(40) NOT NULL,
  `model` smallint(10) UNSIGNED NOT NULL DEFAULT '0',
  `type` varchar(20) DEFAULT NULL,
  `length` smallint(10) UNSIGNED DEFAULT NULL,
  `values` tinytext NOT NULL,
  `width` smallint(10) UNSIGNED NOT NULL,
  `height` smallint(10) UNSIGNED NOT NULL,
  `rules` tinytext NOT NULL,
  `ruledescription` tinytext NOT NULL,
  `searchable` tinyint(1) UNSIGNED NOT NULL,
  `listable` tinyint(1) UNSIGNED NOT NULL,
  `order` int(5) UNSIGNED DEFAULT NULL,
  `editable` tinyint(1) UNSIGNED DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `dili_model_fields`
--

INSERT INTO `dili_model_fields` (`id`, `name`, `description`, `model`, `type`, `length`, `values`, `width`, `height`, `rules`, `ruledescription`, `searchable`, `listable`, `order`, `editable`) VALUES
(1, 'post_title', '标题', 1, 'input', 30, '', 0, 0, 'required', '', 1, 1, 1, 1),
(2, 'post_category', '分类', 1, 'select_from_model', 10, 'category|category_name', 20, 20, 'required', '', 1, 1, 2, 1),
(3, 'post_content', '内容', 1, 'wysiwyg', 1000, '', 0, 0, 'required', '', 1, 0, 3, 1);

-- --------------------------------------------------------

--
-- 表的结构 `dili_plugins`
--

CREATE TABLE `dili_plugins` (
  `id` int(5) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL,
  `version` varchar(5) NOT NULL,
  `title` varchar(50) NOT NULL,
  `description` varchar(200) NOT NULL,
  `author` varchar(20) NOT NULL,
  `link` varchar(100) NOT NULL,
  `copyrights` varchar(100) NOT NULL,
  `access` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `active` tinyint(1) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `dili_rights`
--

CREATE TABLE `dili_rights` (
  `right_id` tinyint(10) UNSIGNED NOT NULL,
  `right_name` varchar(30) DEFAULT NULL,
  `right_class` varchar(30) DEFAULT NULL,
  `right_method` varchar(30) DEFAULT NULL,
  `right_detail` varchar(10) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `dili_rights`
--

INSERT INTO `dili_rights` (`right_id`, `right_name`, `right_class`, `right_method`, `right_detail`) VALUES
(1, '密码修改', 'system', 'password', NULL),
(2, '更新缓存', 'system', 'cache', NULL),
(3, ' 站点设置', 'setting', 'site', NULL),
(4, '后台设置', 'setting', 'backend', NULL),
(5, '插件管理[列表]', 'plugin', 'view', NULL),
(6, '添加插件', 'plugin', 'add', NULL),
(7, '修改插件', 'plugin', 'edit', NULL),
(8, '卸载插件', 'plugin', 'del', NULL),
(9, '导出插件', 'plugin', 'export', NULL),
(10, '导入插件', 'plugin', 'import', NULL),
(11, '激活插件', 'plugin', 'active', NULL),
(12, '禁用插件', 'plugin', 'deactive', NULL),
(13, '运行插件', 'module', 'run', NULL),
(14, '内容模型管理[列表]', 'model', 'view', NULL),
(15, '添加内容模型', 'model', 'add', NULL),
(16, '修改内容模型', 'model', 'edit', NULL),
(17, '删除内容模型', 'model', 'del', NULL),
(18, '内容模型字段管理[列表]', 'model', 'fields', NULL),
(19, '添加内容模型字段', 'model', 'add_filed', NULL),
(20, '修改内容模型字段', 'model', 'edit_field', NULL),
(21, '删除内容模型字段', 'model', 'del_field', NULL),
(22, '分类模型管理[列表]', 'category', 'view', NULL),
(23, '添加分类模型', 'category', 'add', NULL),
(24, '修改分类模型', 'category', 'edit', NULL),
(25, '删除分类模型', 'category', 'del', NULL),
(26, '分类模型字段管理[列表]', 'category', 'fields', NULL),
(27, '添加分类模型字段', 'category', 'add_filed', NULL),
(28, '修改分类模型字段', 'category', 'edit_field', NULL),
(29, '删除分类模型字段', 'category', 'del_field', NULL),
(30, '内容管理[列表]', 'content', 'view', NULL),
(31, '添加内容[表单]', 'content', 'form', 'add'),
(32, '修改内容[表单]', 'content', 'form', 'edit'),
(33, '添加内容[动作]', 'content', 'save', 'add'),
(34, '修改内容[动作]', 'content', 'save', 'edit'),
(35, '删除内容', 'content', 'del', NULL),
(36, '分类管理[列表]', 'category_content', 'view', NULL),
(37, '添加分类[表单]', 'category_content', 'form', 'add'),
(38, '修改分类[表单]', 'category_content', 'form', 'edit'),
(39, '添加分类[动作]', 'category_content', 'save', 'add'),
(40, '修改分类[动作]', 'category_content', 'save', 'edit'),
(41, '删除分类', 'category_content', 'del', NULL),
(42, '用户组管理[列表]', 'role', 'view', NULL),
(43, '添加用户组', 'role', 'add', NULL),
(44, '修改用户组', 'role', 'edit', NULL),
(45, '删除用户组', 'role', 'del', NULL),
(46, '用户管理[列表]', 'user', 'view', NULL),
(47, '添加用户', 'user', 'add', NULL),
(48, '修改用户', 'user', 'edit', NULL),
(49, '删除用户', 'user', 'del', NULL),
(50, '数据库备份', 'database', 'index', NULL),
(51, '数据库还原', 'database', 'recover', NULL),
(52, '数据库优化', 'database', 'optimize', NULL),
(53, '油烟监测数据', 'youyan', 'all_data', NULL),
(54, '扬尘监测数据', 'yangchen', 'all_data', NULL),
(55, '油烟监测设备', 'youyan', 'all_device', NULL),
(56, '扬尘监测设备', 'yangchen', 'all_device', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `dili_roles`
--

CREATE TABLE `dili_roles` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `rights` varchar(255) NOT NULL,
  `models` varchar(255) NOT NULL,
  `category_models` varchar(255) NOT NULL,
  `plugins` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `dili_roles`
--

INSERT INTO `dili_roles` (`id`, `name`, `rights`, `models`, `category_models`, `plugins`) VALUES
(1, 'root', '', '', '', ''),
(2, '普通用户', '', '', '', '');

-- --------------------------------------------------------

--
-- 表的结构 `dili_sessions`
--

CREATE TABLE `dili_sessions` (
  `session_id` varchar(40) NOT NULL DEFAULT '0',
  `ip_address` varchar(16) NOT NULL DEFAULT '0',
  `user_agent` varchar(120) NOT NULL,
  `last_activity` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `user_data` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `dili_sessions`
--

INSERT INTO `dili_sessions` (`session_id`, `ip_address`, `user_agent`, `last_activity`, `user_data`) VALUES
('ac5b706c89cca7edeefd9eeb10c89205', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36', 1539876818, 'a:2:{s:9:"user_data";s:0:"";s:3:"uid";s:1:"1";}');

-- --------------------------------------------------------

--
-- 表的结构 `dili_site_settings`
--

CREATE TABLE `dili_site_settings` (
  `site_name` varchar(50) DEFAULT NULL,
  `site_domain` varchar(50) DEFAULT NULL,
  `site_logo` varchar(50) DEFAULT NULL,
  `site_icp` varchar(50) DEFAULT NULL,
  `site_terms` text,
  `site_stats` varchar(200) DEFAULT NULL,
  `site_footer` varchar(500) DEFAULT NULL,
  `site_status` tinyint(1) DEFAULT '1',
  `site_close_reason` varchar(200) DEFAULT NULL,
  `site_keyword` varchar(200) DEFAULT NULL,
  `site_description` varchar(200) DEFAULT NULL,
  `site_theme` varchar(20) DEFAULT NULL,
  `attachment_url` varchar(50) DEFAULT NULL,
  `attachment_dir` varchar(20) DEFAULT NULL,
  `attachment_type` varchar(50) DEFAULT NULL,
  `attachment_maxupload` varchar(20) DEFAULT NULL,
  `thumbs_preferences` varchar(500) DEFAULT '[]'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `dili_site_settings`
--

INSERT INTO `dili_site_settings` (`site_name`, `site_domain`, `site_logo`, `site_icp`, `site_terms`, `site_stats`, `site_footer`, `site_status`, `site_close_reason`, `site_keyword`, `site_description`, `site_theme`, `attachment_url`, `attachment_dir`, `attachment_type`, `attachment_maxupload`, `thumbs_preferences`) VALUES
('在线监测', 'http://www.hanhouai.com/', 'images/AIMonitor_Logo_1.png', '', '', '', '', 1, '网站维护升级中......', 'DiliCMS,CodeIgniter,DiliCMS最新版', 'DiliCMS 基于CodeIgniter的开源免费 专业面向开发者的CMS系统', 'default', NULL, 'attachments', '*.jpg;*.gif;*.png;*.doc', '2097152', '[]');

-- --------------------------------------------------------

--
-- 表的结构 `dili_throttles`
--

CREATE TABLE `dili_throttles` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `dili_u_c_category`
--

CREATE TABLE `dili_u_c_category` (
  `classid` int(5) UNSIGNED NOT NULL,
  `parentid` int(5) UNSIGNED NOT NULL DEFAULT '0',
  `level` int(2) UNSIGNED NOT NULL DEFAULT '1',
  `path` varchar(50) DEFAULT '',
  `category_name` varchar(10) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `dili_u_c_category`
--

INSERT INTO `dili_u_c_category` (`classid`, `parentid`, `level`, `path`, `category_name`) VALUES
(1, 0, 1, '{0}', '编程'),
(2, 0, 1, '{0}', '生活');

-- --------------------------------------------------------

--
-- 表的结构 `dili_u_m_post`
--

CREATE TABLE `dili_u_m_post` (
  `id` int(10) UNSIGNED NOT NULL,
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `create_user` tinyint(10) UNSIGNED NOT NULL DEFAULT '0',
  `update_user` tinyint(10) UNSIGNED NOT NULL DEFAULT '0',
  `post_title` varchar(30) NOT NULL DEFAULT '',
  `post_category` int(10) NOT NULL DEFAULT '0',
  `post_content` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `dili_u_m_post`
--

INSERT INTO `dili_u_m_post` (`id`, `create_time`, `update_time`, `create_user`, `update_user`, `post_title`, `post_category`, `post_content`) VALUES
(1, 1539672621, 1539672621, 1, 1, '测试文章一', 1, '测试文章一测试文章一测试文章一测试文章一测试文章一测试文章一测试文章一测试文章一测试文章一测试文章一测试文章一测试文章一测试文章一测试文章一测试文章一');

-- --------------------------------------------------------

--
-- 表的结构 `dili_validations`
--

CREATE TABLE `dili_validations` (
  `k` varchar(20) DEFAULT NULL,
  `v` varchar(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `dili_validations`
--

INSERT INTO `dili_validations` (`k`, `v`) VALUES
('required', '必填'),
('valid_email', 'E-mail格式');

-- --------------------------------------------------------

--
-- 表的结构 `dili_water`
--

CREATE TABLE `dili_water` (
  `id` int(11) NOT NULL,
  `MN` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `datetime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `dili_yangchen`
--

CREATE TABLE `dili_yangchen` (
  `id` int(11) NOT NULL,
  `MN` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `datetime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `dili_youyan`
--

CREATE TABLE `dili_youyan` (
  `id` int(11) NOT NULL,
  `MN` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `datetime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dili_admins`
--
ALTER TABLE `dili_admins`
  ADD PRIMARY KEY (`uid`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `group` (`role`);

--
-- Indexes for table `dili_attachments`
--
ALTER TABLE `dili_attachments`
  ADD PRIMARY KEY (`aid`);

--
-- Indexes for table `dili_backend_settings`
--
ALTER TABLE `dili_backend_settings`
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `dili_cate_fields`
--
ALTER TABLE `dili_cate_fields`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`,`model`),
  ADD KEY `model` (`model`);

--
-- Indexes for table `dili_cate_models`
--
ALTER TABLE `dili_cate_models`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `dili_menus`
--
ALTER TABLE `dili_menus`
  ADD PRIMARY KEY (`menu_id`);

--
-- Indexes for table `dili_models`
--
ALTER TABLE `dili_models`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `dili_model_fields`
--
ALTER TABLE `dili_model_fields`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`,`model`),
  ADD KEY `model` (`model`);

--
-- Indexes for table `dili_plugins`
--
ALTER TABLE `dili_plugins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `dili_rights`
--
ALTER TABLE `dili_rights`
  ADD PRIMARY KEY (`right_id`);

--
-- Indexes for table `dili_roles`
--
ALTER TABLE `dili_roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `dili_sessions`
--
ALTER TABLE `dili_sessions`
  ADD PRIMARY KEY (`session_id`),
  ADD KEY `last_activity_idx` (`last_activity`);

--
-- Indexes for table `dili_throttles`
--
ALTER TABLE `dili_throttles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dili_u_c_category`
--
ALTER TABLE `dili_u_c_category`
  ADD PRIMARY KEY (`classid`);

--
-- Indexes for table `dili_u_m_post`
--
ALTER TABLE `dili_u_m_post`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dili_water`
--
ALTER TABLE `dili_water`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dili_yangchen`
--
ALTER TABLE `dili_yangchen`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dili_youyan`
--
ALTER TABLE `dili_youyan`
  ADD PRIMARY KEY (`id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `dili_admins`
--
ALTER TABLE `dili_admins`
  MODIFY `uid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- 使用表AUTO_INCREMENT `dili_attachments`
--
ALTER TABLE `dili_attachments`
  MODIFY `aid` int(10) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `dili_backend_settings`
--
ALTER TABLE `dili_backend_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `dili_cate_fields`
--
ALTER TABLE `dili_cate_fields`
  MODIFY `id` mediumint(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `dili_cate_models`
--
ALTER TABLE `dili_cate_models`
  MODIFY `id` mediumint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `dili_menus`
--
ALTER TABLE `dili_menus`
  MODIFY `menu_id` tinyint(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;
--
-- 使用表AUTO_INCREMENT `dili_models`
--
ALTER TABLE `dili_models`
  MODIFY `id` smallint(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `dili_model_fields`
--
ALTER TABLE `dili_model_fields`
  MODIFY `id` mediumint(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- 使用表AUTO_INCREMENT `dili_plugins`
--
ALTER TABLE `dili_plugins`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `dili_rights`
--
ALTER TABLE `dili_rights`
  MODIFY `right_id` tinyint(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;
--
-- 使用表AUTO_INCREMENT `dili_roles`
--
ALTER TABLE `dili_roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- 使用表AUTO_INCREMENT `dili_throttles`
--
ALTER TABLE `dili_throttles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `dili_u_c_category`
--
ALTER TABLE `dili_u_c_category`
  MODIFY `classid` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- 使用表AUTO_INCREMENT `dili_u_m_post`
--
ALTER TABLE `dili_u_m_post`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `dili_water`
--
ALTER TABLE `dili_water`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `dili_yangchen`
--
ALTER TABLE `dili_yangchen`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `dili_youyan`
--
ALTER TABLE `dili_youyan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
