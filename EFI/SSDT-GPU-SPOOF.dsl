DefinitionBlock ("", "SSDT", 2, "DRTNIA", "AMDGPU", 0x00001000)
{
    External (_SB_.PCI0, DeviceObj)
    External (_SB.PCI0.GPP8.VGA, DeviceObj)


    Scope (\_SB.PCI0.GPP8.VGA)
    {
        if (_OSI ("Darwin"))
        {
            Method (_DSM, 4, NotSerialized)
            {
                Local0 = Package (0x04)
                {
                    "device-id",
                    Buffer (0x04)
                    {
                        0xB0, 0x67, 0x00, 0x00
                    },
                    "model",
                    Buffer ()
                    {
                        "R9 280"
                    }
                }
                DTGP (Arg0, Arg1, Arg2, Arg3, RefOf (Local0))
                Return (Local0)
            }
        }
    }
    Scope (\_SB.PCI0)
    {                   
        Method (DTGP, 5, NotSerialized)
        {
            If (LEqual (Arg0, ToUUID ("a0b5b7c6-1318-441c-b0c9-fe695eaf949b")))
            {
                If (LEqual (Arg1, One))
                {
                    If (LEqual (Arg2, Zero))
                    {
                        Store (Buffer (One)
                            {
                                 0x03
                            }, Arg4)
                        Return (One)
                    }

                    If (LEqual (Arg2, One))
                    {
                        Return (One)
                    }
                }
            }

            Store (Buffer (One)
                {
                     0x00
                }, Arg4)
            Return (Zero)
        }
      
    }

}
