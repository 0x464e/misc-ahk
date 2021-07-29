/*	
https://docs.microsoft.com/en-us/windows/win32/api/audiopolicy/nn-audiopolicy-iaudiosessionmanager2
https://docs.microsoft.com/en-us/windows/win32/api/audiopolicy/nn-audiopolicy-iaudiosessioncontrol2
https://docs.microsoft.com/en-us/windows/win32/api/audioclient/nn-audioclient-isimpleaudiovolume
https://docs.microsoft.com/en-us/windows/win32/api/wtypesbase/ne-wtypesbase-clsctx

IMMDeviceEnumerator 	CLSID 	{BCDE0395-E52F-467C-8E3D-C4579291692E}
						IID 	{A95664D2-9614-4F35-A746-DE8DB63617E6}
				
IAudioSessionManager 	IID		{BFA971F1-4D5E-40BB-935E-967039BFBEE4}				
IAudioSessionManager2 	IID 	{77AA99A0-1BD6-484F-8BC7-2C654C9A9B6F}
IAudioSessionControl2  	IID 	{bfb7ff88-7239-4fc9-8fa2-07c950be9c6d}
ISimpleAudioVolume  	IID 	{87CE5498-68D6-44E5-9215-6DA47EF883D8}
					


IUnknown::AddRef									0
IUnknown::QueryInterface							8
IUnknown::Release									16
IMMDeviceEnumerator::EnumAudioEndpoints				24
IMMDeviceEnumerator::GetDefaultAudioEndpoint		32
IMMDeviceEnumerator::GetDevice						40



typedef enum __MIDL___MIDL_itf_mmdeviceapi_0000_0000_0001 {
  eRender,
  eCapture,
  eAll,
  EDataFlow_enum_count
} EDataFlow;


HRESULT GetDefaultAudioEndpoint(
  EDataFlow dataFlow,
  ERole     role,
  IMMDevice **ppEndpoint
);

IMMDevice : IUnknown
...
IMMDevice::Activate				24
IMMDevice::GetId				32
IMMDevice::GetState				...
IMMDevice::OpenPropertyStore



CLSIDFromString(
    _In_ LPCOLESTR lpsz,
    _Out_ LPCLSID pclsid
    );
	
	HRESULT Activate(
  REFIID      iid,
  DWORD       dwClsCtx,
  PROPVARIANT *pActivationParams,
  void        **ppInterface
);

IAudioSessionManager2 : IAudioSessionManager : IUnknown
...
IAudioSessionManager::GetAudioSessionControl			24
IAudioSessionManager::GetSimpleAudioVolume				32
IAudioSessionManager2::GetSessionEnumerator				40
IAudioSessionManager2::RegisterDuckNotification			48
IAudioSessionManager2::RegisterSessionNotification		56
IAudioSessionManager2::UnregisterDuckNotification		64
IAudioSessionManager2::UnregisterSessionNotification	72

HRESULT GetSessionEnumerator(
  IAudioSessionEnumerator **SessionEnum
);

IAudioSessionEnumerator : IUnknown
...
IAudioSessionEnumerator::GetCount		24
IAudioSessionEnumerator::GetSession		32

HRESULT GetCount(
  int *SessionCount
);

HRESULT GetSession(
  int                  SessionCount,
  IAudioSessionControl **Session
);


IAudioSessionControl : IUnknown
...
wrong offsets from docs, check audiopolicy.h for right order
IAudioSessionControl::GetDisplayName						24
IAudioSessionControl::GetGroupingParam						32
IAudioSessionControl::GetIconPath							40
IAudioSessionControl::GetState								48
IAudioSessionControl::RegisterAudioSessionNotification		56
IAudioSessionControl::SetDisplayName						64
IAudioSessionControl::SetGroupingParam						72
IAudioSessionControl::SetIconPath							80
IAudioSessionControl::UnregisterAudioSessionNotification	88

IAudioSessionControl2 : IAudioSessionControl
...
IAudioSessionControl2::GetSessionIdentifier					96
IAudioSessionControl2::GetSessionInstanceIdentifier			104
IAudioSessionControl2::GetProcessId							112
IAudioSessionControl2::IsSystemSoundsSession
IAudioSessionControl2::SetDuckingPreference

HRESULT GetDisplayName(
  LPWSTR *pRetVal
);

HRESULT GetProcessId(
  DWORD *pRetVal
);
*/ 

#NoEnv

pid_to_find := 12345

;some one-liner fun
Loop, % (sessionCount, DllCall(NumGet(0+(vtable, vtable := NumGet(0+(IAudioSessionEnumerator, DllCall(NumGet(NumGet(0+(pIAudioSessionManager2
    , DllCall((pActivate := NumGet(NumGet(0+(pIMMDevice, DllCall(pGetDefaultAudioEndpoint := NumGet(NumGet(0+pIMMDeviceEnumerator 
    := ComObjCreate("{BCDE0395-E52F-467C-8E3D-C4579291692E}", "{A95664D2-9614-4F35-A746-DE8DB63617E6}")), 4*A_PtrSize), Ptr, pIMMDeviceEnumerator
    , UInt, 0, UInt, 1, PtrP, pIMMDevice))), 3*A_PtrSize), DllCall("Ole32\CLSIDFromString", ("WStr", VarSetCapacity(const_IID_IAudioSessionManager2
    , A_PtrSize)), "{77AA99A0-1BD6-484F-8BC7-2C654C9A9B6F}", Ptr, &const_IID_IAudioSessionManager2)), Ptr, pIMMDevice, UInt, &const_IID_IAudioSessionManager2
    , UInt, 0x4, Ptr, 0, PtrP, pIAudioSessionManager2))), 5*A_PtrSize), Ptr, pIAudioSessionManager2, PtrP, IAudioSessionEnumerator)))), 3*A_PtrSize), Ptr
    , IAudioSessionEnumerator, IntP, sessionCount))
        if(!_ && (processId, DllCall(NumGet(NumGet(0+(pIAudioSessionControl2,DllCall(NumGet(NumGet(0+(pIAudioSessionControl, DllCall(NumGet(vtable+0, 4*A_PtrSize), Ptr
        , IAudioSessionEnumerator, Int, A_Index-1, PtrP, pIAudioSessionControl)))), ("Ptr", DllCall("Ole32\CLSIDFromString", ("WStr", VarSetCapacity(const_IID_IAudioSessionControl2, A_PtrSize))
        , "{bfb7ff88-7239-4fc9-8fa2-07c950be9c6d}", Ptr, &const_IID_IAudioSessionControl2)), pIAudioSessionControl, UInt, &const_IID_IAudioSessionControl2, PtrP, pIAudioSessionControl2)))
        , 14*A_PtrSize), Ptr, pIAudioSessionControl2, UIntP, processId), ObjRelease(pIAudioSessionControl), ObjRelease(pIAudioSessionControl2)) 
        = pid_to_find)
            MsgBox, % ("Found it", _ := !_, ObjRelease(IAudioSessionEnumerator), ObjRelease(pIAudioSessionManager2), ObjRelease(pIMMDeviceEnumerator), ObjRelease(pIMMDevice))
    



return

;--------------------------------------------------------------------------
;same code as above, just not a one-liner

pid_to_find := 12345

pIMMDeviceEnumerator := ComObjCreate("{BCDE0395-E52F-467C-8E3D-C4579291692E}", "{A95664D2-9614-4F35-A746-DE8DB63617E6}")

vtable := NumGet(pIMMDeviceEnumerator+0)
pGetDefaultAudioEndpoint := NumGet(vtable+0, 4*A_PtrSize)
DllCall(pGetDefaultAudioEndpoint, Ptr, pIMMDeviceEnumerator, UInt, 0, UInt, 1, PtrP, pIMMDevice)

vtable := NumGet(pIMMDevice+0)
pActivate := NumGet(vtable+0, 3*A_PtrSize)

VarSetCapacity(const_IID_IAudioSessionManager2, A_PtrSize)
DllCall("Ole32\CLSIDFromString", WStr, "{77AA99A0-1BD6-484F-8BC7-2C654C9A9B6F}", Ptr, &const_IID_IAudioSessionManager2)

DllCall(pActivate, Ptr, pIMMDevice, UInt, &const_IID_IAudioSessionManager2, UInt, 0x4, Ptr, 0, PtrP, pIAudioSessionManager2)
vtable := NumGet(pIAudioSessionManager2+0)
pGetSessionEnumerator := NumGet(vtable+0, 5*A_PtrSize)

DllCall(pGetSessionEnumerator, Ptr, pIAudioSessionManager2, PtrP, IAudioSessionEnumerator)
vtable := NumGet(IAudioSessionEnumerator+0)
pGetCount := NumGet(vtable+0, 3*A_PtrSize)
pGetSession := NumGet(vtable+0, 4*A_PtrSize)
DllCall(pGetCount, Ptr, IAudioSessionEnumerator, IntP, sessionCount)

Loop, % sessionCount
{
	DllCall(pGetSession, Ptr, IAudioSessionEnumerator, Int, A_Index-1, PtrP, pIAudioSessionControl)
	
	vtable := NumGet(pIAudioSessionControl+0)
	pQueryInterface := NumGet(vtable+0)
	
	VarSetCapacity(const_IID_IAudioSessionControl2, A_PtrSize)
	DllCall("Ole32\CLSIDFromString", WStr, "{bfb7ff88-7239-4fc9-8fa2-07c950be9c6d}", Ptr, &const_IID_IAudioSessionControl2)
	DllCall(pQueryInterface, Ptr, pIAudioSessionControl, UInt, &const_IID_IAudioSessionControl2, PtrP, pIAudioSessionControl2)
	pIAudioSessionControl2 := ComObjQuery(pIAudioSessionControl, "{bfb7ff88-7239-4fc9-8fa2-07c950be9c6d}")
	vtable := NumGet(pIAudioSessionControl2+0)
	pGetProcessId := NumGet(vtable+0, 14*A_PtrSize)
	
	DllCall(pGetProcessId, Ptr, pIAudioSessionControl2, UIntP, processId)
	
	if (processId = 35388)
	{
		MsgBox, % "Found it"
		break
	}
	
	ObjRelease(pIAudioSessionControl)
	ObjRelease(pIAudioSessionControl2)
}

ObjRelease(IAudioSessionEnumerator)
ObjRelease(pIAudioSessionManager2)
ObjRelease(pIMMDeviceEnumerator)
ObjRelease(pIMMDevice)