/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50077
Source Host           : localhost:3306
Source Database       : eclaimdemo

Target Server Type    : MYSQL
Target Server Version : 50077
File Encoding         : 65001

Date: 2012-05-25 12:13:07
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `account`
-- ----------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account` (
  `accid` varchar(50) NOT NULL,
  `typeid` bigint(20) default NULL,
  `date` datetime default NULL,
  `accountName` varchar(255) default NULL,
  `accountNo` double NOT NULL,
  `transactions` varchar(11) character set latin1 collate latin1_bin default 'true',
  `timestamp` timestamp NULL default NULL on update CURRENT_TIMESTAMP,
  `description` varchar(255) default NULL,
  PRIMARY KEY  (`accid`),
  KEY `accid` (`accid`),
  KEY `fk_account_typeid` (`typeid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of account
-- ----------------------------

-- ----------------------------
-- Table structure for `accountcompany`
-- ----------------------------
DROP TABLE IF EXISTS `accountcompany`;
CREATE TABLE `accountcompany` (
  `accid` varchar(50) character set latin1 NOT NULL,
  `companyid` varchar(36) NOT NULL,
  `balance` double(20,2) default NULL,
  `timestamp` timestamp NULL default NULL on update CURRENT_TIMESTAMP,
  KEY `accid` (`accid`),
  KEY `companyid` (`companyid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of accountcompany
-- ----------------------------

-- ----------------------------
-- Table structure for `actionlog`
-- ----------------------------
DROP TABLE IF EXISTS `actionlog`;
CREATE TABLE `actionlog` (
  `logid` int(11) NOT NULL auto_increment,
  `userid` varchar(50) NOT NULL,
  `datedon` datetime default NULL,
  `actionby` varchar(50) NOT NULL,
  `actionid` int(11) default NULL,
  `actionto` varchar(50) NOT NULL,
  `actiontext` text NOT NULL,
  `ipaddress` varchar(20) character set utf8 NOT NULL default '',
  PRIMARY KEY  (`logid`)
) ENGINE=InnoDB AUTO_INCREMENT=4043 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of actionlog
-- ----------------------------

-- ----------------------------
-- Table structure for `actionlogref`
-- ----------------------------
DROP TABLE IF EXISTS `actionlogref`;
CREATE TABLE `actionlogref` (
  `shwith` varchar(50) collate utf8_unicode_ci NOT NULL,
  `logid` int(11) NOT NULL,
  KEY `logid` (`logid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of actionlogref
-- ----------------------------

-- ----------------------------
-- Table structure for `actions`
-- ----------------------------
DROP TABLE IF EXISTS `actions`;
CREATE TABLE `actions` (
  `actionname` varchar(512) NOT NULL,
  `actionid` int(11) NOT NULL,
  `groupid` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of actions
-- ----------------------------
INSERT INTO actions VALUES ('%s added %s as a Friend on %s', '1', '6');
INSERT INTO actions VALUES ('%s added %s as Moderator on %s', '2', '6');
INSERT INTO actions VALUES ('%s joined %s Community on %s', '3', '3');
INSERT INTO actions VALUES ('%s joined %s Project on %s', '4', '2');
INSERT INTO actions VALUES ('%s dropped %s from Network on %s', '5', '6');
INSERT INTO actions VALUES ('%s left %s Community on %s', '6', '3');
INSERT INTO actions VALUES ('%s left %s Project on %s', '7', '2');
INSERT INTO actions VALUES ('%s created %s Community on %s', '8', '3');
INSERT INTO actions VALUES ('%s created %s Project on %s', '9', '2');
INSERT INTO actions VALUES ('%s requested %s for connection on %s', '10', '6');
INSERT INTO actions VALUES ('1 requested 2 community for connection', '11', '3');
INSERT INTO actions VALUES ('%s updated %s  project tasks on %s', '12', '2');
INSERT INTO actions VALUES ('%s shared %s calendar with you on %s', '13', '4');
INSERT INTO actions VALUES ('%s updated shared calendar %s on %s', '14', '4');
INSERT INTO actions VALUES ('%s deleted %s calendar on %s', '15', '4');
INSERT INTO actions VALUES ('%s shared %s ', '16', '1');
INSERT INTO actions VALUES ('%s Updated status of %s', '17', '1');
INSERT INTO actions VALUES ('%s commited new version of %s', '18', '1');
INSERT INTO actions VALUES ('%s activated versioning of %s', '19', '1');
INSERT INTO actions VALUES ('%s deleted %s', '20', '1');
INSERT INTO actions VALUES ('%s reverted permission for %s', '21', '1');
INSERT INTO actions VALUES ('%s added  %s', '22', '1');
INSERT INTO actions VALUES ('%s added %s in %s community', '23', '1');
INSERT INTO actions VALUES ('%s activated versioning of %s in %s community', '24', '1');
INSERT INTO actions VALUES ('%s updated status of %s in %s community', '25', '1');
INSERT INTO actions VALUES ('%s deleted %s from %s community', '26', '1');
INSERT INTO actions VALUES ('%s added %s in %s project', '28', '1');
INSERT INTO actions VALUES ('%s activated versioning of %s in %s  project', '29', '1');
INSERT INTO actions VALUES ('%s updated status of %s in %s project', '30', '1');
INSERT INTO actions VALUES ('%s deleted %s from %s project', '31', '1');
INSERT INTO actions VALUES ('%s modified %s from %s community ', '27', '1');
INSERT INTO actions VALUES ('%s modified %s from %s  project', '32', '1');
INSERT INTO actions VALUES ('%s commited new version of %s  in %s community', '33', '1');
INSERT INTO actions VALUES ('%s commited new version of %s  in %s project', '34', '1');
INSERT INTO actions VALUES ('%s added %s calendar in %s on %s', '35', '4');
INSERT INTO actions VALUES ('%s updated calendar %s in %s on %s', '36', '4');
INSERT INTO actions VALUES ('%s deleted %s calendar in %s on %s', '37', '4');
INSERT INTO actions VALUES ('%s assigned %s task on %s', '38', '5');
INSERT INTO actions VALUES ('%s updated %s task on %s', '39', '5');
INSERT INTO actions VALUES ('%s reassigned %s task to %s on %s', '40', '5');
INSERT INTO actions VALUES ('%s added %s as a Friend at %s', '41', '6');
INSERT INTO actions VALUES ('%s added %s as Moderator at %s', '42', '6');
INSERT INTO actions VALUES ('%s joined %s Community at %s', '43', '3');
INSERT INTO actions VALUES ('%s joined %s Project at %s', '44', '2');
INSERT INTO actions VALUES ('%s dropped %s from Network at %s', '45', '6');
INSERT INTO actions VALUES ('%s left %s Community at %s', '46', '3');
INSERT INTO actions VALUES ('%s left %s Project at %s', '47', '2');
INSERT INTO actions VALUES ('%s created %s Community at %s', '48', '3');
INSERT INTO actions VALUES ('1 requested 2 community for connection', '49', '3');
INSERT INTO actions VALUES ('%s updated %s  project tasks at %s', '50', '2');
INSERT INTO actions VALUES ('%s shared %s calendar with you at %s', '51', '4');
INSERT INTO actions VALUES ('%s updated shared calendar %s at %s', '52', '4');
INSERT INTO actions VALUES ('%s deleted %s calendar at %s', '53', '4');
INSERT INTO actions VALUES ('%s shared %s ', '54', '1');
INSERT INTO actions VALUES ('%s Updated status of %s', '55', '1');
INSERT INTO actions VALUES ('%s commited new version of %s', '56', '1');
INSERT INTO actions VALUES ('%s activated versioning of %s', '57', '1');
INSERT INTO actions VALUES ('%s deleted %s', '58', '1');
INSERT INTO actions VALUES ('%s reverted permission for %s', '59', '1');
INSERT INTO actions VALUES ('%s added  %s', '60', '1');
INSERT INTO actions VALUES ('%s added %s in %s community', '61', '1');
INSERT INTO actions VALUES ('%s activated versioning of %s in %s community', '62', '1');
INSERT INTO actions VALUES ('%s updated status of %s in %s community', '63', '1');
INSERT INTO actions VALUES ('%s deleted %s from %s community', '64', '1');
INSERT INTO actions VALUES ('%s modified %s from %s community ', '65', '1');
INSERT INTO actions VALUES ('%s added %s in %s project', '66', '1');
INSERT INTO actions VALUES ('%s activated versioning of %s in %s  project', '67', '1');
INSERT INTO actions VALUES ('%s updated status of %s in %s project', '68', '1');
INSERT INTO actions VALUES ('%s deleted %s from %s project', '69', '1');
INSERT INTO actions VALUES ('%s modified %s from %s  project', '70', '1');
INSERT INTO actions VALUES ('%s commited new version of %s  in %s community', '71', '1');
INSERT INTO actions VALUES ('%s commited new version of %s  in %s project', '72', '1');
INSERT INTO actions VALUES ('%s added %s calendar in %s at %s', '73', '4');
INSERT INTO actions VALUES ('%s updated calendar %s in %s at %s', '74', '4');
INSERT INTO actions VALUES ('%s deleted %s calendar in %s at %s', '75', '4');
INSERT INTO actions VALUES ('%s assigned %s task at %s', '76', '5');
INSERT INTO actions VALUES ('%s updated %s task at %s', '77', '5');
INSERT INTO actions VALUES ('%s reassigned %s task to %s at %s', '78', '5');
INSERT INTO actions VALUES ('%s added %s event in %s calendar at %s', '79', '4');
INSERT INTO actions VALUES ('%s updated %s event in %s calendar at %s', '80', '4');
INSERT INTO actions VALUES ('%s deleted %s event in %s calendar at %s', '81', '4');
INSERT INTO actions VALUES ('%s requested %s for connection at %s', '82', '6');
INSERT INTO actions VALUES ('%s created %s Project at %s', '83', '2');

-- ----------------------------
-- Table structure for `activitieslist`
-- ----------------------------
DROP TABLE IF EXISTS `activitieslist`;
CREATE TABLE `activitieslist` (
  `activityid` int(11) NOT NULL,
  `activityname` varchar(50) character set latin1 NOT NULL,
  `featureid` int(11) NOT NULL,
  `displayactivityname` varchar(50) NOT NULL,
  KEY `featureid` (`featureid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of activitieslist
-- ----------------------------
INSERT INTO activitieslist VALUES ('1', 'ManageUser', '1', 'Manage User');
INSERT INTO activitieslist VALUES ('2', 'InviteUser', '1', 'Invite User');
INSERT INTO activitieslist VALUES ('1', 'ManageMember', '2', 'Manage Member');
INSERT INTO activitieslist VALUES ('2', 'ManageCommunity', '2', 'Manage Community');
INSERT INTO activitieslist VALUES ('3', 'UploadDocs', '2', 'Upload Docs');
INSERT INTO activitieslist VALUES ('4', 'DeleteDocs', '2', 'Delete Docs');
INSERT INTO activitieslist VALUES ('5', 'PostMsg', '2', 'Post Msg');
INSERT INTO activitieslist VALUES ('6', 'ModerateMsg', '2', 'Moderate Msg');
INSERT INTO activitieslist VALUES ('1', 'ManageProject', '3', 'Manage Project');
INSERT INTO activitieslist VALUES ('2', 'ManageMember', '3', 'Manage Member');
INSERT INTO activitieslist VALUES ('3', 'UploadDocs', '3', 'Upload Docs');
INSERT INTO activitieslist VALUES ('4', 'DeleteDocs', '3', 'Delete Docs');
INSERT INTO activitieslist VALUES ('5', 'PostMsg', '3', 'Post Msg');
INSERT INTO activitieslist VALUES ('6', 'ModerateMsg', '3', 'Moderate Msg');
INSERT INTO activitieslist VALUES ('7', 'CreateNewThreadDis', '2', 'Create New Thread Dis');
INSERT INTO activitieslist VALUES ('7', 'CreateNewThreadDis', '3', 'Create New Thread Dis');
INSERT INTO activitieslist VALUES ('1', 'EditCompany', '4', 'Edit Company Details');
INSERT INTO activitieslist VALUES ('1', 'Dashboard', '5', 'Access Dashboard');
INSERT INTO activitieslist VALUES ('2', 'Projects', '5', 'Access Projects');
INSERT INTO activitieslist VALUES ('3', 'Documents', '5', 'Access Documents');
INSERT INTO activitieslist VALUES ('4', 'Community', '5', 'Access Communities');
INSERT INTO activitieslist VALUES ('5', 'Accounts', '5', 'Access Business Accounts');
INSERT INTO activitieslist VALUES ('6', 'CRM', '5', 'Access CRM');
INSERT INTO activitieslist VALUES ('1', 'viewonly', '6', 'View Only');
INSERT INTO activitieslist VALUES ('2', 'createlead', '6', 'Create Lead');
INSERT INTO activitieslist VALUES ('3', 'convertlead', '6', 'Convert Lead');
INSERT INTO activitieslist VALUES ('4', 'manageleads', '6', 'Manage Lead');
INSERT INTO activitieslist VALUES ('5', 'activities', '6', 'Activity Management');
INSERT INTO activitieslist VALUES ('1', 'viewonly', '7', 'View Only');
INSERT INTO activitieslist VALUES ('2', 'createaccount', '7', 'Create Account');
INSERT INTO activitieslist VALUES ('3', 'manageaccount', '7', 'Manage Account');
INSERT INTO activitieslist VALUES ('4', 'activities', '7', 'Activity Management');
INSERT INTO activitieslist VALUES ('1', 'viewonly', '8', 'View Only');
INSERT INTO activitieslist VALUES ('2', 'createopportunity', '8', 'Create Opportunity');
INSERT INTO activitieslist VALUES ('3', 'manageopportunities', '8', 'Manage Opportunity');
INSERT INTO activitieslist VALUES ('4', 'activities', '8', 'Activity Management');
INSERT INTO activitieslist VALUES ('1', 'viewonly', '9', 'View Only');
INSERT INTO activitieslist VALUES ('2', 'createcontact', '9', 'Create Contact');
INSERT INTO activitieslist VALUES ('3', 'managecontact', '9', 'Manage Contact');
INSERT INTO activitieslist VALUES ('4', 'activities', '9', 'Activity Management');
INSERT INTO activitieslist VALUES ('6', 'viewcampaigns', '6', 'View Campaigns History');
INSERT INTO activitieslist VALUES ('5', 'viewcampaigns', '9', 'View Campaigns History');
INSERT INTO activitieslist VALUES ('5', 'managecases', '7', 'Manage Cases');
INSERT INTO activitieslist VALUES ('6', 'manageopportunities', '7', 'Manage Opportunities');
INSERT INTO activitieslist VALUES ('7', 'managepartner', '7', 'Manage Partner');
INSERT INTO activitieslist VALUES ('6', 'managecases', '9', 'Manage Cases');
INSERT INTO activitieslist VALUES ('7', 'manageopportunities', '9', 'Manage Opportunities');
INSERT INTO activitieslist VALUES ('5', 'managecompetitors', '8', 'Manage Competitors');
INSERT INTO activitieslist VALUES ('6', 'managepartners', '8', 'Manage Partners');
INSERT INTO activitieslist VALUES ('6', 'stagehistory', '8', 'Show Stage History');
INSERT INTO activitieslist VALUES ('1', 'viewonly', '10', 'View Only');
INSERT INTO activitieslist VALUES ('2', 'createcampaigns', '10', 'Create Campaigns');
INSERT INTO activitieslist VALUES ('3', 'managecampaigns', '10', 'Manage Campaigns');
INSERT INTO activitieslist VALUES ('4', 'activities', '10', 'Activity Management');
INSERT INTO activitieslist VALUES ('5', 'manageopportunities', '10', 'Manage Opportunities');
INSERT INTO activitieslist VALUES ('1', 'assignrole', '11', 'Assign Role');
INSERT INTO activitieslist VALUES ('2', 'assignfeatures', '11', 'Assign Features');
INSERT INTO activitieslist VALUES ('3', 'createcostcenter', '11', 'Create Cost Center');
INSERT INTO activitieslist VALUES ('4', 'alltrips', '11', 'All Trips');
INSERT INTO activitieslist VALUES ('5', 'allexpenses', '11', 'All Expenses');
INSERT INTO activitieslist VALUES ('6', 'finalizetrip', '11', 'Finalize Trip');

-- ----------------------------
-- Table structure for `addressbook`
-- ----------------------------
DROP TABLE IF EXISTS `addressbook`;
CREATE TABLE `addressbook` (
  `contactid` varchar(36) NOT NULL,
  `name` varchar(50) character set utf8 collate utf8_unicode_ci default NULL,
  `emailid` varchar(100) character set utf8 collate utf8_unicode_ci default NULL,
  `phone` varchar(15) character set utf8 collate utf8_unicode_ci default NULL,
  `address` varchar(100) character set utf8 collate utf8_unicode_ci default NULL,
  `userid` varchar(36) NOT NULL,
  PRIMARY KEY  (`contactid`),
  KEY `add_fk_1` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of addressbook
-- ----------------------------

-- ----------------------------
-- Table structure for `alerts`
-- ----------------------------
DROP TABLE IF EXISTS `alerts`;
CREATE TABLE `alerts` (
  `alertid` varchar(50) NOT NULL default '0',
  `alertval` text NOT NULL,
  PRIMARY KEY  (`alertid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of alerts
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
  `createdon` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `announcerid` varchar(36) NOT NULL default '',
  `isall` tinyint(1) NOT NULL default '0',
  `isshowname` tinyint(1) NOT NULL default '1',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of announcements
-- ----------------------------

-- ----------------------------
-- Table structure for `answers`
-- ----------------------------
DROP TABLE IF EXISTS `answers`;
CREATE TABLE `answers` (
  `quesid` varchar(64) NOT NULL,
  `ansid` varchar(64) default NULL,
  `options` varchar(128) default NULL,
  `value` varchar(64) default NULL,
  KEY `questionid` (`quesid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of answers
-- ----------------------------

-- ----------------------------
-- Table structure for `apiresponse`
-- ----------------------------
DROP TABLE IF EXISTS `apiresponse`;
CREATE TABLE `apiresponse` (
  `id` varchar(50) NOT NULL,
  `companyid` varchar(50) NOT NULL,
  `request` varchar(1024) NOT NULL,
  `response` varchar(1024) NOT NULL default '""',
  `status` int(11) NOT NULL default '0',
  `timestamp` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of apiresponse
-- ----------------------------

-- ----------------------------
-- Table structure for `calendarevents`
-- ----------------------------
DROP TABLE IF EXISTS `calendarevents`;
CREATE TABLE `calendarevents` (
  `eid` varchar(36) NOT NULL,
  `cid` varchar(36) default NULL,
  `startts` timestamp NULL default NULL,
  `endts` timestamp NULL default NULL,
  `subject` varchar(100) default NULL,
  `descr` text,
  `location` varchar(50) default NULL,
  `showas` char(1) default NULL,
  `priority` char(1) default NULL,
  `recpattern` varchar(3) default NULL,
  `recend` datetime default NULL,
  `resources` text,
  `timestamp` timestamp NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`eid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of calendarevents
-- ----------------------------

-- ----------------------------
-- Table structure for `calendars`
-- ----------------------------
DROP TABLE IF EXISTS `calendars`;
CREATE TABLE `calendars` (
  `cid` varchar(36) NOT NULL,
  `cname` varchar(50) NOT NULL,
  `description` text,
  `location` varchar(15) NOT NULL,
  `timezone` varchar(35) default NULL,
  `colorcode` varchar(7) default 'CC3333',
  `caltype` int(1) default '0',
  `isdefault` int(1) NOT NULL,
  `userid` varchar(50) NOT NULL,
  `timestamp` timestamp NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of calendars
-- ----------------------------

-- ----------------------------
-- Table structure for `chatmessages`
-- ----------------------------
DROP TABLE IF EXISTS `chatmessages`;
CREATE TABLE `chatmessages` (
  `sendid` varchar(50) NOT NULL,
  `receiveid` varchar(50) NOT NULL,
  `message` text,
  `messagetimestamp` time NOT NULL,
  `rsflag` int(11) NOT NULL default '0',
  `readflag` int(11) default '0',
  KEY `chatmsg_fk_1` (`sendid`),
  KEY `chatmsg_fk_2` (`receiveid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of chatmessages
-- ----------------------------

-- ----------------------------
-- Table structure for `community`
-- ----------------------------
DROP TABLE IF EXISTS `community`;
CREATE TABLE `community` (
  `image` varchar(256) NOT NULL,
  `communityid` varchar(50) NOT NULL default '0',
  `communityname` text,
  `aboutcommunity` text,
  `companyid` varchar(36) default NULL,
  `createdon` timestamp NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `nickname` varchar(50) default NULL,
  PRIMARY KEY  (`communityid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of community
-- ----------------------------

-- ----------------------------
-- Table structure for `communitymembers`
-- ----------------------------
DROP TABLE IF EXISTS `communitymembers`;
CREATE TABLE `communitymembers` (
  `communityid` varchar(50) NOT NULL default '0',
  `status` int(11) NOT NULL,
  `userid` varchar(50) NOT NULL default '0',
  `updatedon` datetime default NULL,
  KEY `communitymembers_fk_1` (`communityid`),
  KEY `communitymembers_fk_2` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of communitymembers
-- ----------------------------

-- ----------------------------
-- Table structure for `company`
-- ----------------------------
DROP TABLE IF EXISTS `company`;
CREATE TABLE `company` (
  `companyid` varchar(36) NOT NULL,
  `companyname` varchar(100) NOT NULL,
  `createdon` timestamp NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
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
  `image` varchar(256) default NULL,
  `featureaccess` int(11) default '0',
  `planid` int(11) NOT NULL default '2',
  `subscriptiondate` date NOT NULL default '1900-01-01',
  `payerid` varchar(50) default NULL,
  `locationid` varchar(36) NOT NULL default '',
  `locationname` varchar(100) default '',
  `emailid` varchar(36) default '',
  `creatorid` varchar(36) NOT NULL,
  `subdomain` varchar(50) NOT NULL,
  `claimperiod` int(11) NOT NULL default '2',
  `currency` int(11) default '1',
  `approvepolicy` varchar(30) NOT NULL default 'byassignedmanager',
  `language` int(11) default NULL,
  `sysemailid` varchar(50) default NULL,
  `dayindex` int(5) default NULL,
  PRIMARY KEY  USING BTREE (`companyid`,`locationid`),
  KEY `planid` (`planid`),
  KEY `language` (`language`),
  CONSTRAINT `company_ibfk_1` FOREIGN KEY (`language`) REFERENCES `language` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of company
-- ----------------------------

-- ----------------------------
-- Table structure for `companyholiday`
-- ----------------------------
DROP TABLE IF EXISTS `companyholiday`;
CREATE TABLE `companyholiday` (
  `companyid` varchar(50) default NULL,
  `holidaydate` date default NULL,
  `description` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of companyholiday
-- ----------------------------

-- ----------------------------
-- Table structure for `companysubscription`
-- ----------------------------
DROP TABLE IF EXISTS `companysubscription`;
CREATE TABLE `companysubscription` (
  `featureid` int(11) default NULL,
  `companyid` varchar(36) NOT NULL default '',
  `subscriptiondate` date NOT NULL default '2000-01-01',
  `expdate` date NOT NULL default '2000-01-01',
  `activityid` int(11) NOT NULL default '0',
  KEY `companyid` (`companyid`),
  KEY `featureid` (`featureid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of companysubscription
-- ----------------------------

-- ----------------------------
-- Table structure for `companyusers`
-- ----------------------------
DROP TABLE IF EXISTS `companyusers`;
CREATE TABLE `companyusers` (
  `companyid` varchar(36) NOT NULL,
  `userid` varchar(36) NOT NULL,
  KEY `companyid` (`companyid`),
  KEY `userid` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of companyusers
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

-- ----------------------------
-- Table structure for `currency`
-- ----------------------------
DROP TABLE IF EXISTS `currency`;
CREATE TABLE `currency` (
  `currencyid` varchar(255) NOT NULL,
  `name` varchar(100) default NULL,
  `htmlcode` varchar(30) default NULL,
  `symbol` varchar(30) default NULL,
  PRIMARY KEY  (`currencyid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of currency
-- ----------------------------
INSERT INTO currency VALUES ('1', 'US Dollar', '24', '&#36;');
INSERT INTO currency VALUES ('2', 'Pound', '00a3', '&#163;');
INSERT INTO currency VALUES ('3', 'Euro', '20ac', '&#128;');
INSERT INTO currency VALUES ('4', 'default', 'a4', '&#164;');
INSERT INTO currency VALUES ('9', 'Uganda Shillings (UGX)', '&#85;&#83;&#104;', 'USh');

-- ----------------------------
-- Table structure for `customer`
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
  `customerid` varchar(50) NOT NULL,
  `companyid` varchar(36) character set utf8 default NULL,
  `type1` varchar(255) default NULL,
  `name` varchar(255) default NULL,
  `company` varchar(255) default NULL,
  `salutation` varchar(255) default NULL,
  `fname` varchar(255) default NULL,
  `lname` varchar(255) default NULL,
  `phone` varchar(255) default NULL,
  `fax` varchar(255) default NULL,
  `alt_phone` varchar(255) default NULL,
  `alt_fax` varchar(255) default NULL,
  `email` varchar(255) default NULL,
  `emailcc` varchar(255) default NULL,
  `billing_address` varchar(255) default NULL,
  `shipping_address` varchar(255) default NULL,
  `balance` double default NULL,
  `timestamp` timestamp NULL default NULL on update CURRENT_TIMESTAMP,
  `createdon` timestamp NULL default NULL,
  `creditlimit` double(10,2) default NULL,
  `bstreet` varchar(100) NOT NULL default '',
  `bcity` varchar(100) NOT NULL default '',
  `bstate` varchar(100) NOT NULL default '',
  `bzip` varchar(10) NOT NULL default '',
  `bcountry` varchar(100) NOT NULL default '',
  `sstreet` varchar(100) NOT NULL default '',
  `scity` varchar(100) NOT NULL default '',
  `sstate` varchar(100) NOT NULL default '',
  `szip` varchar(10) NOT NULL default '',
  `scountry` varchar(100) NOT NULL default '',
  PRIMARY KEY  (`customerid`),
  KEY `companyid` (`companyid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of customer
-- ----------------------------

-- ----------------------------
-- Table structure for `dateformat`
-- ----------------------------
DROP TABLE IF EXISTS `dateformat`;
CREATE TABLE `dateformat` (
  `formatid` varchar(255) character set utf8 NOT NULL,
  `name` varchar(50) character set utf8 default NULL,
  `javascript` varchar(50) character set utf8 default NULL,
  `scriptform` varchar(50) character set utf8 default NULL,
  PRIMARY KEY  (`formatid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of dateformat
-- ----------------------------
INSERT INTO dateformat VALUES ('1', 'Iso8601Long', 'yyyy-MM-dd HH:mm:ss', 'Y-m-d H:i:s');
INSERT INTO dateformat VALUES ('10', 'UniversalsortableDatetime', 'yyyy-MM-dd HH:mm:ss z', 'Y-m-d H:i:s T');
INSERT INTO dateformat VALUES ('12', 'Kdate1', 'dd-MM-yy', 'd-m-y');
INSERT INTO dateformat VALUES ('13', 'Kdate2', 'MM-dd-yy', 'm-d-y');
INSERT INTO dateformat VALUES ('14', 'Kdate3', 'dd/MM/yy', 'd/m/y');
INSERT INTO dateformat VALUES ('15', 'Kdate4', 'MM/dd/yy', 'm/d/y');
INSERT INTO dateformat VALUES ('16', 'Kdate5', 'E d-MM-yy', 'D j-m-y');
INSERT INTO dateformat VALUES ('17', 'FullDateShortTime', 'yyyy-MM-dd HH:mm', 'Y-m-d h:i');
INSERT INTO dateformat VALUES ('18', 'Kdate6', 'MMMM dd,yyyy h:mm a', 'F d,Y g:i A');
INSERT INTO dateformat VALUES ('2', 'Iso8601Short', 'yyyy-MM-dd', 'Y-m-d');
INSERT INTO dateformat VALUES ('3', 'ShortDate', 'M/d/yy', 'n/j/y');
INSERT INTO dateformat VALUES ('4', 'longDate', 'EEEE, MMMM dd, yyyy', 'l, F d, Y');
INSERT INTO dateformat VALUES ('5', 'FullDateFormat', 'EEEE, MMMM dd, yyyy h:mm:ss a', 'l, F d, Y g:i:s A');
INSERT INTO dateformat VALUES ('9', 'sortableDatetime', 'yyyy-MM-dd z HH:mm:ss', 'Y-m-d T H:i:s');

-- ----------------------------
-- Table structure for `deldocs`
-- ----------------------------
DROP TABLE IF EXISTS `deldocs`;
CREATE TABLE `deldocs` (
  `docid` varchar(50) default NULL,
  `userid` varchar(50) default NULL,
  KEY `docid` (`docid`),
  KEY `userid` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of deldocs
-- ----------------------------

-- ----------------------------
-- Table structure for `deposit`
-- ----------------------------
DROP TABLE IF EXISTS `deposit`;
CREATE TABLE `deposit` (
  `num` int(32) default NULL,
  `pstid` varchar(50) default NULL,
  `accountid` varchar(50) default NULL,
  `amount` double(20,2) default NULL,
  `note` varchar(256) default NULL,
  `timestamp` timestamp NULL default NULL on update CURRENT_TIMESTAMP,
  KEY `pstid` (`pstid`),
  KEY `accountid` (`accountid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of deposit
-- ----------------------------

-- ----------------------------
-- Table structure for `docprerel`
-- ----------------------------
DROP TABLE IF EXISTS `docprerel`;
CREATE TABLE `docprerel` (
  `docid` varchar(50) default NULL,
  `userid` varchar(50) default NULL,
  `permission` text,
  `readwrite` int(11) default NULL,
  KEY `docprerel_fk_2` (`userid`),
  KEY `docprerelfk1` (`docid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of docprerel
-- ----------------------------

-- ----------------------------
-- Table structure for `docs`
-- ----------------------------
DROP TABLE IF EXISTS `docs`;
CREATE TABLE `docs` (
  `docid` varchar(50) NOT NULL,
  `docname` text,
  `docsize` text,
  `doctype` text,
  `docdatemod` datetime default NULL,
  `userid` varchar(50) default NULL,
  `docper` text,
  `docstatus` text,
  `docrevision` text,
  `groupid` varchar(50) default NULL,
  `comments` varchar(80) default NULL,
  `version` text,
  `svnname` text,
  `storageindex` int(11) NOT NULL,
  PRIMARY KEY  (`docid`),
  KEY `docid` (`docid`),
  KEY `docs_fk_1` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of docs
-- ----------------------------

-- ----------------------------
-- Table structure for `docstags`
-- ----------------------------
DROP TABLE IF EXISTS `docstags`;
CREATE TABLE `docstags` (
  `docid` varchar(50) NOT NULL,
  `id` varchar(50) NOT NULL,
  `tagid` varchar(50) NOT NULL,
  KEY `docid` (`docid`),
  KEY `tagid` (`tagid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of docstags
-- ----------------------------

-- ----------------------------
-- Table structure for `doctagrel`
-- ----------------------------
DROP TABLE IF EXISTS `doctagrel`;
CREATE TABLE `doctagrel` (
  `docid` varchar(50) default NULL,
  `tagid` varchar(50) default NULL,
  `userid` varchar(50) default NULL,
  `groupid` varchar(50) default NULL,
  `pcid` varchar(50) default NULL,
  KEY `doctagrel_fk_1` (`docid`),
  KEY `doctagrel_fk_3` (`userid`),
  KEY `tagid` (`tagid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of doctagrel
-- ----------------------------

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
-- Table structure for `mailmessages`
-- ----------------------------
DROP TABLE IF EXISTS `mailmessages`;
CREATE TABLE `mailmessages` (
  `post_id` varchar(50) NOT NULL,
  `to_id` varchar(50) default NULL,
  `poster_id` varchar(50) default NULL,
  `post_subject` text,
  `post_text` text,
  `post_time` timestamp NULL default CURRENT_TIMESTAMP,
  `flag` tinyint(1) NOT NULL default '0',
  `folder` varchar(50) NOT NULL,
  `reply_to` varchar(50) default NULL,
  `last_folder_id` varchar(50) NOT NULL,
  `readflag` tinyint(1) default '0',
  PRIMARY KEY  (`post_id`),
  KEY `to_id` (`to_id`),
  KEY `poster_id` (`poster_id`),
  KEY `folder` (`folder`),
  KEY `last_folder_id` (`last_folder_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mailmessages
-- ----------------------------

-- ----------------------------
-- Table structure for `mailmsgfoldermap`
-- ----------------------------
DROP TABLE IF EXISTS `mailmsgfoldermap`;
CREATE TABLE `mailmsgfoldermap` (
  `folder_id` varchar(50) NOT NULL,
  `folder_name` text NOT NULL,
  `folder_path` text,
  PRIMARY KEY  (`folder_id`),
  KEY `folder_id` (`folder_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mailmsgfoldermap
-- ----------------------------
INSERT INTO mailmsgfoldermap VALUES ('0', 'Inbox', 'Personal Messages\\Inbox');
INSERT INTO mailmsgfoldermap VALUES ('1', 'Outbox', 'Personal Messages\\Outbox');
INSERT INTO mailmsgfoldermap VALUES ('2', 'Deleted Items', 'Personal Messages\\Deleted Items');
INSERT INTO mailmsgfoldermap VALUES ('3', 'Drafts', 'Personal Messages\\Drafts');

-- ----------------------------
-- Table structure for `mailnotification`
-- ----------------------------
DROP TABLE IF EXISTS `mailnotification`;
CREATE TABLE `mailnotification` (
  `mailid` varchar(255) NOT NULL,
  `userid` varchar(255) NOT NULL,
  `companyid` varchar(255) NOT NULL,
  `reportname` varchar(50) default NULL,
  `statusid` varchar(10) default NULL,
  `frequency` int(11) default NULL,
  `intervaldays` int(11) default NULL,
  `startdate` date NOT NULL,
  `nextdate` date NOT NULL,
  `isactive` int(5) default NULL,
  PRIMARY KEY  (`mailid`),
  KEY `userid` (`userid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of mailnotification
-- ----------------------------

-- ----------------------------
-- Table structure for `permissiontype`
-- ----------------------------
DROP TABLE IF EXISTS `permissiontype`;
CREATE TABLE `permissiontype` (
  `perName` text,
  `perid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of permissiontype
-- ----------------------------
INSERT INTO permissiontype VALUES ('All Connection', '1');
INSERT INTO permissiontype VALUES ('Select Connection', '2');
INSERT INTO permissiontype VALUES ('Everyone', '3');
INSERT INTO permissiontype VALUES ('None', '4');
INSERT INTO permissiontype VALUES ('Project', '5');
INSERT INTO permissiontype VALUES ('Community', '6');
INSERT INTO permissiontype VALUES ('Individual', '7');

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
-- Table structure for `profiletags`
-- ----------------------------
DROP TABLE IF EXISTS `profiletags`;
CREATE TABLE `profiletags` (
  `id` varchar(50) NOT NULL,
  `tagid` varchar(50) NOT NULL,
  KEY `tagid` (`tagid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of profiletags
-- ----------------------------

-- ----------------------------
-- Table structure for `proj_resources`
-- ----------------------------
DROP TABLE IF EXISTS `proj_resources`;
CREATE TABLE `proj_resources` (
  `resourceid` varchar(50) NOT NULL default '0',
  `resourcename` text NOT NULL,
  `projid` varchar(50) NOT NULL,
  `billable` bit(1) NOT NULL default b'1',
  `maxunits` int(11) default '0',
  `stdrate` double default '0',
  `overtimerate` double default '0',
  `costperuse` double NOT NULL default '0',
  `accrueat` text,
  `basecalender` text,
  `code` text,
  `materiallabel` text,
  `initials` text,
  `resourcegrp` text,
  `typeid` int(11) default '1',
  `colorcode` varchar(10) default '#FF0000',
  `timestamp` datetime default NULL,
  `inuseflag` bit(1) default b'1',
  PRIMARY KEY  (`resourceid`,`projid`),
  KEY `projid_Fk` (`projid`),
  KEY `typeid` (`typeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of proj_resources
-- ----------------------------

-- ----------------------------
-- Table structure for `proj_resourcetype`
-- ----------------------------
DROP TABLE IF EXISTS `proj_resourcetype`;
CREATE TABLE `proj_resourcetype` (
  `typeid` int(11) NOT NULL auto_increment,
  `typename` text NOT NULL,
  `timestamp` datetime default NULL,
  PRIMARY KEY  (`typeid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of proj_resourcetype
-- ----------------------------
INSERT INTO proj_resourcetype VALUES ('1', 'Member', null);
INSERT INTO proj_resourcetype VALUES ('2', 'Other', null);
INSERT INTO proj_resourcetype VALUES ('4', 'new Res Type', null);
INSERT INTO proj_resourcetype VALUES ('5', 'new type', null);
INSERT INTO proj_resourcetype VALUES ('6', 'Network', null);

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
  `actiontime` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  KEY `userid` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of resetpwd
-- ----------------------------

-- ----------------------------
-- Table structure for `sharecalendarmap`
-- ----------------------------
DROP TABLE IF EXISTS `sharecalendarmap`;
CREATE TABLE `sharecalendarmap` (
  `cid` varchar(36) NOT NULL,
  `userid` varchar(36) NOT NULL,
  `permissionlevel` int(11) default '0',
  `timestamp` timestamp NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  KEY `userid` (`userid`),
  KEY `cid` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sharecalendarmap
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
-- Table structure for `tax`
-- ----------------------------
DROP TABLE IF EXISTS `tax`;
CREATE TABLE `tax` (
  `id` varchar(255) NOT NULL,
  `name` varchar(50) NOT NULL,
  `percentage` double(4,2) NOT NULL default '0.00',
  `taxcode` varchar(50) NOT NULL,
  `deleteflag` char(1) NOT NULL default 'F',
  `companyid` varchar(255) NOT NULL,
  `applydate` datetime NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tax
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
INSERT INTO timezone VALUES ('2', '(GMT +08:00) Kuala Lumpur', '+08:00', 'MST', '2');
INSERT INTO timezone VALUES ('1', '(GMT +05:30) India Standard Time', '+05:30', 'IST', '1');
INSERT INTO timezone VALUES ('3', '(GMT +03:00) Jeddah, Saudi Arabia', '+03:00', 'AST', '3');
INSERT INTO timezone VALUES ('4', '(GMT +07:00) Jakarta, Java, Indonesia', '+07:00', 'WIT', '4');
INSERT INTO timezone VALUES ('5', '(GMT +01:00) London, England, United Kingdom', '+01:00', 'BST', '5');
INSERT INTO timezone VALUES ('6', '(GMT +06:00) Islamabad, Pakistan', '+06:00', 'PKST', '6');
INSERT INTO timezone VALUES ('7', '(GMT +10:00) Brisbane, Queensland, Australia', '+10:00', 'EST', '7');
INSERT INTO timezone VALUES ('8', '(GMT +4:00) Abu Dhabi, United Arab Emirates', '+04:00', 'GST', '8');
INSERT INTO timezone VALUES ('9', '(GMT +12:00) Christchurch, New Zealand', '+12:00', 'NZDT', '9');
INSERT INTO timezone VALUES ('10', '(GMT +08:00) Singapore, Singapore', '+08:00', 'SGT', '10');
INSERT INTO timezone VALUES ('11', '(GMT +07:00) Bangkok, Thailand', '+07:00', 'ICT', '11');
INSERT INTO timezone VALUES ('12', '(GMT +01:00) Lagos, Nigeria', '+01:00', 'WAT', '12');
INSERT INTO timezone VALUES ('13', '(GMT +04:00) Port Louis, Mauritius', '+04:00', 'MIT', '13');
INSERT INTO timezone VALUES ('14', '(GMT -05:00) Washington, USA', '-05:00', 'EDT', '14');
INSERT INTO timezone VALUES ('15', '(GMT +08:00) Hong Kong, China', '+08:00', 'HKT', '15');
INSERT INTO timezone VALUES ('16', '(GMT +06:00) Dhaka, Bangladesh', '+06:00', 'BDT', '16');
INSERT INTO timezone VALUES ('17', '(GMT +03:00) Kuwait City, Kuwait', '+03:00', 'AST', '17');
INSERT INTO timezone VALUES ('18', '(GMT +08:00) Manila, Philippines', '+08:00', 'PHT', '18');
INSERT INTO timezone VALUES ('19', '(GMT +03:00) Manama, Bahrain', '+03:00', 'AST', '19');
INSERT INTO timezone VALUES ('20', '(GMT +03:30) Tehran, Iran', '+03:30', 'IRST', '20');
INSERT INTO timezone VALUES ('21', '(GMT +03:00) Khartoum, Sudan', '+03:00', 'CAT', '21');
INSERT INTO timezone VALUES ('23', '(GMT -04:00) New York, New York, United States', '-04:00', 'EDT', '23');
INSERT INTO timezone VALUES ('22', '(GMT +02:00) Berlin, Berlin, Germany', '+02:00', 'CEST', '22');
INSERT INTO timezone VALUES ('24', '(GMT -08:00)Pacific Time Zone,Canada', '-08:00', 'PT', '24');
INSERT INTO timezone VALUES ('25', '(GMT -07:00)Mountain Time Zone,Canada', '-07:00', 'MT', '25');
INSERT INTO timezone VALUES ('26', '(GMT -06:00)Central Time Zone,Canada', '-06:00', 'CT', '26');
INSERT INTO timezone VALUES ('27', '(GMT -05:00)Eastern Time Zone,Toronto,Canada', '-05:00', 'ET', '27');
INSERT INTO timezone VALUES ('28', '(GMT -04:00)Atlantic Time Zone,Canada', '-04:00', 'AT', '28');
INSERT INTO timezone VALUES ('29', '(GMT -03:30)Newfoundland Standard Time Zone', '-03:30', 'NST', '29');

-- ----------------------------
-- Table structure for `tms_accomodationdetails`
-- ----------------------------
DROP TABLE IF EXISTS `tms_accomodationdetails`;
CREATE TABLE `tms_accomodationdetails` (
  `id` varchar(36) NOT NULL,
  `tripid` varchar(36) NOT NULL,
  `hotelname` varchar(50) NOT NULL,
  `checkindate` varchar(36) NOT NULL,
  `checkintime` varchar(36) default NULL,
  `checkoutdate` varchar(36) NOT NULL,
  `checkouttime` varchar(36) default NULL,
  `roomtype` varchar(36) NOT NULL,
  `remark` varchar(200) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tms_accomodationdetails
-- ----------------------------

-- ----------------------------
-- Table structure for `tms_advance`
-- ----------------------------
DROP TABLE IF EXISTS `tms_advance`;
CREATE TABLE `tms_advance` (
  `id` varchar(255) NOT NULL,
  `tripid` varchar(255) NOT NULL,
  `approverid` varchar(255) NOT NULL,
  `name` varchar(50) NOT NULL,
  `items` varchar(50) NOT NULL,
  `amount` double(12,4) NOT NULL default '0.0000',
  `applydate` datetime NOT NULL,
  `userid` varchar(255) NOT NULL,
  `statusid` int(1) NOT NULL default '4',
  `approvedamount` double(12,4) NOT NULL default '0.0000',
  `comments` text,
  `remarks` varchar(255) NOT NULL default '',
  `isArchive` tinyint(1) NOT NULL default '0',
  `isArchiveByAdmin` tinyint(1) NOT NULL default '0',
  `isArchiveByApp` tinyint(1) NOT NULL default '0',
  `financemgr` varchar(255) default NULL,
  `remarkbyfinancer` varchar(255) default NULL,
  `chequeno` varchar(50) default NULL,
  `approvedon` varchar(50) default NULL,
  `costcenterid` int(12) NOT NULL,
  `projectid` int(12) NOT NULL,
  `advanceid` varchar(255) NOT NULL,
  `typeflag` int(10) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `userid` (`userid`),
  KEY `approverid` (`approverid`),
  CONSTRAINT `tms_advance_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`),
  CONSTRAINT `tms_advance_ibfk_2` FOREIGN KEY (`approverid`) REFERENCES `users` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tms_advance
-- ----------------------------

-- ----------------------------
-- Table structure for `tms_advanceaccmap`
-- ----------------------------
DROP TABLE IF EXISTS `tms_advanceaccmap`;
CREATE TABLE `tms_advanceaccmap` (
  `userid` varchar(36) NOT NULL,
  `advanceid` varchar(36) NOT NULL,
  `accManagerid` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tms_advanceaccmap
-- ----------------------------

-- ----------------------------
-- Table structure for `tms_claimaccontmap`
-- ----------------------------
DROP TABLE IF EXISTS `tms_claimaccontmap`;
CREATE TABLE `tms_claimaccontmap` (
  `userid` varchar(36) character set utf8 NOT NULL default '',
  `claimid` varchar(36) character set utf8 NOT NULL default '',
  `accManagerid` varchar(36) character set utf8 NOT NULL default '',
  KEY `userid` (`userid`),
  KEY `account_claimid` (`claimid`),
  KEY `account_approver` (`accManagerid`),
  CONSTRAINT `account_approver` FOREIGN KEY (`accManagerid`) REFERENCES `users` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `account_claimid` FOREIGN KEY (`claimid`) REFERENCES `tms_expenses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tms_claimaccontmap_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tms_claimaccontmap
-- ----------------------------

-- ----------------------------
-- Table structure for `tms_claims`
-- ----------------------------
DROP TABLE IF EXISTS `tms_claims`;
CREATE TABLE `tms_claims` (
  `claimtypeid` varchar(4) NOT NULL default '',
  `currencyid` varchar(4) NOT NULL default '',
  `amount` varchar(36) NOT NULL default '0',
  `adjustedamount` varchar(36) NOT NULL default '',
  `tripid` varchar(36) NOT NULL default '',
  `approverid` varchar(36) NOT NULL default '',
  `projectid` varchar(4) NOT NULL default '',
  `currencyname` varchar(5) NOT NULL default '',
  `id` varchar(36) NOT NULL,
  `isadvance` tinyint(1) NOT NULL default '0',
  `name` varchar(36) default '',
  `statusid` varchar(36) default NULL,
  `approvedamount` varchar(36) default '',
  `approvedon` varchar(36) default '',
  `approvedby` varchar(36) default '',
  `comments` varchar(36) default '',
  `filledby` varchar(36) default '',
  `spenton` varchar(36) default '',
  `paymentstatus` varchar(20) default 'Unpaid',
  `numdays` int(5) default NULL,
  `isoriginal` int(1) default NULL,
  `cashorcard` varchar(4) default NULL,
  `cardtype` varchar(15) default NULL,
  `cardno` varchar(30) default NULL,
  `currencyrate` double default NULL,
  `isgroup` int(4) default NULL,
  `dailyexpense` int(4) default NULL,
  `paidby` int(4) default NULL,
  `medicalplanid` varchar(36) default NULL,
  `defaultcurr` varchar(4) NOT NULL default '',
  PRIMARY KEY  USING BTREE (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tms_claims
-- ----------------------------

-- ----------------------------
-- Table structure for `tms_combo`
-- ----------------------------
DROP TABLE IF EXISTS `tms_combo`;
CREATE TABLE `tms_combo` (
  `id` int(12) NOT NULL auto_increment,
  `name` varchar(50) character set latin1 NOT NULL,
  `type` varchar(50) character set latin1 NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tms_combo
-- ----------------------------
INSERT INTO tms_combo VALUES ('1', 'Select...', 'blank');
INSERT INTO tms_combo VALUES ('2', 'Approved', 'Status');
INSERT INTO tms_combo VALUES ('3', 'Rejected', 'Status');
INSERT INTO tms_combo VALUES ('4', 'Pending', 'Status');
INSERT INTO tms_combo VALUES ('5', 'On Hold', 'Status');
INSERT INTO tms_combo VALUES ('6', 'USD', 'currency');
INSERT INTO tms_combo VALUES ('7', 'INR', 'currency');
INSERT INTO tms_combo VALUES ('8', 'GBP', 'currency');
INSERT INTO tms_combo VALUES ('9', 'EURO', 'currency');
INSERT INTO tms_combo VALUES ('10', 'SwissFranc', 'currency');
INSERT INTO tms_combo VALUES ('11', 'MYR', 'currency');
INSERT INTO tms_combo VALUES ('12', 'Rail', 'transport');
INSERT INTO tms_combo VALUES ('13', 'Road', 'transport');
INSERT INTO tms_combo VALUES ('14', 'Air', 'transport');
INSERT INTO tms_combo VALUES ('15', 'Rial', 'currency');
INSERT INTO tms_combo VALUES ('16', 'Confirmed', 'status_reservation');
INSERT INTO tms_combo VALUES ('18', 'Cancelled', 'status_reservation');
INSERT INTO tms_combo VALUES ('19', 'Pending Visa', 'status_reservation');
INSERT INTO tms_combo VALUES ('20', 'Pending Passport', 'status_reservation');
INSERT INTO tms_combo VALUES ('21', 'Pending Medical', 'status_reservation');
INSERT INTO tms_combo VALUES ('22', 'Pending Legal', 'status_reservation');
INSERT INTO tms_combo VALUES ('23', 'Pending Criminal', 'status_reservation');
INSERT INTO tms_combo VALUES ('24', 'Rejected', 'status_reservation');
INSERT INTO tms_combo VALUES ('25', 'Waiting For Accounts Approval', 'Status');
INSERT INTO tms_combo VALUES ('26', 'Visa', 'card');
INSERT INTO tms_combo VALUES ('27', 'Master', 'card');
INSERT INTO tms_combo VALUES ('28', 'Debit', 'card');
INSERT INTO tms_combo VALUES ('39', 'Pending Cancellation ', 'status');
INSERT INTO tms_combo VALUES ('40', 'Approved Cancellation ', 'status');
INSERT INTO tms_combo VALUES ('41', 'Not Submitted', 'status');

-- ----------------------------
-- Table structure for `tms_costcenter`
-- ----------------------------
DROP TABLE IF EXISTS `tms_costcenter`;
CREATE TABLE `tms_costcenter` (
  `id` int(12) NOT NULL auto_increment,
  `name` varchar(100) NOT NULL,
  `description` varchar(100) default NULL,
  `companyid` varchar(36) NOT NULL,
  `resp_id` varchar(50) default NULL,
  `enddate` date default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=400 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tms_costcenter
-- ----------------------------

-- ----------------------------
-- Table structure for `tms_currency`
-- ----------------------------
DROP TABLE IF EXISTS `tms_currency`;
CREATE TABLE `tms_currency` (
  `id` int(3) NOT NULL auto_increment,
  `country` varchar(50) default NULL,
  `code` varchar(5) default NULL,
  `symbol` varchar(10) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1010 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tms_currency
-- ----------------------------
INSERT INTO tms_currency VALUES ('19', 'Albania', 'ALL', 'Lek');
INSERT INTO tms_currency VALUES ('1', 'United States of America', 'USD', '$');
INSERT INTO tms_currency VALUES ('37', 'Afghanistan', 'AFN', 'AFN');
INSERT INTO tms_currency VALUES ('4', 'Argentina', 'ARS', '$');
INSERT INTO tms_currency VALUES ('49', 'Aruba', 'AWG', 'AWG');
INSERT INTO tms_currency VALUES ('94', 'Australia', 'AUD', '$');
INSERT INTO tms_currency VALUES ('68', 'Azerbaijan', 'AZN', 'AZN');
INSERT INTO tms_currency VALUES ('27', 'Bahamas', 'BSD', '$');
INSERT INTO tms_currency VALUES ('115', 'Barbados', 'BBD', '$');
INSERT INTO tms_currency VALUES ('10', 'Belarus', 'BYR', 'p.');
INSERT INTO tms_currency VALUES ('12', 'Belize', 'BZD', 'BZ$');
INSERT INTO tms_currency VALUES ('13', 'Bermuda', 'BMD', '$');
INSERT INTO tms_currency VALUES ('14', 'Bolivia', 'BOB', '$b');
INSERT INTO tms_currency VALUES ('15', 'Bosnia and Herzegovina', 'BAM', 'KM');
INSERT INTO tms_currency VALUES ('16', 'Botswana', 'BWP', 'P');
INSERT INTO tms_currency VALUES ('17', 'Bulgaria', 'BGN', 'BGN');
INSERT INTO tms_currency VALUES ('18', 'Brazil', 'BRL', 'R$');
INSERT INTO tms_currency VALUES ('2', 'United Kingdom', 'GBP', 'Â£');
INSERT INTO tms_currency VALUES ('20', 'Brunei Darussalam', 'BND', '$');
INSERT INTO tms_currency VALUES ('21', 'Cambodia', 'KHR', 'KHR');
INSERT INTO tms_currency VALUES ('22', 'Canada', 'CAD', '$');
INSERT INTO tms_currency VALUES ('23', 'Cayman Islands', 'KYD', '$');
INSERT INTO tms_currency VALUES ('24', 'Chile', 'CLP', '$');
INSERT INTO tms_currency VALUES ('25', 'China', 'CNY', 'Ã.Â¥');
INSERT INTO tms_currency VALUES ('26', 'Colombia', 'COP', '$');
INSERT INTO tms_currency VALUES ('8', 'Costa Rica', 'CRC', 'CRC');
INSERT INTO tms_currency VALUES ('28', 'Croatia', 'HRK', 'kn');
INSERT INTO tms_currency VALUES ('29', 'Cuba', 'CUP', 'CUP');
INSERT INTO tms_currency VALUES ('31', 'Czech Republic', 'CZK', 'CZK');
INSERT INTO tms_currency VALUES ('32', 'Denmark', 'DKK', 'kr');
INSERT INTO tms_currency VALUES ('33', 'Dominican Republic', 'DOP', 'RD$');
INSERT INTO tms_currency VALUES ('34', 'East Caribbean', 'XCD', '$');
INSERT INTO tms_currency VALUES ('35', 'Egypt', 'EGP', 'Â£');
INSERT INTO tms_currency VALUES ('36', 'El Salvador', 'SVC', '$');
INSERT INTO tms_currency VALUES ('3', 'Europian Union', 'EUR', 'EUR');
INSERT INTO tms_currency VALUES ('38', 'Falkland Islands', 'FKP', 'Â£');
INSERT INTO tms_currency VALUES ('39', 'Fiji', 'FJD', '$');
INSERT INTO tms_currency VALUES ('40', 'Ghana', 'GHC', 'Â¢');
INSERT INTO tms_currency VALUES ('41', 'Gibraltar', 'GIP', 'Â£');
INSERT INTO tms_currency VALUES ('42', 'Guatemala', 'GTQ', 'Q');
INSERT INTO tms_currency VALUES ('43', 'Guernsey', 'GGP', 'Â£');
INSERT INTO tms_currency VALUES ('44', 'Guyana', 'GYD', '$');
INSERT INTO tms_currency VALUES ('45', 'Honduras', 'HNL', 'L');
INSERT INTO tms_currency VALUES ('46', 'Hong Kong', 'HKD', 'HK$');
INSERT INTO tms_currency VALUES ('47', 'Hungary', 'HUF', 'Ft');
INSERT INTO tms_currency VALUES ('48', 'Iceland', 'ISK', 'kr');
INSERT INTO tms_currency VALUES ('5', 'India', 'INR', 'Rs');
INSERT INTO tms_currency VALUES ('50', 'Indonesia', 'IDR', 'Rp');
INSERT INTO tms_currency VALUES ('51', 'Iran', 'IRR', 'IRR');
INSERT INTO tms_currency VALUES ('52', 'Isle of Man', 'IMP', 'Â£');
INSERT INTO tms_currency VALUES ('53', 'Israel', 'ILS', 'ILS');
INSERT INTO tms_currency VALUES ('54', 'Jamaica', 'JMD', 'J$');
INSERT INTO tms_currency VALUES ('55', 'Japan', 'JPY', 'Ã.Â¥');
INSERT INTO tms_currency VALUES ('56', 'Jersey', 'JEP', 'Â£');
INSERT INTO tms_currency VALUES ('57', 'Kazakhstan', 'KZT', 'KZT');
INSERT INTO tms_currency VALUES ('58', 'Korea (North)', 'KPW', 'KPW');
INSERT INTO tms_currency VALUES ('59', 'Korea (South)', 'KRW', 'KRW');
INSERT INTO tms_currency VALUES ('60', 'Kyrgyzstan', 'KGS', 'KGS');
INSERT INTO tms_currency VALUES ('61', 'Laos', 'LAK', 'LAK');
INSERT INTO tms_currency VALUES ('62', 'Latvia', 'LVL', 'Ls');
INSERT INTO tms_currency VALUES ('63', 'Lebanon', 'LBP', 'Â£');
INSERT INTO tms_currency VALUES ('64', 'Liberia', 'LRD', '$');
INSERT INTO tms_currency VALUES ('65', 'Liechtenstein,Switzerland', 'CHF', 'CHF');
INSERT INTO tms_currency VALUES ('66', 'Lithuania', 'LTL', 'Lt');
INSERT INTO tms_currency VALUES ('67', 'Macedonia', 'MKD', 'MKD');
INSERT INTO tms_currency VALUES ('7', 'Malaysia', 'MYR', 'RM');
INSERT INTO tms_currency VALUES ('69', 'Mauritius', 'MUR', 'Rs');
INSERT INTO tms_currency VALUES ('70', 'Mexico', 'MXN', '$');
INSERT INTO tms_currency VALUES ('71', 'Mongolia', 'MNT', 'MNT');
INSERT INTO tms_currency VALUES ('72', 'Mozambique', 'MZN', 'MT');
INSERT INTO tms_currency VALUES ('73', 'Namibia', 'NAD', '$');
INSERT INTO tms_currency VALUES ('74', 'Nepal', 'NPR', 'Rs');
INSERT INTO tms_currency VALUES ('75', 'Netherlands', 'ANG', 'ANG');
INSERT INTO tms_currency VALUES ('76', 'New Zealand', 'NZD', '$');
INSERT INTO tms_currency VALUES ('77', 'Nicaragua', 'NIO', 'C$');
INSERT INTO tms_currency VALUES ('78', 'Nigeria', 'NGN', 'NGN');
INSERT INTO tms_currency VALUES ('79', 'Norway', 'NOK', 'kr');
INSERT INTO tms_currency VALUES ('80', 'Oman', 'OMR', 'OMR');
INSERT INTO tms_currency VALUES ('81', 'Pakistan', 'PKR', 'Rs');
INSERT INTO tms_currency VALUES ('82', 'Panama', 'PAB', 'B/.');
INSERT INTO tms_currency VALUES ('83', 'Paraguay', 'PYG', 'Gs');
INSERT INTO tms_currency VALUES ('84', 'Peru', 'PEN', 'S/.');
INSERT INTO tms_currency VALUES ('85', 'Philippines', 'PHP', 'Php');
INSERT INTO tms_currency VALUES ('86', 'Poland', 'PLN', 'PLN');
INSERT INTO tms_currency VALUES ('87', 'Qatar', 'QAR', 'QAR');
INSERT INTO tms_currency VALUES ('88', 'Romania', 'RON', 'lei');
INSERT INTO tms_currency VALUES ('89', 'Russia', 'RUB', 'RUB');
INSERT INTO tms_currency VALUES ('90', 'Saint Helena', 'SHP', 'Â£');
INSERT INTO tms_currency VALUES ('91', 'Saudi Arabia', 'SAR', 'SAR');
INSERT INTO tms_currency VALUES ('92', 'Serbia', 'RSD', 'RSD');
INSERT INTO tms_currency VALUES ('93', 'Seychelles', 'SCR', 'Rs');
INSERT INTO tms_currency VALUES ('6', 'Singapore', 'SGD', '$');
INSERT INTO tms_currency VALUES ('95', 'Solomon Islands', 'SBD', '$');
INSERT INTO tms_currency VALUES ('96', 'Somalia', 'SOS', 'S');
INSERT INTO tms_currency VALUES ('97', 'South Africa', 'ZAR', 'R');
INSERT INTO tms_currency VALUES ('98', 'Sri Lanka', 'LKR', 'Rs');
INSERT INTO tms_currency VALUES ('99', 'Sweden', 'SEK', 'kr');
INSERT INTO tms_currency VALUES ('100', 'Suriname', 'SRD', '$');
INSERT INTO tms_currency VALUES ('101', 'Syria', 'SYP', 'Â£');
INSERT INTO tms_currency VALUES ('102', 'Taiwan', 'TWD', 'NT$');
INSERT INTO tms_currency VALUES ('103', 'Thailand', 'THB', 'THB');
INSERT INTO tms_currency VALUES ('104', 'Trinidad and Tobago', 'TTD', 'TT$');
INSERT INTO tms_currency VALUES ('105', 'Turkey', 'TRY', 'TL');
INSERT INTO tms_currency VALUES ('106', 'Turkey', 'TRL', 'TRL');
INSERT INTO tms_currency VALUES ('107', 'Tuvalu', 'TVD', '$');
INSERT INTO tms_currency VALUES ('108', 'Ukraine', 'UAH', 'UAH');
INSERT INTO tms_currency VALUES ('109', 'Uruguay', 'UYU', '$U');
INSERT INTO tms_currency VALUES ('110', 'Uzbekistan', 'UZS', 'UZS');
INSERT INTO tms_currency VALUES ('111', 'Venezuela,Bolivares', 'VEF', 'Bs');
INSERT INTO tms_currency VALUES ('112', 'Vietnam', 'VND', 'VND');
INSERT INTO tms_currency VALUES ('113', 'Yemen', 'YER', 'YER');
INSERT INTO tms_currency VALUES ('114', 'Zimbabwe', 'ZWD', 'Z$');
INSERT INTO tms_currency VALUES ('9', 'Uganda', 'USh', 'USh');

-- ----------------------------
-- Table structure for `tms_designation`
-- ----------------------------
DROP TABLE IF EXISTS `tms_designation`;
CREATE TABLE `tms_designation` (
  `id` int(12) NOT NULL auto_increment,
  `emptype` varchar(200) NOT NULL default '',
  `department` varchar(100) NOT NULL default '',
  `companyid` varchar(36) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `lm_empleavemodel_ibfk_1` (`companyid`)
) ENGINE=InnoDB AUTO_INCREMENT=1342 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tms_designation
-- ----------------------------

-- ----------------------------
-- Table structure for `tms_documents`
-- ----------------------------
DROP TABLE IF EXISTS `tms_documents`;
CREATE TABLE `tms_documents` (
  `id` varchar(36) character set latin1 NOT NULL,
  `name` varchar(100) character set latin1 NOT NULL,
  `storeindex` varchar(36) character set latin1 NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tms_documents
-- ----------------------------

-- ----------------------------
-- Table structure for `tms_exchangeRule`
-- ----------------------------
DROP TABLE IF EXISTS `tms_exchangeRule`;
CREATE TABLE `tms_exchangeRule` (
  `id` int(12) NOT NULL auto_increment,
  `ondate` date NOT NULL,
  `currencyid` int(12) NOT NULL,
  `rate` double NOT NULL,
  `defaultcurrid` int(12) NOT NULL,
  `amtvalue` double NOT NULL,
  `companyid` varchar(36) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=121 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tms_exchangeRule
-- ----------------------------

-- ----------------------------
-- Table structure for `tms_expenses`
-- ----------------------------
DROP TABLE IF EXISTS `tms_expenses`;
CREATE TABLE `tms_expenses` (
  `id` varchar(36) NOT NULL,
  `userid` varchar(36) character set latin1 default NULL,
  `description` varchar(1024) character set latin1 default NULL,
  `amount` double NOT NULL default '0',
  `currencytypeid` varchar(36) character set latin1 default NULL,
  `filedon` date default NULL,
  `costcenterid` varchar(36) character set latin1 NOT NULL,
  `statusid` int(12) default NULL,
  `isgroup` tinyint(4) default NULL,
  `spenton` date default NULL,
  `approvedon` date default NULL,
  `approvedby` varchar(36) default NULL,
  `approvedamount` double default NULL,
  `tripid` varchar(36) default NULL,
  `itinid` varchar(36) default NULL,
  `name` varchar(100) default NULL,
  `comments` varchar(1024) default NULL,
  `isadvance` tinyint(4) default NULL,
  `filedby` varchar(36) default NULL,
  `paidby` tinyint(1) NOT NULL default '0',
  `dailyexpense` tinyint(1) NOT NULL default '0',
  `numdays` int(5) NOT NULL default '1',
  `isoriginal` tinyint(1) NOT NULL default '0',
  `projid` varchar(36) NOT NULL default '',
  `issave` tinyint(1) NOT NULL default '0',
  `approverid` varchar(36) NOT NULL default '',
  `calculatedby` tinyint(4) default '1',
  `rate` double default '0',
  `distance` double default '0',
  `cashorcard` tinyint(4) default '1',
  `cardtype` varchar(15) default NULL,
  `cardno` varchar(30) default NULL,
  `currencyrate` double default '1',
  `defaultcurr` varchar(36) default NULL,
  `isArchive` tinyint(1) NOT NULL default '0',
  `isBillable` tinyint(1) NOT NULL default '1',
  `claimedamount` double NOT NULL default '0',
  `insideclaimid` varchar(36) NOT NULL default '',
  `taxid` varchar(36) NOT NULL default '',
  `expensetypeid` varchar(36) NOT NULL default '',
  `ispersonal` tinyint(1) NOT NULL default '0',
  `approvedAdvance` double(25,4) NOT NULL default '0.0000',
  `isArchiveByAdmin` tinyint(1) NOT NULL default '0',
  `isArchiveByApp` tinyint(1) NOT NULL default '0',
  `from` varchar(50) default NULL,
  `to` varchar(50) default NULL,
  `parking` double NOT NULL default '0',
  `toll` double NOT NULL default '0',
  `mileage` double NOT NULL default '0',
  `mileagerate` double NOT NULL default '1',
  `refno` int(11) NOT NULL default '0',
  `remarks` text,
  `chequeno` varchar(50) default NULL,
  `remarkbyfinancer` varchar(255) default NULL,
  PRIMARY KEY  (`id`),
  KEY `taxid` (`taxid`),
  KEY `expensetypeid` (`expensetypeid`),
  KEY `approverid` (`approverid`),
  CONSTRAINT `tms_expenses_ibfk_1` FOREIGN KEY (`approverid`) REFERENCES `users` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='InnoDB free: 6144 kB';

-- ----------------------------
-- Records of tms_expenses
-- ----------------------------

-- ----------------------------
-- Table structure for `tms_expensetypes`
-- ----------------------------
DROP TABLE IF EXISTS `tms_expensetypes`;
CREATE TABLE `tms_expensetypes` (
  `id` int(11) default NULL,
  `name` varchar(35) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tms_expensetypes
-- ----------------------------
INSERT INTO tms_expensetypes VALUES ('0', 'General');
INSERT INTO tms_expensetypes VALUES ('1', 'Mileage');
INSERT INTO tms_expensetypes VALUES ('2', 'HR');
INSERT INTO tms_expensetypes VALUES ('3', 'Travel');
INSERT INTO tms_expensetypes VALUES ('4', 'Unlimited Expense');

-- ----------------------------
-- Table structure for `tms_flightdetails`
-- ----------------------------
DROP TABLE IF EXISTS `tms_flightdetails`;
CREATE TABLE `tms_flightdetails` (
  `id` varchar(36) NOT NULL,
  `tripid` varchar(36) NOT NULL default '',
  `deptcountry` varchar(36) NOT NULL default '',
  `deptcity` varchar(36) NOT NULL default '',
  `deptdate` varchar(36) NOT NULL default '',
  `arrcountry` varchar(36) NOT NULL default '',
  `arrcity` varchar(36) NOT NULL default '',
  `arrdate` varchar(36) NOT NULL default '',
  `approverid` varchar(36) NOT NULL default '',
  `createdby` varchar(36) NOT NULL default '',
  `arrtime` varchar(36) NOT NULL default '',
  `depttime` varchar(36) NOT NULL default '',
  `passportno` varchar(36) NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tms_flightdetails
-- ----------------------------

-- ----------------------------
-- Table structure for `tms_GroupItemmap`
-- ----------------------------
DROP TABLE IF EXISTS `tms_GroupItemmap`;
CREATE TABLE `tms_GroupItemmap` (
  `groupid` int(12) NOT NULL,
  `isCC` tinyint(1) NOT NULL default '0',
  `expenseid` int(12) NOT NULL,
  `periodic_limit` double NOT NULL,
  PRIMARY KEY  (`groupid`,`isCC`,`expenseid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tms_GroupItemmap
-- ----------------------------

-- ----------------------------
-- Table structure for `tms_items`
-- ----------------------------
DROP TABLE IF EXISTS `tms_items`;
CREATE TABLE `tms_items` (
  `id` int(12) NOT NULL auto_increment,
  `name` varchar(100) NOT NULL,
  `description` varchar(100) default NULL,
  `companyid` varchar(100) NOT NULL,
  `type` int(11) default '0',
  `monthly_limit` double NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=414 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tms_items
-- ----------------------------

-- ----------------------------
-- Table structure for `tms_itinerary`
-- ----------------------------
DROP TABLE IF EXISTS `tms_itinerary`;
CREATE TABLE `tms_itinerary` (
  `tripid` varchar(36) character set latin1 NOT NULL,
  `depcountry` int(12) NOT NULL,
  `depcity` varchar(50) character set latin1 NOT NULL,
  `depdate` date NOT NULL,
  `deptime` time default NULL,
  `modetypeid` int(12) default NULL,
  `arrcountry` int(12) default NULL,
  `arrcity` varchar(50) character set latin1 default NULL,
  `arrdate` date default NULL,
  `arrtime` time default NULL,
  `id` varchar(36) character set latin1 NOT NULL,
  `next` varchar(36) character set latin1 default NULL,
  `name` varchar(100) NOT NULL,
  `statusid` int(12) default NULL,
  `comments` varchar(1024) default NULL,
  `description` varchar(1024) default NULL,
  `createdby` varchar(36) default NULL,
  `approverid` varchar(36) NOT NULL default '',
  `duration` double NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tms_itinerary
-- ----------------------------

-- ----------------------------
-- Table structure for `tms_memberitinerarymap`
-- ----------------------------
DROP TABLE IF EXISTS `tms_memberitinerarymap`;
CREATE TABLE `tms_memberitinerarymap` (
  `itinid` varchar(36) character set latin1 NOT NULL,
  `userid` varchar(36) character set latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tms_memberitinerarymap
-- ----------------------------

-- ----------------------------
-- Table structure for `tms_membertripmap`
-- ----------------------------
DROP TABLE IF EXISTS `tms_membertripmap`;
CREATE TABLE `tms_membertripmap` (
  `tripid` varchar(36) character set latin1 NOT NULL,
  `userid` varchar(36) character set latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tms_membertripmap
-- ----------------------------

-- ----------------------------
-- Table structure for `tms_passportform`
-- ----------------------------
DROP TABLE IF EXISTS `tms_passportform`;
CREATE TABLE `tms_passportform` (
  `number` varchar(50) NOT NULL,
  `fname` varchar(50) NOT NULL,
  `lname` varchar(50) NOT NULL,
  `mname` varchar(50) NOT NULL,
  `fathersname` varchar(50) NOT NULL,
  `mothersname` varchar(50) NOT NULL,
  `address` varchar(1024) NOT NULL,
  `issuedate` date NOT NULL,
  `expirydate` date NOT NULL,
  `issuecity` varchar(50) NOT NULL,
  `dob` date NOT NULL,
  `pob` varchar(50) NOT NULL,
  `id` varchar(36) NOT NULL,
  `userid` varchar(50) NOT NULL,
  `nationality` varchar(50) NOT NULL,
  `countrycode` varchar(32) NOT NULL,
  `fileno` varchar(100) default NULL,
  `oldpassportinfo` varchar(1024) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tms_passportform
-- ----------------------------

-- ----------------------------
-- Table structure for `tms_project`
-- ----------------------------
DROP TABLE IF EXISTS `tms_project`;
CREATE TABLE `tms_project` (
  `id` int(12) NOT NULL auto_increment,
  `name` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `companyid` varchar(50) NOT NULL,
  `manager` varchar(50) default NULL,
  `enddate` date default NULL,
  `description` varchar(50) default NULL,
  `startdate` date default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=359 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tms_project
-- ----------------------------

-- ----------------------------
-- Table structure for `tms_reservations`
-- ----------------------------
DROP TABLE IF EXISTS `tms_reservations`;
CREATE TABLE `tms_reservations` (
  `itinid` varchar(36) NOT NULL,
  `isvalidvisa` int(3) default NULL,
  `isvalidpassport` int(3) default NULL,
  `userid` varchar(36) NOT NULL,
  `statusid` int(12) default NULL,
  `comments` varchar(1024) default NULL,
  `id` varchar(36) NOT NULL,
  `name` varchar(100) NOT NULL,
  `isreservationrequest` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tms_reservations
-- ----------------------------

-- ----------------------------
-- Table structure for `tms_roles`
-- ----------------------------
DROP TABLE IF EXISTS `tms_roles`;
CREATE TABLE `tms_roles` (
  `id` int(12) NOT NULL auto_increment,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tms_roles
-- ----------------------------
INSERT INTO tms_roles VALUES ('-99', 'superadmin');
INSERT INTO tms_roles VALUES ('1', 'Administrator');
INSERT INTO tms_roles VALUES ('2', 'User');
INSERT INTO tms_roles VALUES ('3', 'Manager');
INSERT INTO tms_roles VALUES ('4', 'Finance Manager');
INSERT INTO tms_roles VALUES ('5', 'HR');

-- ----------------------------
-- Table structure for `tms_trips`
-- ----------------------------
DROP TABLE IF EXISTS `tms_trips`;
CREATE TABLE `tms_trips` (
  `name` varchar(50) NOT NULL,
  `id` varchar(36) character set latin1 NOT NULL,
  `goals` varchar(1024) character set latin1 NOT NULL,
  `sdate` date NOT NULL,
  `edate` date NOT NULL,
  `isgroup` tinyint(4) NOT NULL,
  `statusid` int(12) NOT NULL,
  `comments` varchar(1024) default NULL,
  `createdby` varchar(36) default NULL,
  `approverid` varchar(36) NOT NULL default '',
  `duration` double default '0',
  `isflightdetails` tinyint(1) NOT NULL default '0',
  `venue` varchar(36) default NULL,
  `projectid` varchar(36) default NULL,
  `remark` varchar(1024) NOT NULL,
  `costcenterid` int(12) default '0',
  `isArchive` tinyint(1) NOT NULL default '0',
  `isArchiveByAdmin` tinyint(1) NOT NULL default '0',
  `isArchiveByApp` tinyint(1) NOT NULL default '0',
  `isaccomodationdetails` tinyint(1) NOT NULL default '0',
  `approvedon` varchar(50) default NULL,
  `source` varchar(50) default NULL,
  `destination` varchar(50) default NULL,
  `isEntertainment` tinyint(1) default '0',
  `ismeal` tinyint(1) default '0',
  `isother` tinyint(1) default '0',
  `otherexp` varchar(255) default NULL,
  PRIMARY KEY  (`id`),
  KEY `createdby` (`createdby`),
  KEY `approverid` (`approverid`),
  CONSTRAINT `tms_trips_ibfk_1` FOREIGN KEY (`createdby`) REFERENCES `users` (`userid`),
  CONSTRAINT `tms_trips_ibfk_2` FOREIGN KEY (`approverid`) REFERENCES `users` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tms_trips
-- ----------------------------

-- ----------------------------
-- Table structure for `tms_userapprovermap`
-- ----------------------------
DROP TABLE IF EXISTS `tms_userapprovermap`;
CREATE TABLE `tms_userapprovermap` (
  `userid` varchar(36) NOT NULL,
  `approverid` varchar(36) NOT NULL,
  KEY `lm_userapprovermap_ibfk_1` (`userid`),
  KEY `lm_userapprovermap_ibfk_2` (`approverid`),
  CONSTRAINT `tms_userapprovermap_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tms_userapprovermap_ibfk_2` FOREIGN KEY (`approverid`) REFERENCES `users` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tms_userapprovermap
-- ----------------------------

-- ----------------------------
-- Table structure for `tms_userbands`
-- ----------------------------
DROP TABLE IF EXISTS `tms_userbands`;
CREATE TABLE `tms_userbands` (
  `id` int(12) NOT NULL auto_increment,
  `name` varchar(100) default NULL,
  `description` varchar(100) default NULL,
  `companyid` varchar(36) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=142 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tms_userbands
-- ----------------------------
INSERT INTO tms_userbands VALUES ('-99', 'Default', 'Default', '-1');

-- ----------------------------
-- Table structure for `tms_userrolemap`
-- ----------------------------
DROP TABLE IF EXISTS `tms_userrolemap`;
CREATE TABLE `tms_userrolemap` (
  `roleid` int(12) NOT NULL,
  `userid` varchar(36) NOT NULL,
  KEY `lm_userrolemap_ibfk_1` (`userid`),
  KEY `lm_userrolemap_ibfk_2` (`roleid`),
  CONSTRAINT `tms_userrolemap_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tms_userrolemap_ibfk_2` FOREIGN KEY (`roleid`) REFERENCES `tms_roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='InnoDB free: 3407872 kB; (`userid`) REFER `leavelocaldb/user';

-- ----------------------------
-- Records of tms_userrolemap
-- ----------------------------

-- ----------------------------
-- Table structure for `tms_usertripdocmap`
-- ----------------------------
DROP TABLE IF EXISTS `tms_usertripdocmap`;
CREATE TABLE `tms_usertripdocmap` (
  `docid` varchar(36) character set latin1 NOT NULL,
  `tripid` varchar(36) character set latin1 NOT NULL,
  `expenseid` varchar(36) default NULL,
  `userid` varchar(36) character set latin1 NOT NULL,
  `doctypeid` varchar(36) default NULL,
  `advanceid` varchar(36) default NULL,
  `itinid` varchar(36) default NULL,
  `reservationid` varchar(36) default NULL,
  `claimid` varchar(36) default ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tms_usertripdocmap
-- ----------------------------

-- ----------------------------
-- Table structure for `tms_visaform`
-- ----------------------------
DROP TABLE IF EXISTS `tms_visaform`;
CREATE TABLE `tms_visaform` (
  `userid` varchar(36) NOT NULL,
  `type` varchar(100) default NULL,
  `validfrom` date default NULL,
  `validto` date default NULL,
  `issuedby` varchar(1024) default NULL,
  `issuedon` date default NULL,
  `fromcountryid` int(12) NOT NULL,
  `tocountryid` int(12) NOT NULL,
  `id` varchar(36) NOT NULL,
  `itinid` varchar(36) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tms_visaform
-- ----------------------------

-- ----------------------------
-- Table structure for `tm_docs`
-- ----------------------------
DROP TABLE IF EXISTS `tm_docs`;
CREATE TABLE `tm_docs` (
  `id` varchar(36) NOT NULL,
  `name` varchar(100) NOT NULL,
  `type` int(12) NOT NULL,
  `tripid` varchar(36) NOT NULL,
  `teid` varchar(36) default NULL,
  `storeindex` int(12) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tm_docs
-- ----------------------------

-- ----------------------------
-- Table structure for `tm_expensetypes`
-- ----------------------------
DROP TABLE IF EXISTS `tm_expensetypes`;
CREATE TABLE `tm_expensetypes` (
  `expenseid` varchar(36) NOT NULL,
  `expensename` varchar(36) NOT NULL,
  `creatorid` varchar(36) NOT NULL,
  `companyid` varchar(36) NOT NULL,
  `createdon` timestamp NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `description` text,
  PRIMARY KEY  (`expenseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tm_expensetypes
-- ----------------------------

-- ----------------------------
-- Table structure for `todotask`
-- ----------------------------
DROP TABLE IF EXISTS `todotask`;
CREATE TABLE `todotask` (
  `taskid` varchar(50) NOT NULL,
  `parentId` varchar(50) default NULL,
  `description` text NOT NULL,
  `taskorder` int(11) default NULL,
  `status` int(1) NOT NULL default '0',
  `timestamp` timestamp NOT NULL default '0000-00-00 00:00:00',
  `userid` varchar(50) NOT NULL,
  `grouptype` int(2) NOT NULL default '0' COMMENT 'grouptype is 0 default for individual 1 fro project ...',
  `assignedto` varchar(50) default NULL,
  `leafflag` bit(1) default NULL,
  PRIMARY KEY  (`taskid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of todotask
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

-- ----------------------------
-- Table structure for `useralerts`
-- ----------------------------
DROP TABLE IF EXISTS `useralerts`;
CREATE TABLE `useralerts` (
  `userid` varchar(50) default NULL,
  `alertid` varchar(50) NOT NULL default '0',
  PRIMARY KEY  (`alertid`),
  KEY `userid` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of useralerts
-- ----------------------------

-- ----------------------------
-- Table structure for `userannouncements`
-- ----------------------------
DROP TABLE IF EXISTS `userannouncements`;
CREATE TABLE `userannouncements` (
  `userid` varchar(50) NOT NULL,
  `announceid` int(11) NOT NULL,
  `companyid` varchar(50) NOT NULL,
  KEY `userid` (`userid`),
  KEY `userannouncements_ibfk_1` (`announceid`),
  KEY `userannouncements_ibfk_2` (`companyid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of userannouncements
-- ----------------------------

-- ----------------------------
-- Table structure for `userfriendmapping`
-- ----------------------------
DROP TABLE IF EXISTS `userfriendmapping`;
CREATE TABLE `userfriendmapping` (
  `userid` varchar(50) NOT NULL,
  `friendid` varchar(50) NOT NULL,
  KEY `userid` (`userid`),
  KEY `friendid` (`friendid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of userfriendmapping
-- ----------------------------

-- ----------------------------
-- Table structure for `userlogin`
-- ----------------------------
DROP TABLE IF EXISTS `userlogin`;
CREATE TABLE `userlogin` (
  `userid` varchar(36) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(60) NOT NULL default '',
  `lastactivitydate` timestamp NOT NULL default '1989-12-31 10:30:00',
  `authkey` varchar(36) NOT NULL,
  PRIMARY KEY  (`userid`),
  KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of userlogin
-- ----------------------------

-- ----------------------------
-- Table structure for `userpermission`
-- ----------------------------
DROP TABLE IF EXISTS `userpermission`;
CREATE TABLE `userpermission` (
  `companyid` varchar(36) NOT NULL default '',
  `roleid` int(12) NOT NULL default '0',
  `isApprover` tinyint(1) default NULL,
  `isHR` tinyint(1) default NULL,
  `isFManager` tinyint(1) default NULL,
  `isAdmin` tinyint(1) default NULL,
  `isMasterconfig` tinyint(1) default NULL,
  `fullReport` tinyint(1) default NULL,
  PRIMARY KEY  (`companyid`,`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of userpermission
-- ----------------------------

-- ----------------------------
-- Table structure for `userrelations`
-- ----------------------------
DROP TABLE IF EXISTS `userrelations`;
CREATE TABLE `userrelations` (
  `userid1` varchar(50) NOT NULL,
  `userid2` varchar(50) NOT NULL,
  `relationid` int(11) default '0',
  KEY `userid1` (`userid1`),
  KEY `userid2` (`userid2`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of userrelations
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
  `address` varchar(300) default NULL,
  `designation` varchar(15) default NULL,
  `contactno` varchar(20) default NULL,
  `aboutuser` text,
  `userstatus` text,
  `timezone` int(11) default '25',
  `companyid` varchar(36) NOT NULL,
  `fax` varchar(20) NOT NULL default '',
  `altcontactno` varchar(15) NOT NULL default '',
  `phpbbid` varchar(20) NOT NULL default '2',
  `panno` varchar(16) NOT NULL default '',
  `ssnno` varchar(16) default NULL,
  `active` int(11) default '1',
  `dateformat` int(11) default '18',
  `emptypeid` int(12) NOT NULL,
  `dojoining` datetime default NULL,
  `doconf` datetime default NULL,
  `totalcredits` decimal(11,2) default '0.00',
  `empstatus` int(2) NOT NULL default '2',
  `locationid` varchar(36) NOT NULL default '',
  `costcenterid` int(11) default NULL,
  `userbandid` int(12) default '-99',
  PRIMARY KEY  (`userid`),
  KEY `userid` (`userid`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `userlogin` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO company(companyid, companyname,createdon, address, locationid,locationname,creatorid,subdomain,country,timezone) VALUES ('04b536a0-5e51-482f-ac67-615b59c1e331', 'eclaims', now(), '', '04b536a0-5e51-482f-ac67-615b59c1e331', 'eclaims', '04b536a0-5e51-482f-ac67-615b59c1e342', 'eclaims', 244, 23);

INSERT INTO userlogin(userid, username, password, authkey) VALUES ('04b536a0-5e51-482f-ac67-615b59c1e342', 'admin', 'c0b137fe2d792459f26ff763cce44574a5b5ab03', "1234");

INSERT INTO users(userid, companyid, image,locationid,emptypeid,emailid,roleid,fname,lname,dojoining,doconf,dateformat) VALUES ('04b536a0-5e51-482f-ac67-615b59c1e342', '04b536a0-5e51-482f-ac67-615b59c1e331', "", '04b536a0-5e51-482f-ac67-615b59c1e331', "1", 'demo@deskera.com', 1, 'Admin', 'Admin', now(), now(), 18);

INSERT INTO tms_userrolemap(userid,roleid) VALUES ('04b536a0-5e51-482f-ac67-615b59c1e342', 1);

INSERT INTO tms_costcenter (name,resp_id,description,enddate,companyid) VALUES('Default', '04b536a0-5e51-482f-ac67-615b59c1e342', 'Default', '2020-12-31', '04b536a0-5e51-482f-ac67-615b59c1e331');

INSERT INTO tms_items(name,type,description,companyid,monthly_limit)  VALUES ('General', 0, 1, '04b536a0-5e51-482f-ac67-615b59c1e331', '100000');

INSERT INTO tms_userapprovermap(approverid,userid) VALUES ('04b536a0-5e51-482f-ac67-615b59c1e342', '04b536a0-5e51-482f-ac67-615b59c1e342');

INSERT INTO userpermission(companyid,roleid,isApprover,isHR,isFManager,isAdmin,isMasterconfig,fullReport) VALUES ('04b536a0-5e51-482f-ac67-615b59c1e331',1,1,1,1,1,1,1);

INSERT INTO userpermission(companyid,roleid,isApprover,isHR,isFManager,isAdmin,isMasterconfig,fullReport) VALUES ('04b536a0-5e51-482f-ac67-615b59c1e331',2,0,0,0,0,0,0);

INSERT INTO userpermission(companyid,roleid,isApprover,isHR,isFManager,isAdmin,isMasterconfig,fullReport) VALUES ('04b536a0-5e51-482f-ac67-615b59c1e331',3,1,0,0,0,0,0);

INSERT INTO userpermission(companyid,roleid,isApprover,isHR,isFManager,isAdmin,isMasterconfig,fullReport) VALUES ('04b536a0-5e51-482f-ac67-615b59c1e331',4,0,0,1,0,0,1);

INSERT INTO userpermission(companyid,roleid,isApprover,isHR,isFManager,isAdmin,isMasterconfig,fullReport) VALUES ('04b536a0-5e51-482f-ac67-615b59c1e331',5,0,1,0,0,0,0);

update users set costcenterid=1 where userid='04b536a0-5e51-482f-ac67-615b59c1e342';
