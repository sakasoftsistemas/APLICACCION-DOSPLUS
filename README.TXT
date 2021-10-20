===============================================================================
                    README for vDosPlus (formerly vDos-lfn)
                   A general-purpose non-gaming DOS emulator
                     by Wengier (based on vDos and DOSBox)
                       Website: http://www.vDosPlus.org/
===============================================================================

Introduction
============
vDosPlus is a free x86 PC and DOS emulator for Windows based on vDos by Jos
Schaars, which was in turn derived from DOSBox, a cross-platform DOS emulator.
vDosPlus is designed to run non-gaming DOS applications in all current Windows
versions, both 32-bit and 64-bit. 32-bit Windows includes NTVDM (NT Virtual DOS
Machine), but this is not the case for 64-bit Windows. However, most today's
Windows is now 64-bit, and to run DOS programs you will need a DOS emulator.
vDosPlus is exactly for this purpose, and like original vDos it provides
advanced features such as support for file-locking (needed by multi-user
applications) and printing to Windows-only (GDI) printers, but it also has its
unique features such as a tighter integration with Windows and enhanced
keyboard, mouse and display support (see the feature list in the vDosPlus home
page for more information). It was formerly known as vDos-lfn because its
initial focus was support for Windows-style long filenames or LFNs (but now
with a very wide range of additional features there are much more than this).
You are strongly recommended to visit the vDosPlus home page (vDosPlus.org)
for further information about vDosPlus and its latest versions.

Feature Highlights
==================
* It runs in both 32-bit and 64-bit Windows, including Windows XP, Vista, 7, 8,
8.1 and 10 (all versions up to the latest release; Windows 2000 is supported
also via a special version)
* Run your DOS applications reliably in a DOS virtual machine; the text-mode
DOS screen (either windowed or full-screen) is fully scalable with a TTF font
* Network support and multi-user environment friendly with file- and record-
locking; you can always run multiple DOS applications in different vDosPlus
sessions
* Tight integration with Windows, including direct support for Windows-style
long filenames (LFN), copying to and pasting from the Windows clipboard, etc
* Support for multi-monitor setups, on-screen text styles (such as true bold
and italics), border/edge padding, mouse wheel scrolling, transparent window,
and many more
* Built-in 4DOS 8.00 shell which provides powerful command-line and other
functionalities; you can also find many useful information from its interactive
help system
* You can customize the config settings easily by editing the config file,
changing them on the fly, or you can simply use the vDosPlus default settings
* Powerful printing functionalities to print to PCL and PostScript printers as
well as Windows-only (GDI) printers directly; printing to PDF is also supported

Origin of vDosPlus (or vDos-lfn)
================================
vDos is a DOS emulator created by Jos Schaars to run non-gaming DOS programs
under Windows. However, while vDos is targeted for (mainly text mode) serious
DOS applications, it has a strange behaviour as pointed out by users in its
forum: unlike other DOS emulators or environments such as DOSBox, vDos hides
ALL files or paths that have associated long filenames or LFNs in its DOS
emulation. For example, "C:\Program Files" is a directory commonly seen in
Windows, and it has a corresponding DOS name, usually "C:\PROGRA~1". In both
real DOS environments or under DOS emulators like DOSBox, "C:\PROGRA~1" (or
even "C:\Program Files" if LFN support is enabled) will be seen using directory
listing commands such as DIR. However, original vDos deliberately hides such
paths, essentially making all such files/paths invisible under its emulation,
either from its shell or any applications running within it. Although many vDos
users have pointed out this issue and requested its creator Jos Schaars not to
hide them (or at least add such an option), it is clear from his replies that
Jos Schaars will not change this behavior of vDos. Thus, I decided to make a
patch myself to reveal these files and paths under vDos. Furthermore, as the
author of the DOSBox SVN-lfn branch (its LFN patch allows both its shell and
LFN-aware applications to see and operate with long filenames), I decided to go
further to add full LFN implementation to vDos as well, not just the "reveal
files/paths" patch as mentioned earlier. This involves the addition of the
INT21/AX=71xx long filename function handlers to vDos, similar to a Windows 9x
DOS prompt or a real MS-DOS 7.10 environment with DOSLFN installed. The vDos
version with LFN implementation applied became known as "vDos-lfn" (now know as
"vDosPlus" with very many more unique features), and at this time the great
majority of Int21/AX=71xx functions have been fully or mostly implemented. With
the integrated LFN functions both its 4DOS 8.00 shell and LFN-aware DOS
applications running within the vDosPlus window will be able to see and operate
with LFN, similar to the functionality of my DOSBox LFN patch.

While the initial focus of vDosPlus (then known as vDos-lfn) was LFN support,
it soon became capable of other features too. For example, another very
important feature in vDosPlus (vDos-lfn) not found in original vDos is support
for keyboard INT9/IRQ1 handling. vDos created by Jos Schaars does not support
this, thus programs like MS-DOS Editor, QBASIC and XyWrite would not work
properly with it. On the other hand, vDosPlus (vDos-lfn) supports this along
with other features such as LFN support and the keyboard speed control, and
indeed programs like XyWrite work pretty well with it. As a result, vDosPlus
(vDos-lfn) soon became popular among for example XyWrite users. Discussions of
vDosPlus (vDos-lfn) were previously done in the Modified vDos subforum of the
vDos forum. Later, however, when it has more and more unique and additional
features (not found in original vDos) and the differences between vDos and
vDosPlus become greater and greater, vDosPlus becomes a separate project from
Jos Schaars's vDos, having its own website and discussion forum. Many users
of various DOS programs use vDosPlus instead of original vDos because vDosPlus
is generally much more flexible and powerful than vDos. A summary of the many
features in vDosPlus that do not exist in original vDos can be found at the
vDosPlus home page.

Installation and updates
========================
There are two ways to install vDosPlus: Using the automated Windows installer
(either standalone installer or the web installer), or manually. The install
packages can be downloaded from the vDosPlus home page (www.vdosplus.org).
If you use the automated Installation, then you simply run the Windows 
installer for vDosPlus to start the setup program, and follow the on-screen
instructions to complete the setup. If you choose the manual installation,
you can first create a new directory for vDosPlus, and then extract the
contents of the portable version (ZIP package) of vDosPlus to this directory.
If you want to be able to run vDosPlus from any directory, you will need to
modify your PATH environment variable to include the directory vDosPlus is
located in.

There are three branches of vDosPlus that are currently being maintained and
supported, namely the most recent 2017.08.01 branch, which is based on vDos
2017.08.01, as well as the earlier 2016.10.01 and 2015.11.01 branches of
vDosPlus, based on vDos 2016.10.01 and vDos 2015.11.01 respectively. As the
vDosPlus binary or package is updated from time to time, the installable
vDosPlus package includes the "Check for updates" feature as a shortcut in
the Windows Start menu to check for the latest build of the currently
installed branch of vDosPlus. A list of recent changes and other improvements
made to vDosPlus can be found at the vDosPlus home page.

To uninstall the software, you can use the provided uninstall program to remove
it if you installed vDosPlus using the automated Windows installer. Otherwise,
you can uninstall it manually by deleting the directory containing vDosPlus.
You may want to keep the configuration files (config.txt and autoexec.txt etc)
if you have customized them and plan to install vDosPlus again later.

Getting Started
===============
The vDosPlus installer will automatically install a vDosPlus shortcut in the
Windows Start menu and/or the desktop for you. You can launch vDosPlus directly
from this shortcut. If you use the portable version instead of the installable
version, then you can go to the vDosPlus directory and then launch vDosPlus.exe
from there. By default, there are two special files for vDosPlus, namely
config.txt and autoexec.txt, which roughly correspond to the DOS config.sys and
autoexec.bat files. The config.txt file contains the configuration options for
vDosPlus sessions, and you can see the comments in the file for details about
these options (for example, you can change the default font for vDosPlus by
setting the FONT option in config.txt). The autoexec.txt file is equivalent to
the DOS autoexec.bat file, and commands contained in this file is automatically
executed when DOS starts. It should be fairly easy to adjust these two files to
your needs, or if you simply want to use the default settings then you do not
need to change anything in these files.

Once you start vDosPlus you can run do different things with it, or run your
favorite DOS applications inside vDosPlus. There are two shells provided by
this version of vDosPlus, namely the built-in 4DOS 8.00 shell and the improved
version of the internal non-4DOS shell provided in corresponding version of
original vDos. The 4DOS shell is the default shell used by vDosPlus because it
provides powerful command-line functionalities, but if you want you can change
this with the SHEL4DOS option in config.txt. Both traditional DOS 8.3 short
filenames (SFN) and Windows-style long filenames (LFN) are natively supported
by vDosPlus, so for example the DIR command will list both names. You probably
first want to see vDosPlus's built-in full-screen 4DOS help system by typing
the HELP command and check out the information from there. Doszip Commander, an
LFN-aware file manager is included with vDosPlus, and you can start it by
simply typing the DZ command from the vDosPlus command line. In order to run
your favorite DOS applications you need to first mount drives for use in
vDosPlus with the USE command, e.g. USE D: D:\. But you can also let vDosPlus
mount all available Windows drives automatically for use in vDosPlus by setting
the option "USEDRVS=ON" (without quotes) in the config.txt file. Once you go to
the directory that contains your DOS application in vDosPlus, you should be
able to launch the application easily as you do in a real DOS system.

Using vDosPlus
==============

Using Disk Drives and Network Path
----------------------------------
By default, vDosPlus only assigns its starting directory as Drive C:, and you
can manually assign vDosPlus drive letters to Windows directories with commands
like "USE C: C:\" and "USE D: D:\FILES" as in original vDos. However, unlike
original vDos you can also let vDosPlus automatically assign its drive letters
to all corresponding Windows drives and set the DOS current directory
accordingly by setting the "USEDRVS=ON" option in the config.txt file. With
this vDosPlus will assign the same drive letters automatically as in Windows,
and then there is no need to command for example "USE C: C:\", "USE D: D:\" in
vDosPlus. You can also unassign drives that have been previously assigned using
vDosPlus's UNUSE command (e.g. "UNUSE D:"), and after a disk drive has been
unassigned in vDosPlus, you can choose to assign it again (perhaps pointing to
a different location) with the USE command. Typing "USE" without any parameters
will show a list of all currently assigned drives in vDosPlus.

vDosPlus can also access Windows network or UNC paths directly, without first
requiring them to be mapped as disk drives. For example, you can list files and
directories in the network path \\MACHINE\FOLDER with the DIR command:

DIR \\MACHINE\FOLDER

Nevertheless, while many vDosPlus commands and some DOS programs can access
network or UNC paths directly, other DOS programs may not support using network
paths. In this case it's highly recommanded to map them as disk drives in order
to use such DOS programs, e.g.

USE E: \\MACHINE\FOLDER

DOS and Windows Applications
----------------------------
Like original vDos, vDosPlus is designed to run DOS applications. You can
launch a DOS application by typing its name from the DOS command line inside
vDosPlus provided that the DOS application is accessible from that location.
If not, you can use the standard DOS PATH command to add the location of that
DOS application to the DOS paths and then start this DOS application from the
DOS command line. Apart from DOS applications, you can also start Windows
applications from the DOS command line inside vDosPlus by default, but Windows
applications will still run in a separate window outside vDosPlus. The vDosPlus
package also includes the program START.EXE, which can also be used to launch a
Windows application or file in a separate window (e.g. "start notepad" to start
Windows Notepad; type "start" or "start /?" to see its usage). In addition, if
you are an advanced user, you can force vDosPlus to run a program as a DOS
application rather than launching it in a separate window when an external
program that is loaded inside vDosPlus is deemed to be a Windows PE application
by setting the "WINRUN=OFF" option in config.txt. It is generally recommended
to use the default setting for this, but you may want to change the WINRUN
setting in certain circumstances.

Long Filenames
--------------
Like the Windows 9x DOS prompt (and unlike original vDos), vDosPlus supports
both traditional DOS 8.3 short file names (SFNs) and the Window-style long file
names (LFNs) by default. For example, its built-in 4DOS 8.00 shell will display
both LFNs such as "C:\Program Files" and their corresponding SFNs such as
"C:\PROGRA~1" when you use the DIR command to list file and directories. Apart
from the 4DOS shell, there are also many LFN-aware applications under DOS such
as MS-DOS 7 EDIT and Doszip Commander, which will be able to see and operate
with both the long filenames and their corresponding DOS 8.3 names. While LFN
support is enabled in vDosPlus by default and it is recommended to leave this
setting on in most cases, you can also disable LFN support in vDosPlus by
setting the "LFN=OFF" option in config.txt. Then only the traditional DOS 8.3
file names (including those with tildes or "~") will be supported in vDosPlus.
Furthermore, as mentioned in the earlier "Origin of vDosPlus (or vDos-lfn)"
section original vDos always and deliberately hides all files and directories
that have long filenames. While not recommended, you can also get the same
effect in vDosPlus by setting the "FILTER83=ON" option in addition to the
"LFN=OFF" option mentioned above.

Moreover, when long filename support is enabled in vDosPlus (i.e. without
setting "LFN=OFF"), long file or directory names on ExFAT drives or NTFS drives
with DOS 8.3 name creation disabled are also supported by default, but since
they do not have corresponding DOS 8.3 short file or directory names they will
not be accessible by DOS programs that are unaware of long filenames. When
using the 4DOS DIR command to list file and directories, a question mark ("?")
will be displayed as their short names for such files or directories. However,
you may choose to let vDosPlus not support such files or directories that do
not have associated DOS 8.3 short names by setting the aforementioned option
"FILTER83=ON". When LFN support is enabled, this option will filter out any
files or directories that do not have corresponding DOS 8.3 short names.

Directory Listing and Reported Disk Space
-----------------------------------------
You can use the DIR command from the DOS command line inside vDosPlus to list
the contents of the current or specified directory. Other information such as
the volume labels, serial numbers and free space of disk drives will be shown
in the directory listings as well. Different date formats can be displayed by
the DIR command according to the country code set by the COUNTRY command. The
default date format is the U.S. mm-dd-yyyy format, but you can change to other
formats like dd/mm/yyyy or yyyy.mm.dd by switching to the desired country code
inside vDosPlus. For example, "COUNTRY 44" will use the U.K. dd/mm/yyyy date
format in directory listings, and "COUNTRY 81" will use the Japanese yyyy-mm-dd
date format. You can actually change the file dates/times in vDosPlus using the
TOUCH command. Volume labels and file attributes can also be changed with the
LABEL and ATTRIB commands respectively.

Unlike original vDos, information displayed by the DIR command such as the free
disk space in vDosPlus reflects the actual information of your drives. There
are two main DOS APIs that will report the free disk space, namely the older
INT21/AH=36 and the newer INT21/AX=7303 functions. The built-in DIR command by
default uses the second function to report the free disk space, thus it is
capable of reporting very large disk space. On the other hand, the free disk
space reported by the first function can never exceed 2GB, and there also exist
some very old DOS programs which expect an even lower disk space as reported by
this function. In this case you may want to set the "SPACELOW=ON" option in the
config.txt file for these DOS programs. The free disk space reported by the
second function is not affected by this option.

Reported DOS Version Number
---------------------------
Unlike original vDos, which always reports the DOS version 5.00, the default
reported DOS version of vDosPlus is 7.10, so that you can use many external
commands from MS-DOS 7.10 directly such as FC, FIND, MORE and SORT as well as
the MS-DOS 7.10 command shell (COMMAND.COM). Nevertheless, you may see the
message "Incorrect DOS version" when you try to run certain programs, such as
external commands from MS-DOS 6.xx or 5.xx. If this is this case you can change
vDosPlus's reported DOS version by setting the "DOSVER=<n. nn>" option in the
config.txt file or from the DOS command line inside vDosPlus with the SETCFG
command, e.g. "SETCFG DOSVER=5.00", which will change the reported DOS version
to 5.00 inside vDosPlus. You can use the command "SETCFG DOSVER=" to restore
the reported DOS version to the default version (i.e. 7.10) inside vDosPlus.
Simply typing the "VER" command will also show the reported DOS version.

Enhanced Keyboard Handling
--------------------------
Compared with original vDos, vDosPlus has enhanced keyboard support in addition
to various other features. vDosPlus supports keyboard speed control as part of
enhanced keyboard support: by default it uses the Windows settings for keyboard
repeat delay and interval as in the original vDos, but you can override the
Windows defaults in vDosPlus by setting "KEYDELAY=<val>" and "KEYINTER=<val>"
(in milliseconds) in the config.txt file (Windows settings will be used if
either <val> is set to 0). Furthermore, vDosPlus implements IRQ1/INT9 keyboard
handling emulation, thus allowing programs such as MS-DOS EDIT, XyWrite,
QBASIC/QuickBASIC and Visual BASIC to run properly. While it is generally
unnecessary, you can also disable IRQ1/INT9 support by setting the "KEYMODE=0"
option in the config.txt file. The default value for KEYMODE is 2, which should
work fine in most cases, but you might want to set "KEYMODE=1" if you would
like to map certain keys in XyWrite or Nota Bene ("KEYMODE=1" is recommended
for these two programs), or "KEYMODE=3" if a modified behavior of the F6 key
is desired. In addition, vDosPlus features basic support for Ctrl-C/Ctrl-Break
handling (it will work with for example the DIR /P command).

Mouse Support
-------------
By default, mouse support is disabled for DOS applications inside vDosPlus just
like original vDos. However, you can use the mouse to move or resize the
vDosPlus window, or to copy to and paste from the Windows clipboard. You may
want vDosPlus to automatically hide the mouse pointer when typing by setting
"AUHIDEMS=ON" in config.txt (the mouse pointer will reappear when you move the
mouse or click a mouse button). There is also a CLICKMOD config option so that
you can let vDosPlus convert left and right mouse button clicks automatically
into keyboard presses such as the Enter key and the ESC key. Similarly, mouse
wheel movements can be automatically converted into keyboard presses in
vDosPlus as well. They will be converted into up and down arrows for scrolling
inside vDosPlus by default, but these are customizable with the WHEELMOD option
in config.txt. An optional horizontal scrolling feature in some mice is also
supported, and you can switch them at run-time by using a shortcut. Moreover,
if you want to enable the left and right mouse buttons for mouse-aware DOS
applications inside vDosPlus, then you need to enable them with the "MOUSE=ON"
option in config.txt.

Memory Support
--------------
vDosPlus supports both the XMS memory and the EMS memory for DOS applications
in addition to the memory below 1MB. For the memory below 1MB, there are the
640KB conventional memory and the 160KB upper memory; the first 64KB memory is
included in the 640KB conventional memory in vDosPlus by default as in a real
DOS system, and vDosPlus will attempt to automatically apply fix to certain
very old DOS programs (e.g. WordPerfect Office 3.0) that may otherwise show the
"Packed file is corrupt" error message when loading. But for compatibility
purpose you may still turn this 64KB memory off with the "LOW=OFF" option in
config.txt in case such a program does not load properly. You can also add the
extra first 64KB of the graphics adapter to the conventional memory, but you
cannot use graphics if this is set (or it will override this extra memory).
The XMS memory and/or the EMS memory can be set with the XMEM config option.
For the XMS memory, a maximum of 255MB is supported. If the specified XMS
memory is 16MB or greater, then XMS version 3.0 will be reported by vDosPlus.
Otherwise XMS version 2.0 is reported. The maximum EMS memory supported by
the XMEM option is 63MB, but it is LIM EMS 3.2 only thus not 100% compatible
with the LIM EMS 4.0 specification. However, you can load the EMSMAGIC 1.1
program included with vDosPlus to automatically convert half of the XMS memory
provided by the XMEM option (up to 32MB) to 100% compatible LIM EMS 4.0 memory,
and if XMS version 2.0 is reported then it will automatically convert the rest
to XMS 3.0 too. With this you can use both XMS & EMS memory at the same time. 

Fonts and On-Screen Text Styles
-------------------------------
Like original vDos, vDosPlus uses a scalable TTF font so the DOS screen can be
sized when in the text-mode (both windowed or full-screen). You can change the
TTF font for use in vDosPlus with the FONT option in the config.txt file, e.g.
"FONT=Nouveau_IBM" or "FONT=Consola". Nouveau_IBM.ttf, the freely available
Nouveau IBM TTF font that is compatible with vDosPlus is included with the
vDosPlus package. If you use the vDosPlus installer, it will also copy the
normal version as well as the bold, italic and bold-italic versions of the
Consolas font (consola.ttf, consolab,ttf, consolai.ttf and consolaz.ttf
respectively) to the vDosPlus installation directory for use with vDosPlus if
the font can be found in the Windows fonts directory. You can also let vDosPlus
display on-screen text styles (such as boldface and italics) when using
DOS-based word processors. You will need to set the WP option in config.txt for
this, and currently WordPerfect, WordStar and XyWrite are supported. vDosPlus
can display italicized text by slanting the characters automatically, but it is
recommended to specify an actual italics version of the font with the ITALFONT
option in config.txt. Similarly, vDosPlus can display true boldface and bold-
italics if you specify actual bold and bold-italic versions of the font with
the BOLDFONT and BOITFONT options in config.txt. For example, you can set the
following config options in config.txt:

FONT=Consola
BOITFONT=Consolaz
BOLDFONT=Consolab
ITALFONT=Consolai

vDosPlus can also display other text styles such as single or double underlined
text, small text, superscripts and subscripts visually. Visual display for
strikeout text can be turned on with the "STRIKOUT=ON" config option, and the
output color for small text can be changed with the SMALLCLR config option.

Window Position and Size
------------------------
The vDosPlus window is by default centered on the screen at startup. It is
either framed or unframed (i.e. without borders or titlebar, which is the
default) depending on the setting of the FRAME option in config.txt. When in
the text mode you can find the standard system icons or options to maximize
(or restore) and close the vDosPlus screen in its system menu ("maximize"
allows to enter full-screen mode, equivalent to the ALT+Enter shortcut when in
window mode); you can change the visual style of the system icons or simply
disable the icons when frameless or in the full-screen mode with the SYSICONS
option in config.txt; the close botton/system icon in the top-right corner of
the vDosPlus window can also be disabled with the "SYSCLOSE=OFF" config option
(which applies to both frameless and framed modes). You can move the vDosPlus
window by dragging the mouse anywhere within the window if you hold the Ctrl
key, and you can use the mouse wheel while holding the Ctrl key to increase or
decrease the window size at the current location. Since vDosPlus features
multi-monitor support, it can be started either on the default screen or on the
specified screen or monitor with the "SCREEN=<val>" (where <val> is the screen
number) config option. Like original vDos, the vDosPlus window is not the
topmost window by default, but you can set the option "TOPWIN=ON" in config.txt
if you do not want part of the vDosPlus window to be hidden by the Windows
taskbar when they overlap. By default, font size selection in vDosPlus is in
even point sizes and rounded pixel dimensions as in original vDos, but you can
turn off this behavior in vDosPlus by setting the "EVENSIZE=OFF" option in
config.txt. vDosPlus also provides the option to set the border (or edge)
padding in the text mode with the "PADDING=nn,n" config option. The first
argument specifies the spacing, and the optional second argument is for setting
the padding color. You can even change the transparency of the vDosPlus screen
by setting the "TRANSWIN=<val>" config option, where <val> is the transparency
ratio from 0 (no transparency, the default) to 90 (high transparency).

Window Title and Icon
---------------------
You can change the title string and icon displayed in the vDosPlus titlebar by
using "TITLE=<string>" and "ICON=<some-icon-file>[,icon-index]" options in
config.txt. You are recommended to turn on the vDosPlus frame ("FRAME=ON") in
this case, or else the vDosPlus titlebar will not be shown. The default title
string is "vDosPlus", but you can change it to something else too. For icons
displayed in the vDosPlus titlebar, you can use icons in .ICO, .DLL or .EXE
files and predefined Windows icons. When using an .ICO file, you generally need
to only specify the icon file name. When using .DLL and .EXE files for icons,
you can use either the icon index (starting at 0) or the resource name as the
second parameter. If the second parameter is omitted, then the first icon in
the specified file will be used.

For example, these two pairs of directives are equivalent and select the first
icon in the file:
ICON = MY_ICON.ICO
ICON = MY_ICON.ICO,0

ICON = DOSPrinter.exe
ICON = DOSPrinter.exe,0

Equally, the following are equivalent:
ICON=%windir%\explorer.exe
ICON=%windir%\explorer.exe,0 (where 0 is the first item in the icon index)
ICON=%windir%\explorer.exe,ICO_MYCOMPUTER (where ICO_MYCOMPUTER is the resource
name for this icon)

An example of ICON = DLL,resource name:
ICON = C:\WINDOWS\SYSTEM32\SHELL32.DLL,#1001

An example of a predefined Windows icon:
ICON = ,#104

Windows Clipboard
-----------------
vDosPlus supports the Windows clipboard directly, and it can also access the
Windows clipboard in many ways. Note that the Win key is normally used in some
special keyboard combinations in vDosPlus, but if Win+Ctrl+ combinations are
not needed by your DOS program(s), you can also use Ctrl+ without the Win key
by setting the "WINKEY=OFF" option in config.txt. For example, you can use
Ctrl+Win+left mouse button (or Click+left mouse button with the "WINKEY=OFF"
option set) to select a rectangle block of text and copy it to the Windows
clipboard, and use Ctrl+Win+right mouse button (or Click+right mouse button
with "WINKEY=OFF") to paste text from the Windows clipboard. The Ctrl+Win+A,
Ctrl+Win+C and Ctrl+Win+V shortcuts (or Ctrl+A/Ctrl+C/Ctrl+V with "WINKEY=OFF")
can be used to copy text to or paste text from the Windows clipboard too. More
information about these shortcuts may be found in the sysnotes.txt file which
can be opened with the Ctrl+Win+N shortcut (or Ctrl+N with "WINKEY=OFF") in
vDosPlus. If you have set a COM or LPT port to exchange data with the Windows
clipboard similar to "LPT4=CLIP" in config.txt, you can also copy text to or
paste text from the Windows clipboard with this port. For example, the command
"DIR>LPT4" will copy the contents of the directory listing to the Windows
clipboard. Alternatively, you can use 4DOS's built-in CLIP: device to exchange
data with the Windows clipboard as well, e.g. the command "TYPE CLIP:" will
display the content of the Windows clipboard if it contains text.

Printing and other information
------------------------------
Like original vDos, vDosPlus includes built-in printing functionality to print
to Windows-only (GDI) printers directly in addition to PCL and PostScript
printers. You can either use the built-in printing system of vDosPlus or use an
external program such as DOSPrinter (which is included in the vDosPlus package)
to print. Printing to PDF is also supported. You will find more detailed
information about printing in vDosPlus in the PDF document named Printing.pdf
and/or the remarks and examples in the Printing section of the config.txt file.
Moreover, unlike original vDos, vDosPlus allows you to specify the directory
for temporary printing files with the "TEMPDIR=<path>" option in config.txt.

There are also many other features in vDosPlus such as the ability to maintain
its own local date/time ("SYNCTIME=OFF" option in config.txt), to overcome an
issue in original vDos which may cause Ctrl+Alt+? shortcuts for other Windows
applications not to work in full-screen mode ("SHORTCUT=ON" option in
config.txt, although in this case it is recommended to also set "TOPWIN=ON" or
hide the Windows taskbar automatically before switching to full-screen).
Likewise, there are also other config options supported by vDosPlus, although
features such as support for a blinking cursor and the internal PC speaker are
enabled by default but can also be turned off. Please see config.txt for more
details about these (optional) settings. See also the file "vDos - Readme.pdf"
for information that applies to both vDos and vDosPlus.

Exit vDosPlus
-------------
Like other Windows applications, you can exit vDosPlus by clicking on the close
button or icon on the top-right corner of the vDosPlus window. When you are in
DOS command line within vDosPlus, you can usually exit vDosPlus by issuing the
"EXIT" command. This might not work if you are shelling from another DOS
application inside vDosPlus, in which case you need to exit the DOS application
first. When you click on the close button or icon on the top-right corner of
the vDosPlus, sometimes vDosPlus may warn you that there are open file handles.
It's recommended to exit the DOS application in the normal way it provides, but
still you can force exit vDosPlus by answering Yes in this case. Similarly, you
can force exit vDosPlus by issuing the command "REBOOT /P" from the DOS command
line inside vDosPlus, in which case vDosPlus will power off itself using the
Advanced Power Management (APM).

Setting Config Options
----------------------

-- In config.txt --
The standard way of setting config options is to set them in the config file
named config.txt located in the vDosPlus directory, and the names of these
config options are not case-sensitive. For example, the config line "FRAME=ON"
(or "frame=on") turns on the window frame for vDosPlus. While the config.txt
file is similar to the DOS config.sys or Windows config.nt in some ways, DOS
config.sys or Windows config.nt settings like KEYB= and DEVICE= will not work
in config.txt. Also, vDosPlus will treat config lines starting with "#" or
"REM" as comments; block (multi-line) comments starting with "#[" and ending
with "]#" are also supported. If some config line in the config.txt file
contains errors, vDosPlus will warn you about them by default, but you can let
vDosPlus not display warnings caused by incorrect settings in the config file
at startup by setting the "CONFWARN=OFF" config option. Most of these features
are not present in original vDos, although it is possible to let both vDosPlus
and original vDos use the same config file, in which case you may want to turn
on vDosPlus specific settings using the syntax "REM VDOSPLUS:option=[value]"
instead of simply "option=[value]".

-- From the vDosPlus command line --
Apart from setting the config options in the config file named config.txt, with
vDosPlus you can also set them from the vDosPlus command line with the /set
option. When the same config options are set both in config.txt and from the
vDosPlus command line, those set in the command line will take precedence. For
example, "vDosPlus /set frame=on" will turn on the vDosPlus window frame
regardless the setting in config.txt. The user can also force the default
setting for a config file to be used by "unsetting" them in the config file or
from the command line. For example, "vDosPlus /set font=" will force to use the
default font for vDosPlus. To set multiple config options in the command line,
the config options can be separated by the semi-colons (;). For example,
"vDosPlus /set keydelay=400;keyinter=20" will set both the "KEYDELAY=400" and
the "KEYINTER=20" config options.

Also note that if the above command line options are not used, the vDosPlus
command line will be stored in the environment variable named VDOSP_ARGS.

-- Alternative config files --
vDosPlus also allows users to specify the names of the config file and the
autoexec file to use as well. They are config.txt and autoexec.txt respectively
by default, but with the /cfg command line option the user can specify an
alternative config file for vDosPlus to use, and with the AUTOEXEC directive
(set either from the config file or from the vDosPlus command line, e.g.
"AUTOEXEC=test.txt" in config.txt or "vDosPlus /set autoexec=test.txt" from the
vDosPlus command line), the user can specify an alternative autoexec file for
vDosPlus to use too. If they are not present in the current directory, then the
files in the directory where vDosPlus.exe is located will be used. The /cfg and
the /set options can also be combined (with /cfg coming first). For example,
"vDosPlus /cfg config.new /set frame=on;autoexec=autofile.txt" will use the
file config.new as the config file while the frame setting will be overridden
with "FRAME=ON" and the file autofile.txt will be used as the autoexec file.
The names of the config file and the autoexec file as specified for a vDosPlus
session are stored in the environment variables VDOSP_CONFIG and VDOSP_AUTOEXEC
of this vDosPlus session, and the directory where the vDosPlus executable is
located is stored in the environment variable named VDOSP_EXEDIR. If the config
file specified in the command line does not exist, then vDosPlus will use the
default settings for this; if the specified autoexec file does not exist, then
it will be skipped.

-- Inside vDosPlus (SETCFG, SETCOLOR, SETPORT) --
With vDosPlus you can change almost all config options on the fly or view their
current settings from the DOS command line inside vDosPlus using the SETCFG
command. For example, the command "SETCFG FRAME=ON" will turn on the vDosPlus
window frame on the fly. To view the current frame setting, you can command
"SETCFG FRAME", or you can command "SETCFG FRAME=" to return the window frame
to the default setting. Note that these changes apply to the current vDosPlus
session only. The SETCFG command without any parameters will show the settings
of all supported config options. There are only three config options currently
not supported by the SETCFG command, namely COLORS, LOW and XMEM, but the
colors settings can be changed or viewed using the separate SETCOLOR command.
For example, the command "SETCOLOR 0 #202020" will change Color #0 to the
specified color value, and the command "SETCOLOR 0 -" will return it to the
default color value. Setting colors via DAC registers through BIOS is supported
too, so that programs like VPT (VGA Palette Tool) can be used to change the
color settings too. Port settings (COMx and LPTx, x=1. . 9) can be changed or
viewed using the SETPORT command, whose syntax is very similar to the SETCFG
command. For example, "SETPORT LPT4=CLIP" will use the LPT4 port to exchange
data with the Windows clipboard, and command SETPORT without any parameters
will show the current settings of all COM and LPT ports.

Support
=======
vDosPlus is free to download, use and distribute, and its home page is located
at the following URL. Please visit the vDosPlus home page to find the latest
downloads and other useful information such as the changelog and advanced tips:
http://www.vdosplus.org/

The main discussions and support forum of vDosPlus are available at its
SourceForge site in the URL below. Please feel free to post your feedback,
ideas, bug reports and other comments in the vDosPlus discussion board:
https://sourceforge.net/p/vdosplus/discussion/

You can also visit the support page made by Edward Mendelson (emendelson) for
more information relating to my LFN-supporting versions of vDos & DOSBox here:
http://www.wpdos.org/dosbox-vdos-lfn.html

If you find this software or any information on the vDosPlus site useful or
valuable, please consider making a donation so that I will be able to continue
the development of vDosPlus and pay for the cost of maintaining the site.
Donations can easily be made by clicking the donation button in the vDosPlus
home page; they are optional but are very welcome and would be valuable support
for continuing the vDosPlus project. Thank you very much for your contributions
to the project!

Wengier
wengierwu@yahoo.com
October 2017