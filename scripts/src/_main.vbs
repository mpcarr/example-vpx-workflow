Option Explicit

'*****************************************************************************************************
' CREDITS
' Initial table created by fuzzel, jimmyfingers, jpsalas, toxie & unclewilly (in alphabetical order)
' Flipper primitives by zany
' Ball rolling sound script by jpsalas
' Ball shadow by ninuzzu
' Ball control & ball dropping sound by rothbauerw
' DOF by arngrim
' Positional sound helper functions by djrobx
' Plus a lot of input from the whole community (sorry if we forgot you :/)
'*****************************************************************************************************


'First, try to load the Controller.vbs (DOF), which helps controlling additional hardware like lights, gears, knockers, bells and chimes (to increase realism)
'This table uses DOF via the 'SoundFX' calls that are inserted in some of the PlaySound commands, which will then fire an additional event, instead of just playing a sample/sound effect
On Error Resume Next
ExecuteGlobal GetTextFile("controller.vbs")
If Err Then MsgBox "You need the Controller.vbs file in order to run this table (installed with the VPX package in the scripts folder)"
On Error Goto 0

'If using Visual PinMAME (VPM), place the ROM/game name in the constant below,
'both for VPM, and DOF to load the right DOF config from the Configtool, whether it's a VPM or an Original table

'Const cGameName = ""

If Table1.ShowDT = false then
    Scoretext.Visible = false
End If


Dim EnableBallControl
EnableBallControl = false 'Change to true to enable manual ball control (or press C in-game) via the arrow keys and B (boost movement) keys

Const BallSize = 25  'Ball radius


Sub playfield_mesh_Hit()
	msgbox "ball has hit playfield"
end Sub

Sub Drain_Hit()
	PlaySound "drain",0,1,AudioPan(Drain),0.25,0,0,1,AudioFade(Drain)
	Drain.DestroyBall
	BIP = BIP - 1
	If BIP = 0 then
		'Plunger.CreateBall
		BallRelease.CreateBall
		BallRelease.Kick 90, 7
		PlaySound SoundFX("ballrelease",DOFContactors), 0,1,AudioPan(BallRelease),0.25,0,0,1,AudioFade(BallRelease)
		BIP = BIP + 1
	End If
End Sub


Dim BIP
BIP = 0

Sub Plunger_Init()
	PlaySound SoundFX("ballrelease",DOFContactors), 0,1,AudioPan(BallRelease),0.25,0,0,1,AudioFade(BallRelease)
	'Plunger.CreateBall
	BallRelease.CreateBall
	BallRelease.Kick 90, 7
	BIP = BIP + 1
End Sub

Sub Gate_Hit
	Kicker1.Kick 190, 10
End Sub

Sub Bumper1_Hit
	PlaySound SoundFX("fx_bumper4",DOFContactors), 0,1,AudioPan(Bumper1),0,0,0,1,AudioFade(Bumper1)
	B1L1.State = 1:B1L2. State = 1
	Me.TimerEnabled = 1
End Sub

Sub Bumper1_Timer
	B1L1.State = 0:B1L2. State = 0
	Me.Timerenabled = 0
End Sub

Sub Bumper2_Hit
	PlaySound SoundFX("fx_bumper4",DOFContactors), 0,1,AudioPan(Bumper2),0,0,0,1,AudioFade(Bumper2)
	B2L1.State = 1:B2L2. State = 1
	Me.TimerEnabled = 1
End Sub

Sub Bumper2_Timer
	B2L1.State = 0:B2L2. State = 0
	Me.Timerenabled = 0
End Sub	

Sub Bumper3_Hit
	PlaySound SoundFX("fx_bumper4",DOFContactors), 0,1,AudioPan(Bumper3),0,0,0,1,AudioFade(Bumper3)
	B3L1.State = 1:B3L2. State = 1
	Me.TimerEnabled = 1
End Sub

Sub Bumper3_Timer
	B3L1.State = 0:B3L2. State = 0
	Me.Timerenabled = 0
End Sub

Sub Bumper4_Hit
	PlaySound SoundFX("fx_bumper4",DOFContactors), 0,1,AudioPan(Bumper4),0,0,0,1,AudioFade(Bumper4)
	B4L1.State = 1:B4L2. State = 1
	Me.TimerEnabled = 1
End Sub

Sub Bumper4_Timer
	B4L1.State = 0:B4L2. State = 0
	Me.Timerenabled = 0
End Sub

Sub Bumper5_Hit
	PlaySound SoundFX("fx_bumper4",DOFContactors), 0,1,AudioPan(Bumper5),0,0,0,1,AudioFade(Bumper5)
	B5L1.State = 1:B5L2. State = 1
	Me.TimerEnabled = 1
End Sub

Sub Bumper5_Timer
	B5L1.State = 0:B5L2. State = 0
	Me.Timerenabled = 0
End Sub

Sub sw9_Hit
	If L9.State = 1 then 
		L9.State  = 0
	else 
		L9.State = 1
	end if
End Sub

Sub sw8_Hit
	If L8.State = 1 then 
		L8.State  = 0
	else 
		L8.State = 1
	end if
End Sub

Sub sw7_Hit
	If L7.State = 1 then 
		L7.State  = 0
	else 
		L7.State = 1
	end if
End Sub

Sub sw6_Hit
	If L6.State = 1 then 
		L6.State  = 0
	else 
		L6.State = 1
	end if
End Sub


'****Targets
Sub sw1_Hit
	If L1.State = 1 then 
		L1.State  = 0
	else 
		L1.State = 1
	end if
	Me.TimerEnabled = 1
End Sub

Sub sw1_Timer
	sw1.isDropped=0
	Me.TimerEnabled = 0
End Sub

Sub sw2_Hit
	If L2.State = 1 then 
		L2.State  = 0
	else 
		L2.State = 1
	end if
	Me.TimerEnabled = 1
End Sub

Sub sw2_Timer
	sw2.isDropped=0
	Me.TimerEnabled = 0
End Sub

Sub sw3_Hit
	If L3.State = 1 then 
		L3.State  = 0
	else 
		L3.State = 1
	end if
	ME.TimerEnabled = 1
End Sub

Sub sw3_Timer
	sw3.isDropped = 0
	Me.TimerEnabled = 0
End Sub

Sub sw11_Hit
	If L11.State = 1 then 
		L11.State  = 0
	else 
		L11.State = 1
	end if
End Sub


Sub sw12_Hit
	If L12.State = 1 then 
		L12.State  = 0
	else 
		L12.State = 1
	end if
End Sub


Sub sw13_Hit
	If L13.State = 1 then 
		L13.State  = 0
	else 
		L13.State = 1
	end if
End Sub

Sub Kicker1_Hit
	PlaySound "kicker_enter_center", 0, Vol(ActiveBall), AudioPan(ActiveBall), 0, Pitch(ActiveBall), 1, 0, AudioFade(ActiveBall)
	'Plunger.CreateBall
	PlaySound SoundFX("ballrelease",DOFContactors), 0,0.5,AudioPan(BallRelease),0.25,0,0,1,AudioFade(BallRelease)
	BallRelease.CreateBall
	BallRelease.Kick 90, 8
	BIP = BIP +1
End Sub

Sub Kicker1_UnHit
	PlaySound "popper_ball",0,.75,AudioPan(Kicker1),0.25,0,0,1,AudioFade(Kicker1)
End Sub

'*****GI Lights On
dim xx

For each xx in GI:xx.State = 1: Next

'**********Sling Shot Animations
' Rstep and Lstep  are the variables that increment the animation
'****************
Dim RStep, Lstep

Sub RightSlingShot_Slingshot
    PlaySound SoundFX("right_slingshot",DOFContactors), 0,1, 0.05,0.05 '0,1, AudioPan(RightSlingShot), 0.05,0,0,1,AudioFade(RightSlingShot)
    RSling.Visible = 0
    RSling1.Visible = 1
    sling1.rotx = 20
    RStep = 0
    RightSlingShot.TimerEnabled = 1
	gi1.State = 0:Gi2.State = 0
End Sub

Sub RightSlingShot_Timer
    Select Case RStep
        Case 3:RSLing1.Visible = 0:RSLing2.Visible = 1:sling1.rotx = 10
        Case 4:RSLing2.Visible = 0:RSLing.Visible = 1:sling1.rotx = 0:RightSlingShot.TimerEnabled = 0:gi1.State = 1:Gi2.State = 1
    End Select
    RStep = RStep + 1
End Sub

Sub LeftSlingShot_Slingshot
    PlaySound SoundFX("left_slingshot",DOFContactors), 0,1, -0.05,0.05 '0,1, AudioPan(LeftSlingShot), 0.05,0,0,1,AudioFade(LeftSlingShot)
    LSling.Visible = 0
    LSling1.Visible = 1
    sling2.rotx = 20
    LStep = 0
    LeftSlingShot.TimerEnabled = 1
	gi3.State = 0:Gi4.State = 0
End Sub

Sub LeftSlingShot_Timer
    Select Case LStep
        Case 3:LSLing1.Visible = 0:LSLing2.Visible = 1:sling2.rotx = 10
        Case 4:LSLing2.Visible = 0:LSLing.Visible = 1:sling2.rotx = 0:LeftSlingShot.TimerEnabled = 0:gi3.State = 1:Gi4.State = 1
    End Select
    LStep = LStep + 1
End Sub
















