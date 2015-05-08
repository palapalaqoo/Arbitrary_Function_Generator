VERSION 6
BEGIN SCHEMATIC
    BEGIN ATTR DeviceFamilyName "spartan3a"
        DELETE all:0
        EDITNAME all:0
        EDITTRAIT all:0
    END ATTR
    BEGIN NETLIST
        SIGNAL write
        SIGNAL read
        SIGNAL Addr_in(25:0)
        SIGNAL CS
        SIGNAL DataBus(15:0)
        SIGNAL XLXN_6(15:0)
        SIGNAL XLXN_7(25:0)
        SIGNAL XLXN_8
        SIGNAL XLXN_9(15:0)
        SIGNAL Write_out
        SIGNAL ADDR(25:0)
        SIGNAL DATA(15:0)
        SIGNAL REG_SEL(3:0)
        SIGNAL ARB_SEL
        PORT Input write
        PORT Input read
        PORT Input Addr_in(25:0)
        PORT Input CS
        PORT Input DataBus(15:0)
        PORT Output Write_out
        PORT Output ADDR(25:0)
        PORT Output DATA(15:0)
        PORT Output REG_SEL(3:0)
        PORT Output ARB_SEL
        BEGIN BLOCKDEF V1
            TIMESTAMP 2008 7 25 5 2 8
            LINE N 64 240 0 240 
            LINE N 64 176 0 176 
            RECTANGLE N 384 -172 448 -148 
            LINE N 384 -160 448 -160 
            RECTANGLE N 0 -172 64 -148 
            LINE N 64 -160 0 -160 
            RECTANGLE N 0 36 64 60 
            LINE N 64 48 0 48 
            LINE N 64 -80 0 -80 
            LINE N 64 -16 0 -16 
            RECTANGLE N 384 36 448 60 
            LINE N 384 48 448 48 
            RECTANGLE N 384 100 448 124 
            LINE N 384 112 448 112 
            LINE N 384 -16 448 -16 
            LINE N 384 -80 448 -80 
            RECTANGLE N 64 -192 384 268 
        END BLOCKDEF
        BEGIN BLOCKDEF DDR_CON
            TIMESTAMP 2009 3 13 9 36 6
            LINE N 432 224 496 224 
            LINE N 64 96 0 96 
            LINE N 64 -288 0 -288 
            RECTANGLE N 0 -172 64 -148 
            LINE N 64 -160 0 -160 
            RECTANGLE N 0 -44 64 -20 
            LINE N 64 -32 0 -32 
            LINE N 432 -288 496 -288 
            RECTANGLE N 432 -236 496 -212 
            LINE N 432 -224 496 -224 
            RECTANGLE N 432 -172 496 -148 
            LINE N 432 -160 496 -160 
            RECTANGLE N 432 -108 496 -84 
            LINE N 432 -96 496 -96 
            RECTANGLE N 432 -44 496 -20 
            LINE N 432 -32 496 -32 
            RECTANGLE N 64 -320 432 308 
        END BLOCKDEF
        BEGIN BLOCK XLXI_1 V1
            PIN INIT_DONE
            PIN Read read
            PIN CS CS
            PIN Write write
            PIN Addr_in(25:0) Addr_in(25:0)
            PIN Din(15:0)
            PIN DataBus(15:0) DataBus(15:0)
            PIN Read_out
            PIN Write_out XLXN_8
            PIN Addr_out(25:0) XLXN_7(25:0)
            PIN Dout(15:0) XLXN_9(15:0)
        END BLOCK
        BEGIN BLOCK XLXI_2 DDR_CON
            PIN CLK_50_IN
            PIN Write_in XLXN_8
            PIN Addr_in(25:0) XLXN_7(25:0)
            PIN Data_in(15:0) XLXN_9(15:0)
            PIN Write_out Write_out
            PIN Addr_out(25:0) ADDR(25:0)
            PIN Data_out(15:0) DATA(15:0)
            PIN REG_SEL(3:0) REG_SEL(3:0)
            PIN DDS_PINC(47:0)
            PIN ARB_SEL ARB_SEL
        END BLOCK
    END NETLIST
    BEGIN SHEET 1 3520 2720
        BEGIN INSTANCE XLXI_1 672 992 R0
        END INSTANCE
        BEGIN BRANCH write
            WIRE 640 976 672 976
        END BRANCH
        BEGIN BRANCH read
            WIRE 640 912 672 912
        END BRANCH
        BEGIN BRANCH Addr_in(25:0)
            WIRE 640 832 672 832
        END BRANCH
        BEGIN BRANCH CS
            WIRE 640 1168 672 1168
        END BRANCH
        BEGIN BRANCH DataBus(15:0)
            WIRE 624 1296 1168 1296
            WIRE 1120 1104 1168 1104
            WIRE 1168 1104 1168 1296
        END BRANCH
        IOMARKER 640 976 write R180 28
        IOMARKER 640 912 read R180 28
        IOMARKER 640 832 Addr_in(25:0) R180 28
        IOMARKER 640 1168 CS R180 28
        IOMARKER 624 1296 DataBus(15:0) R180 28
        BEGIN BRANCH XLXN_7(25:0)
            WIRE 1120 832 1296 832
            WIRE 1296 832 1296 976
            WIRE 1296 976 1472 976
        END BRANCH
        BEGIN BRANCH XLXN_9(15:0)
            WIRE 1120 1040 1296 1040
            WIRE 1296 1040 1296 1104
            WIRE 1296 1104 1472 1104
        END BRANCH
        BEGIN INSTANCE XLXI_2 1472 1136 R0
        END INSTANCE
        BEGIN BRANCH XLXN_8
            WIRE 1120 976 1136 976
            WIRE 1136 848 1472 848
            WIRE 1136 848 1136 976
        END BRANCH
        BEGIN BRANCH Write_out
            WIRE 1968 848 2000 848
        END BRANCH
        IOMARKER 2000 848 Write_out R0 28
        BEGIN BRANCH ADDR(25:0)
            WIRE 1968 912 2000 912
        END BRANCH
        IOMARKER 2000 912 ADDR(25:0) R0 28
        BEGIN BRANCH DATA(15:0)
            WIRE 1968 976 2000 976
        END BRANCH
        IOMARKER 2000 976 DATA(15:0) R0 28
        BEGIN BRANCH REG_SEL(3:0)
            WIRE 1968 1040 2000 1040
        END BRANCH
        IOMARKER 2000 1040 REG_SEL(3:0) R0 28
        BEGIN BRANCH ARB_SEL
            WIRE 1968 1360 2000 1360
        END BRANCH
        IOMARKER 2000 1360 ARB_SEL R0 28
    END SHEET
END SCHEMATIC
