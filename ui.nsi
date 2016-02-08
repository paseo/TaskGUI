# �������

!define PRODUCT_NAME				"UI����ƽ̨ 1.3"				# ��Ʒ����
!define PRODUCT_VERSION				"1.3.0.0"						# ��Ʒ�汾��
!define PRODUCT_SIZE_KB				39093							# ��Ʒ�ļ���С
!define PRODUCT_OUTFILE_NAME		"UI����ƽ̨_v1.3.0_setup.exe"	# ����ļ�����
!define PRODUCT_PUBLISHER			"ʢ������"						# ������
!define PRODUCT_LEGAL				"stnts.com - 2015"				# ����
!define EXE_NAME					"nw.exe"

!define MUI_ICON					"dist\app\resources\images\ui.ico"
!define MUI_UNICON					"${MUI_ICON}"

# �Ӿ�ʶ��ϵͳ

VIProductVersion					"${PRODUCT_VERSION}"
VIAddVersionKey	"ProductName"		"${PRODUCT_NAME}"
VIAddVersionKey	"ProductVersion"	"${PRODUCT_VERSION}"
VIAddVersionKey	"CompanyName"		"${PRODUCT_PUBLISHER}"	# ��˾����
VIAddVersionKey	"LegalCopyright"	"${PRODUCT_LEGAL}"		# ���ɰ�Ȩ
VIAddVersionKey	"FileDescription"	"${PRODUCT_NAME}"		# �ļ�����
VIAddVersionKey	"FileVersion"		"${PRODUCT_VERSION}"	# �ļ��汾
VIAddVersionKey	"InternalName"		"ui"					# �ڲ�����
VIAddVersionKey	"OriginalFilename"	"${EXE_NAME}"			# ԭʼ�ļ�����

# ���ñ�����

SetCompressor			lzma
Name					"${PRODUCT_NAME}"
OutFile					"${PRODUCT_OUTFILE_NAME}"
InstallDir				"$PROGRAMFILES\ui\"
ShowInstDetails			hide
ShowUninstDetails		hide
RequestExecutionLevel	admin

# ���� MUI2 ��

!include "MUI2.nsh"

# ��װ��ҳ

!insertmacro MUI_PAGE_WELCOME
!insertmacro MUI_PAGE_DIRECTORY
!insertmacro MUI_PAGE_INSTFILES
!insertmacro MUI_PAGE_FINISH

# ж����ҳ

!insertmacro MUI_UNPAGE_INSTFILES
!insertmacro MUI_UNPAGE_FINISH

# MUI �򵼽�������

!insertmacro MUI_LANGUAGE	"SimpChinese"


Section "!Files" "des_files"

	SetOutPath $INSTDIR
	File /r "dist\*.*"

	SetShellVarContext all
	CreateDirectory "$SMPROGRAMS\${PRODUCT_NAME}"
	CreateShortCut "$SMPROGRAMS\${PRODUCT_NAME}\${PRODUCT_NAME}.lnk" "$INSTDIR\${EXE_NAME}" "" "$INSTDIR\app\resources\images\ui.ico"
	CreateShortCut "$SMPROGRAMS\${PRODUCT_NAME}\ж��${PRODUCT_NAME}.lnk" "$INSTDIR\uninst.exe"
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
	Delete "$SMPROGRAMS\${PRODUCT_NAME}\ж��${PRODUCT_NAME}.lnk"
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
	MessageBox MB_ICONQUESTION|MB_YESNO "��ȷ��Ҫ��ȫɾ�� UI����ƽ̨ �������������" /SD IDYES IDYES +2 IDNO +1
	Abort
FunctionEnd



# Function un.onUninitSuccess

# FunctionEnd