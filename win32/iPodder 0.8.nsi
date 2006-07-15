; Script generated by the HM NIS Edit Script Wizard.

; HM NIS Edit Wizard helper defines
!define PRODUCT_NAME "iPodder"
!define PRODUCT_VERSION "0.8"
!define PRODUCT_PUBLISHER "iPodder team"
!define PRODUCT_WEB_SITE "http://ipodder.sourceforge.net"
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
!insertmacro MUI_PAGE_LICENSE "gpl.txt"
; Directory page
!insertmacro MUI_PAGE_DIRECTORY
; Instfiles page
!insertmacro MUI_PAGE_INSTFILES
; Finish page
!define MUI_FINISHPAGE_SHOWREADME "$INSTDIR\ReadMe.txt"
!insertmacro MUI_PAGE_FINISH

; Uninstaller pages
!insertmacro MUI_UNPAGE_INSTFILES

; Language files
!insertmacro MUI_LANGUAGE "English"

; MUI end ------

Name "${PRODUCT_NAME} ${PRODUCT_VERSION}"
OutFile "iPodder_Setup.exe"
InstallDir "$PROGRAMFILES\iPodder"
ShowInstDetails show
ShowUnInstDetails show

Section "MainSection" SEC01
  SetOutPath "$INSTDIR\BitTorrent"
  SetOverwrite try
  File "BitTorrent\bencode.py"
  File "BitTorrent\bitfield.py"
  File "BitTorrent\btformats.py"
  File "BitTorrent\Choker.py"
  File "BitTorrent\Connecter.py"
  File "BitTorrent\CurrentRateMeasure.py"
  File "BitTorrent\download.py"
  File "BitTorrent\Downloader.py"
  File "BitTorrent\DownloaderFeedback.py"
  File "BitTorrent\Encrypter.py"
  File "BitTorrent\fakeopen.py"
  File "BitTorrent\HTTPHandler.py"
  File "BitTorrent\NatCheck.py"
  File "BitTorrent\parseargs.py"
  File "BitTorrent\PiecePicker.py"
  File "BitTorrent\RateMeasure.py"
  File "BitTorrent\RawServer.py"
  File "BitTorrent\Rerequester.py"
  File "BitTorrent\selectpoll.py"
  File "BitTorrent\Storage.py"
  File "BitTorrent\StorageWrapper.py"
  File "BitTorrent\testtest.py"
  File "BitTorrent\track.py"
  File "BitTorrent\Uploader.py"
  File "BitTorrent\zurllib.py"
  File "BitTorrent\__init__.py"
  SetOutPath "$INSTDIR"
  File "btdownloadlibrary.py"
  File "btshowmetainfo.py"
  File "favorites.txt"
  File "ReadMe.txt"
  File "feedparser.py"
  File "gpl.txt"
  SetOutPath "$INSTDIR\gui"
  File "gui\iPodder.xrc"
  SetOutPath "$INSTDIR\icons_status"
  File "icons_status\icon_downloading.ico"
  File "icons_status\icon_idle_empty.ico"
  File "icons_status\icon_newitem.ico"
  File "icons_status\icon_notconnected.ico"
  SetOutPath "$INSTDIR"
  File "install.py"
  File "iPodder.ico"
  File "iPodder.py"
  File "iPodderGui.pyw"
  CreateDirectory "$SMPROGRAMS\iPodder"
  CreateShortCut "$SMPROGRAMS\ipodder\iPodder.lnk" "$INSTDIR\iPodderGui.pyw" "" "$INSTDIR\iPodder.ico"
  Exec 'python "$INSTDIR\install.py" "$INSTDIR"'
SectionEnd

Section -AdditionalIcons
  WriteIniStr "$INSTDIR\${PRODUCT_NAME}.url" "InternetShortcut" "URL" "${PRODUCT_WEB_SITE}"
  CreateShortCut "$SMPROGRAMS\iPodder\Website.lnk" "$INSTDIR\${PRODUCT_NAME}.url"
  CreateShortCut "$SMPROGRAMS\iPodder\Uninstall.lnk" "$INSTDIR\uninst.exe"
SectionEnd

Section -Post
  WriteUninstaller "$INSTDIR\uninst.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayName" "$(^Name)"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "UninstallString" "$INSTDIR\uninst.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayVersion" "${PRODUCT_VERSION}"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "URLInfoAbout" "${PRODUCT_WEB_SITE}"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "Publisher" "${PRODUCT_PUBLISHER}"
SectionEnd


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
  Delete "$INSTDIR\iPodderGui.pyw"
  Delete "$INSTDIR\iPodder.py"
  Delete "$INSTDIR\iPodder.ico"
  Delete "$INSTDIR\install.py"
  Delete "$INSTDIR\icons_status\icon_notconnected.ico"
  Delete "$INSTDIR\icons_status\icon_newitem.ico"
  Delete "$INSTDIR\icons_status\icon_idle_empty.ico"
  Delete "$INSTDIR\icons_status\icon_downloading.ico"
  Delete "$INSTDIR\gui\iPodder.xrc"
  Delete "$INSTDIR\gpl.txt"
  Delete "$INSTDIR\ReadMe.txt"
  Delete "$INSTDIR\feedparser.py"
  Delete "$INSTDIR\favorites.txt"
  Delete "$INSTDIR\btshowmetainfo.py"
  Delete "$INSTDIR\btdownloadlibrary.py"
  Delete "$INSTDIR\BitTorrent\__init__.py"
  Delete "$INSTDIR\BitTorrent\zurllib.py"
  Delete "$INSTDIR\BitTorrent\Uploader.py"
  Delete "$INSTDIR\BitTorrent\track.py"
  Delete "$INSTDIR\BitTorrent\testtest.py"
  Delete "$INSTDIR\BitTorrent\StorageWrapper.py"
  Delete "$INSTDIR\BitTorrent\Storage.py"
  Delete "$INSTDIR\BitTorrent\selectpoll.py"
  Delete "$INSTDIR\BitTorrent\Rerequester.py"
  Delete "$INSTDIR\BitTorrent\RawServer.py"
  Delete "$INSTDIR\BitTorrent\RateMeasure.py"
  Delete "$INSTDIR\BitTorrent\PiecePicker.py"
  Delete "$INSTDIR\BitTorrent\parseargs.py"
  Delete "$INSTDIR\BitTorrent\NatCheck.py"
  Delete "$INSTDIR\BitTorrent\HTTPHandler.py"
  Delete "$INSTDIR\BitTorrent\fakeopen.py"
  Delete "$INSTDIR\BitTorrent\Encrypter.py"
  Delete "$INSTDIR\BitTorrent\DownloaderFeedback.py"
  Delete "$INSTDIR\BitTorrent\Downloader.py"
  Delete "$INSTDIR\BitTorrent\download.py"
  Delete "$INSTDIR\BitTorrent\CurrentRateMeasure.py"
  Delete "$INSTDIR\BitTorrent\Connecter.py"
  Delete "$INSTDIR\BitTorrent\Choker.py"
  Delete "$INSTDIR\BitTorrent\btformats.py"
  Delete "$INSTDIR\BitTorrent\bitfield.py"
  Delete "$INSTDIR\BitTorrent\bencode.py"

  Delete "$SMPROGRAMS\iPodder\iPodder.lnk"
  Delete "$SMPROGRAMS\iPodder\Uninstall.lnk"
  Delete "$SMPROGRAMS\iPodder\Website.lnk"
  Delete "$STARTMENU.lnk"

  RMDir "$SMPROGRAMS\iPodder"
  RMDir "$INSTDIR\icons_status"
  RMDir "$INSTDIR\gui"
  RMDir "$INSTDIR\BitTorrent"
  RMDir "$INSTDIR"

  DeleteRegKey ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}"
  SetAutoClose true
SectionEnd
