onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -format Literal -radix hexadecimal /TB/DA9747_Data
add wave -noupdate -format Logic /TB/DA9747_CLKP
add wave -noupdate -format Logic /TB/DA9747_CLKN
add wave -noupdate -format Logic /TB/AD9224_CLK
add wave -noupdate -format Logic /TB/Trigout_Pin
add wave -noupdate -format Logic /TB/SYNC_OUT
add wave -noupdate -format Logic /TB/NWE
add wave -noupdate -format Logic /TB/NCS
add wave -noupdate -format Literal -radix hexadecimal {/TB/CPU_Data$inout$reg}
add wave -noupdate -format Literal -radix hexadecimal /TB/CPU_Data
add wave -noupdate -format Literal -radix hexadecimal /TB/CPU_Addr
add wave -noupdate -format Logic /TB/EXT_MODU_SIN
add wave -noupdate -format Literal /TB/AD9224_IN
add wave -noupdate -format Logic /TB/Clock
add wave -noupdate -format Logic /TB/Reset
add wave -noupdate -format Literal /TB/AM_DA9747_Data
add wave -noupdate -format Literal /TB/Relay_Ctrl_Words
add wave -noupdate -format Literal /TB/DAC7821_Data
add wave -noupdate -format Logic /TB/OUT_PROTECT
add wave -noupdate -format Logic /TB/MODWAVE_CSbar
add wave -noupdate -format Logic /TB/MODWAVE_RWbar
add wave -noupdate -format Literal /TB/MOD_SOUT_SEL
add wave -noupdate -divider -height 50 {New Divider}
add wave -noupdate -color Gold -format Literal -itemcolor Gold -radix hexadecimal /TB/UUT/DAC_OFFSET_VU
add wave -noupdate -color Gold -format Literal -itemcolor Gold -radix hexadecimal /TB/UUT/DAC_DUTYS_VU
add wave -noupdate -color Gold -format Literal -itemcolor Gold -radix hexadecimal /TB/UUT/DAC_GAINV_VU
add wave -noupdate -color Gold -format Literal -itemcolor Gold -radix hexadecimal /TB/UUT/DAC7821_SQ_VL
add wave -noupdate -color Gold -format Literal -itemcolor Gold -radix hexadecimal /TB/UUT/DAC7821_SQ_VT
add wave -noupdate -color Gold -format Literal -itemcolor Gold -radix hexadecimal /TB/UUT/DAC7821_Spare
add wave -noupdate -color Magenta -format Literal -itemcolor Magenta -radix hexadecimal /TB/UUT/\\CVG_DAC7821_Signals_Group/DAC7821_CRTL_VOL/Scan_Judge\\
add wave -noupdate -color {Slate Blue} -format Literal -itemcolor {Slate Blue} -radix hexadecimal /TB/CVG_DAC7821_Data
add wave -noupdate -color {Slate Blue} -format Logic -itemcolor {Slate Blue} -radix hexadecimal /TB/CVG_DAC7821_RWbar
add wave -noupdate -color {Slate Blue} -format Logic -itemcolor {Slate Blue} -radix hexadecimal /TB/CVG_DAC7821_CSbar
add wave -noupdate -color {Slate Blue} -format Literal -itemcolor {Slate Blue} -radix hexadecimal /TB/HC4051_SELs
add wave -noupdate -divider -height 50 {New Divider}
add wave -noupdate -format Literal /TB/DDR2_A
add wave -noupdate -format Literal /TB/DDR2_BA
add wave -noupdate -format Literal /TB/DDR2_DM
add wave -noupdate -format Logic /TB/DDR2_CKE
add wave -noupdate -format Logic /TB/DDR2_CS_N
add wave -noupdate -format Logic /TB/DDR2_RAS_N
add wave -noupdate -format Logic /TB/DDR2_CAS_N
add wave -noupdate -format Logic /TB/DDR2_WE_N
add wave -noupdate -format Logic /TB/DDR2_ODT
add wave -noupdate -format Logic /TB/RST_DQS_DIV_OUT
add wave -noupdate -format Logic /TB/DDR2_CK
add wave -noupdate -format Logic /TB/DDR2_CK_N
add wave -noupdate -format Literal {/TB/DDR2_DQS$inout$reg}
add wave -noupdate -format Literal /TB/DDR2_DQS
add wave -noupdate -format Literal {/TB/DDR2_DQS_N$inout$reg}
add wave -noupdate -format Literal /TB/DDR2_DQS_N
add wave -noupdate -format Literal {/TB/DDR2_DQ$inout$reg}
add wave -noupdate -format Literal /TB/DDR2_DQ
add wave -noupdate -format Logic /TB/RST_DQS_DIV_IN
add wave -noupdate -format Logic /TB/ARB_EDDS_SIN
add wave -noupdate -format Logic /TB/NRD
add wave -noupdate -format Literal /TB/KB_Bus
add wave -noupdate -format Literal /TB/KD_Bus
add wave -noupdate -format Logic /TB/Do_Ctrl
add wave -noupdate -format Logic /TB/Key_INT
add wave -noupdate -format Logic /glbl/GSR
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {82399895 ps} 0}
configure wave -namecolwidth 433
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
update
WaveRestoreZoom {0 ps} {111442786 ps}
