VERSION 6
BEGIN SCHEMATIC
    BEGIN ATTR DeviceFamilyName "spartan3a"
        DELETE all:0
        EDITNAME all:0
        EDITTRAIT all:0
    END ATTR
    BEGIN NETLIST
        BEGIN SIGNAL B_OUT
            BEGIN ATTR KEEP TRUE
                VERILOG all:0 wsynth:1
                VHDL all:0 wa:1 wd:1
                VALUETYPE Boolean
            END ATTR
        END SIGNAL
        BEGIN SIGNAL XLXN_56
            BEGIN ATTR KEEP TRUE
                VERILOG all:0 wsynth:1
                VHDL all:0 wa:1 wd:1
                VALUETYPE Boolean
            END ATTR
        END SIGNAL
        BEGIN SIGNAL B_IN
            BEGIN ATTR KEEP TRUE
                VERILOG all:0 wsynth:1
                VHDL all:0 wa:1 wd:1
                VALUETYPE Boolean
            END ATTR
        END SIGNAL
        PORT Output B_OUT
        PORT Input B_IN
        BEGIN BLOCKDEF buf
            TIMESTAMP 2000 1 1 10 10 10
            LINE N 0 -32 64 -32 
            LINE N 224 -32 128 -32 
            LINE N 64 0 128 -32 
            LINE N 128 -32 64 -64 
            LINE N 64 -64 64 0 
        END BLOCKDEF
        BEGIN BLOCK XLXI_43 buf
            PIN I XLXN_56
            PIN O
        END BLOCK
        BEGIN BLOCK XLXI_32 buf
            PIN I
            PIN O XLXN_56
        END BLOCK
        BEGIN BLOCK XLXI_53 buf
            PIN I B_IN
            PIN O B_OUT
        END BLOCK
    END NETLIST
    BEGIN SHEET 1 3520 2720
        BEGIN BRANCH B_OUT
            WIRE 2000 976 2944 976
            WIRE 2944 976 2944 1344
            WIRE 2944 1344 3104 1344
        END BRANCH
        IOMARKER 3104 1344 B_OUT R0 28
        INSTANCE XLXI_43 1952 1424 R0
        BEGIN BRANCH XLXN_56
            WIRE 1808 1392 1952 1392
        END BRANCH
        INSTANCE XLXI_32 1584 1424 R0
        INSTANCE XLXI_53 1776 1008 R0
        BEGIN BRANCH B_IN
            WIRE 1744 976 1776 976
        END BRANCH
        IOMARKER 1744 976 B_IN R180 28
    END SHEET
END SCHEMATIC
