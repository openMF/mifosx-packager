Mifos X New Packager
====================

Requirements
------------

 * OS: Debian/Ubuntu preferable
 * Tools: dpkg-deb, make

Tasks for new release
---------------------

 * Copy mifosng-provider.war to package/var/lib/tomcat7/webapps
 * Copy contents of built community-app to package/var/lib/tomcat7/webapps/ROOT
 * Copy api-docs to package/var/lib/tomcat7/webapps/ROOT
 * Copy pentahoReports folder to package/usr/share/tomcat7/.mifosx
 * Copy mifosplatform-tenants-first-time-install.sql to package/usr/share/mifosx/database
 * touch package/DEBIAN/postinst
 * Update Makefile VER with version, MINV can be 1 or 2 for each package rebuild
 * make package

A deb package should be created with the name mifosx_<version>-<minorversion>_all.deb

