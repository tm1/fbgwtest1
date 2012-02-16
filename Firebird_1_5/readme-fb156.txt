
==================================
Firebird 1.5.6       (Win32 Build)
==================================


o Introduction
o Stability
o Installation of the binary package
o Installing from the zip package
o Installation of the embedded server
o Known Issues
o SQL Language documentation
o Reporting Bugs
o Requesting New Features


Introduction
============

Welcome to Firebird 1.5.6. Full details of the fixes and
minor enhancements in this release are contained in the
release notes. These are in the doc/ directory.


Stability
=========

There is no reason to be concerned about using this
maintenance release in a production environment.
However, before installing ANY new software into a
production environment it should be always be tested
properly on a development system. This is standard
practice.


Installing the self-installing executable
=========================================

Please run the executable and read the accompanying
installation instructions that are contained within the
setup wizard. After installation you will find this
document as doc/installation_readme.txt. More detailed
information is in the release notes.

Many changes have been implemented in this release. If
you have an existing installation of Firebird
(including a v.1.5 beta or release candidate) you must
read the latest release notes and understand the new
names and locations of all binaries and associated
files. This applies to both server and client
installations.

Do not install this version "over the top" of an
existing Firebird or InterBase installation.


Installing from the zip package
===============================

Please follow the instructions in
doc/README_installation.txt for installing the zip
package. (This document is only shipped with the zip
package.)


Installation of the embedded server
===================================

The embedded server is designed to be installed as part
of an existing application. See doc/README_embedded.txt
for more information on how to deploy the embedded
server. (This document is only shipped with the
embedded package.)


Known Issues
============

Client library
--------------
Some legacy Windows tools will not recognise the client
library fbclient.dll and/or will not find it in its
default location, now the ..\bin directory beneath the
Firebird root. For example, the Borland IBConsole
program will not work with fbclient.dll, even if it is
copied to the system directory and renamed to
gds32.dll.

The Windows kits contain a program named instclient.exe
that can be used to build a "legacy-compatible"
gds32.dll and optionally install it to your system
directory. It is essential to read the release notes
and the accompanying README_library_install.txt (in the
..\doc subdirectory) before performing this change.

UDFs and Blob Filters
---------------------
Security changes in this version may cause your UDFs to
be invisible to the server until their location is
configured in firebird.conf. For more information, read
the annotations in firebird.conf and the documentation
in the release notes.


SQL Language Documentation
==========================
New language features, keywords, extensions and
restrictions introduced in this release are documented
in detail in the release notes.


Reporting Bugs
==============

o Are you sure you understand how Firebird works?

  Perhaps you are seeing the correct behaviour and you
  really have a support question. In this case contact
  the firebird-support list server.

  You may subscribe here:

    mailto:firebird-support-subscribe@yahoogroups.com

o Still think it is a bug?

  First check the issue tracker here:

    http://tracker.firebirdsql.org/secure/BrowseProject.jspa

Please do not use the issue tracker to get technical
support. If in doubt subscribe to the support list 
first at

  mailto:firebird-support-subscribe@yahoogroups.com
  
and ask your question there.

	
Requesting New Features
=======================

Before submitting feature requests please review the
existing feature request list. Chances are that someone
has already thought of it. Existing feature requests
can be browsed here:

  http://tracker.firebirdsql.org/secure/CreateIssue!default.jspa

