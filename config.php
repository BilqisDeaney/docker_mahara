<?php
/**
 *
 * @package    mahara
 * @subpackage core
 * @author     Catalyst IT Ltd
 * @license    http://www.gnu.org/copyleft/gpl.html GNU GPL version 3 or later
 * @copyright  For copyright information on Mahara, please see the README file distributed with this software.
 *
 */

/**
 * MAHARA CONFIGURATION FILE
 *
 * INSTRUCTIONS:
 * 1. Copy this file from config-dist.php to config.php
 * 2. Change the values in it to suit your environment.
 *
 * Information about this file is available on the Mahara wiki:
 *     https://wiki.mahara.org/wiki/System_Administrator's_Guide/Installing_Mahara#Create_Mahara.27s_config.php
 *
 * This file includes only the most commonly used Mahara configuration directives. For more options
 * that can be placed in this file, see the Mahara lib file:
 *
 *     htdocs/lib/config-defaults.php
 */

$cfg = new stdClass();

/**
 * database connection details
 * valid values for dbtype are 'postgres' and 'mysql'
 */
$cfg->dbtype   = 'postgres';
$cfg->dbhost   = 'mahara-db';
$cfg->dbport   = null; // Change if you are using a non-standard port number for your database
$cfg->dbname   = 'mahara';
$cfg->dbuser   = 'mahara_user';
$cfg->dbpass   = 'password';

$cfg->wwwroot = 'http://localhost/';

$cfg->dataroot = '/var/lib/sitedata';
$cfg->insecuredataroot = true;

$cfg->sendemail = false;
$cfg->anutechnicalsupportemail = 'ghada@catalyst-au.net';
$cfg->anuenvironment = 'DEV';  // 'STAGE', 'TEST', 'CLDEV', 'PROD', 'DEV'

/**
 * Set this to enable a secondary hash that is only present in the config file
 */
$cfg->passwordsaltmain = 'waJeib3ahLeiSuGoo3OoQuooQu7ahp8N';
$cfg->urlsecret = null;
$cfg->maxuploadsize = 2147483648;

$cfg->productionmode = false;

$cfg->lang = 'en.utf8';

// Elastic search settings: anu-mahara-index
$cfg->plugin_search_elasticsearch_indexname = 'd-anu-mahara-index';
$cfg->plugin_search_elasticsearch_host = 'localhost';

// Path to Clam Anti-virus software.
$cfg->pathtoclam = '/usr/bin/clamscan';
$cfg->skins = true;

