// SSDT for T460 Keyboard Map & Configuration. Use with @MSzturc's ThinkpadAssistant app
// for full function key support (https://github.com/MSzturc/ThinkpadAssistant/releases)

DefinitionBlock("", "SSDT", 2, "T460", "KBRD", 0)
{
    // External references to EC, keyboard, and original methods.
    External (\_SB.PCI0, DeviceObj)
    External (\_SB.PCI0.LPC, DeviceObj)
    External (\_SB.PCI0.LPC.EC, DeviceObj)
    External (\_SB.PCI0.LPC.KBD, DeviceObj)
    External (\_SB.PCI0.LPC.EC.XQ6A, MethodObj)
    External (\_SB.PCI0.LPC.EC.XQ15, MethodObj)
    External (\_SB.PCI0.LPC.EC.XQ14, MethodObj)
    External (\_SB.PCI0.LPC.EC.XQ16, MethodObj)
    External (\_SB.PCI0.LPC.EC.XQ64, MethodObj)
    External (\_SB.PCI0.LPC.EC.XQ66, MethodObj)
    External (\_SB.PCI0.LPC.EC.XQ67, MethodObj)
    External (\_SB.PCI0.LPC.EC.XQ68, MethodObj)
    External (\_SB.PCI0.LPC.EC.XQ69, MethodObj)

    Scope (\_SB.PCI0.LPC.EC)
    {

        // _Q6A - (Fn+F4) microphone mute key.
        Method(_Q6A, 0, NotSerialized)
        {
            If (_OSI ("Darwin"))
          	{
                // Send a one-shot event (down then up) for scancode 64 to keyboard device. This
                // is picked up by VoodooPS2 and sent to macOS as the F20 key.

                //Bug: Currently it's not possivle to map F20 Key in Systemprefs
                Notify (\_SB.PCI0.LPC.KBD, 0x036b)
          	}
          	Else
          	{
                // Call original _Q6A method.
                \_SB.PCI0.LPC_.EC.XQ6A()
          	}
        }

        // _Q15 - (Fn+F5) brightness down key.
        Method (_Q15, 0, NotSerialized)
        {
          	If (_OSI ("Darwin"))
          	{
                // Send a one-shot event (down then up) for scancode e0 05 to keyboard device. This
                // is picked up by VoodooPS2 and sent to macOS as the F14 (brightness down) key.
              	Notify (\_SB.PCI0.LPC.KBD, 0x0405)
          	}
          	Else
          	{
                // Call original _Q15 method.
          	    \_SB.PCI0.LPC.EC.XQ15 ()
          	}
        }

        // _Q14 - (Fn+F6) brightness up key.
        Method (_Q14, 0, NotSerialized)
        {
          	If (_OSI ("Darwin"))
          	{
                // Send a one-shot event (down then up) for scancode e0 06 to keyboard device. This
                // is picked up by VoodooPS2 and sent to macOS as the F15 (brightness up) key.
              	Notify (\_SB.PCI0.LPC.KBD, 0x0406)
          	}
          	Else
          	{
                // Call original _Q14 method.
          		  \_SB.PCI0.LPC.EC.XQ14 ()
          	}
        }

        // _Q16 - (Fn+F7) projector key.
        Method(_Q16, 0, NotSerialized)
        {
            If (_OSI ("Darwin"))
          	{
                // Send a one-shot event (down then up) for scancode 67 to keyboard device. This
                // is picked up by VoodooPS2 and sent to macOS as the F16 key.
              	Notify (\_SB.PCI0.LPC.KBD, 0x0367)
          	}
          	Else
          	{
                // Call original _Q16 method.
          		  \_SB.PCI0.LPC.EC.XQ16 ()
          	}
        }

        // _Q64 - (Fn+F8) Wireless disable key.
        Method(_Q64, 0, NotSerialized)
        {
            If (_OSI ("Darwin"))
            {
                // Send a one-shot event (down then up) for scancode 68 to keyboard device. This
                // is picked up by VoodooPS2 and sent to macOS as the F17 key.
                Notify (\_SB.PCI0.LPC.KBD, 0x0368)
            }
            Else
            {
                // Call original _Q64 method.
                \_SB.PCI0.LPC.EC.XQ64 ()
            }
        }


        // _Q66 - (Fn+F9) Settings key.
        Method(_Q66, 0, NotSerialized)
        {
            If (_OSI ("Darwin"))
            {
                // Send a one-shot event (down then up) for scancode 69 to keyboard device. This
                // is picked up by VoodooPS2 and sent to macOS as the F18 key.
                Notify (\_SB.PCI0.LPC.KBD, 0x0369)
            }
            Else
            {
                // Call original _Q66 method.
                \_SB.PCI0.LPC.EC.XQ66 ()
            }
        }

        // _Q67 - (Fn+F10) Search key.
        Method(_Q67, 0, NotSerialized)
        {

            If (_OSI ("Darwin"))
            {   // Ctrl key is mapped below as macOS Command key by VoodooPS2
                // Send a down event for the Control key (scancode 1d), then a one-shot event (down then up) for
                // the spacebar (scancode 39), and finally an up event for the Control key (break scancode 9d).
                // This is picked up by VoodooPS2 and sent to macOS as the Command+Space key combo for Spotlight.
                Notify (\_SB.PCI0.LPC.KBD, 0x011d)
                Notify (\_SB.PCI0.LPC.KBD, 0x0339)
                Notify (\_SB.PCI0.LPC.KBD, 0x019d)
            }
            Else
            {
                // Call original _Q67 method.
                \_SB.PCI0.LPC.EC.XQ67 ()
            }
        }

        // _Q68 - (Fn+F11) App switcher key.
        Method(_Q68, 0, NotSerialized)
        {

            If (_OSI ("Darwin"))
            {
                // Win key is maped below as macOS Control key by VoodooPS2
                // here first send a down event for the Win key (scancode e0 5b), then a one-shot event (down then up) for
                // the up arrow key (scancode e0 48), and finally an up event for the Win key (break scancode e0 db).
                // This is picked up by VoodooPS2 and sent to macOS as the Control+Up key combo for Mission Control.
                Notify (\_SB.PCI0.LPC.KBD, 0x025b)
                Notify (\_SB.PCI0.LPC.KBD, 0x0448)
                Notify (\_SB.PCI0.LPC.KBD, 0x02db)
            }
            Else
            {
                // Call original _Q68 method.
                \_SB.PCI0.LPC.EC.XQ68 ()
            }
        }

        // _Q69 - (Fn+F12) Start screen key.
        Method(_Q69, 0, NotSerialized)
        {
            If (_OSI ("Darwin"))
            {
                // Send a one-shot event (down then up) for scancode 6a to keyboard device. This
                // is picked up by VoodooPS2 and sent to macOS as the F19 key.
                Notify (\_SB.PCI0.LPC.KBD, 0x036a)
            }
            Else
            {
                // Call original _Q69 method.
                \_SB.PCI0.LPC.EC.XQ69 ()
            }
        }
    }

    Scope (\_SB.PCI0.LPC.KBD)
    {
        If (_OSI ("Darwin"))
        {

            // Overrides for settings in the Info.plist files
            Name(RMCF, Package()
            {
                "Keyboard", Package ()
                {
                    "ActionSwipeLeft",  "37 d, 21 d, 21 u, 37 u",
                    "ActionSwipeRight", "37 d, 1e d, 1e u, 37 u",
                    "SleepPressTime",   "1500",
                    // This crazy combination somehow maps
                    // macOS < == > Keyboard
                    // command == ctrl (for using windows like copy pase shortcut)
                    // control == win
                    // option  == Alt
                    "Custom PS2 Map", Package()
                    {
                        Package(Zero) { },
                        "e037=64",	// PrtSc=F13,via SysPrefs->Keyboard->Shortcuts
                        // swaps left alt with left win, without this only "Custom ADB Map"
                        // doesn't work, don't know why
                        "38=e05b",
                        "e05b=38",
                    },
                    "Custom ADB Map", Package()
		            {
  		                Package(Zero){},
  		                // Somehow setting 1d=37 makes left alt = left control and left win = option
                        // here 38 and e05b doesn't respect this ADB map, But only setting them in
                        // Custom PS2 Map alone doesn't work either.
                		"38=3a",    // 38 is PS2 for left alt, 3a is ADB for left option
                        "1d=37",    // 1d is PS2 for left control, 37 is ADB for command
                        "e05b=3b",    // e05b is PS2 for left win, 3b is ADB for left control
		            },
                },
            })
        }
    }
}
