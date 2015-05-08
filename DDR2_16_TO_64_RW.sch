VERSION 6
BEGIN SCHEMATIC
    BEGIN ATTR DeviceFamilyName "spartan3a"
        DELETE all:0
        EDITNAME all:0
        EDITTRAIT all:0
    END ATTR
    BEGIN NETLIST
        SIGNAL XLXN_37
        SIGNAL XLXN_44
        SIGNAL CLK_IN
        SIGNAL CLK_IN_90
        SIGNAL INIT_DONE
        SIGNAL CMD_ACK
        SIGNAL DATA_VALID_IN
        SIGNAL READED_DATA_IN(31:0)
        SIGNAL READ_DATA_OUT(15:0)
        SIGNAL TB_BUFF_DATA_OUT(63:0)
        SIGNAL XLXN_33
        SIGNAL XLXN_34(2:0)
        SIGNAL XLXN_35(25:0)
        SIGNAL XLXN_36(31:0)
        SIGNAL XLXN_38(2:0)
        SIGNAL XLXN_39(25:0)
        SIGNAL TB_BUFF_WRIGHT_OUT
        SIGNAL TB_BUFF_AOUT(25:0)
        SIGNAL XLXN_47
        SIGNAL ar_req
        SIGNAL ar_done
        SIGNAL XLXN_49(31:0)
        SIGNAL SYNC_OUT
        SIGNAL SYNC_CNT(19:0)
        SIGNAL XLXN_66(31:0)
        SIGNAL XLXN_67(31:0)
        SIGNAL ARB_CLK
        SIGNAL SYNC_VALID
        SIGNAL CMD_OUT(2:0)
        SIGNAL ADDR_OUT(25:0)
        SIGNAL WRITE_DATA_OUT(31:0)
        SIGNAL BURST_DONE_OUT
        SIGNAL XLXN_42
        SIGNAL WRITE_IN
        SIGNAL WRITE_DATA_IN(15:0)
        SIGNAL ADDR_IN(25:0)
        SIGNAL EXT_CLK
        SIGNAL ARB_SEL
        SIGNAL XLXN_249
        SIGNAL XLXN_250
        SIGNAL XLXN_252(1:0)
        SIGNAL XLXN_253
        SIGNAL XLXN_254
        PORT Input CLK_IN
        PORT Input CLK_IN_90
        PORT Input INIT_DONE
        PORT Input CMD_ACK
        PORT Input DATA_VALID_IN
        PORT Input READED_DATA_IN(31:0)
        PORT Output READ_DATA_OUT(15:0)
        PORT Input ar_req
        PORT Input ar_done
        PORT Output SYNC_OUT
        PORT Output ARB_CLK
        PORT Output CMD_OUT(2:0)
        PORT Output ADDR_OUT(25:0)
        PORT Output WRITE_DATA_OUT(31:0)
        PORT Output BURST_DONE_OUT
        PORT Input WRITE_IN
        PORT Input WRITE_DATA_IN(15:0)
        PORT Input ADDR_IN(25:0)
        PORT Input EXT_CLK
        PORT Output ARB_SEL
        BEGIN BLOCKDEF BUFF
            TIMESTAMP 2009 12 2 6 33 7
            LINE N 400 688 464 688 
            LINE N 400 64 464 64 
            LINE N 64 -224 0 -224 
            RECTANGLE N 0 -108 64 -84 
            LINE N 64 -96 0 -96 
            RECTANGLE N 0 -44 64 -20 
            LINE N 64 -32 0 -32 
            LINE N 400 -224 464 -224 
            RECTANGLE N 400 -140 464 -116 
            LINE N 400 -128 464 -128 
            RECTANGLE N 400 -44 464 -20 
            LINE N 400 -32 464 -32 
            RECTANGLE N 400 212 464 236 
            LINE N 400 224 464 224 
            RECTANGLE N 400 308 464 332 
            LINE N 400 320 464 320 
            RECTANGLE N 400 116 464 140 
            LINE N 400 128 464 128 
            LINE N 64 400 0 400 
            LINE N 400 400 464 400 
            LINE N 64 -160 0 -160 
            RECTANGLE N 64 -256 400 732 
            RECTANGLE N 400 516 464 540 
            LINE N 400 528 464 528 
        END BLOCKDEF
        BEGIN BLOCKDEF Write_Controler
            TIMESTAMP 2009 5 14 2 23 25
            LINE N 64 96 0 96 
            LINE N 400 32 464 32 
            LINE N 64 -416 0 -416 
            LINE N 64 -352 0 -352 
            LINE N 64 -288 0 -288 
            LINE N 64 -224 0 -224 
            LINE N 64 -160 0 -160 
            RECTANGLE N 0 -108 64 -84 
            LINE N 64 -96 0 -96 
            RECTANGLE N 0 -44 64 -20 
            LINE N 64 -32 0 -32 
            LINE N 400 -416 464 -416 
            RECTANGLE N 400 -332 464 -308 
            LINE N 400 -320 464 -320 
            RECTANGLE N 400 -252 464 -228 
            LINE N 400 -240 464 -240 
            RECTANGLE N 400 -172 464 -148 
            LINE N 400 -160 464 -160 
            LINE N 64 32 0 32 
            RECTANGLE N 64 -448 400 192 
        END BLOCKDEF
        BEGIN BLOCKDEF Read_Controler
            TIMESTAMP 2008 10 20 8 9 49
            LINE N 64 480 0 480 
            LINE N 64 352 0 352 
            LINE N 64 224 0 224 
            LINE N 64 96 0 96 
            LINE N 416 32 480 32 
            LINE N 64 -480 0 -480 
            LINE N 64 -352 0 -352 
            LINE N 64 -288 0 -288 
            LINE N 64 -224 0 -224 
            LINE N 64 -160 0 -160 
            RECTANGLE N 0 -44 64 -20 
            LINE N 64 -32 0 -32 
            RECTANGLE N 416 -348 480 -324 
            LINE N 416 -336 480 -336 
            RECTANGLE N 416 -204 480 -180 
            LINE N 416 -192 480 -192 
            RECTANGLE N 416 -76 480 -52 
            LINE N 416 -64 480 -64 
            LINE N 416 -480 480 -480 
            RECTANGLE N 0 564 64 588 
            LINE N 64 576 0 576 
            RECTANGLE N 416 116 480 140 
            LINE N 416 128 480 128 
            RECTANGLE N 64 -512 416 644 
            LINE N 416 224 480 224 
        END BLOCKDEF
        BEGIN BLOCKDEF RW_SELECTER
            TIMESTAMP 2008 6 11 2 49 40
            LINE N 512 32 576 32 
            LINE N 64 -480 0 -480 
            LINE N 64 -416 0 -416 
            RECTANGLE N 512 -492 576 -468 
            LINE N 512 -480 576 -480 
            RECTANGLE N 512 -268 576 -244 
            LINE N 512 -256 576 -256 
            RECTANGLE N 512 -44 576 -20 
            LINE N 512 -32 576 -32 
            RECTANGLE N 64 -512 512 128 
            RECTANGLE N 0 -300 64 -276 
            LINE N 64 -288 0 -288 
            RECTANGLE N 0 -236 64 -212 
            LINE N 64 -224 0 -224 
            RECTANGLE N 0 -172 64 -148 
            LINE N 64 -160 0 -160 
            LINE N 64 -352 0 -352 
            RECTANGLE N 0 -44 64 -20 
            LINE N 64 -32 0 -32 
            RECTANGLE N 0 20 64 44 
            LINE N 64 32 0 32 
            RECTANGLE N 0 84 64 108 
            LINE N 64 96 0 96 
            LINE N 64 -96 0 -96 
        END BLOCKDEF
        BEGIN BLOCKDEF SYNC
            TIMESTAMP 2008 10 28 2 0 3
            RECTANGLE N 0 20 64 44 
            LINE N 64 32 0 32 
            RECTANGLE N 0 84 64 108 
            LINE N 64 96 0 96 
            RECTANGLE N 0 -108 64 -84 
            LINE N 64 -96 0 -96 
            RECTANGLE N 0 -44 64 -20 
            LINE N 64 -32 0 -32 
            LINE N 448 -224 512 -224 
            LINE N 64 -224 0 -224 
            RECTANGLE N 64 -256 448 212 
            LINE N 64 176 0 176 
        END BLOCKDEF
        BEGIN BLOCKDEF bufg
            TIMESTAMP 2000 1 1 10 10 10
            LINE N 64 -64 64 0 
            LINE N 128 -32 64 -64 
            LINE N 64 0 128 -32 
            LINE N 224 -32 128 -32 
            LINE N 0 -32 64 -32 
        END BLOCKDEF
        BEGIN BLOCKDEF ARB_CLK_GEN
            TIMESTAMP 2009 12 2 6 41 48
            LINE N 64 -352 0 -352 
            LINE N 64 -288 0 -288 
            LINE N 416 -352 480 -352 
            RECTANGLE N 64 -384 416 -104 
            RECTANGLE N 0 -156 64 -132 
            LINE N 64 -144 0 -144 
        END BLOCKDEF
        BEGIN BLOCK XLXI_2 Write_Controler
            PIN ar_req ar_req
            PIN Write_in TB_BUFF_WRIGHT_OUT
            PIN CLK_in CLK_IN
            PIN CLK_in_90 CLK_IN_90
            PIN Init_done INIT_DONE
            PIN CMD_ack CMD_ACK
            PIN Addr_in(25:0) TB_BUFF_AOUT(25:0)
            PIN Data_in(63:0) TB_BUFF_DATA_OUT(63:0)
            PIN Burst_Done_out XLXN_33
            PIN WRITE_OUT XLXN_44
            PIN CMD_out(2:0) XLXN_34(2:0)
            PIN Data_out(31:0) XLXN_36(31:0)
            PIN Addr_out(25:0) XLXN_35(25:0)
            PIN ar_done ar_done
        END BLOCK
        BEGIN BLOCK XLXI_5 SYNC
            PIN CLK200 ARB_CLK
            PIN ARB_SIZE_IN(31:0) XLXN_49(31:0)
            PIN SYNC_CNT_IN(19:0) SYNC_CNT(19:0)
            PIN START_IN(31:0) XLXN_66(31:0)
            PIN END_IN(31:0) XLXN_67(31:0)
            PIN SYNC_OUT SYNC_OUT
            PIN SYNC_VALID SYNC_VALID
        END BLOCK
        BEGIN BLOCK XLXI_4 RW_SELECTER
            PIN READ_IN XLXN_42
            PIN WRITE_IN XLXN_44
            PIN CMD_OUT(2:0) CMD_OUT(2:0)
            PIN ADDR_OUT(25:0) ADDR_OUT(25:0)
            PIN DATA_OUT(31:0) WRITE_DATA_OUT(31:0)
            PIN BURST_DONE_OUT BURST_DONE_OUT
            PIN CMD_IN_W(2:0) XLXN_34(2:0)
            PIN ADDR_IN_W(25:0) XLXN_35(25:0)
            PIN DATA_IN_W(31:0) XLXN_36(31:0)
            PIN BURST_DONE_W XLXN_33
            PIN CMD_IN_R(2:0) XLXN_38(2:0)
            PIN ADDR_IN_R(25:0) XLXN_39(25:0)
            PIN DATA_IN_R(31:0)
            PIN BURST_DONE_R XLXN_37
        END BLOCK
        BEGIN BLOCK XLXI_3 Read_Controler
            PIN Init_done INIT_DONE
            PIN DCM_200M ARB_CLK
            PIN DAC_ACT XLXN_47
            PIN CLK_in CLK_IN
            PIN CLK_in_90 CLK_IN_90
            PIN CMD_ACK_in CMD_ACK
            PIN ar_req ar_req
            PIN ar_done ar_done
            PIN Data_valid_in DATA_VALID_IN
            PIN Readed_data_in(31:0) READED_DATA_IN(31:0)
            PIN ARB_SIZE32_IN(31:0) XLXN_49(31:0)
            PIN Burst_done_out XLXN_37
            PIN READ_OUT XLXN_42
            PIN CMD_out(2:0) XLXN_38(2:0)
            PIN Addr_out(25:0) XLXN_39(25:0)
            PIN Data_out(15:0) READ_DATA_OUT(15:0)
            PIN SYNC_CNT_OUT(19:0) SYNC_CNT(19:0)
            PIN SYNC_VAILD SYNC_VALID
        END BLOCK
        BEGIN BLOCK XLXI_1 BUFF
            PIN CLK_DDS_IN EXT_CLK
            PIN CLK133 CLK_IN
            PIN Write_in WRITE_IN
            PIN Addr_in(25:0) ADDR_IN(25:0)
            PIN Data_in(15:0) WRITE_DATA_IN(15:0)
            PIN Write_enable_out TB_BUFF_WRIGHT_OUT
            PIN DAC0_ACT XLXN_47
            PIN DCM_RESET XLXN_249
            PIN ARB_SEL ARB_SEL
            PIN Addr_out(25:0) TB_BUFF_AOUT(25:0)
            PIN Data_out(63:0) TB_BUFF_DATA_OUT(63:0)
            PIN ARB_SIZE_OUT(31:0) XLXN_49(31:0)
            PIN SYNC_START(31:0) XLXN_66(31:0)
            PIN SYNC_END(31:0) XLXN_67(31:0)
            PIN ARB_CLK_S(1:0) XLXN_252(1:0)
        END BLOCK
        BEGIN BLOCK XLXI_130 bufg
            PIN I XLXN_253
            PIN O ARB_CLK
        END BLOCK
        BEGIN BLOCK XLXI_182 ARB_CLK_GEN
            PIN AD9834_CLK EXT_CLK
            PIN DCM_RESET XLXN_249
            PIN S(1:0) XLXN_252(1:0)
            PIN ARB_CLK_OUT XLXN_253
        END BLOCK
    END NETLIST
    BEGIN SHEET 1 3520 2720
        BEGIN INSTANCE XLXI_2 1296 544 R0
        END INSTANCE
        BEGIN BRANCH CLK_IN
            WIRE 368 1184 368 1344
            WIRE 368 1344 400 1344
            WIRE 368 1184 528 1184
            WIRE 400 192 528 192
            WIRE 528 192 1008 192
            WIRE 1008 192 1296 192
            WIRE 1008 192 1008 1008
            WIRE 1008 1008 1680 1008
            WIRE 528 192 528 1184
        END BRANCH
        BEGIN BRANCH CLK_IN_90
            WIRE 448 256 1072 256
            WIRE 1072 256 1296 256
            WIRE 1072 256 1072 1072
            WIRE 1072 1072 1680 1072
        END BRANCH
        BEGIN BRANCH INIT_DONE
            WIRE 400 320 1104 320
            WIRE 1104 320 1296 320
            WIRE 1104 320 1104 880
            WIRE 1104 880 1680 880
        END BRANCH
        BEGIN BRANCH CMD_ACK
            WIRE 400 384 1136 384
            WIRE 1136 384 1296 384
            WIRE 1136 384 1136 1136
            WIRE 1136 1136 1680 1136
        END BRANCH
        BEGIN BRANCH DATA_VALID_IN
            WIRE 416 448 1024 448
            WIRE 1024 448 1024 1200
            WIRE 1024 1200 1680 1200
        END BRANCH
        BEGIN BRANCH READED_DATA_IN(31:0)
            WIRE 432 576 1088 576
            WIRE 1088 576 1088 1328
            WIRE 1088 1328 1680 1328
        END BRANCH
        BEGIN BRANCH READ_DATA_OUT(15:0)
            WIRE 432 640 512 640
            WIRE 512 640 512 832
            WIRE 512 832 2224 832
            WIRE 2224 832 2224 1296
            WIRE 2160 1296 2224 1296
        END BRANCH
        BEGIN BRANCH TB_BUFF_DATA_OUT(63:0)
            WIRE 864 1472 1040 1472
            WIRE 1040 512 1040 1472
            WIRE 1040 512 1296 512
        END BRANCH
        BEGIN BRANCH XLXN_33
            WIRE 1760 128 2192 128
            WIRE 2192 128 2192 624
            WIRE 2192 624 2608 624
        END BRANCH
        BEGIN BRANCH XLXN_34(2:0)
            WIRE 1760 224 2176 224
            WIRE 2176 224 2176 688
            WIRE 2176 688 2608 688
        END BRANCH
        BEGIN BRANCH XLXN_35(25:0)
            WIRE 1760 304 2160 304
            WIRE 2160 304 2160 752
            WIRE 2160 752 2608 752
        END BRANCH
        BEGIN BRANCH XLXN_36(31:0)
            WIRE 1760 384 2144 384
            WIRE 2144 384 2144 816
            WIRE 2144 816 2608 816
        END BRANCH
        BEGIN BRANCH XLXN_38(2:0)
            WIRE 2160 1024 2368 1024
            WIRE 2368 944 2368 1024
            WIRE 2368 944 2608 944
        END BRANCH
        BEGIN BRANCH XLXN_39(25:0)
            WIRE 2160 1168 2592 1168
            WIRE 2592 1008 2608 1008
            WIRE 2592 1008 2592 1168
        END BRANCH
        BEGIN BRANCH TB_BUFF_WRIGHT_OUT
            WIRE 864 1280 928 1280
            WIRE 928 128 928 1280
            WIRE 928 128 1296 128
        END BRANCH
        BEGIN BRANCH TB_BUFF_AOUT(25:0)
            WIRE 864 1376 1056 1376
            WIRE 1056 448 1056 1376
            WIRE 1056 448 1296 448
        END BRANCH
        BEGIN BRANCH XLXN_47
            WIRE 864 1568 1664 1568
            WIRE 1664 1456 1680 1456
            WIRE 1664 1456 1664 1568
        END BRANCH
        BEGIN BRANCH ar_req
            WIRE 432 768 992 768
            WIRE 992 768 1280 768
            WIRE 992 768 992 1712
            WIRE 992 1712 1680 1712
            WIRE 1280 576 1280 768
            WIRE 1280 576 1296 576
        END BRANCH
        BEGIN BRANCH ar_done
            WIRE 448 816 1120 816
            WIRE 1120 816 1120 1840
            WIRE 1120 1840 1680 1840
            WIRE 1120 640 1296 640
            WIRE 1120 640 1120 816
        END BRANCH
        BEGIN BRANCH XLXN_49(31:0)
            WIRE 864 1632 1072 1632
            WIRE 1072 1632 1072 1936
            WIRE 1072 1936 1072 2064
            WIRE 1072 2064 1856 2064
            WIRE 1072 1936 1680 1936
            WIRE 1856 1920 1856 2064
            WIRE 1856 1920 2512 1920
        END BRANCH
        BEGIN BRANCH SYNC_OUT
            WIRE 3024 1792 3168 1792
        END BRANCH
        BEGIN BRANCH SYNC_CNT(19:0)
            WIRE 2160 1488 2496 1488
            WIRE 2496 1488 2496 1984
            WIRE 2496 1984 2512 1984
        END BRANCH
        BEGIN BRANCH XLXN_66(31:0)
            WIRE 864 1728 1664 1728
            WIRE 1664 1728 1664 2048
            WIRE 1664 2048 2512 2048
        END BRANCH
        BEGIN BRANCH XLXN_67(31:0)
            WIRE 864 1824 1648 1824
            WIRE 1648 1824 1648 2112
            WIRE 1648 2112 2512 2112
        END BRANCH
        BEGIN BRANCH ARB_CLK
            WIRE 1232 800 1232 1584
            WIRE 1232 1584 1232 2080
            WIRE 1232 2080 1840 2080
            WIRE 1232 1584 1680 1584
            WIRE 1232 800 2192 800
            WIRE 2192 800 2192 1264
            WIRE 2192 1264 2304 1264
            WIRE 2304 1264 2304 2320
            WIRE 2304 1264 3184 1264
            WIRE 1840 1792 1840 2080
            WIRE 1840 1792 2512 1792
            WIRE 2224 2320 2304 2320
        END BRANCH
        BEGIN BRANCH SYNC_VALID
            WIRE 2160 1584 2320 1584
            WIRE 2320 1584 2320 2192
            WIRE 2320 2192 2512 2192
        END BRANCH
        BEGIN INSTANCE XLXI_5 2512 2016 R0
        END INSTANCE
        BEGIN BRANCH XLXN_37
            WIRE 2160 880 2608 880
        END BRANCH
        BEGIN INSTANCE XLXI_4 2608 976 R0
        END INSTANCE
        BEGIN BRANCH CMD_OUT(2:0)
            WIRE 3184 496 3216 496
        END BRANCH
        BEGIN BRANCH ADDR_OUT(25:0)
            WIRE 3184 720 3216 720
        END BRANCH
        BEGIN BRANCH WRITE_DATA_OUT(31:0)
            WIRE 3184 944 3216 944
        END BRANCH
        BEGIN BRANCH BURST_DONE_OUT
            WIRE 3184 1008 3216 1008
        END BRANCH
        BEGIN BRANCH XLXN_44
            WIRE 1760 576 1776 576
            WIRE 1776 560 2608 560
            WIRE 1776 560 1776 576
        END BRANCH
        BEGIN INSTANCE XLXI_3 1680 1360 R0
        END INSTANCE
        BEGIN BRANCH XLXN_42
            WIRE 2160 1392 2208 1392
            WIRE 2208 864 2208 1392
            WIRE 2208 864 2592 864
            WIRE 2592 496 2608 496
            WIRE 2592 496 2592 864
        END BRANCH
        IOMARKER 400 192 CLK_IN R180 28
        IOMARKER 448 256 CLK_IN_90 R180 28
        IOMARKER 400 320 INIT_DONE R180 28
        IOMARKER 400 384 CMD_ACK R180 28
        IOMARKER 416 448 DATA_VALID_IN R180 28
        IOMARKER 432 576 READED_DATA_IN(31:0) R180 28
        IOMARKER 432 640 READ_DATA_OUT(15:0) R180 28
        IOMARKER 432 768 ar_req R180 28
        IOMARKER 448 816 ar_done R180 28
        IOMARKER 3168 1792 SYNC_OUT R0 28
        IOMARKER 3216 496 CMD_OUT(2:0) R0 28
        IOMARKER 3216 720 ADDR_OUT(25:0) R0 28
        IOMARKER 3216 944 WRITE_DATA_OUT(31:0) R0 28
        IOMARKER 3216 1008 BURST_DONE_OUT R0 28
        BEGIN BRANCH WRITE_IN
            WIRE 336 1280 400 1280
        END BRANCH
        BEGIN BRANCH WRITE_DATA_IN(15:0)
            WIRE 304 1472 400 1472
        END BRANCH
        BEGIN BRANCH ADDR_IN(25:0)
            WIRE 304 1408 400 1408
        END BRANCH
        BEGIN INSTANCE XLXI_1 400 1504 R0
        END INSTANCE
        IOMARKER 336 1280 WRITE_IN R180 28
        IOMARKER 304 1472 WRITE_DATA_IN(15:0) R180 28
        IOMARKER 304 1408 ADDR_IN(25:0) R180 28
        BEGIN BRANCH EXT_CLK
            WIRE 160 2400 352 2400
            WIRE 352 1904 400 1904
            WIRE 352 1904 352 2384
            WIRE 352 2384 352 2400
            WIRE 352 2384 928 2384
            WIRE 928 2320 1488 2320
            WIRE 928 2320 928 2384
        END BRANCH
        BEGIN BRANCH ARB_SEL
            WIRE 864 2192 896 2192
        END BRANCH
        IOMARKER 896 2192 ARB_SEL R0 28
        IOMARKER 160 2400 EXT_CLK R180 28
        BEGIN BRANCH XLXN_249
            WIRE 864 1904 1168 1904
            WIRE 1168 1904 1168 2384
            WIRE 1168 2384 1488 2384
        END BRANCH
        BEGIN BRANCH XLXN_252(1:0)
            WIRE 864 2032 1152 2032
            WIRE 1152 2032 1152 2528
            WIRE 1152 2528 1488 2528
        END BRANCH
        BEGIN BRANCH XLXN_253
            WIRE 1968 2320 2000 2320
        END BRANCH
        INSTANCE XLXI_130 2000 2352 R0
        IOMARKER 3184 1264 ARB_CLK R0 28
        BEGIN INSTANCE XLXI_182 1488 2672 R0
        END INSTANCE
    END SHEET
END SCHEMATIC
