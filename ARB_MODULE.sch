VERSION 6
BEGIN SCHEMATIC
    BEGIN ATTR DeviceFamilyName "spartan3a"
        DELETE all:0
        EDITNAME all:0
        EDITTRAIT all:0
    END ATTR
    BEGIN NETLIST
        SIGNAL CLK_in
        SIGNAL vvv
        SIGNAL cntrl0_rst_dqs_div_in
        SIGNAL XLXN_299(25:0)
        SIGNAL cntrl0_burst_done
        SIGNAL XLXN_301(31:0)
        SIGNAL TB_MIG_CMD(2:0)
        SIGNAL XLXN_308
        SIGNAL XLXN_309
        SIGNAL TB_USER_OUTPUT_DATA(31:0)
        SIGNAL cntrl0_ddr2_cke
        SIGNAL cntrl0_ddr2_cs_n
        SIGNAL cntrl0_ddr2_ras_n
        SIGNAL cntrl0_ddr2_cas_n
        SIGNAL cntrl0_ddr2_we_n
        SIGNAL cntrl0_ddr2_odt
        SIGNAL cntrl0_rst_dqs_div_out
        SIGNAL cntrl0_ar_done
        SIGNAL cntrl0_auto_ref_req
        SIGNAL cntrl0_ddr2_a(12:0)
        SIGNAL cntrl0_ddr2_ba(1:0)
        SIGNAL cntrl0_ddr2_dm(1:0)
        SIGNAL cntrl0_ddr2_ck
        SIGNAL cntrl0_ddr2_ck_n
        SIGNAL cntrl0_ddr2_dqs(1:0)
        SIGNAL cntrl0_ddr2_dqs_n(1:0)
        SIGNAL XLXN_333(2:0)
        SIGNAL CLK_TB
        SIGNAL XLXN_339
        SIGNAL INIT_DONE_TB
        SIGNAL cntrl0_ddr2_dq(15:0)
        SIGNAL XLXN_342(3:0)
        SIGNAL XLXN_342(0)
        SIGNAL XLXN_342(2)
        SIGNAL XLXN_342(3)
        SIGNAL XLXN_342(1)
        SIGNAL XLXN_351
        SIGNAL XLXN_352
        SIGNAL XLXN_350
        SIGNAL XLXN_354
        SIGNAL XLXN_355
        SIGNAL DAC_DATA(15:0)
        SIGNAL sync
        SIGNAL DCM_LOCK
        SIGNAL EXT_CLK_IN
        SIGNAL ARB_CLK
        SIGNAL ARB_SELECTED
        SIGNAL write
        SIGNAL Addr_in(25:0)
        SIGNAL CS
        SIGNAL DataBus(15:0)
        SIGNAL XLXN_385(25:0)
        SIGNAL XLXN_386(15:0)
        SIGNAL XLXN_387
        SIGNAL CLK90_TB
        PORT Input CLK_in
        PORT Input cntrl0_rst_dqs_div_in
        PORT Output cntrl0_ddr2_cke
        PORT Output cntrl0_ddr2_cs_n
        PORT Output cntrl0_ddr2_ras_n
        PORT Output cntrl0_ddr2_cas_n
        PORT Output cntrl0_ddr2_we_n
        PORT Output cntrl0_ddr2_odt
        PORT Output cntrl0_rst_dqs_div_out
        PORT Output cntrl0_auto_ref_req
        PORT Output cntrl0_ddr2_a(12:0)
        PORT Output cntrl0_ddr2_ba(1:0)
        PORT Output cntrl0_ddr2_dm(1:0)
        PORT Output cntrl0_ddr2_ck
        PORT Output cntrl0_ddr2_ck_n
        PORT BiDirectional cntrl0_ddr2_dqs(1:0)
        PORT BiDirectional cntrl0_ddr2_dqs_n(1:0)
        PORT Output CLK_TB
        PORT Output INIT_DONE_TB
        PORT BiDirectional cntrl0_ddr2_dq(15:0)
        PORT Output DAC_DATA(15:0)
        PORT Output sync
        PORT Input EXT_CLK_IN
        PORT Output ARB_CLK
        PORT Output ARB_SELECTED
        PORT Input write
        PORT Input Addr_in(25:0)
        PORT Input CS
        PORT Input DataBus(15:0)
        PORT Output CLK90_TB
        BEGIN BLOCKDEF mig20
            TIMESTAMP 2008 5 27 6 6 54
            RECTANGLE N 64 -1664 720 0 
            LINE N 64 -1632 0 -1632 
            LINE N 64 -1456 0 -1456 
            LINE N 64 -1280 0 -1280 
            LINE N 64 -1104 0 -1104 
            LINE N 64 -928 0 -928 
            LINE N 64 -752 0 -752 
            RECTANGLE N 0 -588 64 -564 
            LINE N 64 -576 0 -576 
            RECTANGLE N 0 -412 64 -388 
            LINE N 64 -400 0 -400 
            RECTANGLE N 0 -236 64 -212 
            LINE N 64 -224 0 -224 
            RECTANGLE N 0 -60 64 -36 
            LINE N 64 -48 0 -48 
            LINE N 720 -1632 784 -1632 
            LINE N 720 -1568 784 -1568 
            LINE N 720 -1504 784 -1504 
            LINE N 720 -1440 784 -1440 
            LINE N 720 -1376 784 -1376 
            LINE N 720 -1312 784 -1312 
            LINE N 720 -1248 784 -1248 
            LINE N 720 -1184 784 -1184 
            LINE N 720 -1120 784 -1120 
            LINE N 720 -1056 784 -1056 
            LINE N 720 -992 784 -992 
            LINE N 720 -928 784 -928 
            LINE N 720 -864 784 -864 
            LINE N 720 -800 784 -800 
            LINE N 720 -736 784 -736 
            LINE N 720 -672 784 -672 
            LINE N 720 -608 784 -608 
            RECTANGLE N 720 -556 784 -532 
            LINE N 720 -544 784 -544 
            RECTANGLE N 720 -492 784 -468 
            LINE N 720 -480 784 -480 
            RECTANGLE N 720 -428 784 -404 
            LINE N 720 -416 784 -416 
            RECTANGLE N 720 -364 784 -340 
            LINE N 720 -352 784 -352 
            RECTANGLE N 720 -300 784 -276 
            LINE N 720 -288 784 -288 
            RECTANGLE N 720 -236 784 -212 
            LINE N 720 -224 784 -224 
            RECTANGLE N 720 -172 784 -148 
            LINE N 720 -160 784 -160 
            RECTANGLE N 720 -108 784 -84 
            LINE N 720 -96 784 -96 
            RECTANGLE N 720 -44 784 -20 
            LINE N 720 -32 784 -32 
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
        BEGIN BLOCKDEF InitialDDR2
            TIMESTAMP 2008 7 7 11 21 20
            RECTANGLE N 0 84 64 108 
            LINE N 64 96 0 96 
            LINE N 64 -96 0 -96 
            LINE N 64 0 0 0 
            LINE N 64 -48 0 -48 
            RECTANGLE N 368 -28 432 -4 
            LINE N 368 -16 432 -16 
            RECTANGLE N 64 -128 368 120 
        END BLOCKDEF
        BEGIN BLOCKDEF DDR2_16_TO_64_RW
            TIMESTAMP 2009 12 2 6 33 36
            LINE N 64 176 0 176 
            LINE N 64 112 0 112 
            LINE N 64 -608 0 -608 
            LINE N 64 -544 0 -544 
            LINE N 64 -480 0 -480 
            LINE N 64 -416 0 -416 
            LINE N 64 -352 0 -352 
            RECTANGLE N 0 -236 64 -212 
            LINE N 64 -224 0 -224 
            LINE N 64 -160 0 -160 
            RECTANGLE N 0 -108 64 -84 
            LINE N 64 -96 0 -96 
            RECTANGLE N 656 -620 720 -596 
            LINE N 656 -608 720 -608 
            RECTANGLE N 656 -476 720 -452 
            LINE N 656 -464 720 -464 
            RECTANGLE N 656 -332 720 -308 
            LINE N 656 -320 720 -320 
            RECTANGLE N 0 -28 64 -4 
            LINE N 64 -16 0 -16 
            RECTANGLE N 656 -28 720 -4 
            LINE N 656 -16 720 -16 
            LINE N 656 -160 720 -160 
            LINE N 656 128 720 128 
            RECTANGLE N 64 -640 656 372 
            LINE N 656 288 720 288 
            LINE N 656 224 720 224 
            LINE N 64 320 0 320 
        END BLOCKDEF
        BEGIN BLOCKDEF bufg
            TIMESTAMP 2000 1 1 10 10 10
            LINE N 64 -64 64 0 
            LINE N 128 -32 64 -64 
            LINE N 64 0 128 -32 
            LINE N 224 -32 128 -32 
            LINE N 0 -32 64 -32 
        END BLOCKDEF
        BEGIN BLOCKDEF or3
            TIMESTAMP 2000 1 1 10 10 10
            LINE N 0 -64 48 -64 
            LINE N 0 -128 72 -128 
            LINE N 0 -192 48 -192 
            LINE N 256 -128 192 -128 
            ARC N 28 -256 204 -80 112 -80 192 -128 
            ARC N -40 -184 72 -72 48 -80 48 -176 
            LINE N 48 -64 48 -80 
            LINE N 48 -192 48 -176 
            LINE N 112 -80 48 -80 
            ARC N 28 -176 204 0 192 -128 112 -176 
            LINE N 112 -176 48 -176 
        END BLOCKDEF
        BEGIN BLOCKDEF inv
            TIMESTAMP 2000 1 1 10 10 10
            LINE N 0 -32 64 -32 
            LINE N 224 -32 160 -32 
            LINE N 64 -64 128 -32 
            LINE N 128 -32 64 0 
            LINE N 64 0 64 -64 
            CIRCLE N 128 -48 160 -16 
        END BLOCKDEF
        BEGIN BLOCKDEF vcc
            TIMESTAMP 2000 1 1 10 10 10
            LINE N 64 -32 64 -64 
            LINE N 64 0 64 -32 
            LINE N 96 -64 32 -64 
        END BLOCKDEF
        BEGIN BLOCKDEF DCM0
            TIMESTAMP 2008 10 8 5 54 19
            RECTANGLE N 64 -256 320 0 
            LINE N 64 -224 0 -224 
            LINE N 320 -224 384 -224 
            LINE N 320 -176 384 -176 
            LINE N 320 -128 384 -128 
        END BLOCKDEF
        BEGIN BLOCKDEF V1
            TIMESTAMP 2009 12 1 3 53 2
            RECTANGLE N 384 -172 448 -148 
            LINE N 384 -160 448 -160 
            RECTANGLE N 0 -172 64 -148 
            LINE N 64 -160 0 -160 
            RECTANGLE N 0 36 64 60 
            LINE N 384 -16 448 -16 
            RECTANGLE N 64 -192 384 88 
            LINE N 64 -96 0 -96 
            LINE N 64 -32 0 -32 
            LINE N 0 48 64 48 
            RECTANGLE N 384 -108 448 -84 
            LINE N 384 -96 448 -96 
        END BLOCKDEF
        BEGIN BLOCK MIG_20 mig20
            PIN cntrl0_rst_dqs_div_in cntrl0_rst_dqs_div_in
            PIN reset_in_n vvv
            PIN cntrl0_burst_done cntrl0_burst_done
            PIN clk_int CLK_TB
            PIN clk90_int CLK90_TB
            PIN dcm_lock DCM_LOCK
            PIN cntrl0_user_command_register(2:0) TB_MIG_CMD(2:0)
            PIN cntrl0_user_input_data(31:0) XLXN_301(31:0)
            PIN cntrl0_user_data_mask(3:0) XLXN_342(3:0)
            PIN cntrl0_user_input_address(25:0) XLXN_299(25:0)
            PIN cntrl0_ddr2_cke cntrl0_ddr2_cke
            PIN cntrl0_ddr2_cs_n cntrl0_ddr2_cs_n
            PIN cntrl0_ddr2_ras_n cntrl0_ddr2_ras_n
            PIN cntrl0_ddr2_cas_n cntrl0_ddr2_cas_n
            PIN cntrl0_ddr2_we_n cntrl0_ddr2_we_n
            PIN cntrl0_ddr2_odt cntrl0_ddr2_odt
            PIN cntrl0_rst_dqs_div_out cntrl0_rst_dqs_div_out
            PIN cntrl0_init_done INIT_DONE_TB
            PIN cntrl0_ar_done cntrl0_ar_done
            PIN cntrl0_user_data_valid XLXN_309
            PIN cntrl0_auto_ref_req cntrl0_auto_ref_req
            PIN cntrl0_user_cmd_ack XLXN_308
            PIN cntrl0_clk_tb
            PIN cntrl0_clk90_tb
            PIN cntrl0_sys_rst_tb XLXN_350
            PIN cntrl0_sys_rst90_tb XLXN_351
            PIN cntrl0_sys_rst180_tb XLXN_352
            PIN cntrl0_ddr2_a(12:0) cntrl0_ddr2_a(12:0)
            PIN cntrl0_ddr2_ba(1:0) cntrl0_ddr2_ba(1:0)
            PIN cntrl0_ddr2_dm(1:0) cntrl0_ddr2_dm(1:0)
            PIN cntrl0_user_output_data(31:0) TB_USER_OUTPUT_DATA(31:0)
            PIN cntrl0_ddr2_ck(0:0) cntrl0_ddr2_ck
            PIN cntrl0_ddr2_ck_n(0:0) cntrl0_ddr2_ck_n
            PIN cntrl0_ddr2_dq(15:0) cntrl0_ddr2_dq(15:0)
            PIN cntrl0_ddr2_dqs(1:0) cntrl0_ddr2_dqs(1:0)
            PIN cntrl0_ddr2_dqs_n(1:0) cntrl0_ddr2_dqs_n(1:0)
        END BLOCK
        BEGIN BLOCK INITIAL_DDR2 InitialDDR2
            PIN CLK_in CLK_TB
            PIN Wait200_done_in XLXN_355
            PIN INIT_DONE_IN INIT_DONE_TB
            PIN CMD_IN(2:0) XLXN_333(2:0)
            PIN CMD_out(2:0) TB_MIG_CMD(2:0)
        END BLOCK
        BEGIN BLOCK XLXI_75 bufg
            PIN I XLXN_339
            PIN O CLK90_TB
        END BLOCK
        BEGIN BLOCK INIT_OR3 or3
            PIN I0 XLXN_352
            PIN I1 XLXN_351
            PIN I2 XLXN_350
            PIN O XLXN_354
        END BLOCK
        BEGIN BLOCK XLXI_96 inv
            PIN I XLXN_354
            PIN O XLXN_355
        END BLOCK
        BEGIN BLOCK XLXI_101 gnd
            PIN G XLXN_342(0)
        END BLOCK
        BEGIN BLOCK XLXI_102 gnd
            PIN G XLXN_342(1)
        END BLOCK
        BEGIN BLOCK XLXI_103 gnd
            PIN G XLXN_342(2)
        END BLOCK
        BEGIN BLOCK XLXI_104 gnd
            PIN G XLXN_342(3)
        END BLOCK
        BEGIN BLOCK XLXI_105 vcc
            PIN P vvv
        END BLOCK
        BEGIN BLOCK DCM_133 DCM0
            PIN CLK_IN CLK_in
            PIN LOCK_OUT DCM_LOCK
            PIN CLK0 CLK_TB
            PIN CLK90 XLXN_339
        END BLOCK
        BEGIN BLOCK DDR2_16_TO_64 DDR2_16_TO_64_RW
            PIN CLK_IN CLK_TB
            PIN CLK_IN_90 CLK90_TB
            PIN INIT_DONE INIT_DONE_TB
            PIN CMD_ACK XLXN_308
            PIN DATA_VALID_IN XLXN_309
            PIN READED_DATA_IN(31:0) TB_USER_OUTPUT_DATA(31:0)
            PIN ar_req cntrl0_auto_ref_req
            PIN ar_done cntrl0_ar_done
            PIN WRITE_IN XLXN_387
            PIN WRITE_DATA_IN(15:0) XLXN_386(15:0)
            PIN ADDR_IN(25:0) XLXN_385(25:0)
            PIN EXT_CLK EXT_CLK_IN
            PIN READ_DATA_OUT(15:0) DAC_DATA(15:0)
            PIN SYNC_OUT sync
            PIN ARB_CLK ARB_CLK
            PIN CMD_OUT(2:0) XLXN_333(2:0)
            PIN ADDR_OUT(25:0) XLXN_299(25:0)
            PIN WRITE_DATA_OUT(31:0) XLXN_301(31:0)
            PIN BURST_DONE_OUT cntrl0_burst_done
            PIN ARB_SEL ARB_SELECTED
        END BLOCK
        BEGIN BLOCK XLXI_109 V1
            PIN CS CS
            PIN Write write
            PIN Addr_in(25:0) Addr_in(25:0)
            PIN DataBus(15:0) DataBus(15:0)
            PIN Write_out XLXN_387
            PIN Addr_out(25:0) XLXN_385(25:0)
            PIN Dout(15:0) XLXN_386(15:0)
        END BLOCK
    END NETLIST
    BEGIN SHEET 1 3520 2720
        BEGIN BRANCH CLK_in
            WIRE 176 48 192 48
        END BRANCH
        IOMARKER 176 48 CLK_in R180 28
        BEGIN INSTANCE MIG_20 2288 2112 R0
        END INSTANCE
        BEGIN BRANCH vvv
            WIRE 2176 656 2288 656
        END BRANCH
        BEGIN INSTANCE INITIAL_DDR2 1632 224 R0
        END INSTANCE
        BEGIN BRANCH cntrl0_rst_dqs_div_in
            WIRE 2256 480 2288 480
        END BRANCH
        IOMARKER 2256 480 cntrl0_rst_dqs_div_in R270 28
        BEGIN BRANCH XLXN_299(25:0)
            WIRE 1680 944 1776 944
            WIRE 1776 944 1776 2064
            WIRE 1776 2064 2288 2064
        END BRANCH
        BEGIN BRANCH cntrl0_burst_done
            WIRE 1680 1104 2000 1104
            WIRE 2000 832 2000 1104
            WIRE 2000 832 2288 832
        END BRANCH
        BEGIN BRANCH XLXN_301(31:0)
            WIRE 1680 1248 1952 1248
            WIRE 1952 1248 1952 1712
            WIRE 1952 1712 2288 1712
        END BRANCH
        BEGIN BRANCH TB_MIG_CMD(2:0)
            WIRE 2016 400 2128 400
            WIRE 2016 400 2016 1536
            WIRE 2016 1536 2288 1536
            WIRE 2064 208 2128 208
            WIRE 2128 208 2128 400
        END BRANCH
        BEGIN BRANCH XLXN_308
            WIRE 880 848 880 2176
            WIRE 880 2176 3136 2176
            WIRE 880 848 960 848
            WIRE 3072 1184 3136 1184
            WIRE 3136 1184 3136 2176
        END BRANCH
        BEGIN BRANCH XLXN_309
            WIRE 912 912 912 2160
            WIRE 912 2160 3120 2160
            WIRE 912 912 960 912
            WIRE 3072 1056 3120 1056
            WIRE 3120 1056 3120 2160
        END BRANCH
        BEGIN BRANCH TB_USER_OUTPUT_DATA(31:0)
            WIRE 896 1040 896 2192
            WIRE 896 2192 3232 2192
            WIRE 896 1040 960 1040
            WIRE 3072 1760 3232 1760
            WIRE 3232 1760 3232 2192
        END BRANCH
        BEGIN BRANCH cntrl0_ddr2_cke
            WIRE 3072 480 3104 480
        END BRANCH
        IOMARKER 3104 480 cntrl0_ddr2_cke R0 28
        BEGIN BRANCH cntrl0_ddr2_cs_n
            WIRE 3072 544 3104 544
        END BRANCH
        IOMARKER 3104 544 cntrl0_ddr2_cs_n R0 28
        BEGIN BRANCH cntrl0_ddr2_ras_n
            WIRE 3072 608 3104 608
        END BRANCH
        IOMARKER 3104 608 cntrl0_ddr2_ras_n R0 28
        BEGIN BRANCH cntrl0_ddr2_cas_n
            WIRE 3072 672 3104 672
        END BRANCH
        IOMARKER 3104 672 cntrl0_ddr2_cas_n R0 28
        BEGIN BRANCH cntrl0_ddr2_we_n
            WIRE 3072 736 3104 736
        END BRANCH
        IOMARKER 3104 736 cntrl0_ddr2_we_n R0 28
        BEGIN BRANCH cntrl0_ddr2_odt
            WIRE 3072 800 3104 800
        END BRANCH
        IOMARKER 3104 800 cntrl0_ddr2_odt R0 28
        BEGIN BRANCH cntrl0_rst_dqs_div_out
            WIRE 3072 864 3104 864
        END BRANCH
        IOMARKER 3104 864 cntrl0_rst_dqs_div_out R0 28
        BEGIN BRANCH cntrl0_ar_done
            WIRE 864 1440 960 1440
            WIRE 864 1440 864 1744
            WIRE 864 1744 2112 1744
            WIRE 2112 16 3088 16
            WIRE 3088 16 3088 944
            WIRE 3088 944 3104 944
            WIRE 3104 944 3104 992
            WIRE 2112 16 2112 1744
            WIRE 3072 992 3104 992
        END BRANCH
        BEGIN BRANCH cntrl0_auto_ref_req
            WIRE 928 1376 960 1376
            WIRE 928 1376 928 2144
            WIRE 928 2144 3088 2144
            WIRE 3072 1120 3152 1120
            WIRE 3152 1120 3184 1120
            WIRE 3152 1120 3152 1168
            WIRE 3088 1168 3088 2144
            WIRE 3088 1168 3152 1168
        END BRANCH
        BEGIN BRANCH cntrl0_ddr2_a(12:0)
            WIRE 3072 1568 3104 1568
        END BRANCH
        IOMARKER 3104 1568 cntrl0_ddr2_a(12:0) R0 28
        BEGIN BRANCH cntrl0_ddr2_ba(1:0)
            WIRE 3072 1632 3104 1632
        END BRANCH
        IOMARKER 3104 1632 cntrl0_ddr2_ba(1:0) R0 28
        BEGIN BRANCH cntrl0_ddr2_dm(1:0)
            WIRE 3072 1696 3104 1696
        END BRANCH
        IOMARKER 3104 1696 cntrl0_ddr2_dm(1:0) R0 28
        BEGIN BRANCH cntrl0_ddr2_ck
            WIRE 3072 1824 3104 1824
        END BRANCH
        IOMARKER 3104 1824 cntrl0_ddr2_ck R0 28
        BEGIN BRANCH cntrl0_ddr2_ck_n
            WIRE 3072 1888 3104 1888
        END BRANCH
        IOMARKER 3104 1888 cntrl0_ddr2_ck_n R0 28
        BEGIN BRANCH cntrl0_ddr2_dqs(1:0)
            WIRE 3072 2016 3104 2016
        END BRANCH
        IOMARKER 3104 2016 cntrl0_ddr2_dqs(1:0) R0 28
        BEGIN BRANCH cntrl0_ddr2_dqs_n(1:0)
            WIRE 3072 2080 3104 2080
        END BRANCH
        IOMARKER 3104 2080 cntrl0_ddr2_dqs_n(1:0) R0 28
        BEGIN BRANCH XLXN_333(2:0)
            WIRE 1552 320 1552 432
            WIRE 1552 432 1712 432
            WIRE 1712 432 1712 800
            WIRE 1552 320 1632 320
            WIRE 1680 800 1712 800
        END BRANCH
        BEGIN BRANCH CLK_TB
            WIRE 576 48 1040 48
            WIRE 1040 48 1040 224
            WIRE 1040 224 1040 576
            WIRE 1040 224 1472 224
            WIRE 1472 224 1632 224
            WIRE 1472 224 1472 384
            WIRE 1472 384 1808 384
            WIRE 1808 384 1808 1008
            WIRE 1808 1008 2288 1008
            WIRE 1040 48 1136 48
            WIRE 912 576 912 656
            WIRE 912 656 960 656
            WIRE 912 576 1040 576
        END BRANCH
        BEGIN BRANCH INIT_DONE_TB
            WIRE 864 592 864 784
            WIRE 864 784 960 784
            WIRE 864 592 1488 592
            WIRE 1488 176 1488 592
            WIRE 1488 176 1584 176
            WIRE 1584 176 1632 176
            WIRE 1584 176 1584 368
            WIRE 1584 368 3136 368
            WIRE 3136 368 3136 928
            WIRE 3136 928 3184 928
            WIRE 3072 928 3136 928
        END BRANCH
        IOMARKER 3296 1952 cntrl0_ddr2_dq(15:0) R0 28
        BEGIN BRANCH cntrl0_ddr2_dq(15:0)
            WIRE 3072 1952 3296 1952
        END BRANCH
        BUSTAP 2000 1792 2000 1888
        BUSTAP 2064 1792 2064 1888
        BUSTAP 2144 1792 2144 1888
        BUSTAP 2224 1792 2224 1888
        BEGIN BRANCH XLXN_342(3:0)
            WIRE 2000 1792 2064 1792
            WIRE 2064 1792 2144 1792
            WIRE 2144 1792 2224 1792
            WIRE 2224 1792 2256 1792
            WIRE 2256 1792 2256 1888
            WIRE 2256 1888 2288 1888
        END BRANCH
        BEGIN BRANCH XLXN_342(0)
            WIRE 1408 1888 2000 1888
        END BRANCH
        BEGIN BRANCH XLXN_342(2)
            WIRE 1584 1936 2144 1936
            WIRE 2144 1888 2144 1936
        END BRANCH
        BEGIN BRANCH XLXN_342(3)
            WIRE 1664 1952 2224 1952
            WIRE 2224 1888 2224 1952
        END BRANCH
        BEGIN BRANCH XLXN_342(1)
            WIRE 1488 1920 2064 1920
            WIRE 2064 1888 2064 1920
        END BRANCH
        INSTANCE INIT_OR3 2960 32 R180
        BEGIN BRANCH XLXN_351
            WIRE 2960 160 3504 160
            WIRE 3504 160 3504 1440
            WIRE 3072 1440 3504 1440
        END BRANCH
        BEGIN BRANCH XLXN_352
            WIRE 2960 96 3488 96
            WIRE 3488 96 3488 1504
            WIRE 3072 1504 3488 1504
        END BRANCH
        BEGIN BRANCH XLXN_350
            WIRE 2960 224 3472 224
            WIRE 3472 224 3472 1376
            WIRE 3072 1376 3472 1376
        END BRANCH
        BEGIN BRANCH XLXN_354
            WIRE 2672 160 2704 160
        END BRANCH
        INSTANCE XLXI_96 2672 128 R180
        BEGIN BRANCH XLXN_355
            WIRE 1568 32 1568 128
            WIRE 1568 128 1632 128
            WIRE 1568 32 2128 32
            WIRE 2128 32 2128 160
            WIRE 2128 160 2448 160
        END BRANCH
        INSTANCE XLXI_101 1344 2016 R0
        INSTANCE XLXI_102 1424 2048 R0
        INSTANCE XLXI_103 1520 2064 R0
        INSTANCE XLXI_104 1600 2080 R0
        IOMARKER 3184 1120 cntrl0_auto_ref_req R0 28
        INSTANCE XLXI_105 2112 656 R0
        BEGIN BRANCH DAC_DATA(15:0)
            WIRE 528 496 1744 496
            WIRE 1744 496 1744 656
            WIRE 1680 656 1744 656
        END BRANCH
        IOMARKER 528 496 DAC_DATA(15:0) R180 28
        BEGIN INSTANCE DCM_133 192 272 R0
        END INSTANCE
        BEGIN INSTANCE DDR2_16_TO_64 960 1264 R0
        END INSTANCE
        BEGIN BRANCH sync
            WIRE 1680 1392 1808 1392
        END BRANCH
        BEGIN BRANCH DCM_LOCK
            WIRE 576 144 656 144
            WIRE 656 144 656 352
            WIRE 656 352 1696 352
            WIRE 1696 352 1696 1360
            WIRE 1696 1360 2288 1360
        END BRANCH
        IOMARKER 1808 1392 sync R0 28
        BEGIN BRANCH EXT_CLK_IN
            WIRE 368 1696 944 1696
            WIRE 944 1584 960 1584
            WIRE 944 1584 944 1696
        END BRANCH
        BEGIN BRANCH ARB_CLK
            WIRE 1680 1488 1696 1488
        END BRANCH
        IOMARKER 1696 1488 ARB_CLK R0 28
        BEGIN BRANCH ARB_SELECTED
            WIRE 1680 1552 1712 1552
        END BRANCH
        IOMARKER 1712 1552 ARB_SELECTED R0 28
        IOMARKER 368 1696 EXT_CLK_IN R180 28
        BEGIN INSTANCE XLXI_109 336 1200 R0
        END INSTANCE
        BEGIN BRANCH write
            WIRE 304 1104 336 1104
        END BRANCH
        IOMARKER 304 1104 write R180 28
        BEGIN BRANCH Addr_in(25:0)
            WIRE 304 1040 336 1040
        END BRANCH
        IOMARKER 304 1040 Addr_in(25:0) R180 28
        BEGIN BRANCH CS
            WIRE 304 1168 336 1168
        END BRANCH
        IOMARKER 304 1168 CS R180 28
        BEGIN BRANCH DataBus(15:0)
            WIRE 304 1248 336 1248
        END BRANCH
        IOMARKER 304 1248 DataBus(15:0) R180 28
        BEGIN BRANCH XLXN_385(25:0)
            WIRE 784 1040 864 1040
            WIRE 864 1040 864 1168
            WIRE 864 1168 960 1168
        END BRANCH
        BEGIN BRANCH XLXN_386(15:0)
            WIRE 784 1104 848 1104
            WIRE 848 1104 848 1248
            WIRE 848 1248 960 1248
        END BRANCH
        BEGIN BRANCH XLXN_387
            WIRE 784 1184 928 1184
            WIRE 928 1104 928 1184
            WIRE 928 1104 960 1104
        END BRANCH
        IOMARKER 3184 928 INIT_DONE_TB R0 28
        BEGIN BRANCH CLK90_TB
            WIRE 944 608 944 720
            WIRE 944 720 960 720
            WIRE 944 608 1424 608
            WIRE 1056 176 1424 176
            WIRE 1424 176 1424 400
            WIRE 1424 400 1728 400
            WIRE 1728 400 1728 1184
            WIRE 1728 1184 2288 1184
            WIRE 1424 400 1424 608
            WIRE 1248 96 1280 96
            WIRE 1248 96 1248 128
            WIRE 1248 128 1424 128
            WIRE 1424 128 1424 176
        END BRANCH
        IOMARKER 1136 48 CLK_TB R0 28
        IOMARKER 1280 96 CLK90_TB R0 28
        INSTANCE XLXI_75 832 208 R0
        BEGIN BRANCH XLXN_339
            WIRE 576 96 704 96
            WIRE 704 96 704 176
            WIRE 704 176 832 176
        END BRANCH
    END SHEET
END SCHEMATIC
