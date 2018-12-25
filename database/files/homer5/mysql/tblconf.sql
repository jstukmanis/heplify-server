-- name: create-alias-table
CREATE TABLE IF NOT EXISTS `alias` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `gid` int(5) NOT NULL DEFAULT 0,
  `ip` varchar(80) NOT NULL DEFAULT '',
  `port` int(10) NOT NULL DEFAULT '0',
  `capture_id` varchar(100) NOT NULL DEFAULT '',
  `alias` varchar(100) NOT NULL DEFAULT '',
  `is_stp` tinyint(1) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `host_2` (`ip`,`port`,`capture_id`),
  KEY `host` (`ip`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- name: create-group-table
CREATE TABLE IF NOT EXISTS `group` (
  `gid` int(10) NOT NULL DEFAULT 0,
  `name` varchar(100) NOT NULL DEFAULT '',
  UNIQUE KEY `gid` (`gid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- name: create-link_share-table
CREATE TABLE IF NOT EXISTS `link_share` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(10) NOT NULL DEFAULT 0,
  `uuid` varchar(120) NOT NULL DEFAULT '',
  `data` text NOT NULL,
  `expire` datetime NOT NULL DEFAULT '2032-12-31 00:00:00',
  `active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;

-- name: create-node-table
CREATE TABLE IF NOT EXISTS `node` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `host` varchar(80) NOT NULL DEFAULT '',
  `dbname` varchar(100) NOT NULL DEFAULT '',
  `dbport` varchar(100) NOT NULL DEFAULT '',
  `dbusername` varchar(100) NOT NULL DEFAULT '',
  `dbpassword` varchar(100) NOT NULL DEFAULT '',
  `dbtables` varchar(100) NOT NULL DEFAULT 'sip_capture',
  `name` varchar(100) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `host_2` (`host`),
  KEY `host` (`host`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- name: create-setting-table
CREATE TABLE IF NOT EXISTS `setting` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(10) NOT NULL DEFAULT '0',
  `param_name` varchar(120) NOT NULL DEFAULT '',
  `param_value` text NOT NULL,
  `valid_param_from` datetime NOT NULL DEFAULT '2012-01-01 00:00:00',
  `valid_param_to` datetime NOT NULL DEFAULT '2032-12-01 00:00:00',
  `param_prio` int(2) NOT NULL DEFAULT '10',
  `active` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uid_2` (`uid`,`param_name`),
  KEY `param_name` (`param_name`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;

-- name: create-user-table
CREATE TABLE IF NOT EXISTS `user` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `gid` int(10) NOT NULL DEFAULT '10',
  `grp` varchar(200) NOT NULL DEFAULT '',
  `username` varchar(50) NOT NULL DEFAULT '',
  `password` varchar(100) NOT NULL DEFAULT '',
  `firstname` varchar(250) NOT NULL DEFAULT '',
  `lastname` varchar(250) NOT NULL DEFAULT '',
  `email` varchar(250) NOT NULL DEFAULT '',
  `department` varchar(100) NOT NULL DEFAULT '',
  `regdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `lastvisit` datetime NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`uid`),
  UNIQUE KEY `login` (`username`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;

-- name: create-user_menu-table
CREATE TABLE IF NOT EXISTS `user_menu` (
  `id` varchar(125) NOT NULL DEFAULT '',
  `name` varchar(100) NOT NULL DEFAULT '',
  `alias` varchar(200) NOT NULL DEFAULT '',
  `icon` varchar(100) NOT NULL DEFAULT '',
  `weight` int(10) NOT NULL DEFAULT '10',
  `active` int(1) NOT NULL DEFAULT '1',
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- name: create-api_auth_key-table
CREATE TABLE IF NOT EXISTS `api_auth_key` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `authkey` varchar(200) NOT NULL,
  `source_ip` varchar(200) NOT NULL DEFAULT '0.0.0.0',
  `startdate` datetime NOT NULL DEFAULT '2012-01-01 00:00:00',
  `stopdate` datetime NOT NULL DEFAULT '2032-01-01 00:00:00',
  `userobject` varchar(250) NOT NULL,
  `description` varchar(200) NOT NULL DEFAULT '',
  `lastvisit` datetime NOT NULL DEFAULT '2012-01-01 00:00:00',
  `enable` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `authkey` (`authkey`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1;
