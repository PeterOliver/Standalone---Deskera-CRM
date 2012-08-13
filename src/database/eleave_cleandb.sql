/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50077
Source Host           : localhost:3306
Source Database       : deskeraeleave

Target Server Type    : MYSQL
Target Server Version : 50077
File Encoding         : 65001

Date: 2012-05-25 12:59:00
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `actionlog`
-- ----------------------------
DROP TABLE IF EXISTS `actionlog`;
CREATE TABLE `actionlog` (
  `logid` int(11) NOT NULL auto_increment,
  `userid` varchar(50) NOT NULL,
  `actionby` varchar(50) NOT NULL,
  `actionid` int(11) default NULL,
  `actionto` varchar(50) NOT NULL,
  `actiontext` text NOT NULL,
  `ipaddress` varchar(20) NOT NULL default '',
  `datedon` bigint(20) default NULL,
  PRIMARY KEY  (`logid`)
) ENGINE=InnoDB AUTO_INCREMENT=29127 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of actionlog
-- ----------------------------

-- ----------------------------
-- Table structure for `announcements`
-- ----------------------------
DROP TABLE IF EXISTS `announcements`;
CREATE TABLE `announcements` (
  `id` int(11) NOT NULL auto_increment,
  `userid` varchar(36) NOT NULL,
  `companyid` varchar(36) NOT NULL,
  `description` text NOT NULL,
  `announcerid` varchar(36) NOT NULL default '',
  `isall` tinyint(1) NOT NULL default '0',
  `isshowname` tinyint(1) NOT NULL default '1',
  `fromdate` datetime NOT NULL,
  `todate` datetime NOT NULL,
  `createdon` bigint(20) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `announcements_ibfk_1` (`userid`),
  KEY `announcements_ibfk_2` (`companyid`)
) ENGINE=InnoDB AUTO_INCREMENT=355 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of announcements
-- ----------------------------

-- ----------------------------
-- Table structure for `announce_user_map`
-- ----------------------------
DROP TABLE IF EXISTS `announce_user_map`;
CREATE TABLE `announce_user_map` (
  `announcementid` int(11) default NULL,
  `userid` varchar(36) NOT NULL,
  KEY `announcementid` (`announcementid`),
  KEY `userid` (`userid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of announce_user_map
-- ----------------------------

-- ----------------------------
-- Table structure for `apiresponse`
-- ----------------------------
DROP TABLE IF EXISTS `apiresponse`;
CREATE TABLE `apiresponse` (
  `id` varchar(50) collate utf8_unicode_ci NOT NULL,
  `companyid` varchar(50) collate utf8_unicode_ci NOT NULL,
  `request` varchar(1024) collate utf8_unicode_ci NOT NULL,
  `response` varchar(1024) collate utf8_unicode_ci NOT NULL default '""',
  `status` int(11) NOT NULL default '0',
  `timestamp` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of apiresponse
-- ----------------------------

-- ----------------------------
-- Table structure for `column_header`
-- ----------------------------
DROP TABLE IF EXISTS `column_header`;
CREATE TABLE `column_header` (
  `id` int(11) NOT NULL default '0',
  `name` varchar(30) default NULL,
  `modulename` varchar(30) default NULL,
  `moduleid` int(11) default NULL,
  `ismandatory` int(3) default NULL,
  `isnull` int(3) default NULL,
  `dbfield` varchar(30) default NULL,
  `dbtable` varchar(30) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of column_header
-- ----------------------------
INSERT INTO column_header VALUES ('1', 'Applicant', 'Leave', '1', '1', '1', 'createdby', 'lm_leaves');
INSERT INTO column_header VALUES ('2', 'Approving Officer', 'Leave', '1', '1', '1', 'approverid', 'lm_leaves');
INSERT INTO column_header VALUES ('3', 'Description', 'Leave', '1', '0', '1', 'description', 'lm_leaves');
INSERT INTO column_header VALUES ('4', 'From', 'Leave', '1', '1', '1', 'fromdate', 'lm_leaves');
INSERT INTO column_header VALUES ('5', 'To', 'Leave', '1', '1', '1', 'todate', 'lm_leaves');
INSERT INTO column_header VALUES ('6', 'Duration', 'Leave', '1', '0', '1', 'duration', 'lm_leavedurationmap');
INSERT INTO column_header VALUES ('7', 'Status', 'Leave', '1', '1', '1', 'statusid', 'lm_leaves');
INSERT INTO column_header VALUES ('8', 'Approve/Reject on', 'Leave', '1', '0', '0', 'statusChangeon', 'lm_leaves');
INSERT INTO column_header VALUES ('9', 'Leave Type', 'Leave', '1', '1', '1', 'type', 'lm_leaves');
INSERT INTO column_header VALUES ('10', 'Applied On', 'Leave', '1', '0', '1', 'createdon', 'lm_leaves');
INSERT INTO column_header VALUES ('11', 'Remarks', 'Leave', '1', '0', '0', 'remarks', 'lm_leaves');
INSERT INTO column_header VALUES ('12', 'firstdayhalf', 'Leave', '1', '0', '0', 'firstdayhalf', 'lm_leaves');
INSERT INTO column_header VALUES ('13', 'lastdayhalf', 'Leave', '1', '0', '0', 'lastdayhalf', 'lm_leaves');

-- ----------------------------
-- Table structure for `company`
-- ----------------------------
DROP TABLE IF EXISTS `company`;
CREATE TABLE `company` (
  `companyid` varchar(36) NOT NULL,
  `locationid` varchar(36) NOT NULL default '',
  `companyname` varchar(100) NOT NULL,
  `locationname` varchar(100) NOT NULL,
  `address` varchar(50) default NULL,
  `city` varchar(50) default NULL,
  `state` varchar(50) default NULL,
  `country` varchar(50) default NULL,
  `phone` varchar(16) default NULL,
  `fax` varchar(50) default NULL,
  `zip` varchar(50) default NULL,
  `timezone` varchar(50) default NULL,
  `website` varchar(50) default NULL,
  `activated` bit(1) NOT NULL default b'1',
  `maxusers` int(11) NOT NULL default '20',
  `maxcommunities` int(11) NOT NULL default '5',
  `maxprojects` int(11) NOT NULL default '5',
  `image` varchar(256) NOT NULL default '',
  `featureaccess` int(11) default '0',
  `planid` int(11) NOT NULL default '2',
  `subscriptiondate` date NOT NULL default '1900-01-01',
  `payerid` varchar(50) NOT NULL default '',
  `emailnotification` int(3) default '0',
  `creatorid` varchar(36) NOT NULL,
  `subdomain` varchar(50) NOT NULL,
  `emailid` varchar(50) default ' ',
  `currency` int(11) default '1',
  `createdon` bigint(20) default NULL,
  `language` int(11) default NULL,
  PRIMARY KEY  USING BTREE (`companyid`,`locationid`),
  KEY `planid` (`planid`),
  KEY `locationid` (`locationid`),
  KEY `language` (`language`),
  CONSTRAINT `company_ibfk_1` FOREIGN KEY (`language`) REFERENCES `language` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of company
-- ----------------------------

-- ----------------------------
-- Table structure for `companyholidays`
-- ----------------------------
DROP TABLE IF EXISTS `companyholidays`;
CREATE TABLE `companyholidays` (
  `companyid` varchar(36) NOT NULL,
  `holiday` date NOT NULL default '1900-09-09',
  `description` varchar(512) NOT NULL default '',
  `weeklyoff` int(3) NOT NULL default '-1',
  `locationid` varchar(36) NOT NULL,
  KEY `companyid` (`companyid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of companyholidays
-- ----------------------------

-- ----------------------------
-- Table structure for `companylocation`
-- ----------------------------
DROP TABLE IF EXISTS `companylocation`;
CREATE TABLE `companylocation` (
  `locationid` varchar(36) NOT NULL,
  `locationname` varchar(36) NOT NULL,
  `companyid` varchar(36) NOT NULL,
  PRIMARY KEY  (`locationid`),
  KEY `new_fk_constraint` (`companyid`),
  CONSTRAINT `new_fk_constraint` FOREIGN KEY (`companyid`) REFERENCES `company` (`companyid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of companylocation
-- ----------------------------

-- ----------------------------
-- Table structure for `country`
-- ----------------------------
DROP TABLE IF EXISTS `country`;
CREATE TABLE `country` (
  `countryid` int(11) NOT NULL default '0',
  `countryname` varchar(100) NOT NULL default ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of country
-- ----------------------------
INSERT INTO country VALUES ('1', 'ABU DHABI');
INSERT INTO country VALUES ('2', 'ADMIRALTY ISLANDS');
INSERT INTO country VALUES ('3', 'AFGHANISTAN');
INSERT INTO country VALUES ('4', 'AJMAN');
INSERT INTO country VALUES ('5', 'AL AIN');
INSERT INTO country VALUES ('6', 'ALBANIA');
INSERT INTO country VALUES ('7', 'ALGERIA');
INSERT INTO country VALUES ('8', 'ANDORRA');
INSERT INTO country VALUES ('9', 'ANGOLA');
INSERT INTO country VALUES ('10', 'ANGUILLA');
INSERT INTO country VALUES ('11', 'ANTARTICA');
INSERT INTO country VALUES ('12', 'ANTIGUA');
INSERT INTO country VALUES ('13', 'ARGENTINA');
INSERT INTO country VALUES ('14', 'ARMENIA');
INSERT INTO country VALUES ('15', 'ARUBA');
INSERT INTO country VALUES ('16', 'ASCENSION ISLAND');
INSERT INTO country VALUES ('17', 'AUSTRALIA');
INSERT INTO country VALUES ('18', 'AUSTRIA');
INSERT INTO country VALUES ('19', 'AZERBAIJAN');
INSERT INTO country VALUES ('20', 'BAHAMAS');
INSERT INTO country VALUES ('21', 'BAHRAIN');
INSERT INTO country VALUES ('22', 'BANGLADESH');
INSERT INTO country VALUES ('23', 'BARBADOS');
INSERT INTO country VALUES ('24', 'BELGIUM');
INSERT INTO country VALUES ('25', 'BELIZE');
INSERT INTO country VALUES ('26', 'BENIN');
INSERT INTO country VALUES ('27', 'BERMUDA');
INSERT INTO country VALUES ('28', 'BHUTAN');
INSERT INTO country VALUES ('29', 'BOLIVIA');
INSERT INTO country VALUES ('30', 'BOSNIA/HERZEGOVINA');
INSERT INTO country VALUES ('31', 'BOTSWANA');
INSERT INTO country VALUES ('32', 'BOUVET ISLAND');
INSERT INTO country VALUES ('33', 'BRAZIL');
INSERT INTO country VALUES ('34', 'BRITISH INDIAN OCEAN TERRITORY');
INSERT INTO country VALUES ('35', 'BRUNEI');
INSERT INTO country VALUES ('36', 'BULGARIA');
INSERT INTO country VALUES ('37', 'BURKINA/FASO');
INSERT INTO country VALUES ('38', 'BURUNDI');
INSERT INTO country VALUES ('39', 'BYELORUSSIA');
INSERT INTO country VALUES ('117', 'CAMBODIA');
INSERT INTO country VALUES ('40', 'CAMEROON');
INSERT INTO country VALUES ('41', 'CANADA');
INSERT INTO country VALUES ('42', 'CAPE VERDE');
INSERT INTO country VALUES ('43', 'CAROLINE ISLANDS');
INSERT INTO country VALUES ('44', 'CAYMAN ISLANDS');
INSERT INTO country VALUES ('45', 'CENTRAL AFRICAN REP');
INSERT INTO country VALUES ('46', 'CHAD');
INSERT INTO country VALUES ('47', 'CHILE');
INSERT INTO country VALUES ('48', 'CHINA PEOPLES REP');
INSERT INTO country VALUES ('49', 'CHRISTMAS ISLANDS');
INSERT INTO country VALUES ('50', 'COCOS ISLANDS');
INSERT INTO country VALUES ('51', 'COLOMBIA');
INSERT INTO country VALUES ('53', 'COMORO ISLANDS');
INSERT INTO country VALUES ('54', 'CONGO');
INSERT INTO country VALUES ('55', 'COOK ISLANDS');
INSERT INTO country VALUES ('56', 'COSTA RICA');
INSERT INTO country VALUES ('57', 'CROTIA');
INSERT INTO country VALUES ('58', 'CUBA');
INSERT INTO country VALUES ('59', 'CYPRUS');
INSERT INTO country VALUES ('60', 'CZECH REPUBLIC');
INSERT INTO country VALUES ('61', 'DENMARK');
INSERT INTO country VALUES ('62', 'DJIBOUTI');
INSERT INTO country VALUES ('63', 'DOMINICA');
INSERT INTO country VALUES ('64', 'DOMINICAN REPUBLIC');
INSERT INTO country VALUES ('65', 'DUBAI');
INSERT INTO country VALUES ('67', 'ECUADOR');
INSERT INTO country VALUES ('68', 'EGYPT');
INSERT INTO country VALUES ('69', 'EL SALVADOR');
INSERT INTO country VALUES ('70', 'ENGLAND');
INSERT INTO country VALUES ('71', 'EQUATORIAL GUINEA');
INSERT INTO country VALUES ('72', 'ERITREA');
INSERT INTO country VALUES ('73', 'ESTONIA');
INSERT INTO country VALUES ('74', 'ETHIOPIA');
INSERT INTO country VALUES ('75', 'FAEROE ISLANDS');
INSERT INTO country VALUES ('76', 'FALKLAND ISLANDS');
INSERT INTO country VALUES ('77', 'FIJI');
INSERT INTO country VALUES ('78', 'FINLAND');
INSERT INTO country VALUES ('79', 'FRANCE');
INSERT INTO country VALUES ('80', 'FRENCH GUIANA');
INSERT INTO country VALUES ('81', 'FRENCH POLYNESIA');
INSERT INTO country VALUES ('82', 'FRENCH SOUTHERN TERRITORIES');
INSERT INTO country VALUES ('83', 'FUJAIRAH');
INSERT INTO country VALUES ('84', 'GABON');
INSERT INTO country VALUES ('85', 'GAMBIA');
INSERT INTO country VALUES ('86', 'GEORGIA');
INSERT INTO country VALUES ('87', 'GERMANY');
INSERT INTO country VALUES ('88', 'GHANA');
INSERT INTO country VALUES ('89', 'GIBRALTAR');
INSERT INTO country VALUES ('90', 'GREECE');
INSERT INTO country VALUES ('91', 'GREENLAND');
INSERT INTO country VALUES ('92', 'GRENADA');
INSERT INTO country VALUES ('93', 'GUADELOUPE');
INSERT INTO country VALUES ('94', 'GUAM');
INSERT INTO country VALUES ('95', 'GUATEMALA');
INSERT INTO country VALUES ('96', 'GUINEA');
INSERT INTO country VALUES ('97', 'GUINEA-BISSAU');
INSERT INTO country VALUES ('98', 'GUYANA');
INSERT INTO country VALUES ('99', 'HAITI');
INSERT INTO country VALUES ('100', 'HEARD & MCDONALD ISLANDS');
INSERT INTO country VALUES ('101', 'HONDURAS');
INSERT INTO country VALUES ('102', 'HONG KONG');
INSERT INTO country VALUES ('103', 'HUNGARY');
INSERT INTO country VALUES ('104', 'ICELAND');
INSERT INTO country VALUES ('105', 'INDIA');
INSERT INTO country VALUES ('106', 'INDONESIA');
INSERT INTO country VALUES ('108', 'IRAN');
INSERT INTO country VALUES ('109', 'IRAQ');
INSERT INTO country VALUES ('110', 'IRELAND');
INSERT INTO country VALUES ('111', 'ISRAEL');
INSERT INTO country VALUES ('112', 'ITALY');
INSERT INTO country VALUES ('113', 'IVORY COAST');
INSERT INTO country VALUES ('114', 'JAMAICA');
INSERT INTO country VALUES ('115', 'JAPAN');
INSERT INTO country VALUES ('116', 'JORDAN');
INSERT INTO country VALUES ('118', 'KAZAKHSTAN');
INSERT INTO country VALUES ('119', 'KENYA');
INSERT INTO country VALUES ('120', 'KIRGHIZIA');
INSERT INTO country VALUES ('121', 'KIRIBATI');
INSERT INTO country VALUES ('122', 'KOREA NORTH');
INSERT INTO country VALUES ('123', 'KOREA SOUTH');
INSERT INTO country VALUES ('124', 'KUWAIT');
INSERT INTO country VALUES ('125', 'LAOS');
INSERT INTO country VALUES ('126', 'LATVIA');
INSERT INTO country VALUES ('127', 'LEBANON');
INSERT INTO country VALUES ('128', 'LESOTHO');
INSERT INTO country VALUES ('129', 'LIBERIA');
INSERT INTO country VALUES ('130', 'LIBYA');
INSERT INTO country VALUES ('131', 'LIECHTENSTEIN');
INSERT INTO country VALUES ('132', 'LITHUANIA');
INSERT INTO country VALUES ('133', 'LUXEMBOURG');
INSERT INTO country VALUES ('134', 'MACAO');
INSERT INTO country VALUES ('135', 'MADAGASCAR/MALAGASY');
INSERT INTO country VALUES ('136', 'MALAWI');
INSERT INTO country VALUES ('137', 'MALAYSIA');
INSERT INTO country VALUES ('138', 'MALDIVES');
INSERT INTO country VALUES ('139', 'MALI');
INSERT INTO country VALUES ('140', 'MALTA');
INSERT INTO country VALUES ('141', 'MARSHALL ISLANDS');
INSERT INTO country VALUES ('142', 'MARTINIQUE');
INSERT INTO country VALUES ('143', 'MAURITANIA');
INSERT INTO country VALUES ('144', 'MAURITIUS');
INSERT INTO country VALUES ('145', 'MAYOTTE');
INSERT INTO country VALUES ('146', 'MEXICO');
INSERT INTO country VALUES ('147', 'MICRONESIA');
INSERT INTO country VALUES ('148', 'MIDWAY ISLAND');
INSERT INTO country VALUES ('149', 'MOLDAVIA');
INSERT INTO country VALUES ('150', 'MONACO');
INSERT INTO country VALUES ('151', 'MONGOLIA');
INSERT INTO country VALUES ('152', 'MONTSERRAT');
INSERT INTO country VALUES ('153', 'MOROCCO');
INSERT INTO country VALUES ('154', 'MOZAMBIQUE');
INSERT INTO country VALUES ('155', 'MYANMAR (BURMA)');
INSERT INTO country VALUES ('156', 'NAMIBIA');
INSERT INTO country VALUES ('158', 'NAURU');
INSERT INTO country VALUES ('159', 'NEPAL');
INSERT INTO country VALUES ('160', 'NETHERLANDS');
INSERT INTO country VALUES ('161', 'NETHERLANDS ANTILLES');
INSERT INTO country VALUES ('163', 'NEW CALEDONIA');
INSERT INTO country VALUES ('164', 'NEW ZEALAND');
INSERT INTO country VALUES ('165', 'NICARAGUA');
INSERT INTO country VALUES ('166', 'NIGER');
INSERT INTO country VALUES ('167', 'NIGERIA');
INSERT INTO country VALUES ('168', 'NIUE');
INSERT INTO country VALUES ('170', 'NORFOLK ISLAND');
INSERT INTO country VALUES ('171', 'NORTHERN IRELAND');
INSERT INTO country VALUES ('172', 'NORTHERN MARIANA ISLANDS');
INSERT INTO country VALUES ('173', 'NORWAY');
INSERT INTO country VALUES ('175', 'OMAN');
INSERT INTO country VALUES ('176', 'PAKISTAN');
INSERT INTO country VALUES ('266', 'PALASTINE');
INSERT INTO country VALUES ('177', 'PALAU');
INSERT INTO country VALUES ('178', 'PANAMA');
INSERT INTO country VALUES ('179', 'PAPUA NEW GUINEA');
INSERT INTO country VALUES ('180', 'PARAGUAY');
INSERT INTO country VALUES ('181', 'PERU');
INSERT INTO country VALUES ('182', 'PHILIPPINES');
INSERT INTO country VALUES ('183', 'PITCAIRN');
INSERT INTO country VALUES ('184', 'POLAND');
INSERT INTO country VALUES ('185', 'PORTUGAL');
INSERT INTO country VALUES ('186', 'PUERTO RICO');
INSERT INTO country VALUES ('187', 'QATAR');
INSERT INTO country VALUES ('188', 'RAS AL KHAIMAH');
INSERT INTO country VALUES ('189', 'REUNION ISLAND');
INSERT INTO country VALUES ('190', 'ROMANIA');
INSERT INTO country VALUES ('191', 'RUSSION FEDERATION');
INSERT INTO country VALUES ('192', 'RWANDA');
INSERT INTO country VALUES ('193', 'SAMOA AMERICAN');
INSERT INTO country VALUES ('194', 'SAMOA WESTERN');
INSERT INTO country VALUES ('195', 'SAN MARINO');
INSERT INTO country VALUES ('196', 'SAO TOME & PRINCIPE');
INSERT INTO country VALUES ('197', 'SAUDI ARABIA');
INSERT INTO country VALUES ('198', 'SCOTLAND');
INSERT INTO country VALUES ('199', 'SENEGAL');
INSERT INTO country VALUES ('200', 'SEYCHELLES');
INSERT INTO country VALUES ('201', 'SHARJAH');
INSERT INTO country VALUES ('202', 'SIERRA LEONE');
INSERT INTO country VALUES ('203', 'SINGAPORE');
INSERT INTO country VALUES ('204', 'SLOVAKIA');
INSERT INTO country VALUES ('205', 'SLOVENIA');
INSERT INTO country VALUES ('206', 'SOLOMON ISLANDS');
INSERT INTO country VALUES ('207', 'SOMALIA');
INSERT INTO country VALUES ('208', 'SOUTH AFRICA');
INSERT INTO country VALUES ('209', 'SOUTH GEORGIA');
INSERT INTO country VALUES ('210', 'SOUTH SANDWICH ISLANDS');
INSERT INTO country VALUES ('211', 'SOVIET UNION');
INSERT INTO country VALUES ('212', 'SPAIN');
INSERT INTO country VALUES ('213', 'SRI LANKA');
INSERT INTO country VALUES ('214', 'ST HELENA');
INSERT INTO country VALUES ('215', 'ST KITTS/NEVIS');
INSERT INTO country VALUES ('216', 'ST LUCIA');
INSERT INTO country VALUES ('217', 'ST PIERRE');
INSERT INTO country VALUES ('218', 'ST VINCENT');
INSERT INTO country VALUES ('219', 'SUDAN');
INSERT INTO country VALUES ('220', 'SURINAME');
INSERT INTO country VALUES ('221', 'SVALBARD & JAN MAYEN ISLANDS');
INSERT INTO country VALUES ('222', 'SWAZILAND');
INSERT INTO country VALUES ('223', 'SWEDEN');
INSERT INTO country VALUES ('224', 'SWITZERLAND');
INSERT INTO country VALUES ('225', 'SYRIA');
INSERT INTO country VALUES ('226', 'TAIWAN');
INSERT INTO country VALUES ('227', 'TAJIKSTAN');
INSERT INTO country VALUES ('228', 'TANZANIA');
INSERT INTO country VALUES ('229', 'THAILAND');
INSERT INTO country VALUES ('66', 'TIMOR-LESTE');
INSERT INTO country VALUES ('230', 'TOGO');
INSERT INTO country VALUES ('231', 'TOKELAU ISLANDS');
INSERT INTO country VALUES ('232', 'TONGA');
INSERT INTO country VALUES ('233', 'TRINIDAD & TOBAGO');
INSERT INTO country VALUES ('234', 'TUNISIA');
INSERT INTO country VALUES ('235', 'TURKEY');
INSERT INTO country VALUES ('236', 'TURKMENISTAN');
INSERT INTO country VALUES ('237', 'TURKS & CAICOS ISLANDS');
INSERT INTO country VALUES ('238', 'TUVALU');
INSERT INTO country VALUES ('239', 'UGANDA');
INSERT INTO country VALUES ('240', 'UKRAINE');
INSERT INTO country VALUES ('241', 'UMM AL QAIWAIN');
INSERT INTO country VALUES ('999', 'UNDEFINED');
INSERT INTO country VALUES ('242', 'UNITED ARAB EMIRATES');
INSERT INTO country VALUES ('243', 'UNITED KINGDOM');
INSERT INTO country VALUES ('244', 'UNITED STATES');
INSERT INTO country VALUES ('245', 'UNITED STATES MINOR OUTLYING ISLANDS');
INSERT INTO country VALUES ('246', 'URUGUAY');
INSERT INTO country VALUES ('251', 'UZBEKISTAN');
INSERT INTO country VALUES ('252', 'VANUATU');
INSERT INTO country VALUES ('253', 'VATICAN CITY');
INSERT INTO country VALUES ('254', 'VENEZUELA');
INSERT INTO country VALUES ('255', 'VIETNAM');
INSERT INTO country VALUES ('256', 'VIRGIN ISLANDS UK');
INSERT INTO country VALUES ('257', 'WAKE ISLAND');
INSERT INTO country VALUES ('258', 'WALES');
INSERT INTO country VALUES ('259', 'WALLIS & FUTUNA ISLAND');
INSERT INTO country VALUES ('267', 'WEST AFRICA');
INSERT INTO country VALUES ('260', 'WESTERN SAHARA');
INSERT INTO country VALUES ('261', 'YEMEN ARAB REPUBLIC');
INSERT INTO country VALUES ('262', 'YUGOSLAVIA');
INSERT INTO country VALUES ('263', 'ZAIRE');
INSERT INTO country VALUES ('264', 'ZAMBIA');
INSERT INTO country VALUES ('265', 'ZIMBABWE');

-- ----------------------------
-- Table structure for `csignups`
-- ----------------------------
DROP TABLE IF EXISTS `csignups`;
CREATE TABLE `csignups` (
  `loginid` varchar(50) NOT NULL,
  `emailid` varchar(100) NOT NULL,
  `pass` varchar(100) default NULL,
  `signupid` varchar(36) NOT NULL default '',
  `companyname` varchar(100) NOT NULL default ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of csignups
-- ----------------------------
INSERT INTO csignups VALUES ('amar', 'amar86@gmail.com', 'a94a8fe5ccb19ba61c4c0873d391e987982fbbd3', 'b6d54928-240a-4885-b1c3-3cc2f45340e6', 'krawler');

-- ----------------------------
-- Table structure for `currency`
-- ----------------------------
DROP TABLE IF EXISTS `currency`;
CREATE TABLE `currency` (
  `currencyid` varchar(255) NOT NULL default '',
  `currencyname` varchar(100) default NULL,
  `htmlcode` varchar(30) NOT NULL,
  `symbol` varchar(30) NOT NULL,
  PRIMARY KEY  (`currencyid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of currency
-- ----------------------------
INSERT INTO currency VALUES ('1', 'US Dollar', '&#36;', '24');
INSERT INTO currency VALUES ('2', 'Pound', '&#163;', '00a3');
INSERT INTO currency VALUES ('3', 'Euro', '&#128;', '20ac');
INSERT INTO currency VALUES ('4', 'default', '&#164;', 'a4');
INSERT INTO currency VALUES ('5', 'Rupee', 'Rs', 'Rs');
INSERT INTO currency VALUES ('6', 'SG Dollar', 'SGD', 'SGD');
INSERT INTO currency VALUES ('9', 'Uganda Shillings (UGX)', '&#85;&#83;&#104;', 'USh');
INSERT INTO currency VALUES ('7', 'Malaysian Ringgit', 'RM', 'RM');
INSERT INTO currency VALUES ('8', 'Colones (CRC)', '&#8353;', '20A1');

-- ----------------------------
-- Table structure for `dateformat`
-- ----------------------------
DROP TABLE IF EXISTS `dateformat`;
CREATE TABLE `dateformat` (
  `id` int(11) NOT NULL default '0',
  `name` varchar(50) NOT NULL default '',
  `scriptform` varchar(50) NOT NULL default '',
  `javaform` varchar(50) NOT NULL default '',
  `javadate` varchar(30) default NULL,
  `scriptdate` varchar(30) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dateformat
-- ----------------------------
INSERT INTO dateformat VALUES ('1', 'Iso8601Long', 'Y-m-d H:i:s', 'yyyy-MM-dd HH:mm:ss', 'yyyy-MM-dd', 'Y-m-d');
INSERT INTO dateformat VALUES ('2', 'Iso8601Short', 'Y-m-d', 'yyyy-MM-dd', 'yyyy-MM-dd', 'Y-m-d');
INSERT INTO dateformat VALUES ('3', 'ShortDate', 'n/j/y', 'M/d/yy', 'M/d/yy', 'n/j/y');
INSERT INTO dateformat VALUES ('4', 'longDate', 'l, F d, Y', 'EEEE, MMMM dd, yyyy', 'MMMM dd, yyyy', 'F d, Y');
INSERT INTO dateformat VALUES ('5', 'FullDateFormat', 'l. F d, Y g:i:s A', 'EEEE, MMMM dd, yyyy h:mm:ss a', 'MMMM dd, yyyy', 'F d, Y');
INSERT INTO dateformat VALUES ('6', 'MonthDate', 'F d', 'MMMM dd', 'MMMM dd', 'F d');
INSERT INTO dateformat VALUES ('7', 'ShortTime', 'g:i A', 'h:mm a', '', '');
INSERT INTO dateformat VALUES ('8', 'Longtime', 'g:i:s A', 'h:mm:ss a', '', '');
INSERT INTO dateformat VALUES ('9', 'sortableDatetime', 'Y-m-d T H:i:s', 'yyyy-MM-dd z HH:mm:ss', 'yyyy-MM-dd z', 'Y-m-d T');
INSERT INTO dateformat VALUES ('10', 'UniversalsortableDatetime', 'Y-m-d H:i:s 0', 'yyyy-MM-dd HH:mm:ss Z', 'yyyy-MM-dd', 'Y-m-d');
INSERT INTO dateformat VALUES ('11', 'YearMonth', 'F, Y', 'MMMM, yyyy', 'MMMM, yyyy', 'F, Y');
INSERT INTO dateformat VALUES ('12', 'Kdate1', 'd-m-y', 'dd-MM-yy', 'dd-MM-yy', 'd-m-y');
INSERT INTO dateformat VALUES ('13', 'Kdate2', 'm-d-y', 'MM-dd-yy', 'MM-dd-yy', 'm-d-y');
INSERT INTO dateformat VALUES ('14', 'Kdate3', 'd/m/y', 'dd/MM/yy', 'dd/MM/yy', 'd/m/y');
INSERT INTO dateformat VALUES ('15', 'Kdate4', 'm/d/y', 'MM/dd/yy', 'MM/dd/yy', 'm/d/y');
INSERT INTO dateformat VALUES ('16', 'Kdate5', 'D j-m-y', 'E d-MM-yy', 'E d-MM-yy', 'D j-m-y');
INSERT INTO dateformat VALUES ('17', 'FullDateShortTime', 'Y-m-d g:i A', 'yyyy-MM-dd HH:mm a', 'yyyy-MM-dd', 'Y-m-d');
INSERT INTO dateformat VALUES ('18', 'Kdate6', 'F d,Y g:i A', 'MMMM dd,yyyy h:mm a', 'MMMM dd,yyyy', 'F d,Y');

-- ----------------------------
-- Table structure for `emailnotification`
-- ----------------------------
DROP TABLE IF EXISTS `emailnotification`;
CREATE TABLE `emailnotification` (
  `caseid` varchar(255) NOT NULL,
  `htmlmsg` text NOT NULL,
  `plainmsg` text NOT NULL,
  `subject` varchar(255) default NULL,
  PRIMARY KEY  (`caseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of emailnotification
-- ----------------------------
INSERT INTO emailnotification VALUES ('ChangePassword', 'You will be able to access eLeave application at <a href=\'%s\'>%s</a><p>When logging in for the first time, the following information is required:<p>\n\n\r\n\n\n <p>User ID :<strong>%s</strong></p> \n\n\r\n<p>Password :<strong>%s</strong></p>\n\n\n\n\r\n<p>For security purposes, you are advised to change your password ASAP. \r\nIn the event you forget your password or have problems logging in,\r\n please send an email request to: %s and your request will be addressed accordingly.</p>\r\n <p>Note: For authentication purposes, only requests from authorized email addresses will be entertained.</p>\r\n <p>For leave data enquiries, kindly refer to your local Human Resource department for clarification.</p>\r\n <p>For more information, a user manual is attached to this email.</p>\r\n <p>Regards</p>\r\n <p>eLeave Administrator</p>\r\n', 'You will be able to access eLeave application at <a href=\'%s\'>%s</a><p>When logging in for the first time, the following information is required:<p>\n\n\r\n\n\n <p>User ID :<strong>%s</strong></p> \n\n\r\n<p>Password :<strong>%s</strong></p>\n\n\n\n\r\n<p>For security purposes, you are advised to change your password ASAP. \r\nIn the event you forget your password or have problems logging in,\r\n please send an email request to: %s and your request will be addressed accordingly.</p>\r\n <p>Note: For authentication purposes, only requests from authorized email addresses will be entertained.</p>\r\n <p>For leave data enquiries, kindly refer to your local Human Resource department for clarification.</p>\r\n <p>For more information, a user manual is attached to this email.</p>\r\n <p>Regards</p>\r\n <p>eLeave Administrator</p>', 'Change my password');
INSERT INTO emailnotification VALUES ('CreateUserOrResetPassword', 'You will be able to access eLeave application at <a href=\'%s\'>%s</a><p>When logging in for the first time, the following information is required:<p>\n\n\r\n\n\n <p>User ID :<strong>%s</strong></p> \n\n\r\n<p>Password :<strong>%s</strong></p>\n\n\n\n\r\n<p>For security purposes, you are advised to change your password ASAP. \r\nIn the event you forget your password or have problems logging in,\r\n please send an email request to: %sÃ‚ and your request will be addressedÃ‚ accordingly.</p>\r\n <p>Note: For authentication purposes, only requests from authorized email addresses will be entertained.</p>\r\n <p>For leave data enquiries, kindly refer to your local Human Resource department for clarification.</p>\r\n <p>For more information, a user manual is attached to this email.</p>\r\n <p>Regards</p>\r\n <p>eLeave Administrator</p>\r\n', 'You will be able to access eLeave application at <a href=\'%s\'>%s</a><p>When logging in for the first time, the following information is required:<p>\n\n\r\n\n\n <p>User ID :<strong>%s</strong></p> \n\n\r\n<p>Password :<strong>%s</strong></p>\n\n\n\n\r\n<p>For security purposes, you are advised to change your password ASAP. \r\nIn the event you forget your password or have problems logging in,\r\n please send an email request to: %sÃ‚ and your request will be addressedÃ‚ accordingly.</p>\r\n <p>Note: For authentication purposes, only requests from authorized email addresses will be entertained.</p>\r\n <p>For leave data enquiries, kindly refer to your local Human Resource department for clarification.</p>\r\n <p>For more information, a user manual is attached to this email.</p>\r\n <p>Regards</p>\r\n <p>eLeave Administrator</p>', '[Deskera] Welcome to Leave Manager');
INSERT INTO emailnotification VALUES ('emLeaveApplicationRequest', ' <p>Dear <b>%s</b></p><p>\n        For your attention:</p> <p><b>%s</b>\nhas %s time-off leave application for your approval.</p>\n<p>The time-off leave details are : </p> <div style=\'padding-left:20px\'>\n<ui>\n<li><b>%s</b>: %s</li>\n<li><b>%s</b>: %s</li>\n<li><b>%s</b>: %s</li>\n<li><b>Leave Type</b>: %s</li>\n<li><b>Time in hours</b>: %s</li>\n<li><b>Description</b>: %s</li>\n%s\n</ui> ', ' <p>Dear <b>%s</b></p><p>\n        For your attention:</p> <p><b>%s</b>\nhas %s time-off leave application for your approval.</p>\n<p>The time-off leave details are : </p> <div style=\'padding-left:20px\'>\n<ui>\n<li><b>%s</b>: %s</li>\n<li><b>%s</b>: %s</li>\n<li><b>%s</b>: %s</li>\n<li><b>Leave Type</b>: %s</li>\n<li><b>Time in hours</b>: %s</li>\n<li><b>Description</b>: %s</li>\n%s\n</ui> ', 'New time-off request submitted');
INSERT INTO emailnotification VALUES ('emLeaveApprovalCancellationRequest', ' <p>Dear <b>%s</b></p><p>\n        For your attention:</p><p><b>%s</b> has %s time-off leave cancellation for your approval.</p>\n<div style=\'padding-left:20px\'>\n<ui>\n<li><b>%s</b>: %s</li>\n<li><b>%s</b>: %s</li>\n<li><b>%s</b>: %s</li>\n<li><b>Leave Type</b>: %s</li>\n<li><b>Time in hours</b>: %s</li>\n<li><b>Description</b>: %s</li>\n%s\n</ui>\n ', ' <p>Dear <b>%s</b></p><p>\n        For your attention:</p><p><b>%s</b> has %s time-off leave cancellation for your approval.</p>\n<div style=\'padding-left:20px\'>\n<ui>\n<li><b>%s</b>: %s</li>\n<li><b>%s</b>: %s</li>\n<li><b>%s</b>: %s</li>\n<li><b>Leave Type</b>: %s</li>\n<li><b>Time in hours</b>: %s</li>\n<li><b>Description</b>: %s</li>\n%s\n</ui>\n ', 'Time-off cancellation request submitted');
INSERT INTO emailnotification VALUES ('emLeaveApprovalCancellationRequestApproved', '|  <p>Dear <b>%s</b></p><p>\n        For your attention:</p><p><b>%s</b> has %s your time-off leave cancellation.</p>\n<ui>\n<li><b>%s</b>: %s</li>\n<li><b>%s</b>: %s</li>\n<li><b>%s</b>: %s</li>\n<li><b>Leave Type</b>: %s</li>\n<li><b>Time in hours</b>: %s</li>\n<li><b>Description</b>: %s</li>\n%s\n</ui>\n  ', '|  <p>Dear <b>%s</b></p><p>\n        For your attention:</p><p><b>%s</b> has %s your time-off leave cancellation.</p>\n<ui>\n<li><b>%s</b>: %s</li>\n<li><b>%s</b>: %s</li>\n<li><b>%s</b>: %s</li>\n<li><b>Leave Type</b>: %s</li>\n<li><b>Time in hours</b>: %s</li>\n<li><b>Description</b>: %s</li>\n%s\n</ui>\n  ', 'Time-off cancellation approved');
INSERT INTO emailnotification VALUES ('emLeaveApprovalCancellationRequestRejected', '    <p>Dear <b>%s</b></p><p>\n        For your attention:</p><p><b>%s</b> has %s your time-off leave cancellation.</p>\n<div style=\'padding-left:20px\'>\n<ui>\n<li><b>%s</b>: %s</li>\n<li><b>%s</b>: %s</li>\n<li><b>%s</b>: %s</li>\n<li><b>Leave Type</b>: %s</li>\n<li><b>Time in hours</b>: %s</li>\n<li><b>Description</b>: %s</li>\n%s\n</ui>\n ', '    <p>Dear <b>%s</b></p><p>\n        For your attention:</p><p><b>%s</b> has %s your time-off leave cancellation.</p>\n<div style=\'padding-left:20px\'>\n<ui>\n<li><b>%s</b>: %s</li>\n<li><b>%s</b>: %s</li>\n<li><b>%s</b>: %s</li>\n<li><b>Leave Type</b>: %s</li>\n<li><b>Time in hours</b>: %s</li>\n<li><b>Description</b>: %s</li>\n%s\n</ui>\n ', 'Time-off cancellation rejected');
INSERT INTO emailnotification VALUES ('emLeaveApprovedOrRejectedStatus', '   <p>Dear <b>%s</b></p><p>\n        For your attention:</p><p><b>%s</b> has %s your time-off leave.</p>\n<div style=\'padding-left:20px\'>\n<ui>\n<li><b>%s</b>: %s</li>\n<li><b>%s</b>: %s</li>\n<li><b>%s</b>: %s</li>\n<li><b>Leave Type</b>: %s</li>\n<li><b>Time in hours</b>: %s</li>\n<li><b>Description</b>: %s</li>\n%s\n</ui>\n ', '   <p>Dear <b>%s</b></p><p>\n        For your attention:</p><p><b>%s</b> has %s your time-off leave.</p>\n<div style=\'padding-left:20px\'>\n<ui>\n<li><b>%s</b>: %s</li>\n<li><b>%s</b>: %s</li>\n<li><b>%s</b>: %s</li>\n<li><b>Leave Type</b>: %s</li>\n<li><b>Time in hours</b>: %s</li>\n<li><b>Description</b>: %s</li>\n%s\n</ui>\n ', 'Time-off request rejected');
INSERT INTO emailnotification VALUES ('emPendingLeaveCancellation', ' <p>Dear <b>%s</b></p><p>\n        For your attention:</p>\n<p><b>%s</b> has %s his/her time-off leave application which was pending approval. Please ignore the earlier request for approval relating to the details below.</p>\n<div style=\'padding-left:20px\'>\n<ui>\n<li><b>%s</b>: %s</li>\n<li><b>%s</b>: %s</li>\n<li><b>%s</b>: %s</li>\n<li><b>Leave Type</b>: %s</li>\n<li><b>Time in hours</b>: %s</li>\n<li><b>Description</b>: %s</li>\n%s\n</ui>\n ', ' <p>Dear <b>%s</b></p><p>\n        For your attention:</p>\n<p><b>%s</b> has %s his/her time-off leave application which was pending approval. Please ignore the earlier request for approval relating to the details below.</p>\n<div style=\'padding-left:20px\'>\n<ui>\n<li><b>%s</b>: %s</li>\n<li><b>%s</b>: %s</li>\n<li><b>%s</b>: %s</li>\n<li><b>Leave Type</b>: %s</li>\n<li><b>Time in hours</b>: %s</li>\n<li><b>Description</b>: %s</li>\n%s\n</ui>\n ', 'Time-off cancellation request submitted');
INSERT INTO emailnotification VALUES ('LeaveApplicationRequest', ' <p>Dear <b>%s</b></p><p>\n        For your attention:</p> <p><b>%s</b>\nhas %s leave application for your approval.</p>\n<p>The leave details are : </p> <div style=\'padding-left:20px\'>\n<ui><li><b>%s</b>: %s</li>\n<li><b>%s</b>: %s</li>\n<li><b>Leave Type</b>: %s</li>\n<li><b>Days</b>: %s</li>\n<li><b>Description</b>: %s </li>\n%s</ui>%s\n</div> ', ' <p>Dear <b>%s</b></p><p>\n        For your attention:</p> <p><b>%s</b>\nhas %s leave application for your approval.</p>\n<p>The leave details are : </p> <div style=\'padding-left:20px\'>\n<ui><li><b>%s</b>: %s</li>\n<li><b>%s</b>: %s</li>\n<li><b>Leave Type</b>: %s</li>\n<li><b>Days</b>: %s</li>\n<li><b>Description</b>: %s </li>\n%s</ui>%s\n</div>\n', 'Leave request submitted');
INSERT INTO emailnotification VALUES ('LeaveApprovalCancellationRequest', ' <p>Dear <b>%s</b></p><p>\n        For your attention:</p><p><b>%s</b> has %s leave cancellation for your approval.</p>\n<div style=\'padding-left:20px\'><table border=\'1\'>\n<tr><th>%s</th>\n<th>%s</th>\n<th>Leave Type</th>\n<th>Days</th>\n<th width=150>Description</th></tr>\n<tr>\n<td>%s</td>\n<td>%s</td>\n<td>%s</td>\n<td>%s</td>\n<td>%s</td>\n</tr></table>\n</div><br><p>%s</p></br>\n', ' <p>Dear <b>%s</b></p><p>\n        For your attention:</p><p><b>%s</b> has %s leave cancellation for your approval.</p>\n<div style=\'padding-left:20px\'><table border=\'1\'>\n<tr><th>%s</th>\n<th>%s</th>\n<th>Leave Type</th>\n<th>Days</th>\n<th width=150>Description</th></tr>\n<tr>\n<td>%s</td>\n<td>%s</td>\n<td>%s</td>\n<td>%s</td>\n<td>%s</td>\n</tr></table>\n</div><br><p>%s</p></br>\n\n', 'Cancellation leave approval request');
INSERT INTO emailnotification VALUES ('LeaveApprovalCancellationRequestApproved', ' <p>Dear <b>%s</b></p><p>\n        For your attention:</p><p><b>%s</b> has %s your leave cancellation.</p>\n<div style=\'padding-left:20px\'><table border=\'1\'>\n<tr><th>%s</th>\n<th>%s</th>\n<th>Leave Type</th>\n<th>Days</th>\n<th width=150>Description</th></tr>\n<tr>\n<td>%s</td>\n<td>%s</td>\n<td>%s</td>\n<td>%s</td>\n<td>%s</td>\n</tr></table>\n</div><br><p>%s</p></br>\n', ' <p>Dear <b>%s</b></p><p>\n        For your attention:</p><p><b>%s</b> has %s your leave cancellation.</p>\n<div style=\'padding-left:20px\'><table border=\'1\'>\n<tr><th>%s</th>\n<th>%s</th>\n<th>Leave Type</th>\n<th>Days</th>\n<th width=150>Description</th></tr>\n<tr>\n<td>%s</td>\n<td>%s</td>\n<td>%s</td>\n<td>%s</td>\n<td>%s</td>\n</tr></table>\n</div><br><p>%s</p></br>\n', 'Leave cancellation approved');
INSERT INTO emailnotification VALUES ('LeaveApprovalCancellationRequestRejected', '  <p>Dear <b>%s</b></p><p>\n        For your attention:</p><p><b>%s</b> has %s your leave cancellation.</p>\n<div style=\'padding-left:20px\'><table border=\'1\'>\n<tr><th>%s</th>\n<th>%s</th>\n<th>Leave Type</th>\n<th>Days</th>\n<th width=150>Description</th></tr>\n<tr>\n<td>%s</td>\n<td>%s</td>\n<td>%s</td>\n<td>%s</td>\n<td>%s</td>\n</tr></table>\n</div><br><p>%s</p></br>\n', ' <p>Dear <b>%s</b></p><p>\n        For your attention:</p><p><b>%s</b> has %s your leave cancellation.</p>\n<div style=\'padding-left:20px\'><table border=\'1\'>\n<tr><th>%s</th>\n<th>%s</th>\n<th>Leave Type</th>\n<th>Days</th>\n<th width=150>Description</th></tr>\n<tr>\n<td>%s</td>\n<td>%s</td>\n<td>%s</td>\n<td>%s</td>\n<td>%s</td>\n</tr></table>\n</div><br><p>%s</p></br>\n', 'Leave cancellation rejected');
INSERT INTO emailnotification VALUES ('LeaveApprovedOrRejectedStatus', ' <p>Dear <b>%s</b></p><p>\n        For your attention:</p><p><b>%s</b> has %s your leave.</p>\n<div style=\'padding-left:20px\'><table border=\'1\'>\n<tr><th>%s</th>\n<th>%s</th>\n<th>Leave Type</th>\n<th>Days</th>\n<th width=150>Description</th></tr>\n<tr>\n<td>%s</td>\n<td>%s</td>\n<td>%s</td>\n<td>%s</td>\n<td>%s</td>\n</tr></table>\n</div><br><p>%s</p></br>\n\n', ' <p>Dear <b>%s</b></p><p>\n        For your attention:</p><p><b>%s</b> has %s your leave.</p>\n<div style=\'padding-left:20px\'><table border=\'1\'>\n<tr><th>%s</th>\n<th>%s</th>\n<th>Leave Type</th>\n<th>Days</th>\n<th width=150>Description</th></tr>\n<tr>\n<td>%s</td>\n<td>%s</td>\n<td>%s</td>\n<td>%s</td>\n<td>%s</td>\n</tr></table>\n</div><br><p>%s</p></br>\n', 'Leave request rejected');
INSERT INTO emailnotification VALUES ('LeaveMailFormat', '  <p>Dear <b>%s</b></p><p>\nFor your attention:</p><p><b>%s</b> has %s.</p><p>The leave details are : </p>\n<div style=\'padding-left:20px\'>\n<ui>\n<li><b>%s</b>: %s</li>\n<li><b>%s</b>: %s</li>\n<li><b>Leave Type</b>: %s</li>\n<li><b>Days</b>: %s</li>\n<li><b>Description</b>: %s </li>\n%s</ui>\n%s\n</div>\n', '  <p>Dear <b>%s</b></p><p>\nFor your attention:</p><p><b>%s</b> has %s.</p><p>The leave details are : </p>\n<div style=\'padding-left:20px\'>\n<ui>\n<li><b>%s</b>: %s</li>\n<li><b>%s</b>: %s</li>\n<li><b>Leave Type</b>: %s</li>\n<li><b>Days</b>: %s</li>\n<li><b>Description</b>: %s </li>\n%s</ui>\n%s\n</div>\n', null);
INSERT INTO emailnotification VALUES ('PendingLeaveCancellation', ' <p>Dear <b>%s</b></p><p>\n        For your attention:</p><p><b>%s</b> has %s his/her leave application which was pending  approval. Please ignore the earlier request for approval relating to the details below.</p>\n<div style=\'padding-left:20px\'>\n<ui><li><b>%s</b>: %s</li>\n<li><b>%s</b>: %s</li>\n<li><b>Leave Type</b>: %s</li>\n<li><b>Days</b>: %s</li>\n<li><b>Description</b>: %s </li>\n%s</ui>\n', ' <p>Dear <b>%s</b></p><p>\n        For your attention:</p><p><b>%s</b> has %s his/her leave application which was pending  approval. Please ignore the earlier request for approval relating to the details below.</p>\n<div style=\'padding-left:20px\'>\n<ui><li><b>%s</b>: %s</li>\n<li><b>%s</b>: %s</li>\n<li><b>Leave Type</b>: %s</li>\n<li><b>Days</b>: %s</li>\n<li><b>Description</b>: %s </li>\n%s</ui>\n', 'Leave cancellation request');
INSERT INTO emailnotification VALUES ('RejectedLeaveApplicationCancelled', ' <p>Dear <b>%s</b></p>p><b>%s</b> has %s a cancelled rejected leave application.</p><p><b>The leave details are:</b></p>\n<div style=\'padding-left:20px\'><ui><li><b>%s</b>: %s</li>\n<li><b>%s</b>: %s</li>\n<li><b>Leave Type</b>: %s</li>\n<li><b>Days</b>: %s</li>\n<li><b>Description</b>: %s </li>\n%s</ui>\n', ' <p>Dear <b>%s</b></p>p><b>%s</b> has %s a cancelled rejected leave application.</p><p><b>The leave details are:</b></p>\n<div style=\'padding-left:20px\'><ui><li><b>%s</b>: %s</li>\n<li><b>%s</b>: %s</li>\n<li><b>Leave Type</b>: %s</li>\n<li><b>Days</b>: %s</li>\n<li><b>Description</b>: %s </li>\n%s</ui>\n', 'Rejected leave Application cancelled');
INSERT INTO emailnotification VALUES ('ResetPassword', 'You will be able to access eLeave application at <a href=\'%s\'>%s</a><p>When logging in for the first time, the following information is required:<p>\n\n\r\n\n\n <p>User ID :<strong>%s</strong></p> \n\n\r\n<p>Password :<strong>%s</strong></p>\n\n\n\n\r\n<p>For security purposes, you are advised to change your password ASAP. \r\nIn the event you forget your password or have problems logging in,\r\n please send an email request to: %s and your request will be addressed accordingly.</p>\r\n <p>Note: For authentication purposes, only requests from authorized email addresses will be entertained.</p>\r\n <p>For leave data enquiries, kindly refer to your local Human Resource department for clarification.</p>\r\n <p>For more information, a user manual is attached to this email.</p>\r\n <p>Regards</p>\r\n <p>eLeave Administrator</p>\r\n', 'You will be able to access eLeave application at <a href=\'%s\'>%s</a><p>When logging in for the first time, the following information is required:<p>\n\n\r\n\n\n <p>User ID :<strong>%s</strong></p> \n\n\r\n<p>Password :<strong>%s</strong></p>\n\n\n\n\r\n<p>For security purposes, you are advised to change your password ASAP. \r\nIn the event you forget your password or have problems logging in,\r\n please send an email request to: %s and your request will be addressed accordingly.</p>\r\n <p>Note: For authentication purposes, only requests from authorized email addresses will be entertained.</p>\r\n <p>For leave data enquiries, kindly refer to your local Human Resource department for clarification.</p>\r\n <p>For more information, a user manual is attached to this email.</p>\r\n <p>Regards</p>\r\n <p>eLeave Administrator</p>', 'Reset password');

-- ----------------------------
-- Table structure for `featurelist`
-- ----------------------------
DROP TABLE IF EXISTS `featurelist`;
CREATE TABLE `featurelist` (
  `featureid` int(11) NOT NULL,
  `featurename` varchar(50) character set latin1 NOT NULL,
  PRIMARY KEY  (`featureid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of featurelist
-- ----------------------------
INSERT INTO featurelist VALUES ('1', 'User');
INSERT INTO featurelist VALUES ('2', 'Community');
INSERT INTO featurelist VALUES ('3', 'Project');
INSERT INTO featurelist VALUES ('4', 'Company');
INSERT INTO featurelist VALUES ('5', 'Features');
INSERT INTO featurelist VALUES ('6', 'CRM_LEADS');
INSERT INTO featurelist VALUES ('7', 'CRM_ACCOUNT');
INSERT INTO featurelist VALUES ('8', 'CRM_OPPORTUNITY');
INSERT INTO featurelist VALUES ('9', 'CRM_CONTACTS');
INSERT INTO featurelist VALUES ('10', 'CRM_CAMPAIGN');
INSERT INTO featurelist VALUES ('11', 'TRIPS_ADMIN');

-- ----------------------------
-- Table structure for `filepath`
-- ----------------------------
DROP TABLE IF EXISTS `filepath`;
CREATE TABLE `filepath` (
  `nodeid` varchar(64) NOT NULL,
  `filepath` varchar(256) NOT NULL,
  KEY `fk2_filepath` (`nodeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of filepath
-- ----------------------------

-- ----------------------------
-- Table structure for `importlog`
-- ----------------------------
DROP TABLE IF EXISTS `importlog`;
CREATE TABLE `importlog` (
  `id` varchar(255) NOT NULL,
  `filename` varchar(255) default NULL,
  `storagename` varchar(255) default NULL,
  `type` varchar(255) default NULL,
  `log` varchar(255) default NULL,
  `totalrecs` int(11) default '0',
  `rejected` int(11) default '0',
  `module` varchar(255) NOT NULL,
  `user` varchar(255) NOT NULL,
  `company` varchar(255) NOT NULL,
  `temp_importdate` bigint(20) default NULL,
  `importdate` bigint(20) default NULL,
  `failureName` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of importlog
-- ----------------------------

-- ----------------------------
-- Table structure for `language`
-- ----------------------------
DROP TABLE IF EXISTS `language`;
CREATE TABLE `language` (
  `id` int(11) NOT NULL,
  `langcode` varchar(10) default NULL,
  `countrycode` varchar(10) default NULL,
  `langname` varchar(50) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of language
-- ----------------------------
INSERT INTO language VALUES ('1', 'en', 'US', 'English (United States)');
INSERT INTO language VALUES ('2', 'hi', 'IN', 'Hindi (India)');

-- ----------------------------
-- Table structure for `lm_alerts`
-- ----------------------------
DROP TABLE IF EXISTS `lm_alerts`;
CREATE TABLE `lm_alerts` (
  `id` int(11) NOT NULL auto_increment,
  `message` varchar(1024) NOT NULL default '',
  `userid` varchar(36) NOT NULL default '',
  `type` varchar(50) NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lm_alerts
-- ----------------------------

-- ----------------------------
-- Table structure for `lm_combo`
-- ----------------------------
DROP TABLE IF EXISTS `lm_combo`;
CREATE TABLE `lm_combo` (
  `id` int(12) NOT NULL auto_increment,
  `name` varchar(100) NOT NULL,
  `type` varchar(100) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lm_combo
-- ----------------------------
INSERT INTO lm_combo VALUES ('1', 'Select...', 'blank');
INSERT INTO lm_combo VALUES ('2', 'Approved', 'status');
INSERT INTO lm_combo VALUES ('3', 'Rejected', 'status');
INSERT INTO lm_combo VALUES ('4', 'Pending', 'status');
INSERT INTO lm_combo VALUES ('8', 'AM', 'ampm');
INSERT INTO lm_combo VALUES ('9', 'PM', 'ampm');
INSERT INTO lm_combo VALUES ('10', 'Cancellation Requested', 'status');
INSERT INTO lm_combo VALUES ('11', 'Cancellation Approved', 'status');
INSERT INTO lm_combo VALUES ('27', 'Unauthorized', 'status');
INSERT INTO lm_combo VALUES ('28', 'Emergency', 'leave');
INSERT INTO lm_combo VALUES ('29', 'Annual', 'leave');
INSERT INTO lm_combo VALUES ('30', 'Other', 'leave');
INSERT INTO lm_combo VALUES ('31', 'Medical', 'leave');
INSERT INTO lm_combo VALUES ('32', 'Personal', 'leave');
INSERT INTO lm_combo VALUES ('33', 'Official', 'leave');
INSERT INTO lm_combo VALUES ('34', 'Monthly', 'entitlementbasis');
INSERT INTO lm_combo VALUES ('35', 'Yearly', 'entitlementbasis');
INSERT INTO lm_combo VALUES ('36', 'Leave Types', 'entitlementrules');
INSERT INTO lm_combo VALUES ('37', 'Job Grades', 'entitlementrules');
INSERT INTO lm_combo VALUES ('38', 'Years of Service', 'entitlementrules');
INSERT INTO lm_combo VALUES ('39', 'Male', 'assignByGender');
INSERT INTO lm_combo VALUES ('40', 'Female', 'assignByGender');
INSERT INTO lm_combo VALUES ('41', 'All', 'assignByGender');
INSERT INTO lm_combo VALUES ('42', 'Active users', 'activeinactivecmb');
INSERT INTO lm_combo VALUES ('43', 'Inactive users', 'activeinactivecmb');
INSERT INTO lm_combo VALUES ('44', 'Deleted users', 'activeinactivecmb');

-- ----------------------------
-- Table structure for `lm_compoff`
-- ----------------------------
DROP TABLE IF EXISTS `lm_compoff`;
CREATE TABLE `lm_compoff` (
  `id` varchar(36) NOT NULL,
  `ondate` datetime NOT NULL,
  `companyid` varchar(36) NOT NULL,
  `creatorid` varchar(36) NOT NULL,
  `createdon` bigint(20) default NULL,
  `validperiod` int(12) default NULL,
  `remarks` varchar(1024) default NULL,
  `isexpire` tinyint(1) default '0',
  PRIMARY KEY  (`id`),
  KEY `companyid` (`companyid`),
  KEY `creatorid` (`creatorid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lm_compoff
-- ----------------------------

-- ----------------------------
-- Table structure for `lm_documents`
-- ----------------------------
DROP TABLE IF EXISTS `lm_documents`;
CREATE TABLE `lm_documents` (
  `id` varchar(36) character set latin1 NOT NULL default '',
  `name` varchar(100) character set latin1 NOT NULL default '',
  `storeindex` varchar(36) character set latin1 NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lm_documents
-- ----------------------------

-- ----------------------------
-- Table structure for `lm_emleaves`
-- ----------------------------
DROP TABLE IF EXISTS `lm_emleaves`;
CREATE TABLE `lm_emleaves` (
  `id` varchar(36) NOT NULL,
  `duration` double NOT NULL default '0',
  `description` varchar(1024) NOT NULL,
  `approverid` varchar(36) NOT NULL,
  `isarchived` tinyint(1) NOT NULL default '0',
  `createdby` varchar(36) NOT NULL,
  `statusid` int(12) NOT NULL,
  `remarks` varchar(1024) NOT NULL default '',
  `statusChangeon` bigint(20) default NULL,
  `createdon` bigint(20) default NULL,
  `ondate` bigint(20) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `lm_emleaves_ibfk_1` (`createdby`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='emergency leaves table';

-- ----------------------------
-- Records of lm_emleaves
-- ----------------------------

-- ----------------------------
-- Table structure for `lm_empleavemodel`
-- ----------------------------
DROP TABLE IF EXISTS `lm_empleavemodel`;
CREATE TABLE `lm_empleavemodel` (
  `id` int(12) NOT NULL auto_increment,
  `emptype` varchar(200) NOT NULL default '',
  `department` varchar(200) NOT NULL default '',
  `fromyear` double NOT NULL default '0',
  `toyear` double NOT NULL default '0',
  `timeoff` double NOT NULL,
  `companyid` varchar(36) NOT NULL,
  `type` int(5) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=552 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lm_empleavemodel
-- ----------------------------

-- ----------------------------
-- Table structure for `lm_empleavetypemap`
-- ----------------------------
DROP TABLE IF EXISTS `lm_empleavetypemap`;
CREATE TABLE `lm_empleavetypemap` (
  `emptypeid` int(12) NOT NULL,
  `leavetypeid` int(12) NOT NULL,
  `total` double NOT NULL,
  `lcfmax` double NOT NULL,
  `maxbalance` double NOT NULL,
  `status` tinyint(1) NOT NULL default '1',
  KEY `leavetypeid` (`leavetypeid`),
  CONSTRAINT `lm_empleavetypemap_ibfk_1` FOREIGN KEY (`leavetypeid`) REFERENCES `lm_leavetypes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lm_empleavetypemap
-- ----------------------------

-- ----------------------------
-- Table structure for `lm_leavedurationmap`
-- ----------------------------
DROP TABLE IF EXISTS `lm_leavedurationmap`;
CREATE TABLE `lm_leavedurationmap` (
  `leaveid` varchar(36) NOT NULL,
  `duration` double NOT NULL default '0',
  KEY `lm_leavedurationmap_ibfk_1` (`leaveid`),
  CONSTRAINT `lm_leavedurationmap_ibfk_1` FOREIGN KEY (`leaveid`) REFERENCES `lm_leaves` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lm_leavedurationmap
-- ----------------------------

-- ----------------------------
-- Table structure for `lm_leavepolicy`
-- ----------------------------
DROP TABLE IF EXISTS `lm_leavepolicy`;
CREATE TABLE `lm_leavepolicy` (
  `docid` varchar(36) NOT NULL default '',
  `docname` varchar(100) NOT NULL default '',
  `accumulatedby` varchar(50) NOT NULL,
  `companyyear` datetime NOT NULL,
  `docmaxsize` int(11) NOT NULL default '2',
  `companyid` varchar(36) NOT NULL,
  `minworkdays` int(11) NOT NULL default '0',
  `encashmax` double NOT NULL default '0',
  `entitledby` varchar(50) NOT NULL default '',
  `leavemodelby` varchar(50) NOT NULL default ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lm_leavepolicy
-- ----------------------------

-- ----------------------------
-- Table structure for `lm_leaves`
-- ----------------------------
DROP TABLE IF EXISTS `lm_leaves`;
CREATE TABLE `lm_leaves` (
  `id` varchar(36) NOT NULL,
  `name` varchar(100) default '',
  `fromdate` datetime NOT NULL,
  `todate` datetime NOT NULL,
  `description` varchar(1024) NOT NULL,
  `remarks` varchar(1024) NOT NULL default '',
  `type` int(12) NOT NULL,
  `createdby` varchar(36) NOT NULL,
  `statusid` int(12) NOT NULL,
  `isarchived` tinyint(1) NOT NULL default '0',
  `approverid` varchar(36) NOT NULL,
  `ampmid` int(12) NOT NULL default '99',
  `isoneday` tinyint(1) NOT NULL default '0',
  `altcontact` varchar(1024) NOT NULL default '',
  `groupid` varchar(36) NOT NULL default '',
  `isgroup` tinyint(1) NOT NULL default '0',
  `createdon` bigint(20) default NULL,
  `statusChangeon` bigint(20) default NULL,
  `firstdayhalf` tinyint(1) NOT NULL default '0',
  `lastdayhalf` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `statusid` (`statusid`),
  KEY `approverid` (`approverid`),
  KEY `createdby` (`createdby`),
  KEY `type` (`type`),
  CONSTRAINT `lm_leaves_ibfk_1` FOREIGN KEY (`statusid`) REFERENCES `lm_combo` (`id`),
  CONSTRAINT `lm_leaves_ibfk_2` FOREIGN KEY (`approverid`) REFERENCES `users` (`userid`),
  CONSTRAINT `lm_leaves_ibfk_3` FOREIGN KEY (`createdby`) REFERENCES `users` (`userid`),
  CONSTRAINT `lm_leaves_ibfk_4` FOREIGN KEY (`type`) REFERENCES `lm_leavetypes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='InnoDB free: 478208 kB';

-- ----------------------------
-- Records of lm_leaves
-- ----------------------------

-- ----------------------------
-- Table structure for `lm_leavestatus`
-- ----------------------------
DROP TABLE IF EXISTS `lm_leavestatus`;
CREATE TABLE `lm_leavestatus` (
  `leaveid` varchar(36) NOT NULL,
  `planned` int(1) NOT NULL default '0',
  `authorized` int(1) NOT NULL default '0',
  `paid` int(1) NOT NULL default '0',
  `duration` double NOT NULL default '0',
  `id` int(11) NOT NULL auto_increment,
  `fromdate` datetime NOT NULL,
  `todate` datetime NOT NULL,
  `unpaid_leaves` double NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `lm_leavestatus_ibfk_1` (`leaveid`),
  CONSTRAINT `lm_leavestatus_ibfk_1` FOREIGN KEY (`leaveid`) REFERENCES `lm_leaves` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4138 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lm_leavestatus
-- ----------------------------

-- ----------------------------
-- Table structure for `lm_leavetypes`
-- ----------------------------
DROP TABLE IF EXISTS `lm_leavetypes`;
CREATE TABLE `lm_leavetypes` (
  `id` int(12) NOT NULL auto_increment,
  `name` varchar(100) NOT NULL,
  `calculateby` int(12) NOT NULL,
  `isvisible` tinyint(1) NOT NULL,
  `companyid` varchar(36) NOT NULL,
  `locationid` varchar(36) NOT NULL,
  `entitlementbasis` int(3) unsigned NOT NULL,
  `entitlementrules` int(3) default NULL,
  `assignbygender` int(3) unsigned NOT NULL default '41',
  `Mandatorydays` int(12) default NULL,
  PRIMARY KEY  (`id`),
  KEY `copanyid` (`companyid`),
  KEY `locationid` (`locationid`)
) ENGINE=InnoDB AUTO_INCREMENT=482 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lm_leavetypes
-- ----------------------------
INSERT INTO lm_leavetypes VALUES ('-1', 'Compensatory Off', '0', '0', '', '', '0', null, '41', null);

-- ----------------------------
-- Table structure for `lm_leaveusermap`
-- ----------------------------
DROP TABLE IF EXISTS `lm_leaveusermap`;
CREATE TABLE `lm_leaveusermap` (
  `leaveid` varchar(36) NOT NULL,
  `userid` varchar(36) NOT NULL,
  KEY `leaveid` (`leaveid`),
  KEY `userid` (`userid`),
  CONSTRAINT `lm_leaveusermap_ibfk_1` FOREIGN KEY (`leaveid`) REFERENCES `lm_leaves` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `lm_leaveusermap_ibfk_2` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lm_leaveusermap
-- ----------------------------

-- ----------------------------
-- Table structure for `lm_roles`
-- ----------------------------
DROP TABLE IF EXISTS `lm_roles`;
CREATE TABLE `lm_roles` (
  `id` int(12) NOT NULL auto_increment,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lm_roles
-- ----------------------------
INSERT INTO lm_roles VALUES ('-99', 'Super Admin');
INSERT INTO lm_roles VALUES ('1', 'Administrator');
INSERT INTO lm_roles VALUES ('2', 'User');
INSERT INTO lm_roles VALUES ('3', 'Inactive User');
INSERT INTO lm_roles VALUES ('4', 'Project Manager');
INSERT INTO lm_roles VALUES ('5', 'HR');

-- ----------------------------
-- Table structure for `lm_userapprovermap`
-- ----------------------------
DROP TABLE IF EXISTS `lm_userapprovermap`;
CREATE TABLE `lm_userapprovermap` (
  `userid` varchar(36) NOT NULL,
  `approverid` varchar(36) NOT NULL,
  KEY `lm_userapprovermap_ibfk_1` (`userid`),
  KEY `lm_userapprovermap_ibfk_2` (`approverid`),
  CONSTRAINT `lm_userapprovermap_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `lm_userapprovermap_ibfk_2` FOREIGN KEY (`approverid`) REFERENCES `users` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lm_userapprovermap
-- ----------------------------

-- ----------------------------
-- Table structure for `lm_usercompoffmap`
-- ----------------------------
DROP TABLE IF EXISTS `lm_usercompoffmap`;
CREATE TABLE `lm_usercompoffmap` (
  `compoffid` varchar(36) NOT NULL,
  `userid` varchar(36) NOT NULL,
  `leaveid` varchar(36) default NULL,
  `istaken` tinyint(1) default '0',
  KEY `compoffid` (`compoffid`),
  KEY `userid` (`userid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lm_usercompoffmap
-- ----------------------------

-- ----------------------------
-- Table structure for `lm_userleaveadjustaudit`
-- ----------------------------
DROP TABLE IF EXISTS `lm_userleaveadjustaudit`;
CREATE TABLE `lm_userleaveadjustaudit` (
  `adjustfor` varchar(32) NOT NULL,
  `adjustby` varchar(32) NOT NULL,
  `ip` varchar(36) NOT NULL,
  `description` text NOT NULL,
  `changed` text NOT NULL,
  `userid` varchar(36) default NULL,
  `createdon` bigint(20) NOT NULL,
  KEY `ajusttrial_constraint` (`userid`),
  CONSTRAINT `ajusttrial_constraint` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lm_userleaveadjustaudit
-- ----------------------------

-- ----------------------------
-- Table structure for `lm_userleavedocmap`
-- ----------------------------
DROP TABLE IF EXISTS `lm_userleavedocmap`;
CREATE TABLE `lm_userleavedocmap` (
  `docid` varchar(36) NOT NULL default '',
  `leaveid` varchar(36) NOT NULL default '',
  `userid` varchar(36) NOT NULL default '',
  `doctypeid` varchar(36) character set utf8 NOT NULL default ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of lm_userleavedocmap
-- ----------------------------

-- ----------------------------
-- Table structure for `lm_userleavestatus`
-- ----------------------------
DROP TABLE IF EXISTS `lm_userleavestatus`;
CREATE TABLE `lm_userleavestatus` (
  `userid` varchar(36) NOT NULL,
  `leavetypeid` int(12) NOT NULL,
  `taken` double NOT NULL default '0',
  `lcf` double NOT NULL default '0',
  `adjust` double NOT NULL default '0',
  `cfdone` int(1) NOT NULL default '0',
  PRIMARY KEY  (`userid`,`leavetypeid`),
  KEY `lm_userleavestatus_ibfk_2` (`userid`),
  KEY `leavetypeid` (`leavetypeid`),
  CONSTRAINT `lm_userleavestatus_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `lm_userleavestatus_ibfk_2` FOREIGN KEY (`leavetypeid`) REFERENCES `lm_leavetypes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lm_userleavestatus
-- ----------------------------

-- ----------------------------
-- Table structure for `lm_userleavestatusmap`
-- ----------------------------
DROP TABLE IF EXISTS `lm_userleavestatusmap`;
CREATE TABLE `lm_userleavestatusmap` (
  `statusid` varchar(36) NOT NULL,
  `userid` varchar(36) NOT NULL,
  `leavetypeid` int(12) NOT NULL,
  PRIMARY KEY  (`statusid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of lm_userleavestatusmap
-- ----------------------------

-- ----------------------------
-- Table structure for `lm_userrolemap`
-- ----------------------------
DROP TABLE IF EXISTS `lm_userrolemap`;
CREATE TABLE `lm_userrolemap` (
  `roleid` int(12) NOT NULL,
  `userid` varchar(36) NOT NULL,
  KEY `lm_userrolemap_ibfk_1` (`userid`),
  KEY `lm_userrolemap_ibfk_2` (`roleid`),
  CONSTRAINT `lm_userrolemap_ibfk_1` FOREIGN KEY (`roleid`) REFERENCES `lm_roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `lm_userrolemap_ibfk_2` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lm_userrolemap
-- ----------------------------

-- ----------------------------
-- Table structure for `planedition`
-- ----------------------------
DROP TABLE IF EXISTS `planedition`;
CREATE TABLE `planedition` (
  `planid` int(11) NOT NULL auto_increment,
  `planname` varchar(50) NOT NULL default '',
  `costperuser` int(11) NOT NULL default '0',
  `costperproject` int(11) NOT NULL default '0',
  `costpercommunity` int(11) NOT NULL default '0',
  `validationperiod` int(11) NOT NULL default '30',
  `subscriptioncost` int(11) NOT NULL default '0',
  PRIMARY KEY  (`planid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of planedition
-- ----------------------------
INSERT INTO planedition VALUES ('1', 'Standard', '1', '5', '5', '-1', '20');
INSERT INTO planedition VALUES ('2', 'Trial', '-1', '-1', '-1', '30', '0');
INSERT INTO planedition VALUES ('3', 'Pro', '0', '0', '0', '-1', '20');
INSERT INTO planedition VALUES ('4', 'Premium', '0', '0', '0', '-1', '20');
INSERT INTO planedition VALUES ('5', 'Custom', '1', '5', '0', '30', '0');

-- ----------------------------
-- Table structure for `projreport_template`
-- ----------------------------
DROP TABLE IF EXISTS `projreport_template`;
CREATE TABLE `projreport_template` (
  `tempid` varchar(255) NOT NULL,
  `tempname` varchar(40) default NULL,
  `description` varchar(40) default NULL,
  `configstr` longtext,
  `userid` varchar(255) default NULL,
  `deleteflag` int(11) default NULL,
  PRIMARY KEY  (`tempid`),
  KEY `projectreport_constraint` (`userid`),
  CONSTRAINT `projectreport_constraint` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of projreport_template
-- ----------------------------
INSERT INTO projreport_template VALUES ('-1', 'Default_Template', null, '{\"landscape\":\"true\",\"pageBorder\":\"true\",\"gridBorder\":\"true\",\"title\":\"$NAME\",\"subtitles\":\"\",\"headNote\":\"$COMPNAME\",\"showLogo\":\"true\",\"headDate\":\"true\",\"footDate\":\"false\",\"footPager\":\"true\",\"headPager\":\"false\",\"footNote\":\"$NAME\",\"textColor\":\"000000\",\"bgColor\":\"FFFFFF\"}', null, null);

-- ----------------------------
-- Table structure for `references`
-- ----------------------------
DROP TABLE IF EXISTS `references`;
CREATE TABLE `references` (
  `userid` varchar(36) NOT NULL,
  `refid` varchar(8) NOT NULL,
  `numberofref` int(8) NOT NULL default '0',
  `emailid` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of references
-- ----------------------------

-- ----------------------------
-- Table structure for `resetpwd`
-- ----------------------------
DROP TABLE IF EXISTS `resetpwd`;
CREATE TABLE `resetpwd` (
  `userid` varchar(36) NOT NULL,
  `genid` varchar(50) NOT NULL,
  `actiontime` bigint(20) NOT NULL,
  KEY `userid` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of resetpwd
-- ----------------------------

-- ----------------------------
-- Table structure for `roletemplates`
-- ----------------------------
DROP TABLE IF EXISTS `roletemplates`;
CREATE TABLE `roletemplates` (
  `roletypeid` int(11) NOT NULL,
  `featureid` int(11) NOT NULL,
  `permissions` int(11) NOT NULL,
  KEY `roletypeid` (`roletypeid`),
  KEY `featureid` (`featureid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of roletemplates
-- ----------------------------

-- ----------------------------
-- Table structure for `roletype`
-- ----------------------------
DROP TABLE IF EXISTS `roletype`;
CREATE TABLE `roletype` (
  `roletypeid` int(11) NOT NULL auto_increment,
  `roletype` varchar(50) NOT NULL,
  PRIMARY KEY  (`roletypeid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of roletype
-- ----------------------------
INSERT INTO roletype VALUES ('1', 'Test');

-- ----------------------------
-- Table structure for `seed`
-- ----------------------------
DROP TABLE IF EXISTS `seed`;
CREATE TABLE `seed` (
  `seedid` int(11) NOT NULL auto_increment,
  `seedval` varchar(32) NOT NULL,
  PRIMARY KEY  (`seedid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of seed
-- ----------------------------

-- ----------------------------
-- Table structure for `subscriptionmap`
-- ----------------------------
DROP TABLE IF EXISTS `subscriptionmap`;
CREATE TABLE `subscriptionmap` (
  `companyid` varchar(36) NOT NULL default '',
  `token` varchar(36) NOT NULL default '',
  KEY `companyid` (`companyid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of subscriptionmap
-- ----------------------------

-- ----------------------------
-- Table structure for `superadmin`
-- ----------------------------
DROP TABLE IF EXISTS `superadmin`;
CREATE TABLE `superadmin` (
  `id` int(4) NOT NULL auto_increment,
  `userid` varchar(36) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of superadmin
-- ----------------------------

-- ----------------------------
-- Table structure for `suuser`
-- ----------------------------
DROP TABLE IF EXISTS `suuser`;
CREATE TABLE `suuser` (
  `sauserid` varchar(36) NOT NULL,
  `sausername` varchar(50) NOT NULL,
  `plainpass` varchar(50) NOT NULL,
  `password` varchar(32) NOT NULL,
  `authkey` varchar(36) NOT NULL,
  `lastactivitydate` bigint(20) default NULL,
  PRIMARY KEY  (`sauserid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of suuser
-- ----------------------------

-- ----------------------------
-- Table structure for `suusercompanymap`
-- ----------------------------
DROP TABLE IF EXISTS `suusercompanymap`;
CREATE TABLE `suusercompanymap` (
  `sauserid` varchar(36) NOT NULL,
  `companyid` varchar(36) NOT NULL,
  KEY `sauserid` (`sauserid`),
  KEY `companyid` (`companyid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of suusercompanymap
-- ----------------------------

-- ----------------------------
-- Table structure for `temp`
-- ----------------------------
DROP TABLE IF EXISTS `temp`;
CREATE TABLE `temp` (
  `eid` varchar(50) NOT NULL,
  `cid` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of temp
-- ----------------------------

-- ----------------------------
-- Table structure for `timezone`
-- ----------------------------
DROP TABLE IF EXISTS `timezone`;
CREATE TABLE `timezone` (
  `id` varchar(10) default NULL,
  `name` varchar(200) default NULL,
  `difference` varchar(32) default NULL,
  `sname` varchar(32) default NULL,
  `sortorder` int(11) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of timezone
-- ----------------------------
INSERT INTO timezone VALUES ('2', '(GMT-11:00) Midway', '-11:00', 'MST', '2');
INSERT INTO timezone VALUES ('1', '(GMT-11:00) Apia', '-11:00', 'IST', '1');
INSERT INTO timezone VALUES ('3', '(GMT-11:00) Niue', '-11:00', 'AST', '3');
INSERT INTO timezone VALUES ('4', '(GMT-11:00) Pago Pago', '-11:00', 'WIT', '4');
INSERT INTO timezone VALUES ('5', '(GMT-10:00) Fakaofo', '-10:00', 'BST', '5');
INSERT INTO timezone VALUES ('6', '(GMT-10:00) Hawaii Time', '-10:00', 'PKST', '6');
INSERT INTO timezone VALUES ('7', '(GMT-10:00) Johnston', '-10:00', 'EST', '7');
INSERT INTO timezone VALUES ('8', '(GMT-10:00) Rarotonga', '-10:00', 'GST', '8');
INSERT INTO timezone VALUES ('9', '(GMT-10:00) Tahiti', '-10:00', 'NZDT', '9');
INSERT INTO timezone VALUES ('10', '(GMT-09:30) Marquesas', '-09:30', 'SGT', '10');
INSERT INTO timezone VALUES ('11', '(GMT-09:00) Alaska Time', '-09:00', 'ICT', '11');
INSERT INTO timezone VALUES ('12', '(GMT-09:00) Gambier', '-09:00', 'WAT', '12');
INSERT INTO timezone VALUES ('13', '(GMT-08:00) Pacific Time', '-08:00', 'MIT', '13');
INSERT INTO timezone VALUES ('14', '(GMT-08:00) Pacific Time - Tijuana', '-08:00', 'EDT', '14');
INSERT INTO timezone VALUES ('15', '(GMT-08:00) Pacific Time - Vancouver', '-08:00', 'HKT', '15');
INSERT INTO timezone VALUES ('16', '(GMT-08:00) Pacific Time - Whitehorse', '-08:00', 'BDT', '16');
INSERT INTO timezone VALUES ('17', '(GMT-08:00) Pitcairn', '-08:00', 'AST', '17');
INSERT INTO timezone VALUES ('18', '(GMT-07:00) Mountain Time - Dawson Creek', '-07:00', 'PHT', '18');
INSERT INTO timezone VALUES ('19', '(GMT-07:00) Mountain Time (America/Denver)', '-07:00', 'AST', '19');
INSERT INTO timezone VALUES ('20', '(GMT-07:00) Mountain Time - Edmonton', '-07:00', 'IRST', '20');
INSERT INTO timezone VALUES ('21', '(GMT-07:00) Mountain Time - Hermosillo', '-07:00', 'CAT', '21');
INSERT INTO timezone VALUES ('23', '(GMT-07:00) Mountain Time - Arizona', '-07:00', 'EDT', '23');
INSERT INTO timezone VALUES ('22', '(GMT-07:00) Mountain Time - Chihuahua, Mazatlan', '-07:00', 'CEST', '22');
INSERT INTO timezone VALUES ('24', '(GMT-07:00) Mountain Time - Yellowknife', '-07:00', 'PT', '24');
INSERT INTO timezone VALUES ('25', '(GMT-06:00) Belize', '-06:00', 'MT', '25');
INSERT INTO timezone VALUES ('26', '(GMT-06:00) Central Time', '-06:00', 'CT', '26');
INSERT INTO timezone VALUES ('27', '(GMT-06:00) Costa Rica', '-06:00', 'ET', '27');
INSERT INTO timezone VALUES ('28', '(GMT-06:00) El Salvador', '-06:00', 'AT', '28');
INSERT INTO timezone VALUES ('29', '(GMT-06:00) Guatemala', '-06:00', 'NST', '29');
INSERT INTO timezone VALUES ('30', '(GMT-06:00) Managua', '-06:00', null, '30');
INSERT INTO timezone VALUES ('31', '(GMT-06:00) Central Time - Mexico City', '-06:00', null, '31');
INSERT INTO timezone VALUES ('32', '(GMT-06:00) Central Time - Regina', '-06:00', null, '32');
INSERT INTO timezone VALUES ('33', '(GMT-06:00) Central Time (America/Tegucigalpa)', '-06:00', null, '33');
INSERT INTO timezone VALUES ('34', '(GMT-06:00) Central Time - Winnipeg', '-06:00', null, '34');
INSERT INTO timezone VALUES ('35', '(GMT-06:00) Easter Island', '-06:00', null, '35');
INSERT INTO timezone VALUES ('36', '(GMT-06:00) Galapagos', '-06:00', null, '36');
INSERT INTO timezone VALUES ('37', '(GMT-05:00) Bogota', '-05:00', null, '37');
INSERT INTO timezone VALUES ('38', '(GMT-05:00) Cayman', '-05:00', null, '38');
INSERT INTO timezone VALUES ('39', '(GMT-05:00) Grand Turk', '-05:00', null, '39');
INSERT INTO timezone VALUES ('40', '(GMT-05:00) Guayaquil', '-05:00', null, '40');
INSERT INTO timezone VALUES ('41', '(GMT-05:00) Havana', '-05:00', null, '41');
INSERT INTO timezone VALUES ('42', '(GMT-05:00) Eastern Time - Iqaluit', '-05:00', null, '42');
INSERT INTO timezone VALUES ('43', '(GMT-05:00) Jamaica', '-05:00', null, '43');
INSERT INTO timezone VALUES ('44', '(GMT-05:00) Lima', '-05:00', null, '44');
INSERT INTO timezone VALUES ('45', '(GMT-05:00) Eastern Time - Montreal', '-05:00', null, '45');
INSERT INTO timezone VALUES ('46', '(GMT-05:00) Nassau', '-05:00', null, '46');
INSERT INTO timezone VALUES ('47', '(GMT-05:00) Eastern Time', '-05:00', null, '47');
INSERT INTO timezone VALUES ('48', '(GMT-05:00) Panama', '-05:00', null, '48');
INSERT INTO timezone VALUES ('49', '(GMT-05:00) Port-au-Prince', '-05:00', null, '49');
INSERT INTO timezone VALUES ('50', '(GMT-05:00) Eastern Time - Toronto', '-05:00', null, '50');
INSERT INTO timezone VALUES ('51', '(GMT-04:30) Caracas', '-04:30', null, '51');
INSERT INTO timezone VALUES ('52', '(GMT-04:00) Anguilla', '-04:00', null, '52');
INSERT INTO timezone VALUES ('53', '(GMT-04:00) Antigua', '-04:00', null, '53');
INSERT INTO timezone VALUES ('54', '(GMT-04:00) Aruba', '-04:00', null, '54');
INSERT INTO timezone VALUES ('55', '(GMT-04:00) Asuncion', '-04:00', null, '55');
INSERT INTO timezone VALUES ('56', '(GMT-04:00) Barbados', '-04:00', null, '56');
INSERT INTO timezone VALUES ('57', '(GMT-04:00) Boa Vista', '-04:00', null, '57');
INSERT INTO timezone VALUES ('58', '(GMT-04:00) Campo Grande', '-04:00', null, '58');
INSERT INTO timezone VALUES ('59', '(GMT-04:00) Cuiaba', '-04:00', null, '59');
INSERT INTO timezone VALUES ('60', '(GMT-04:00) Curacao', '-04:00', null, '60');
INSERT INTO timezone VALUES ('61', '(GMT-04:00) Dominica', '-04:00', null, '61');
INSERT INTO timezone VALUES ('62', '(GMT-04:00) Grenada', '-04:00', null, '62');
INSERT INTO timezone VALUES ('63', '(GMT-04:00) Guadeloupe', '-04:00', null, '63');
INSERT INTO timezone VALUES ('64', '(GMT-04:00) Guyana', '-04:00', null, '64');
INSERT INTO timezone VALUES ('65', '(GMT-04:00) Atlantic Time - Halifax', '-04:00', null, '65');
INSERT INTO timezone VALUES ('66', '(GMT-04:00) La Paz', '-04:00', null, '66');
INSERT INTO timezone VALUES ('67', '(GMT-04:00) Manaus', '-04:00', null, '67');
INSERT INTO timezone VALUES ('68', '(GMT-04:00) Martinique', '-04:00', null, '68');
INSERT INTO timezone VALUES ('69', '(GMT-04:00) Montserrat', '-04:00', null, '69');
INSERT INTO timezone VALUES ('70', '(GMT-04:00) Port of Spain', '-04:00', null, '70');
INSERT INTO timezone VALUES ('71', '(GMT-04:00) Porto Velho', '-04:00', null, '71');
INSERT INTO timezone VALUES ('72', '(GMT-04:00) Puerto Rico', '-04:00', null, '72');
INSERT INTO timezone VALUES ('73', '(GMT-04:00) Rio Branco', '-04:00', null, '73');
INSERT INTO timezone VALUES ('74', '(GMT-04:00) Santiago', '-04:00', null, '74');
INSERT INTO timezone VALUES ('75', '(GMT-04:00) Santo Domingo', '-04:00', null, '75');
INSERT INTO timezone VALUES ('76', '(GMT-04:00) St. Kitts', '-04:00', null, '76');
INSERT INTO timezone VALUES ('77', '(GMT-04:00) St. Lucia', '-04:00', null, '77');
INSERT INTO timezone VALUES ('78', '(GMT-04:00) St. Thomas', '-04:00', null, '78');
INSERT INTO timezone VALUES ('79', '(GMT-04:00) St. Vincent', '-04:00', null, '79');
INSERT INTO timezone VALUES ('80', '(GMT-04:00) Thule', '-04:00', null, '80');
INSERT INTO timezone VALUES ('81', '(GMT-04:00) Tortola', '-04:00', null, '81');
INSERT INTO timezone VALUES ('82', '(GMT-04:00) Palmer', '-04:00', null, '82');
INSERT INTO timezone VALUES ('83', '(GMT-04:00) Bermuda', '-04:00', null, '83');
INSERT INTO timezone VALUES ('84', '(GMT-04:00) Stanley', '-04:00', null, '84');
INSERT INTO timezone VALUES ('85', '(GMT-03:30) Newfoundland Time - St. Johns', '-03:30', null, '85');
INSERT INTO timezone VALUES ('86', '(GMT-03:00) Araguaina', '-03:00', null, '86');
INSERT INTO timezone VALUES ('87', '(GMT-03:00) Buenos Aires', '-03:00', null, '87');
INSERT INTO timezone VALUES ('88', '(GMT-03:00) Salvador', '-03:00', null, '88');
INSERT INTO timezone VALUES ('89', '(GMT-03:00) Belem', '-03:00', null, '89');
INSERT INTO timezone VALUES ('90', '(GMT-03:00) Cayenne', '-03:00', null, '90');
INSERT INTO timezone VALUES ('91', '(GMT-03:00) Fortaleza', '-03:00', null, '91');
INSERT INTO timezone VALUES ('92', '(GMT-03:00) Godthab', '-03:00', null, '92');
INSERT INTO timezone VALUES ('93', '(GMT-03:00) Maceio', '-03:00', null, '93');
INSERT INTO timezone VALUES ('94', '(GMT-03:00) Miquelon', '-03:00', null, '94');
INSERT INTO timezone VALUES ('95', '(GMT-03:00) Montevideo', '-03:00', null, '95');
INSERT INTO timezone VALUES ('96', '(GMT-03:00) Paramaribo', '-03:00', null, '96');
INSERT INTO timezone VALUES ('97', '(GMT-03:00) Recife', '-03:00', null, '97');
INSERT INTO timezone VALUES ('98', '(GMT-03:00) Sao Paulo', '-03:00', null, '98');
INSERT INTO timezone VALUES ('99', '(GMT-03:00) Rothera', '-03:00', null, '99');
INSERT INTO timezone VALUES ('100', '(GMT-02:00) Noronha', '-02:00', null, '100');
INSERT INTO timezone VALUES ('101', '(GMT-02:00) South Georgia', '-02:00', null, '101');
INSERT INTO timezone VALUES ('102', '(GMT-01:00) Scoresbysund', '-01:00', null, '102');
INSERT INTO timezone VALUES ('103', '(GMT-01:00) Azores', '-01:00', null, '103');
INSERT INTO timezone VALUES ('104', '(GMT-01:00) Cape Verde', '-01:00', null, '104');
INSERT INTO timezone VALUES ('105', '(GMT+00:00) Abidjan', '+00:00', null, '105');
INSERT INTO timezone VALUES ('106', '(GMT+00:00) Accra', '+00:00', null, '106');
INSERT INTO timezone VALUES ('107', '(GMT+00:00) Bamako', '+00:00', null, '107');
INSERT INTO timezone VALUES ('108', '(GMT+00:00) Banjul', '+00:00', null, '108');
INSERT INTO timezone VALUES ('109', '(GMT+00:00) Bissau', '+00:00', null, '109');
INSERT INTO timezone VALUES ('110', '(GMT+00:00) Casablanca', '+00:00', null, '110');
INSERT INTO timezone VALUES ('111', '(GMT+00:00) Conakry', '+00:00', null, '111');
INSERT INTO timezone VALUES ('112', '(GMT+00:00) Dakar', '+00:00', null, '112');
INSERT INTO timezone VALUES ('113', '(GMT+00:00) El Aaiun', '+00:00', null, '113');
INSERT INTO timezone VALUES ('114', '(GMT+00:00) Freetown', '+00:00', null, '114');
INSERT INTO timezone VALUES ('115', '(GMT+00:00) Lome', '+00:00', null, '115');
INSERT INTO timezone VALUES ('116', '(GMT+00:00) Monrovia', '+00:00', null, '116');
INSERT INTO timezone VALUES ('117', '(GMT+00:00) Nouakchott', '+00:00', null, '117');
INSERT INTO timezone VALUES ('118', '(GMT+00:00) Ouagadougou', '+00:00', null, '118');
INSERT INTO timezone VALUES ('119', '(GMT+00:00) Sao Tome', '+00:00', null, '119');
INSERT INTO timezone VALUES ('120', '(GMT+00:00) Danmarkshavn', '+00:00', null, '120');
INSERT INTO timezone VALUES ('121', '(GMT+00:00) Canary Islands', '+00:00', null, '121');
INSERT INTO timezone VALUES ('122', '(GMT+00:00) Faeroe', '+00:00', null, '122');
INSERT INTO timezone VALUES ('123', '(GMT+00:00) Reykjavik', '+00:00', null, '123');
INSERT INTO timezone VALUES ('124', '(GMT+00:00) St Helena', '+00:00', null, '124');
INSERT INTO timezone VALUES ('125', '(GMT+00:00) GMT (no daylight saving)', '+00:00', null, '125');
INSERT INTO timezone VALUES ('126', '(GMT+00:00) Dublin', '+00:00', null, '126');
INSERT INTO timezone VALUES ('127', '(GMT+00:00) Lisbon', '+00:00', null, '127');
INSERT INTO timezone VALUES ('128', '(GMT+00:00) London', '+00:00', null, '128');
INSERT INTO timezone VALUES ('129', '(GMT+01:00) Algiers', '+01:00', null, '129');
INSERT INTO timezone VALUES ('130', '(GMT+01:00) Bangui', '+01:00', null, '130');
INSERT INTO timezone VALUES ('131', '(GMT+01:00) Brazzaville', '+01:00', null, '131');
INSERT INTO timezone VALUES ('132', '(GMT+01:00) Ceuta', '+01:00', null, '132');
INSERT INTO timezone VALUES ('133', '(GMT+01:00) Douala', '+01:00', null, '133');
INSERT INTO timezone VALUES ('134', '(GMT+01:00) Kinshasa', '+01:00', null, '134');
INSERT INTO timezone VALUES ('135', '(GMT+01:00) Lagos', '+01:00', null, '135');
INSERT INTO timezone VALUES ('136', '(GMT+01:00) Libreville', '+01:00', null, '136');
INSERT INTO timezone VALUES ('137', '(GMT+01:00) Luanda', '+01:00', null, '137');
INSERT INTO timezone VALUES ('138', '(GMT+01:00) Malabo', '+01:00', null, '138');
INSERT INTO timezone VALUES ('139', '(GMT+01:00) Ndjamena', '+01:00', null, '139');
INSERT INTO timezone VALUES ('140', '(GMT+01:00) Niamey', '+01:00', null, '140');
INSERT INTO timezone VALUES ('141', '(GMT+01:00) Porto-Novo', '+01:00', null, '141');
INSERT INTO timezone VALUES ('142', '(GMT+01:00) Tunis', '+01:00', null, '142');
INSERT INTO timezone VALUES ('143', '(GMT+01:00) Windhoek', '+01:00', null, '143');
INSERT INTO timezone VALUES ('144', '(GMT+01:00) Amsterdam', '+01:00', null, '144');
INSERT INTO timezone VALUES ('145', '(GMT+01:00) Andorra', '+01:00', null, '145');
INSERT INTO timezone VALUES ('146', '(GMT+01:00) Central European Time (Europe/Belgrade)', '+01:00', null, '146');
INSERT INTO timezone VALUES ('147', '(GMT+01:00) Berlin', '+01:00', null, '147');
INSERT INTO timezone VALUES ('148', '(GMT+01:00) Brussels', '+01:00', null, '148');
INSERT INTO timezone VALUES ('149', '(GMT+01:00) Budapest', '+01:00', null, '149');
INSERT INTO timezone VALUES ('150', '(GMT+01:00) Copenhagen', '+01:00', null, '150');
INSERT INTO timezone VALUES ('151', '(GMT+01:00) Gibraltar', '+01:00', null, '151');
INSERT INTO timezone VALUES ('152', '(GMT+01:00) Luxembourg', '+01:00', null, '152');
INSERT INTO timezone VALUES ('153', '(GMT+01:00) Madrid', '+01:00', null, '153');
INSERT INTO timezone VALUES ('154', '(GMT+01:00) Malta', '+01:00', null, '154');
INSERT INTO timezone VALUES ('155', '(GMT+01:00) Monaco', '+01:00', null, '155');
INSERT INTO timezone VALUES ('156', '(GMT+01:00) Oslo', '+01:00', null, '156');
INSERT INTO timezone VALUES ('157', '(GMT+01:00) Paris', '+01:00', null, '157');
INSERT INTO timezone VALUES ('158', '(GMT+01:00) Central European Time (Europe/Prague)', '+01:00', null, '158');
INSERT INTO timezone VALUES ('159', '(GMT+01:00) Rome', '+01:00', null, '159');
INSERT INTO timezone VALUES ('160', '(GMT+01:00) Stockholm', '+01:00', null, '160');
INSERT INTO timezone VALUES ('161', '(GMT+01:00) Tirane', '+01:00', null, '161');
INSERT INTO timezone VALUES ('162', '(GMT+01:00) Vaduz', '+01:00', null, '162');
INSERT INTO timezone VALUES ('163', '(GMT+01:00) Vienna', '+01:00', null, '163');
INSERT INTO timezone VALUES ('164', '(GMT+01:00) Warsaw', '+01:00', null, '164');
INSERT INTO timezone VALUES ('165', '(GMT+01:00) Zurich', '+01:00', null, '165');
INSERT INTO timezone VALUES ('166', '(GMT+02:00) Blantyre', '+02:00', null, '166');
INSERT INTO timezone VALUES ('167', '(GMT+02:00) Bujumbura', '+02:00', null, '167');
INSERT INTO timezone VALUES ('168', '(GMT+02:00) Cairo', '+02:00', null, '168');
INSERT INTO timezone VALUES ('169', '(GMT+02:00) Gaborone', '+02:00', null, '169');
INSERT INTO timezone VALUES ('170', '(GMT+02:00) Harare', '+02:00', null, '170');
INSERT INTO timezone VALUES ('171', '(GMT+02:00) Johannesburg', '+02:00', null, '171');
INSERT INTO timezone VALUES ('172', '(GMT+02:00) Kigali', '+02:00', null, '172');
INSERT INTO timezone VALUES ('173', '(GMT+02:00) Lubumbashi', '+02:00', null, '173');
INSERT INTO timezone VALUES ('174', '(GMT+02:00) Lusaka', '+02:00', null, '174');
INSERT INTO timezone VALUES ('175', '(GMT+02:00) Maputo', '+02:00', null, '175');
INSERT INTO timezone VALUES ('176', '(GMT+02:00) Maseru', '+02:00', null, '176');
INSERT INTO timezone VALUES ('177', '(GMT+02:00) Mbabane', '+02:00', null, '177');
INSERT INTO timezone VALUES ('178', '(GMT+02:00) Tripoli', '+02:00', null, '178');
INSERT INTO timezone VALUES ('179', '(GMT+02:00) Amman', '+02:00', null, '179');
INSERT INTO timezone VALUES ('180', '(GMT+02:00) Beirut', '+02:00', null, '180');
INSERT INTO timezone VALUES ('181', '(GMT+02:00) Damascus', '+02:00', null, '181');
INSERT INTO timezone VALUES ('182', '(GMT+02:00) Gaza', '+02:00', null, '182');
INSERT INTO timezone VALUES ('183', '(GMT+02:00) Jerusalem', '+02:00', null, '183');
INSERT INTO timezone VALUES ('184', '(GMT+02:00) Nicosia', '+02:00', null, '184');
INSERT INTO timezone VALUES ('185', '(GMT+02:00) Athens', '+02:00', null, '185');
INSERT INTO timezone VALUES ('186', '(GMT+02:00) Bucharest', '+02:00', null, '186');
INSERT INTO timezone VALUES ('187', '(GMT+02:00) Chisinau', '+02:00', null, '187');
INSERT INTO timezone VALUES ('188', '(GMT+02:00) Helsinki', '+02:00', null, '188');
INSERT INTO timezone VALUES ('189', '(GMT+02:00) Istanbul', '+02:00', null, '189');
INSERT INTO timezone VALUES ('190', '(GMT+02:00) Moscow-01 - Kaliningrad', '+02:00', null, '190');
INSERT INTO timezone VALUES ('191', '(GMT+02:00) Kiev', '+02:00', null, '191');
INSERT INTO timezone VALUES ('192', '(GMT+02:00) Minsk', '+02:00', null, '192');
INSERT INTO timezone VALUES ('193', '(GMT+02:00) Riga', '+02:00', null, '193');
INSERT INTO timezone VALUES ('194', '(GMT+02:00) Sofia', '+02:00', null, '194');
INSERT INTO timezone VALUES ('195', '(GMT+02:00) Tallinn', '+02:00', null, '195');
INSERT INTO timezone VALUES ('196', '(GMT+02:00) Vilnius', '+02:00', null, '196');
INSERT INTO timezone VALUES ('197', '(GMT+03:00) Addis Ababa', '+03:00', null, '197');
INSERT INTO timezone VALUES ('198', '(GMT+03:00) Asmera', '+03:00', null, '198');
INSERT INTO timezone VALUES ('199', '(GMT+03:00) Dar es Salaam', '+03:00', null, '199');
INSERT INTO timezone VALUES ('200', '(GMT+03:00) Djibouti', '+03:00', null, '200');
INSERT INTO timezone VALUES ('201', '(GMT+03:00) Kampala', '+03:00', null, '201');
INSERT INTO timezone VALUES ('202', '(GMT+03:00) Khartoum', '+03:00', null, '202');
INSERT INTO timezone VALUES ('203', '(GMT+03:00) Mogadishu', '+03:00', null, '203');
INSERT INTO timezone VALUES ('204', '(GMT+03:00) Nairobi', '+03:00', null, '204');
INSERT INTO timezone VALUES ('205', '(GMT+03:00) Syowa', '+03:00', null, '205');
INSERT INTO timezone VALUES ('206', '(GMT+03:00) Aden', '+03:00', null, '206');
INSERT INTO timezone VALUES ('207', '(GMT+03:00) Baghdad', '+03:00', null, '207');
INSERT INTO timezone VALUES ('208', '(GMT+03:00) Bahrain', '+03:00', null, '208');
INSERT INTO timezone VALUES ('209', '(GMT+03:00) Kuwait', '+03:00', null, '209');
INSERT INTO timezone VALUES ('210', '(GMT+03:00) Qatar', '+03:00', null, '210');
INSERT INTO timezone VALUES ('211', '(GMT+03:00) Riyadh', '+03:00', null, '211');
INSERT INTO timezone VALUES ('212', '(GMT+03:00) Moscow+00', '+03:00', null, '212');
INSERT INTO timezone VALUES ('213', '(GMT+03:00) Antananarivo', '+03:00', null, '213');
INSERT INTO timezone VALUES ('214', '(GMT+03:00) Comoro', '+03:00', null, '214');
INSERT INTO timezone VALUES ('215', '(GMT+03:00) Mayotte', '+03:00', null, '215');
INSERT INTO timezone VALUES ('216', '(GMT+03:30) Tehran', '+03:30', null, '216');
INSERT INTO timezone VALUES ('217', '(GMT+04:00) Baku', '+04:00', null, '217');
INSERT INTO timezone VALUES ('218', '(GMT+04:00) Dubai', '+04:00', null, '218');
INSERT INTO timezone VALUES ('219', '(GMT+04:00) Muscat', '+04:00', null, '219');
INSERT INTO timezone VALUES ('220', '(GMT+04:00) Tbilisi', '+04:00', null, '220');
INSERT INTO timezone VALUES ('221', '(GMT+04:00) Yerevan', '+04:00', null, '221');
INSERT INTO timezone VALUES ('222', '(GMT+04:00) Moscow+01 - Samara', '+04:00', null, '222');
INSERT INTO timezone VALUES ('223', '(GMT+04:00) Mahe', '+04:00', null, '223');
INSERT INTO timezone VALUES ('224', '(GMT+04:00) Mauritius', '+04:00', null, '224');
INSERT INTO timezone VALUES ('225', '(GMT+04:00) Reunion', '+04:00', null, '225');
INSERT INTO timezone VALUES ('226', '(GMT+04:30) Kabul', '+04:30', null, '226');
INSERT INTO timezone VALUES ('227', '(GMT+05:00) Aqtau', '+05:00', null, '227');
INSERT INTO timezone VALUES ('228', '(GMT+05:00) Aqtobe', '+05:00', null, '228');
INSERT INTO timezone VALUES ('229', '(GMT+05:00) Ashgabat', '+05:00', null, '229');
INSERT INTO timezone VALUES ('230', '(GMT+05:00) Dushanbe', '+05:00', null, '230');
INSERT INTO timezone VALUES ('231', '(GMT+05:00) Karachi', '+05:00', null, '231');
INSERT INTO timezone VALUES ('232', '(GMT+05:00) Tashkent', '+05:00', null, '232');
INSERT INTO timezone VALUES ('233', '(GMT+05:00) Moscow+02 - Yekaterinburg', '+05:00', null, '233');
INSERT INTO timezone VALUES ('234', '(GMT+05:00) Kerguelen', '+05:00', null, '234');
INSERT INTO timezone VALUES ('235', '(GMT+05:00) Maldives', '+05:00', null, '235');
INSERT INTO timezone VALUES ('236', '(GMT+05:30) India Standard Time', '+05:30', null, '236');
INSERT INTO timezone VALUES ('237', '(GMT+05:30) Colombo', '+05:30', null, '237');
INSERT INTO timezone VALUES ('238', '(GMT+05:45) Katmandu', '+05:45', null, '238');
INSERT INTO timezone VALUES ('239', '(GMT+06:00) Mawson', '+06:00', null, '239');
INSERT INTO timezone VALUES ('240', '(GMT+06:00) Vostok', '+06:00', null, '240');
INSERT INTO timezone VALUES ('241', '(GMT+06:00) Almaty', '+06:00', null, '241');
INSERT INTO timezone VALUES ('242', '(GMT+06:00) Bishkek', '+06:00', null, '242');
INSERT INTO timezone VALUES ('243', '(GMT+06:00) Dhaka', '+06:00', null, '243');
INSERT INTO timezone VALUES ('244', '(GMT+06:00) Moscow+03 - Omsk, Novosibirsk', '+06:00', null, '244');
INSERT INTO timezone VALUES ('245', '(GMT+06:00) Thimphu', '+06:00', null, '245');
INSERT INTO timezone VALUES ('246', '(GMT+06:00) Chagos', '+06:00', null, '246');
INSERT INTO timezone VALUES ('247', '(GMT+06:30) Rangoon', '+06:30', null, '247');
INSERT INTO timezone VALUES ('248', '(GMT+06:30) Cocos', '+06:30', null, '248');
INSERT INTO timezone VALUES ('249', '(GMT+07:00) Davis', '+07:00', null, '249');
INSERT INTO timezone VALUES ('250', '(GMT+07:00) Bangkok', '+07:00', null, '250');
INSERT INTO timezone VALUES ('251', '(GMT+07:00) Hovd', '+07:00', null, '251');
INSERT INTO timezone VALUES ('252', '(GMT+07:00) Jakarta', '+07:00', null, '252');
INSERT INTO timezone VALUES ('253', '(GMT+07:00) Moscow+04 - Krasnoyarsk', '+07:00', null, '253');
INSERT INTO timezone VALUES ('254', '(GMT+07:00) Phnom Penh', '+07:00', null, '254');
INSERT INTO timezone VALUES ('255', '(GMT+07:00) Hanoi', '+07:00', null, '255');
INSERT INTO timezone VALUES ('256', '(GMT+07:00) Vientiane', '+07:00', null, '256');
INSERT INTO timezone VALUES ('257', '(GMT+07:00) Christmas', '+07:00', null, '257');
INSERT INTO timezone VALUES ('258', '(GMT+08:00) Casey', '+08:00', null, '258');
INSERT INTO timezone VALUES ('259', '(GMT+08:00) Brunei', '+08:00', null, '259');
INSERT INTO timezone VALUES ('260', '(GMT+08:00) Choibalsan', '+08:00', null, '260');
INSERT INTO timezone VALUES ('261', '(GMT+08:00) Hong Kong', '+08:00', null, '261');
INSERT INTO timezone VALUES ('262', '(GMT+08:00) Moscow+05 - Irkutsk', '+08:00', null, '262');
INSERT INTO timezone VALUES ('263', '(GMT+08:00) Kuala Lumpur', '+08:00', null, '263');
INSERT INTO timezone VALUES ('264', '(GMT+08:00) Macau', '+08:00', null, '264');
INSERT INTO timezone VALUES ('265', '(GMT+08:00) Makassar', '+08:00', null, '265');
INSERT INTO timezone VALUES ('266', '(GMT+08:00) Manila', '+08:00', null, '266');
INSERT INTO timezone VALUES ('267', '(GMT+08:00) China Time - Beijing', '+08:00', null, '267');
INSERT INTO timezone VALUES ('268', '(GMT+08:00) Singapore', '+08:00', null, '268');
INSERT INTO timezone VALUES ('269', '(GMT+08:00) Taipei', '+08:00', null, '269');
INSERT INTO timezone VALUES ('270', '(GMT+08:00) Ulaanbaatar', '+08:00', null, '270');
INSERT INTO timezone VALUES ('271', '(GMT+08:00) Western Time - Perth', '+08:00', null, '271');
INSERT INTO timezone VALUES ('272', '(GMT+09:00) Dili', '+09:00', null, '272');
INSERT INTO timezone VALUES ('273', '(GMT+09:00) Jayapura', '+09:00', null, '273');
INSERT INTO timezone VALUES ('274', '(GMT+09:00) Pyongyang', '+09:00', null, '274');
INSERT INTO timezone VALUES ('275', '(GMT+09:00) Seoul', '+09:00', null, '275');
INSERT INTO timezone VALUES ('276', '(GMT+09:00) Tokyo', '+09:00', null, '276');
INSERT INTO timezone VALUES ('277', '(GMT+09:00) Moscow+06 - Yakutsk', '+09:00', null, '277');
INSERT INTO timezone VALUES ('278', '(GMT+09:00) Palau', '+09:00', null, '278');
INSERT INTO timezone VALUES ('279', '(GMT+09:30) Central Time - Adelaide', '+09:30', null, '279');
INSERT INTO timezone VALUES ('280', '(GMT+09:30) Central Time - Darwin', '+09:30', null, '280');
INSERT INTO timezone VALUES ('281', '(GMT+10:00) Dumont D\'Urville', '+10:00', null, '281');
INSERT INTO timezone VALUES ('282', '(GMT+10:00) Moscow+07 - Yuzhno-Sakhalinsk', '+10:00', null, '282');
INSERT INTO timezone VALUES ('283', '(GMT+10:00) Eastern Time - Brisbane', '+10:00', null, '283');
INSERT INTO timezone VALUES ('284', '(GMT+10:00) Eastern Time - Hobart', '+10:00', null, '284');
INSERT INTO timezone VALUES ('285', '(GMT+10:00) Eastern Time - Melbourne, Sydney', '+10:00', null, '285');
INSERT INTO timezone VALUES ('286', '(GMT+10:00) Guam', '+10:00', null, '286');
INSERT INTO timezone VALUES ('287', '(GMT+10:00) Port Moresby', '+10:00', null, '287');
INSERT INTO timezone VALUES ('288', '(GMT+10:00) Saipan', '+10:00', null, '288');
INSERT INTO timezone VALUES ('289', '(GMT+10:00) Truk', '+10:00', null, '289');
INSERT INTO timezone VALUES ('290', '(GMT+11:00) Moscow+08 - Magadan', '+11:00', null, '290');
INSERT INTO timezone VALUES ('291', '(GMT+11:00) Efate', '+11:00', null, '291');
INSERT INTO timezone VALUES ('292', '(GMT+11:00) Guadalcanal', '+11:00', null, '292');
INSERT INTO timezone VALUES ('293', '(GMT+11:00) Kosrae', '+11:00', null, '293');
INSERT INTO timezone VALUES ('294', '(GMT+11:00) Noumea', '+11:00', null, '294');
INSERT INTO timezone VALUES ('295', '(GMT+11:00) Ponape', '+11:00', null, '295');
INSERT INTO timezone VALUES ('296', '(GMT+11:30) Norfolk', '+11:30', null, '296');
INSERT INTO timezone VALUES ('297', '(GMT+12:00) Moscow+09 - Petropavlovsk-Kamchatskiy', '+12:00', null, '297');
INSERT INTO timezone VALUES ('298', '(GMT+12:00) Auckland', '+12:00', null, '298');
INSERT INTO timezone VALUES ('299', '(GMT+12:00) Fiji', '+12:00', null, '299');
INSERT INTO timezone VALUES ('300', '(GMT+12:00) Funafuti', '+12:00', null, '300');
INSERT INTO timezone VALUES ('301', '(GMT+12:00) Kwajalein', '+12:00', null, '301');
INSERT INTO timezone VALUES ('302', '(GMT+12:00) Majuro', '+12:00', null, '302');
INSERT INTO timezone VALUES ('303', '(GMT+12:00) Nauru', '+12:00', null, '303');
INSERT INTO timezone VALUES ('304', '(GMT+12:00) Tarawa', '+12:00', null, '304');
INSERT INTO timezone VALUES ('305', '(GMT+12:00) Wake', '+12:00', null, '305');
INSERT INTO timezone VALUES ('306', '(GMT+12:00) Wallis', '+12:00', null, '306');
INSERT INTO timezone VALUES ('307', '(GMT+13:00) Enderbury', '+13:00', null, '307');
INSERT INTO timezone VALUES ('308', '(GMT+13:00) Tongatapu', '+13:00', null, '308');
INSERT INTO timezone VALUES ('309', '(GMT+14:00) Kiritimati', '+14:00', null, '309');

-- ----------------------------
-- Table structure for `treenodes`
-- ----------------------------
DROP TABLE IF EXISTS `treenodes`;
CREATE TABLE `treenodes` (
  `nodeid` varchar(64) NOT NULL,
  `courseid` varchar(64) NOT NULL,
  `iconcls` varchar(32) default NULL,
  `cls` varchar(32) default NULL,
  `nodetext` text,
  `parentid` varchar(64) default NULL,
  `flag` int(11) default NULL,
  `description` varchar(64) default NULL,
  `needapprove` int(1) default NULL,
  `createdbyuserid` varchar(64) default NULL,
  `author` varchar(128) default NULL,
  `pubdate` bigint(20) default NULL,
  `expdate` bigint(20) default NULL,
  `modified` bigint(20) default NULL,
  PRIMARY KEY  (`nodeid`),
  KEY `courseid` (`courseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of treenodes
-- ----------------------------

-- ----------------------------
-- Table structure for `unitags`
-- ----------------------------
DROP TABLE IF EXISTS `unitags`;
CREATE TABLE `unitags` (
  `tagid` varchar(50) NOT NULL,
  `tagname` varchar(50) NOT NULL,
  PRIMARY KEY  (`tagid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of unitags
-- ----------------------------
INSERT INTO unitags VALUES ('1060eafe-2a50-4bcf-89bd-28be2a17a203', '\'xcvxv ghf\'');
INSERT INTO unitags VALUES ('29d97bbb-04d1-4d4b-a57a-bbb420880a8c', 'dfdsaf');
INSERT INTO unitags VALUES ('5c876e4a-a684-4227-a8f0-8594dd4b828e', 'Project');
INSERT INTO unitags VALUES ('7d1b9213-77c6-450a-b77f-49365b6f93ff', 'deskera');
INSERT INTO unitags VALUES ('9a50bbe0-5ff7-4315-9bec-861ee768c041', 'dsf');
INSERT INTO unitags VALUES ('c31ba2ae-4173-4fd2-9ac7-767151ba3c99', 'dfdsf');
INSERT INTO unitags VALUES ('caada6ed-6960-4468-866c-48f40fbf4417', 'df');
INSERT INTO unitags VALUES ('e001dce6-dad8-41b3-b16a-fa662253bdb4', 'xcvxv');
INSERT INTO unitags VALUES ('efa460d8-bbda-4f38-9247-2981fb60b66e', 'asd');
INSERT INTO unitags VALUES ('f1144133-b75e-406c-afa2-18e46135dea0', '\'rg dfg dsf\'');
INSERT INTO unitags VALUES ('ffe68109-4087-49b3-accd-221837142f5e', 'GIF');

-- ----------------------------
-- Table structure for `usercalendar`
-- ----------------------------
DROP TABLE IF EXISTS `usercalendar`;
CREATE TABLE `usercalendar` (
  `cid` int(12) default NULL,
  `userid` varchar(36) default NULL,
  `colorcode` int(12) default '0',
  `isselect` tinyint(1) default '1',
  KEY `userid` (`userid`),
  KEY `cid` (`cid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of usercalendar
-- ----------------------------

-- ----------------------------
-- Table structure for `userlogin`
-- ----------------------------
DROP TABLE IF EXISTS `userlogin`;
CREATE TABLE `userlogin` (
  `userid` varchar(36) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(60) NOT NULL default '',
  `lastactivitydate` timestamp NOT NULL default '1989-12-31 22:00:00',
  `authkey` varchar(36) NOT NULL,
  PRIMARY KEY  (`userid`),
  KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of userlogin
-- ----------------------------

-- ----------------------------
-- Table structure for `usernodeinfo`
-- ----------------------------
DROP TABLE IF EXISTS `usernodeinfo`;
CREATE TABLE `usernodeinfo` (
  `userid` varchar(64) default NULL,
  `nodeid` varchar(64) default NULL,
  `comments` text,
  `attempts` int(10) default NULL,
  `startedon` bigint(20) default NULL,
  `lastaccess` bigint(20) default NULL,
  KEY `nodeid` (`nodeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of usernodeinfo
-- ----------------------------

-- ----------------------------
-- Table structure for `userpermission`
-- ----------------------------
DROP TABLE IF EXISTS `userpermission`;
CREATE TABLE `userpermission` (
  `companyid` varchar(36) NOT NULL default '',
  `roleid` int(12) NOT NULL default '0',
  `isApprover` tinyint(1) default NULL,
  `ViewAdmin` tinyint(1) default NULL,
  `ManagerPolicy` tinyint(1) default NULL,
  `ManageLtype` tinyint(1) default NULL,
  `initCompoff` tinyint(1) default NULL,
  `MakeAnnounce` tinyint(1) default NULL,
  `GroupLeave` tinyint(1) default NULL,
  `viewLogs` tinyint(1) default NULL,
  `viewReports` tinyint(1) default NULL,
  `viewAll` tinyint(1) default NULL,
  `adjustleave` tinyint(1) default NULL,
  PRIMARY KEY  (`companyid`,`roleid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of userpermission
-- ----------------------------

-- ----------------------------
-- Table structure for `userpermissions`
-- ----------------------------
DROP TABLE IF EXISTS `userpermissions`;
CREATE TABLE `userpermissions` (
  `userid` varchar(50) NOT NULL,
  `featureid` int(11) NOT NULL,
  `permissions` int(11) NOT NULL,
  KEY `featureid` (`featureid`),
  KEY `userpermissions_ibfk_2` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of userpermissions
-- ----------------------------

-- ----------------------------
-- Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `image` varchar(256) NOT NULL default '',
  `userid` varchar(36) NOT NULL default '',
  `empid` varchar(50) NOT NULL default '',
  `fname` varchar(50) NOT NULL default '',
  `lname` varchar(50) NOT NULL default '',
  `roleid` int(11) default '0',
  `emailid` varchar(100) NOT NULL default '',
  `address` varchar(100) NOT NULL default '',
  `designation` varchar(15) default NULL,
  `contactno` varchar(15) NOT NULL default '',
  `aboutuser` text,
  `userstatus` text,
  `timezone` varchar(10) NOT NULL default '1',
  `companyid` varchar(36) NOT NULL,
  `locationid` varchar(36) NOT NULL,
  `fax` varchar(20) NOT NULL default '',
  `altcontactno` varchar(15) NOT NULL default '',
  `phpbbid` varchar(20) NOT NULL default '2',
  `panno` varchar(16) NOT NULL default '',
  `ssnno` varchar(16) default NULL,
  `active` int(11) default '1',
  `dateformat` int(11) NOT NULL default '1',
  `emptypeid` int(12) NOT NULL,
  `yosid` int(12) NOT NULL,
  `dojoining` datetime default NULL,
  `doconf` datetime default NULL,
  `ismailsend` int(11) default '1',
  `gender` int(3) unsigned NOT NULL default '39',
  `lastcfmonth` varchar(7) default NULL,
  PRIMARY KEY  (`userid`),
  KEY `userid` (`userid`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `userlogin` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------

-- ----------------------------
-- Table structure for `user_yearlycfdone`
-- ----------------------------
DROP TABLE IF EXISTS `user_yearlycfdone`;
CREATE TABLE `user_yearlycfdone` (
  `userid` varchar(36) NOT NULL default '',
  `leavetypeid` varchar(36) NOT NULL default '',
  `year` int(5) NOT NULL,
  `taken` double NOT NULL default '0',
  `cfdone` int(3) NOT NULL default '-99',
  `lcfmax` int(3) NOT NULL default '0',
  `lcf` int(3) NOT NULL default '0',
  `balance` int(3) NOT NULL default '0',
  KEY `cf_leavetypeid` (`userid`),
  CONSTRAINT `cf_leavetypeid` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cf_userid` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_yearlycfdone
-- ----------------------------

-- ----------------------------
-- Table structure for `WidgetManager`
-- ----------------------------
DROP TABLE IF EXISTS `WidgetManager`;
CREATE TABLE `WidgetManager` (
  `userid` varchar(36) NOT NULL default '',
  `wid` varchar(15) NOT NULL default '',
  `colno` int(1) default NULL,
  `position` int(1) default NULL,
  PRIMARY KEY  (`userid`,`wid`),
  KEY `userid` (`userid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of WidgetManager
-- ----------------------------
insert into company(companyid, companyname,createdon, address, locationid,locationname,creatorid,subdomain,country,timezone) values ('04b536a0-5e51-482f-ac67-615b59c1e331', 'eleave', UNIX_TIMESTAMP(now()), 'eleave', '04b536a0-5e51-482f-ac67-615b59c1e331', 'eleave', '04b536a0-5e51-482f-ac67-615b59c1e342', 'eleave', 244, 23);

insert into userlogin(userid, username, password, authkey) values ('04b536a0-5e51-482f-ac67-615b59c1e342', 'admin', 'c0b137fe2d792459f26ff763cce44574a5b5ab03', "1234");

insert into users(userid, companyid, image,locationid,emptypeid,yosid,emailid,roleid,fname,lname,dojoining,doconf,dateformat,lastcfmonth) values ('04b536a0-5e51-482f-ac67-615b59c1e342', '04b536a0-5e51-482f-ac67-615b59c1e331', "", '04b536a0-5e51-482f-ac67-615b59c1e331', "1", "15", 'demo@deskera.com', 1, 'Admin', 'Admin', now(), now(), 18, date_format(date(now()),'%Y%m'));

insert into lm_userrolemap(userid,roleid) values ('04b536a0-5e51-482f-ac67-615b59c1e342', 1);

INSERT INTO lm_leavetypes(name, calculateby, isvisible, companyid, locationid,entitlementbasis,entitlementrules,assignbygender,Mandatorydays) VALUES ("Default_type", 2, 1, '04b536a0-5e51-482f-ac67-615b59c1e331', '04b536a0-5e51-482f-ac67-615b59c1e331', 34, 36, 41, null);

insert into lm_empleavetypemap(emptypeid, leavetypeid, total, lcfmax, maxbalance) values(0, LAST_INSERT_ID(), "12", "6", "18");

INSERT INTO lm_leavepolicy(accumulatedby,companyyear,companyid,minworkdays,encashmax,entitledby,leavemodelby) VALUES ("always", timestamp(concat(year(now()), '-01-01')), '04b536a0-5e51-482f-ac67-615b59c1e331', 300, 30, "monthly", "jobgrades");
