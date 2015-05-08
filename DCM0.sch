VERSION 6
BEGIN SCHEMATIC
    BEGIN ATTR DeviceFamilyName "spartan3a"
        DELETE all:0
        EDITNAME all:0
        EDITTRAIT all:0
    END ATTR
    BEGIN NETLIST
        SIGNAL XLXN_3
        SIGNAL XLXN_4
        SIGNAL XLXN_5
        SIGNAL XLXN_6
        SIGNAL LOCK_OUT
        SIGNAL CLK0
        SIGNAL CLK_IN
        SIGNAL CLK90
        PORT Output LOCK_OUT
        PORT Output CLK0
        PORT Input CLK_IN
        PORT Output CLK90
        BEGIN BLOCKDEF Gobal_DCM
            TIMESTAMP 2008 8 12 3 8 8
            RECTANGLE N 64 -256 400 0 
            LINE N 64 -224 0 -224 
            LINE N 64 -32 0 -32 
            LINE N 400 -224 464 -224 
            LINE N 400 -160 464 -160 
            LINE N 400 -96 464 -96 
            LINE N 400 -32 464 -32 
        END BLOCKDEF
        BEGIN BLOCKDEF GobalCLK
            TIMESTAMP 2008 8 12 3 8 2
            RECTANGLE N 64 -256 320 0 
            LINE N 64 -224 0 -224 
            LINE N 64 -32 0 -32 
            LINE N 320 -224 384 -224 
            LINE N 320 -96 384 -96 
            LINE N 320 -32 384 -32 
        END BLOCKDEF
        BEGIN BLOCKDEF gnd
            TIMESTAMP 2000 1 1 10 10 10
            LINE N 64 -64 64 -96 
            LINE N 76 -48 52 -48 
            LINE N 68 -32 60 -32 
            LINE N 88 -64 40 -64 
            LINE N 64 -64 64 -80 
            LINE N 64 -128 64 -96 
        END BLOCKDEF
        BEGIN BLOCK XLXI_1 Gobal_DCM
            PIN CLKIN_IN CLK_IN
            PIN RST_IN XLXN_5
            PIN CLKFX_OUT XLXN_6
            PIN CLKIN_IBUFG_OUT
            PIN CLK0_OUT XLXN_3
            PIN LOCKED_OUT XLXN_4
        END BLOCK
        BEGIN BLOCK XLXI_3 gnd
            PIN G XLXN_5
        END BLOCK
        BEGIN BLOCK XLXI_2 GobalCLK
            PIN CLKIN_IN XLXN_6
            PIN RST_IN XLXN_5
            PIN CLK0_OUT CLK0
            PIN CLK90_OUT CLK90
            PIN LOCKED_OUT LOCK_OUT
        END BLOCK
    END NETLIST
    BEGIN SHEET 1 3520 2720
        BEGIN INSTANCE XLXI_1 592 656 R0
        END INSTANCE
        BEGIN BRANCH XLXN_3
            WIRE 1056 560 1088 560
        END BRANCH
        BEGIN BRANCH XLXN_4
            WIRE 1056 624 1088 624
        END BRANCH
        INSTANCE XLXI_3 464 848 R0
        IOMARKER 1872 608 LOCK_OUT R0 28
        IOMARKER 1872 416 CLK0 R0 28
        BEGIN BRANCH LOCK_OUT
            WIRE 1840 608 1872 608
        END BRANCH
        BEGIN BRANCH CLK0
            WIRE 1840 416 1872 416
        END BRANCH
        BEGIN BRANCH XLXN_6
            WIRE 1056 432 1248 432
            WIRE 1248 416 1248 432
            WIRE 1248 416 1456 416
        END BRANCH
        BEGIN INSTANCE XLXI_2 1456 640 R0
        END INSTANCE
        IOMARKER 240 432 CLK_IN R180 28
        BEGIN BRANCH XLXN_5
            WIRE 528 624 592 624
            WIRE 528 624 528 720
            WIRE 528 720 1392 720
            WIRE 1392 608 1392 720
            WIRE 1392 608 1456 608
        END BRANCH
        BEGIN BRANCH CLK_IN
            WIRE 240 432 592 432
        END BRANCH
        BEGIN BRANCH CLK90
            WIRE 1840 544 1856 544
            WIRE 1856 544 1872 544
        END BRANCH
        IOMARKER 1872 544 CLK90 R0 28
    END SHEET
END SCHEMATIC
