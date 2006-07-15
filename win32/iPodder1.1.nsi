; Script generated by the HM NIS Edit Script Wizard.

; HM NIS Edit Wizard helper defines
!define PRODUCT_NAME "iPodder"
!define PRODUCT_VERSION "1.1"
!define PRODUCT_PUBLISHER "iPodder Team"
!define PRODUCT_WEB_SITE "http://ipodder.sourceforge.net/"
!define PRODUCT_DIR_REGKEY "Software\Microsoft\Windows\CurrentVersion\App Paths\iPodder.exe"
!define PRODUCT_UNINST_KEY "Software\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT_NAME}"
!define PRODUCT_UNINST_ROOT_KEY "HKLM"

; MUI 1.67 compatible ------
!include "MUI.nsh"

; MUI Settings
!define MUI_ABORTWARNING
!define MUI_ICON "${NSISDIR}\Contrib\Graphics\Icons\modern-install.ico"
!define MUI_UNICON "${NSISDIR}\Contrib\Graphics\Icons\modern-uninstall.ico"

; Welcome page
!insertmacro MUI_PAGE_WELCOME
; License page
!insertmacro MUI_PAGE_LICENSE "..\gpl.txt"
; Directory page
!insertmacro MUI_PAGE_DIRECTORY
; Components page
!insertmacro MUI_PAGE_COMPONENTS
; Instfiles page
!insertmacro MUI_PAGE_INSTFILES
; Finish page
!define MUI_FINISHPAGE_RUN "$INSTDIR\iPodder.exe"
!define MUI_FINISHPAGE_SHOWREADME "$INSTDIR\readme.txt"
!insertmacro MUI_PAGE_FINISH

; Uninstaller pages
!insertmacro MUI_UNPAGE_INSTFILES

; Language files
!insertmacro MUI_LANGUAGE "English"

; MUI end ------

Name "${PRODUCT_NAME} ${PRODUCT_VERSION}"
OutFile "iPodder1.1.exe"
InstallDir "$PROGRAMFILES\iPodder"
InstallDirRegKey HKLM "${PRODUCT_DIR_REGKEY}" ""
ShowInstDetails show
ShowUnInstDetails show

Section "-iPodder" SEC01
  SetOutPath "$INSTDIR"
  SetOverwrite ifnewer
  File "..\dist\zlib.pyd"
  File "..\dist\wxmsw252uh_xrc_vc.dll"
  File "..\dist\wxmsw252uh_html_vc.dll"
  File "..\dist\wxmsw252uh_core_vc.dll"
  File "..\dist\wxmsw252uh_adv_vc.dll"
  File "..\dist\wxbase252uh_xml_vc.dll"
  File "..\dist\wxbase252uh_vc.dll"
  File "..\dist\wxbase252uh_net_vc.dll"
  File "..\dist\win32ui.pyd"
  File "..\dist\win32pipe.pyd"
  File "..\dist\win32evtlog.pyd"
  File "..\dist\win32api.pyd"
  File "..\dist\w9xpopen.exe"
  File "..\dist\unicodedata.pyd"
  File "..\dist\select.pyd"
  File "..\dist\remote.png"
  File "..\dist\pywintypes23.dll"
  File "..\dist\pythoncom23.dll"
  File "..\dist\python23.dll"
  File "..\dist\pyexpat.pyd"
  File "..\dist\netflder.png"
  File "..\dist\library.zip"
  File "..\dist\iPodder.exe.manifest"
  File "..\dist\iPodder.exe"
  CreateDirectory "$SMPROGRAMS\iPodder"
  CreateShortCut "$SMPROGRAMS\iPodder\iPodder.lnk" "$INSTDIR\iPodder.exe"
  File "..\dist\install.py"
  File "..\dist\gpl.txt"
  File "..\dist\datetime.pyd"
  File "..\dist\_xrc.pyd"
  File "..\dist\_winreg.pyd"
  File "..\dist\_windows_.pyd"
  File "..\dist\_ssl.pyd"
  File "..\dist\_sre.pyd"
  File "..\dist\_socket.pyd"
  File "..\dist\_misc_.pyd"
  File "..\dist\_html.pyd"
  File "..\dist\_gdi_.pyd"
  File "..\dist\_core_.pyd"
  File "..\dist\_controls_.pyd"
  File "..\dist\_bsddb.pyd"
  SetOutPath "$INSTDIR\gui"
  File "..\dist\gui\iPodder.xrc"
  SetOutPath "$INSTDIR\icons_status"
  File "..\dist\icons_status\icon_notconnected.ico"
  File "..\dist\icons_status\icon_newitem.ico"
  File "..\dist\icons_status\icon_idle_empty.ico"
  File "..\dist\icons_status\icon_downloading.ico"
  File "..\dist\icons_status\application.ico"
  SetOutPath "$INSTDIR\images"
  File "..\dist\images\spacer.gif"
  File "..\dist\images\paypal.gif"
  File "..\dist\images\badge_ipodder.gif"
  SetOutPath "$INSTDIR\win32"
  File "..\dist\win32\iPodder.ico"
  SetOutPath "$INSTDIR"
  File "..\readme.txt"
  File "..\todo.txt"
SectionEnd

Section "Desktop shortcut"
  CreateShortCut "$DESKTOP\iPodder.lnk" "$INSTDIR\iPodder.exe"
SectionEnd

Section "Add to Startup Group"
  CreateShortCut "$SMSTARTUP\iPodder.lnk" "$INSTDIR\iPodder.exe"
SectionEnd

Section -AdditionalIcons
  WriteIniStr "$INSTDIR\${PRODUCT_NAME}.url" "InternetShortcut" "URL" "${PRODUCT_WEB_SITE}"
  CreateShortCut "$SMPROGRAMS\iPodder\Website.lnk" "$INSTDIR\${PRODUCT_NAME}.url"
  CreateShortCut "$SMPROGRAMS\iPodder\Uninstall.lnk" "$INSTDIR\uninst.exe"
SectionEnd

Section -Post
  WriteUninstaller "$INSTDIR\uninst.exe"
  WriteRegStr HKLM "${PRODUCT_DIR_REGKEY}" "" "$INSTDIR\iPodder.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayName" "$(^Name)"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "UninstallString" "$INSTDIR\uninst.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayIcon" "$INSTDIR\iPodder.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayVersion" "${PRODUCT_VERSION}"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "URLInfoAbout" "${PRODUCT_WEB_SITE}"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "Publisher" "${PRODUCT_PUBLISHER}"
SectionEnd

Function .onInit

  ReadRegStr $R0 HKLM \
  "Software\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT_NAME}" \
  "UninstallString"

FunctionEnd

Function .onInstSuccess

  StrCmp $R0 "" done
  
  ; $R0 is the 1.0 uninstall string.  It should look like this: 1.0INSTDIR\uninst.exe
  ; $R1 is the old installation directory.
  StrCpy $R1 $R0 -11
  
  ExpandEnvStrings $0 "%APPDATA%"

  StrCmp $0 "%APPDATA%" 0 +2
    ExpandEnvStrings $0 "%HOMEDRIVE%%HOMEPATH%\Application Data"

  IfFileExists $0\*.* 0 done
  IfFileExists $0\iPodder\*.* +2 0
    CreateDirectory $0\iPodder

  ;copy any old configuration
  IfFileExists $0\iPodder\history.txt +3 0
  IfFileExists $R1\history.txt 0 +2
  CopyFiles $R1\history.txt $0\iPodder

  IfFileExists $0\iPodder\schedule.txt +3 0
  IfFileExists $R1\schedule.txt 0 +2
  CopyFiles $R1\schedule.txt $0\iPodder
  
  IfFileExists $0\iPodder\favorites.txt +3 0
  IfFileExists $R1\favorites.txt 0 +2
  CopyFiles $R1\favorites.txt $0\iPodder

  done:

FunctionEnd

Function un.onUninstSuccess
  HideWindow
  MessageBox MB_ICONINFORMATION|MB_OK "$(^Name) was successfully removed from your computer."
FunctionEnd

Function un.onInit
  MessageBox MB_ICONQUESTION|MB_YESNO|MB_DEFBUTTON2 "Are you sure you want to completely remove $(^Name) and all of its components?" IDYES +2
  Abort
FunctionEnd

Section Uninstall
  Delete "$INSTDIR\${PRODUCT_NAME}.url"
  Delete "$INSTDIR\uninst.exe"
  Delete "$INSTDIR\todo.txt"
  Delete "$INSTDIR\readme.txt"
  Delete "$INSTDIR\win32\iPodder.ico"
  Delete "$INSTDIR\images\badge_ipodder.gif"
  Delete "$INSTDIR\images\paypal.gif"
  Delete "$INSTDIR\images\spacer.gif"
  Delete "$INSTDIR\icons_status\application.ico"
  Delete "$INSTDIR\icons_status\icon_downloading.ico"
  Delete "$INSTDIR\icons_status\icon_idle_empty.ico"
  Delete "$INSTDIR\icons_status\icon_newitem.ico"
  Delete "$INSTDIR\icons_status\icon_notconnected.ico"
  Delete "$INSTDIR\gui\iPodder.xrc"
  Delete "$INSTDIR\_bsddb.pyd"
  Delete "$INSTDIR\_controls_.pyd"
  Delete "$INSTDIR\_core_.pyd"
  Delete "$INSTDIR\_gdi_.pyd"
  Delete "$INSTDIR\_html.pyd"
  Delete "$INSTDIR\_misc_.pyd"
  Delete "$INSTDIR\_socket.pyd"
  Delete "$INSTDIR\_sre.pyd"
  Delete "$INSTDIR\_ssl.pyd"
  Delete "$INSTDIR\_windows_.pyd"
  Delete "$INSTDIR\_winreg.pyd"
  Delete "$INSTDIR\_xrc.pyd"
  Delete "$INSTDIR\datetime.pyd"
  Delete "$INSTDIR\gpl.txt"
  Delete "$INSTDIR\install.py"
  Delete "$INSTDIR\iPodder.exe"
  Delete "$INSTDIR\iPodder.exe.manifest"
  Delete "$INSTDIR\library.zip"
  Delete "$INSTDIR\netflder.png"
  Delete "$INSTDIR\pyexpat.pyd"
  Delete "$INSTDIR\python23.dll"
  Delete "$INSTDIR\pythoncom23.dll"
  Delete "$INSTDIR\pywintypes23.dll"
  Delete "$INSTDIR\remote.png"
  Delete "$INSTDIR\select.pyd"
  Delete "$INSTDIR\unicodedata.pyd"
  Delete "$INSTDIR\w9xpopen.exe"
  Delete "$INSTDIR\win32api.pyd"
  Delete "$INSTDIR\win32evtlog.pyd"
  Delete "$INSTDIR\win32pipe.pyd"
  Delete "$INSTDIR\win32ui.pyd"
  Delete "$INSTDIR\wxbase252uh_net_vc.dll"
  Delete "$INSTDIR\wxbase252uh_vc.dll"
  Delete "$INSTDIR\wxbase252uh_xml_vc.dll"
  Delete "$INSTDIR\wxmsw252uh_adv_vc.dll"
  Delete "$INSTDIR\wxmsw252uh_core_vc.dll"
  Delete "$INSTDIR\wxmsw252uh_html_vc.dll"
  Delete "$INSTDIR\wxmsw252uh_xrc_vc.dll"
  Delete "$INSTDIR\zlib.pyd"

  Delete "$SMPROGRAMS\iPodder\Uninstall.lnk"
  Delete "$SMPROGRAMS\iPodder\Website.lnk"
  Delete "$DESKTOP\iPodder.lnk"
  Delete "$SMPROGRAMS\iPodder\iPodder.lnk"
  Delete "$SMSTARTUP\iPodder.lnk"

  RMDir "$SMPROGRAMS\iPodder"
  RMDir "$INSTDIR\win32"
  RMDir "$INSTDIR\images"
  RMDir "$INSTDIR\icons_status"
  RMDir "$INSTDIR\gui"
  RMDir "$INSTDIR"

  DeleteRegKey ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}"
  DeleteRegKey HKLM "${PRODUCT_DIR_REGKEY}"
  SetAutoClose true
SectionEnd
