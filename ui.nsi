# 定义变量

!define PRODUCT_NAME				"UI开发平台 1.3"				# 产品名称
!define PRODUCT_VERSION				"1.3.0.0"						# 产品版本号
!define PRODUCT_SIZE_KB				39093							# 产品文件大小
!define PRODUCT_OUTFILE_NAME		"UI开发平台_v1.3.0_setup.exe"	# 输出文件名称
!define PRODUCT_PUBLISHER			"盛天网络"						# 发行人
!define PRODUCT_LEGAL				"stnts.com - 2015"				# 法律
!define EXE_NAME					"nw.exe"

!define MUI_ICON					"dist\app\resources\images\ui.ico"
!define MUI_UNICON					"${MUI_ICON}"

# 视觉识别系统

VIProductVersion					"${PRODUCT_VERSION}"
VIAddVersionKey	"ProductName"		"${PRODUCT_NAME}"
VIAddVersionKey	"ProductVersion"	"${PRODUCT_VERSION}"
VIAddVersionKey	"CompanyName"		"${PRODUCT_PUBLISHER}"	# 公司名称
VIAddVersionKey	"LegalCopyright"	"${PRODUCT_LEGAL}"		# 法律版权
VIAddVersionKey	"FileDescription"	"${PRODUCT_NAME}"		# 文件描述
VIAddVersionKey	"FileVersion"		"${PRODUCT_VERSION}"	# 文件版本
VIAddVersionKey	"InternalName"		"ui"					# 内部名称
VIAddVersionKey	"OriginalFilename"	"${EXE_NAME}"			# 原始文件名称

# 设置编译项

SetCompressor			lzma
Name					"${PRODUCT_NAME}"
OutFile					"${PRODUCT_OUTFILE_NAME}"
InstallDir				"$PROGRAMFILES\ui\"
ShowInstDetails			hide
ShowUninstDetails		hide
RequestExecutionLevel	admin

# 导入 MUI2 库

!include "MUI2.nsh"

# 安装向导页

!insertmacro MUI_PAGE_WELCOME
!insertmacro MUI_PAGE_DIRECTORY
!insertmacro MUI_PAGE_INSTFILES
!insertmacro MUI_PAGE_FINISH

# 卸载向导页

!insertmacro MUI_UNPAGE_INSTFILES
!insertmacro MUI_UNPAGE_FINISH

# MUI 向导界面语言

!insertmacro MUI_LANGUAGE	"SimpChinese"


Section "!Files" "des_files"

	SetOutPath $INSTDIR
	File /r "dist\*.*"

	SetShellVarContext all
	CreateDirectory "$SMPROGRAMS\${PRODUCT_NAME}"
	CreateShortCut "$SMPROGRAMS\${PRODUCT_NAME}\${PRODUCT_NAME}.lnk" "$INSTDIR\${EXE_NAME}" "" "$INSTDIR\app\resources\images\ui.ico"
	CreateShortCut "$SMPROGRAMS\${PRODUCT_NAME}\卸载${PRODUCT_NAME}.lnk" "$INSTDIR\uninst.exe"
	CreateShortCut "$DESKTOP\${PRODUCT_NAME}.lnk" "$INSTDIR\${EXE_NAME}" "" "$INSTDIR\app\resources\images\ui.ico"

	SetShellVarContext current
		WriteUninstaller "$INSTDIR\uninst.exe"
		WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT_NAME}" "DisplayName" "${PRODUCT_NAME}"
		WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT_NAME}" "DisplayIcon" "$INSTDIR\${EXE_NAME}"
		WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT_NAME}" "UninstallString" "$INSTDIR\uninst.exe"
		WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT_NAME}" "Publisher" "${PRODUCT_PUBLISHER}"
		WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT_NAME}" "DisplayVersion" "${PRODUCT_VERSION}"
        WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT_NAME}" "EstimatedSize" ${PRODUCT_SIZE_KB}
        
SectionEnd

Section "Uninstall"

	SetShellVarContext all
	Delete "$SMPROGRAMS\${PRODUCT_NAME}\${PRODUCT_NAME}.lnk"
	Delete "$SMPROGRAMS\${PRODUCT_NAME}\卸载${PRODUCT_NAME}.lnk"
	Delete "$DESKTOP\${PRODUCT_NAME}.lnk"
	RMDir "$SMPROGRAMS\${PRODUCT_NAME}\"

	SetShellVarContext current

    DeleteRegKey HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT_NAME}"
	SetOutPath "$INSTDIR"
	Delete "$INSTDIR\*.*"

	SetOutPath "$DESKTOP"
	RMDir /r "$INSTDIR"
	RMDir "$INSTDIR"

	SetAutoClose true

SectionEnd



# Function .onInit

# FunctionEnd



# Function .onInitSuccess

# FunctionEnd



# Function onGUIInit

# FunctionEnd



Function un.onInit
	MessageBox MB_ICONQUESTION|MB_YESNO "你确定要完全删除 UI开发平台 及其所有组件？" /SD IDYES IDYES +2 IDNO +1
	Abort
FunctionEnd



# Function un.onUninitSuccess

# FunctionEnd