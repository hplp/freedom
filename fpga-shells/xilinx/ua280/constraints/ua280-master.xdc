#-------------- MCS Generation ----------------------
# verified, should be good

# Bitstream Configuration
# ------------------------------------------------------------------------
set_property CONFIG_VOLTAGE 1.8 [current_design]
set_property BITSTREAM.CONFIG.CONFIGFALLBACK Enable [current_design]
set_property BITSTREAM.GENERAL.COMPRESS TRUE [current_design]
set_property CONFIG_MODE SPIx4 [current_design]
set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 4 [current_design]
set_property BITSTREAM.CONFIG.CONFIGRATE 85.0 [current_design]
set_property BITSTREAM.CONFIG.EXTMASTERCCLK_EN disable [current_design]
set_property BITSTREAM.CONFIG.SPI_FALL_EDGE YES [current_design]
set_property BITSTREAM.CONFIG.UNUSEDPIN Pullup [current_design]
set_property BITSTREAM.CONFIG.SPI_32BIT_ADDR Yes [current_design]
# ------------------------------------------------------------------------
#---------------Physical Constraints-----------------

# 100 MHz clock, Modified
set_property IOSTANDARD LVDS [get_ports sys_diff_clock_clk_p]

set_property PACKAGE_PIN BH6 [get_ports sys_diff_clock_clk_p]
set_property PACKAGE_PIN BJ6 [get_ports sys_diff_clock_clk_n]
set_property IOSTANDARD LVDS [get_ports sys_diff_clock_clk_n]
set_property DQS_BIAS	TRUE [get_ports sys_diff_clock_clk_p]

set_property PACKAGE_PIN L30 [get_ports reset]
set_property IOSTANDARD LVCMOS18 [get_ports reset]
set_false_path -from [get_ports reset]

create_clock -period 10.000 -name sys_diff_clk [get_ports sys_diff_clock_clk_p]
#set_input_jitter [get_clocks -of_objects [get_ports sys_diff_clock_clk_p]] 0.050


# UART Modified
set_property PACKAGE_PIN A28 [get_ports uart_rx]
set_property IOSTANDARD LVCMOS18 [get_ports uart_rx]
set_property IOB TRUE [get_ports uart_rx] [get_cells -of_objects [all_fanout -flat -endpoints_only [get_ports uart_rx]]]
#set_property PACKAGE_PIN AR19 [get_ports uart_ctsn]
#set_property IOSTANDARD LVCMOS18 [get_ports uart_ctsn]
#set_property IOB TRUE [get_ports uart_ctsn]
set_property PACKAGE_PIN B33 [get_ports uart_tx]
set_property IOSTANDARD LVCMOS18 [get_ports uart_tx]
set_property IOB TRUE [get_ports uart_tx]  [get_cells -of_objects [all_fanin -flat -startpoints_only [get_ports uart_tx]]]
#set_property PACKAGE_PIN AU19 [get_ports uart_rtsn]
#set_property IOSTANDARD LVCMOS18 [get_ports uart_rtsn]
#set_property IOB TRUE [get_ports uart_rtsn]

# Platform specific constraints
#set_property IOB TRUE [get_cells "U500UA280System/uarts_0/txm/out_reg"]
#set_property IOB TRUE [get_cells "uart_rxd_sync/sync_1"]

# clk_in
#set_property IOSTANDARD LVDS [get_ports diff_clk_in_p]
#set_property PACKAGE_PIN BJ43 [get_ports diff_clk_in_p]
#set_property PACKAGE_PIN BJ44 [get_ports diff_clk_in_n]
#set_property IOSTANDARD LVDS [get_ports diff_clk_in_n]
#create_clock -period 13.333 -name diff_clk_in_p [get_ports diff_clk_in_p]



set_property PACKAGE_PIN A8                [ get_ports  {ddr_c0_ddr4_dq[3]} ]          ;# Bank  70 VCCO - VCC1V2 Net "DDR4_C1_DQ3"     - IO_L24N_T3U_N11_70
set_property IOSTANDARD  POD12_DCI         [ get_ports  {ddr_c0_ddr4_dq[3]} ]          ;# Bank  70 VCCO - VCC1V2 Net "DDR4_C1_DQ3"     - IO_L24N_T3U_N11_70
set_property PACKAGE_PIN A9                [ get_ports  {ddr_c0_ddr4_dq[2]} ]          ;# Bank  70 VCCO - VCC1V2 Net "DDR4_C1_DQ2"     - IO_L24P_T3U_N10_70
set_property IOSTANDARD  POD12_DCI         [ get_ports  {ddr_c0_ddr4_dq[2]} ]          ;# Bank  70 VCCO - VCC1V2 Net "DDR4_C1_DQ2"     - IO_L24P_T3U_N10_70
set_property PACKAGE_PIN A10               [ get_ports  {ddr_c0_ddr4_dq[1]} ]          ;# Bank  70 VCCO - VCC1V2 Net "DDR4_C1_DQ1"     - IO_L23N_T3U_N9_70
set_property IOSTANDARD  POD12_DCI         [ get_ports  {ddr_c0_ddr4_dq[1]} ]          ;# Bank  70 VCCO - VCC1V2 Net "DDR4_C1_DQ1"     - IO_L23N_T3U_N9_70
set_property PACKAGE_PIN A11               [ get_ports  {ddr_c0_ddr4_dq[0]} ]          ;# Bank  70 VCCO - VCC1V2 Net "DDR4_C1_DQ0"     - IO_L23P_T3U_N8_70
set_property IOSTANDARD  POD12_DCI         [ get_ports  {ddr_c0_ddr4_dq[0]} ]          ;# Bank  70 VCCO - VCC1V2 Net "DDR4_C1_DQ0"     - IO_L23P_T3U_N8_70
set_property PACKAGE_PIN A13               [ get_ports  {ddr_c0_ddr4_dqs_c[0]} ]       ;# Bank  70 VCCO - VCC1V2 Net "DDR4_C1_DQS_C0"  - IO_L22N_T3U_N7_DBC_AD0N_70
set_property IOSTANDARD  DIFF_POD12_DCI    [ get_ports  {ddr_c0_ddr4_dqs_c[0]} ]       ;# Bank  70 VCCO - VCC1V2 Net "DDR4_C1_DQS_C0"  - IO_L22N_T3U_N7_DBC_AD0N_70
set_property PACKAGE_PIN B13               [ get_ports  {ddr_c0_ddr4_dqs_t[0]} ]       ;# Bank  70 VCCO - VCC1V2 Net "DDR4_C1_DQS_T0"  - IO_L22P_T3U_N6_DBC_AD0P_70
set_property IOSTANDARD  DIFF_POD12_DCI    [ get_ports  {ddr_c0_ddr4_dqs_t[0]} ]       ;# Bank  70 VCCO - VCC1V2 Net "DDR4_C1_DQS_T0"  - IO_L22P_T3U_N6_DBC_AD0P_70
set_property PACKAGE_PIN B12               [ get_ports  {ddr_c0_ddr4_dq[4]} ]          ;# Bank  70 VCCO - VCC1V2 Net "DDR4_C1_DQ4"     - IO_L21N_T3L_N5_AD8N_70
set_property IOSTANDARD  POD12_DCI         [ get_ports  {ddr_c0_ddr4_dq[4]} ]          ;# Bank  70 VCCO - VCC1V2 Net "DDR4_C1_DQ4"     - IO_L21N_T3L_N5_AD8N_70
set_property PACKAGE_PIN C12               [ get_ports  {ddr_c0_ddr4_dq[6]} ]          ;# Bank  70 VCCO - VCC1V2 Net "DDR4_C1_DQ6"     - IO_L21P_T3L_N4_AD8P_70
set_property IOSTANDARD  POD12_DCI         [ get_ports  {ddr_c0_ddr4_dq[6]} ]          ;# Bank  70 VCCO - VCC1V2 Net "DDR4_C1_DQ6"     - IO_L21P_T3L_N4_AD8P_70
set_property PACKAGE_PIN B10               [ get_ports  {ddr_c0_ddr4_dq[5]} ]          ;# Bank  70 VCCO - VCC1V2 Net "DDR4_C1_DQ5"     - IO_L20N_T3L_N3_AD1N_70
set_property IOSTANDARD  POD12_DCI         [ get_ports  {ddr_c0_ddr4_dq[5]} ]          ;# Bank  70 VCCO - VCC1V2 Net "DDR4_C1_DQ5"     - IO_L20N_T3L_N3_AD1N_70
set_property PACKAGE_PIN B11               [ get_ports  {ddr_c0_ddr4_dq[7]} ]          ;# Bank  70 VCCO - VCC1V2 Net "DDR4_C1_DQ7"     - IO_L20P_T3L_N2_AD1P_70
set_property IOSTANDARD  POD12_DCI         [ get_ports  {ddr_c0_ddr4_dq[7]} ]          ;# Bank  70 VCCO - VCC1V2 Net "DDR4_C1_DQ7"     - IO_L20P_T3L_N2_AD1P_70
set_property PACKAGE_PIN C9                [ get_ports  {ddr_c0_ddr4_dqs_c[1]} ]       ;# Bank  70 VCCO - VCC1V2 Net "DDR4_C1_DQS_C9"  - IO_L19N_T3L_N1_DBC_AD9N_70
set_property IOSTANDARD  DIFF_POD12_DCI    [ get_ports  {ddr_c0_ddr4_dqs_c[1]} ]       ;# Bank  70 VCCO - VCC1V2 Net "DDR4_C1_DQS_C9"  - IO_L19N_T3L_N1_DBC_AD9N_70
set_property PACKAGE_PIN C10               [ get_ports  {ddr_c0_ddr4_dqs_t[1]} ]       ;# Bank  70 VCCO - VCC1V2 Net "DDR4_C1_DQS_T9"  - IO_L19P_T3L_N0_DBC_AD9P_70
set_property IOSTANDARD  DIFF_POD12_DCI    [ get_ports  {ddr_c0_ddr4_dqs_t[1]} ]       ;# Bank  70 VCCO - VCC1V2 Net "DDR4_C1_DQS_T9"  - IO_L19P_T3L_N0_DBC_AD9P_70
#set_property PACKAGE_PIN C13               #N/A                                    ;# Bank  70 VCCO - VCC1V2 Net "Not Connected"   - IO_T3U_N12_70
#set_property IOSTANDARD  LVCMOS12          #N/A                                    ;# Bank  70 VCCO - VCC1V2 Net "Not Connected"   - IO_T3U_N12_70
#set_property PACKAGE_PIN C14               #N/A                                    ;# Bank  70 VCCO - VCC1V2 Net "Not Connected"   - IO_T2U_N12_70
#set_property IOSTANDARD  LVCMOS12          #N/A                                    ;# Bank  70 VCCO - VCC1V2 Net "Not Connected"   - IO_T2U_N12_70
set_property PACKAGE_PIN A14               [ get_ports  {ddr_c0_ddr4_dq[24]} ]         ;# Bank  70 VCCO - VCC1V2 Net "DDR4_C1_DQ27"    - IO_L18N_T2U_N11_AD2N_70
set_property IOSTANDARD  POD12_DCI         [ get_ports  {ddr_c0_ddr4_dq[24]} ]         ;# Bank  70 VCCO - VCC1V2 Net "DDR4_C1_DQ27"    - IO_L18N_T2U_N11_AD2N_70
set_property PACKAGE_PIN A15               [ get_ports  {ddr_c0_ddr4_dq[26]} ]         ;# Bank  70 VCCO - VCC1V2 Net "DDR4_C1_DQ25"    - IO_L18P_T2U_N10_AD2P_70
set_property IOSTANDARD  POD12_DCI         [ get_ports  {ddr_c0_ddr4_dq[26]} ]         ;# Bank  70 VCCO - VCC1V2 Net "DDR4_C1_DQ25"    - IO_L18P_T2U_N10_AD2P_70
set_property PACKAGE_PIN B15               [ get_ports  {ddr_c0_ddr4_dq[27]} ]         ;# Bank  70 VCCO - VCC1V2 Net "DDR4_C1_DQ24"    - IO_L17N_T2U_N9_AD10N_70
set_property IOSTANDARD  POD12_DCI         [ get_ports  {ddr_c0_ddr4_dq[27]} ]         ;# Bank  70 VCCO - VCC1V2 Net "DDR4_C1_DQ24"    - IO_L17N_T2U_N9_AD10N_70
set_property PACKAGE_PIN C15               [ get_ports  {ddr_c0_ddr4_dq[25]} ]         ;# Bank  70 VCCO - VCC1V2 Net "DDR4_C1_DQ26"    - IO_L17P_T2U_N8_AD10P_70
set_property IOSTANDARD  POD12_DCI         [ get_ports  {ddr_c0_ddr4_dq[25]} ]         ;# Bank  70 VCCO - VCC1V2 Net "DDR4_C1_DQ26"    - IO_L17P_T2U_N8_AD10P_70
set_property PACKAGE_PIN D14               [ get_ports  {ddr_c0_ddr4_dqs_c[6]} ]       ;# Bank  70 VCCO - VCC1V2 Net "DDR4_C1_DQS_C3"  - IO_L16N_T2U_N7_QBC_AD3N_70
set_property IOSTANDARD  DIFF_POD12_DCI    [ get_ports  {ddr_c0_ddr4_dqs_c[6]} ]       ;# Bank  70 VCCO - VCC1V2 Net "DDR4_C1_DQS_C3"  - IO_L16N_T2U_N7_QBC_AD3N_70
set_property PACKAGE_PIN D15               [ get_ports  {ddr_c0_ddr4_dqs_t[6]} ]       ;# Bank  70 VCCO - VCC1V2 Net "DDR4_C1_DQS_T3"  - IO_L16P_T2U_N6_QBC_AD3P_70
set_property IOSTANDARD  DIFF_POD12_DCI    [ get_ports  {ddr_c0_ddr4_dqs_t[6]} ]       ;# Bank  70 VCCO - VCC1V2 Net "DDR4_C1_DQS_T3"  - IO_L16P_T2U_N6_QBC_AD3P_70
set_property PACKAGE_PIN E14               [ get_ports  {ddr_c0_ddr4_dq[29]} ]         ;# Bank  70 VCCO - VCC1V2 Net "DDR4_C1_DQ29"    - IO_L15N_T2L_N5_AD11N_70
set_property IOSTANDARD  POD12_DCI         [ get_ports  {ddr_c0_ddr4_dq[29]} ]         ;# Bank  70 VCCO - VCC1V2 Net "DDR4_C1_DQ29"    - IO_L15N_T2L_N5_AD11N_70
set_property PACKAGE_PIN F15               [ get_ports  {ddr_c0_ddr4_dq[28]} ]         ;# Bank  70 VCCO - VCC1V2 Net "DDR4_C1_DQ31"    - IO_L15P_T2L_N4_AD11P_70
set_property IOSTANDARD  POD12_DCI         [ get_ports  {ddr_c0_ddr4_dq[28]} ]         ;# Bank  70 VCCO - VCC1V2 Net "DDR4_C1_DQ31"    - IO_L15P_T2L_N4_AD11P_70
set_property PACKAGE_PIN F13               [ get_ports  {ddr_c0_ddr4_dq[31]} ]         ;# Bank  70 VCCO - VCC1V2 Net "DDR4_C1_DQ28"    - IO_L14N_T2L_N3_GC_70
set_property IOSTANDARD  POD12_DCI         [ get_ports  {ddr_c0_ddr4_dq[31]} ]         ;# Bank  70 VCCO - VCC1V2 Net "DDR4_C1_DQ28"    - IO_L14N_T2L_N3_GC_70
set_property PACKAGE_PIN F14               [ get_ports  {ddr_c0_ddr4_dq[30]} ]         ;# Bank  70 VCCO - VCC1V2 Net "DDR4_C1_DQ30"    - IO_L14P_T2L_N2_GC_70
set_property IOSTANDARD  POD12_DCI         [ get_ports  {ddr_c0_ddr4_dq[30]} ]         ;# Bank  70 VCCO - VCC1V2 Net "DDR4_C1_DQ30"    - IO_L14P_T2L_N2_GC_70
set_property PACKAGE_PIN D12               [ get_ports  {ddr_c0_ddr4_dqs_c[7]} ]       ;# Bank  70 VCCO - VCC1V2 Net "DDR4_C1_DQS_C12" - IO_L13N_T2L_N1_GC_QBC_70
set_property IOSTANDARD  DIFF_POD12_DCI    [ get_ports  {ddr_c0_ddr4_dqs_c[7]} ]       ;# Bank  70 VCCO - VCC1V2 Net "DDR4_C1_DQS_C12" - IO_L13N_T2L_N1_GC_QBC_70
set_property PACKAGE_PIN E13               [ get_ports  {ddr_c0_ddr4_dqs_t[7]} ]       ;# Bank  70 VCCO - VCC1V2 Net "DDR4_C1_DQS_T12" - IO_L13P_T2L_N0_GC_QBC_70
set_property IOSTANDARD  DIFF_POD12_DCI    [ get_ports  {ddr_c0_ddr4_dqs_t[7]} ]       ;# Bank  70 VCCO - VCC1V2 Net "DDR4_C1_DQS_T12" - IO_L13P_T2L_N0_GC_QBC_70
set_property PACKAGE_PIN E11               [ get_ports  {ddr_c0_ddr4_dq[8]} ]          ;# Bank  70 VCCO - VCC1V2 Net "DDR4_C1_DQ8"     - IO_L12N_T1U_N11_GC_70
set_property IOSTANDARD  POD12_DCI         [ get_ports  {ddr_c0_ddr4_dq[8]} ]          ;# Bank  70 VCCO - VCC1V2 Net "DDR4_C1_DQ8"     - IO_L12N_T1U_N11_GC_70
set_property PACKAGE_PIN F11               [ get_ports  {ddr_c0_ddr4_dq[11]} ]         ;# Bank  70 VCCO - VCC1V2 Net "DDR4_C1_DQ11"    - IO_L12P_T1U_N10_GC_70
set_property IOSTANDARD  POD12_DCI         [ get_ports  {ddr_c0_ddr4_dq[11]} ]         ;# Bank  70 VCCO - VCC1V2 Net "DDR4_C1_DQ11"    - IO_L12P_T1U_N10_GC_70
set_property PACKAGE_PIN D11               [ get_ports  {ddr_c0_ddr4_dq[9]} ]          ;# Bank  70 VCCO - VCC1V2 Net "DDR4_C1_DQ9"     - IO_L11N_T1U_N9_GC_70
set_property IOSTANDARD  POD12_DCI         [ get_ports  {ddr_c0_ddr4_dq[9]} ]          ;# Bank  70 VCCO - VCC1V2 Net "DDR4_C1_DQ9"     - IO_L11N_T1U_N9_GC_70
set_property PACKAGE_PIN E12               [ get_ports  {ddr_c0_ddr4_dq[10]} ]         ;# Bank  70 VCCO - VCC1V2 Net "DDR4_C1_DQ10"    - IO_L11P_T1U_N8_GC_70
set_property IOSTANDARD  POD12_DCI         [ get_ports  {ddr_c0_ddr4_dq[10]} ]         ;# Bank  70 VCCO - VCC1V2 Net "DDR4_C1_DQ10"    - IO_L11P_T1U_N8_GC_70
set_property PACKAGE_PIN D9                [ get_ports  {ddr_c0_ddr4_dqs_c[2]} ]       ;# Bank  70 VCCO - VCC1V2 Net "DDR4_C1_DQS_C1"  - IO_L10N_T1U_N7_QBC_AD4N_70
set_property IOSTANDARD  DIFF_POD12_DCI    [ get_ports  {ddr_c0_ddr4_dqs_c[2]} ]       ;# Bank  70 VCCO - VCC1V2 Net "DDR4_C1_DQS_C1"  - IO_L10N_T1U_N7_QBC_AD4N_70
set_property PACKAGE_PIN D10               [ get_ports  {ddr_c0_ddr4_dqs_t[2]} ]       ;# Bank  70 VCCO - VCC1V2 Net "DDR4_C1_DQS_T1"  - IO_L10P_T1U_N6_QBC_AD4P_70
set_property IOSTANDARD  DIFF_POD12_DCI    [ get_ports  {ddr_c0_ddr4_dqs_t[2]} ]       ;# Bank  70 VCCO - VCC1V2 Net "DDR4_C1_DQS_T1"  - IO_L10P_T1U_N6_QBC_AD4P_70
set_property PACKAGE_PIN E9                [ get_ports  {ddr_c0_ddr4_dq[13]} ]         ;# Bank  70 VCCO - VCC1V2 Net "DDR4_C1_DQ13"    - IO_L9N_T1L_N5_AD12N_70
set_property IOSTANDARD  POD12_DCI         [ get_ports  {ddr_c0_ddr4_dq[13]} ]         ;# Bank  70 VCCO - VCC1V2 Net "DDR4_C1_DQ13"    - IO_L9N_T1L_N5_AD12N_70
set_property PACKAGE_PIN F9                [ get_ports  {ddr_c0_ddr4_dq[14]} ]         ;# Bank  70 VCCO - VCC1V2 Net "DDR4_C1_DQ14"    - IO_L9P_T1L_N4_AD12P_70
set_property IOSTANDARD  POD12_DCI         [ get_ports  {ddr_c0_ddr4_dq[14]} ]         ;# Bank  70 VCCO - VCC1V2 Net "DDR4_C1_DQ14"    - IO_L9P_T1L_N4_AD12P_70
set_property PACKAGE_PIN F10               [ get_ports  {ddr_c0_ddr4_dq[12]} ]         ;# Bank  70 VCCO - VCC1V2 Net "DDR4_C1_DQ12"    - IO_L8N_T1L_N3_AD5N_70
set_property IOSTANDARD  POD12_DCI         [ get_ports  {ddr_c0_ddr4_dq[12]} ]         ;# Bank  70 VCCO - VCC1V2 Net "DDR4_C1_DQ12"    - IO_L8N_T1L_N3_AD5N_70
set_property PACKAGE_PIN G11               [ get_ports  {ddr_c0_ddr4_dq[15]} ]         ;# Bank  70 VCCO - VCC1V2 Net "DDR4_C1_DQ15"    - IO_L8P_T1L_N2_AD5P_70
set_property IOSTANDARD  POD12_DCI         [ get_ports  {ddr_c0_ddr4_dq[15]} ]         ;# Bank  70 VCCO - VCC1V2 Net "DDR4_C1_DQ15"    - IO_L8P_T1L_N2_AD5P_70
set_property PACKAGE_PIN G10               [ get_ports  {ddr_c0_ddr4_dqs_c[3]} ]       ;# Bank  70 VCCO - VCC1V2 Net "DDR4_C1_DQS_C10" - IO_L7N_T1L_N1_QBC_AD13N_70
set_property IOSTANDARD  DIFF_POD12_DCI    [ get_ports  {ddr_c0_ddr4_dqs_c[3]} ]       ;# Bank  70 VCCO - VCC1V2 Net "DDR4_C1_DQS_C10" - IO_L7N_T1L_N1_QBC_AD13N_70
set_property PACKAGE_PIN H10               [ get_ports  {ddr_c0_ddr4_dqs_t[3]} ]       ;# Bank  70 VCCO - VCC1V2 Net "DDR4_C1_DQS_T10" - IO_L7P_T1L_N0_QBC_AD13P_70
set_property IOSTANDARD  DIFF_POD12_DCI    [ get_ports  {ddr_c0_ddr4_dqs_t[3]} ]       ;# Bank  70 VCCO - VCC1V2 Net "DDR4_C1_DQS_T10" - IO_L7P_T1L_N0_QBC_AD13P_70
#set_property PACKAGE_PIN H9                #N/A                                    ;# Bank  70 VCCO - VCC1V2 Net "Not Connected"   - IO_T1U_N12_70
#set_property IOSTANDARD  LVCMOS18          #N/A                                    ;# Bank  70 VCCO - VCC1V2 Net "Not Connected"   - IO_T1U_N12_70
set_property PACKAGE_PIN G13               [ get_ports  {ddr_c0_ddr4_dq[17]} ]         ;# Bank  70 VCCO - VCC1V2 Net "DDR4_C1_DQ17"    - IO_L6N_T0U_N11_AD6N_70
set_property IOSTANDARD  POD12_DCI         [ get_ports  {ddr_c0_ddr4_dq[17]} ]         ;# Bank  70 VCCO - VCC1V2 Net "DDR4_C1_DQ17"    - IO_L6N_T0U_N11_AD6N_70
set_property PACKAGE_PIN H14               [ get_ports  {ddr_c0_ddr4_dq[19]} ]         ;# Bank  70 VCCO - VCC1V2 Net "DDR4_C1_DQ19"    - IO_L6P_T0U_N10_AD6P_70
set_property IOSTANDARD  POD12_DCI         [ get_ports  {ddr_c0_ddr4_dq[19]} ]         ;# Bank  70 VCCO - VCC1V2 Net "DDR4_C1_DQ19"    - IO_L6P_T0U_N10_AD6P_70
set_property PACKAGE_PIN H12               [ get_ports  {ddr_c0_ddr4_dq[16]} ]         ;# Bank  70 VCCO - VCC1V2 Net "DDR4_C1_DQ16"    - IO_L5N_T0U_N9_AD14N_70
set_property IOSTANDARD  POD12_DCI         [ get_ports  {ddr_c0_ddr4_dq[16]} ]         ;# Bank  70 VCCO - VCC1V2 Net "DDR4_C1_DQ16"    - IO_L5N_T0U_N9_AD14N_70
set_property PACKAGE_PIN H13               [ get_ports  {ddr_c0_ddr4_dq[18]} ]         ;# Bank  70 VCCO - VCC1V2 Net "DDR4_C1_DQ18"    - IO_L5P_T0U_N8_AD14P_70
set_property IOSTANDARD  POD12_DCI         [ get_ports  {ddr_c0_ddr4_dq[18]} ]         ;# Bank  70 VCCO - VCC1V2 Net "DDR4_C1_DQ18"    - IO_L5P_T0U_N8_AD14P_70
set_property PACKAGE_PIN G15               [ get_ports  {ddr_c0_ddr4_dqs_c[4]} ]       ;# Bank  70 VCCO - VCC1V2 Net "DDR4_C1_DQS_C2"  - IO_L4N_T0U_N7_DBC_AD7N_70
set_property IOSTANDARD  DIFF_POD12_DCI    [ get_ports  {ddr_c0_ddr4_dqs_c[4]} ]       ;# Bank  70 VCCO - VCC1V2 Net "DDR4_C1_DQS_C2"  - IO_L4N_T0U_N7_DBC_AD7N_70
set_property PACKAGE_PIN H15               [ get_ports  {ddr_c0_ddr4_dqs_t[4]} ]       ;# Bank  70 VCCO - VCC1V2 Net "DDR4_C1_DQS_T2"  - IO_L4P_T0U_N6_DBC_AD7P_70
set_property IOSTANDARD  DIFF_POD12_DCI    [ get_ports  {ddr_c0_ddr4_dqs_t[4]} ]       ;# Bank  70 VCCO - VCC1V2 Net "DDR4_C1_DQS_T2"  - IO_L4P_T0U_N6_DBC_AD7P_70
set_property PACKAGE_PIN J11               [ get_ports  {ddr_c0_ddr4_dq[20]} ]         ;# Bank  70 VCCO - VCC1V2 Net "DDR4_C1_DQ20"    - IO_L3N_T0L_N5_AD15N_70
set_property IOSTANDARD  POD12_DCI         [ get_ports  {ddr_c0_ddr4_dq[20]} ]         ;# Bank  70 VCCO - VCC1V2 Net "DDR4_C1_DQ20"    - IO_L3N_T0L_N5_AD15N_70
set_property PACKAGE_PIN J12               [ get_ports  {ddr_c0_ddr4_dq[21]} ]         ;# Bank  70 VCCO - VCC1V2 Net "DDR4_C1_DQ21"    - IO_L3P_T0L_N4_AD15P_70
set_property IOSTANDARD  POD12_DCI         [ get_ports  {ddr_c0_ddr4_dq[21]} ]         ;# Bank  70 VCCO - VCC1V2 Net "DDR4_C1_DQ21"    - IO_L3P_T0L_N4_AD15P_70
set_property PACKAGE_PIN J14               [ get_ports  {ddr_c0_ddr4_dq[23]} ]         ;# Bank  70 VCCO - VCC1V2 Net "DDR4_C1_DQ23"    - IO_L2N_T0L_N3_70
set_property IOSTANDARD  POD12_DCI         [ get_ports  {ddr_c0_ddr4_dq[23]} ]         ;# Bank  70 VCCO - VCC1V2 Net "DDR4_C1_DQ23"    - IO_L2N_T0L_N3_70
set_property PACKAGE_PIN J15               [ get_ports  {ddr_c0_ddr4_dq[22]} ]         ;# Bank  70 VCCO - VCC1V2 Net "DDR4_C1_DQ22"    - IO_L2P_T0L_N2_70
set_property IOSTANDARD  POD12_DCI         [ get_ports  {ddr_c0_ddr4_dq[22]} ]         ;# Bank  70 VCCO - VCC1V2 Net "DDR4_C1_DQ22"    - IO_L2P_T0L_N2_70
set_property PACKAGE_PIN K13               [ get_ports  {ddr_c0_ddr4_dqs_c[5]} ]       ;# Bank  70 VCCO - VCC1V2 Net "DDR4_C1_DQS_C11" - IO_L1N_T0L_N1_DBC_70
set_property IOSTANDARD  DIFF_POD12_DCI    [ get_ports  {ddr_c0_ddr4_dqs_c[5]} ]       ;# Bank  70 VCCO - VCC1V2 Net "DDR4_C1_DQS_C11" - IO_L1N_T0L_N1_DBC_70
set_property PACKAGE_PIN K14               [ get_ports  {ddr_c0_ddr4_dqs_t[5]} ]       ;# Bank  70 VCCO - VCC1V2 Net "DDR4_C1_DQS_T11" - IO_L1P_T0L_N0_DBC_70
set_property IOSTANDARD  DIFF_POD12_DCI    [ get_ports  {ddr_c0_ddr4_dqs_t[5]} ]       ;# Bank  70 VCCO - VCC1V2 Net "DDR4_C1_DQS_T11" - IO_L1P_T0L_N0_DBC_70
##
##  DDR4 RDIMM Control, Command and Address
##       The DIMM interfaces have connectivity to support UDIMM, RDIMM, LRDIMM and 3DS devices.
##       The below constraints are configured to support DDR4, Single Rank, RDIMMs with x4 Compnent Connectivity and the unused pins are commented out.
##       The System Clock for the MEMORY interface are comemented out and moved to the Clock section of the XDC file
##
#set_property PACKAGE_PIN BF1               [ get_ports  {ddr_c0_ddr4_cke[1]} ]         ;# Bank  69 VCCO - VCC1V2 Net "DDR4_C1_CKE1"    - IO_L24N_T3U_N11_69
#set_property IOSTANDARD  SSTL12_DCI        [ get_ports  {ddr_c0_ddr4_cke[1]} ]         ;# Bank  69 VCCO - VCC1V2 Net "DDR4_C1_CKE1"    - IO_L24N_T3U_N11_69
set_property PACKAGE_PIN BE1               [ get_ports  {ddr_c0_ddr4_cke} ]         ;# Bank  69 VCCO - VCC1V2 Net "DDR4_C1_CKE0"    - IO_L24P_T3U_N10_69
set_property IOSTANDARD  SSTL12_DCI        [ get_ports  {ddr_c0_ddr4_cke} ]         ;# Bank  69 VCCO - VCC1V2 Net "DDR4_C1_CKE0"    - IO_L24P_T3U_N10_69
set_property PACKAGE_PIN BE3               [ get_ports  {ddr_c0_ddr4_adr[4]} ]         ;# Bank  69 VCCO - VCC1V2 Net "DDR4_C1_ADR4"    - IO_L23N_T3U_N9_69
set_property IOSTANDARD  SSTL12_DCI        [ get_ports  {ddr_c0_ddr4_adr[4]} ]         ;# Bank  69 VCCO - VCC1V2 Net "DDR4_C1_ADR4"    - IO_L23N_T3U_N9_69
set_property PACKAGE_PIN BE4               [ get_ports  {ddr_c0_ddr4_adr[11]} ]        ;# Bank  69 VCCO - VCC1V2 Net "DDR4_C1_ADR11"   - IO_L23P_T3U_N8_69
set_property IOSTANDARD  SSTL12_DCI        [ get_ports  {ddr_c0_ddr4_adr[11]} ]        ;# Bank  69 VCCO - VCC1V2 Net "DDR4_C1_ADR11"   - IO_L23P_T3U_N8_69
set_property PACKAGE_PIN BE5               [ get_ports  {ddr_c0_ddr4_adr[6]} ]         ;# Bank  69 VCCO - VCC1V2 Net "DDR4_C1_ADR6"    - IO_L22N_T3U_N7_DBC_AD0N_69
set_property IOSTANDARD  SSTL12_DCI        [ get_ports  {ddr_c0_ddr4_adr[6]} ]         ;# Bank  69 VCCO - VCC1V2 Net "DDR4_C1_ADR6"    - IO_L22N_T3U_N7_DBC_AD0N_69
set_property PACKAGE_PIN BE6               [ get_ports  {ddr_c0_ddr4_adr[5]} ]         ;# Bank  69 VCCO - VCC1V2 Net "DDR4_C1_ADR5"    - IO_L22P_T3U_N6_DBC_AD0P_69
set_property IOSTANDARD  SSTL12_DCI        [ get_ports  {ddr_c0_ddr4_adr[5]} ]         ;# Bank  69 VCCO - VCC1V2 Net "DDR4_C1_ADR5"    - IO_L22P_T3U_N6_DBC_AD0P_69
set_property PACKAGE_PIN BF2               [ get_ports  {ddr_c0_ddr4_bg[1]} ]          ;# Bank  69 VCCO - VCC1V2 Net "DDR4_C1_BG1"     - IO_L21N_T3L_N5_AD8N_69
set_property IOSTANDARD  SSTL12_DCI        [ get_ports  {ddr_c0_ddr4_bg[1]} ]          ;# Bank  69 VCCO - VCC1V2 Net "DDR4_C1_BG1"     - IO_L21N_T3L_N5_AD8N_69
set_property PACKAGE_PIN BF3               [ get_ports  {ddr_c0_ddr4_bg[0]} ]          ;# Bank  69 VCCO - VCC1V2 Net "DDR4_C1_BG0"     - IO_L21P_T3L_N4_AD8P_69
set_property IOSTANDARD  SSTL12_DCI        [ get_ports  {ddr_c0_ddr4_bg[0]} ]          ;# Bank  69 VCCO - VCC1V2 Net "DDR4_C1_BG0"     - IO_L21P_T3L_N4_AD8P_69
set_property PACKAGE_PIN BG2               [ get_ports  {ddr_c0_ddr4_adr[9]} ]         ;# Bank  69 VCCO - VCC1V2 Net "DDR4_C1_ADR9"    - IO_L20N_T3L_N3_AD1N_69
set_property IOSTANDARD  SSTL12_DCI        [ get_ports  {ddr_c0_ddr4_adr[9]} ]         ;# Bank  69 VCCO - VCC1V2 Net "DDR4_C1_ADR9"    - IO_L20N_T3L_N3_AD1N_69
set_property PACKAGE_PIN BG3               [ get_ports  {ddr_c0_ddr4_act_n} ]          ;# Bank  69 VCCO - VCC1V2 Net "DDR4_C1_ACT_B"   - IO_L20P_T3L_N2_AD1P_69
set_property IOSTANDARD  SSTL12_DCI        [ get_ports  {ddr_c0_ddr4_act_n} ]          ;# Bank  69 VCCO - VCC1V2 Net "DDR4_C1_ACT_B"   - IO_L20P_T3L_N2_AD1P_69
#set_property PACKAGE_PIN BG4               [ get_ports  {ddr_c0_ddr4_cs_n[3]} ]        ;# Bank  69 VCCO - VCC1V2 Net "DDR4_C1_CS_B3"   - IO_L19N_T3L_N1_DBC_AD9N_69
#set_property IOSTANDARD  SSTL12_DCI        [ get_ports  {ddr_c0_ddr4_cs_n[3]} ]        ;# Bank  69 VCCO - VCC1V2 Net "DDR4_C1_CS_B3"   - IO_L19N_T3L_N1_DBC_AD9N_69
#set_property PACKAGE_PIN BG5               [ get_ports  {ddr_c0_ddr4_cs_n[2]} ]        ;# Bank  69 VCCO - VCC1V2 Net "DDR4_C1_CS_B2"   - IO_L19P_T3L_N0_DBC_AD9P_69
#set_property IOSTANDARD  SSTL12_DCI        [ get_ports  {ddr_c0_ddr4_cs_n[2]} ]        ;# Bank  69 VCCO - VCC1V2 Net "DDR4_C1_CS_B2"   - IO_L19P_T3L_N0_DBC_AD9P_69
set_property PACKAGE_PIN BF5               [ get_ports  {ddr_c0_ddr4_adr[3]} ]         ;# Bank  69 VCCO - VCC1V2 Net "DDR4_C1_ADR3"    - IO_T3U_N12_69
set_property IOSTANDARD  SSTL12_DCI        [ get_ports  {ddr_c0_ddr4_adr[3]} ]         ;# Bank  69 VCCO - VCC1V2 Net "DDR4_C1_ADR3"    - IO_T3U_N12_69
set_property PACKAGE_PIN BF6               [ get_ports  {ddr_c0_ddr4_adr[2]} ]         ;# Bank  69 VCCO - VCC1V2 Net "DDR4_C1_ADR2"    - IO_T2U_N12_69
set_property IOSTANDARD  SSTL12_DCI        [ get_ports  {ddr_c0_ddr4_adr[2]} ]         ;# Bank  69 VCCO - VCC1V2 Net "DDR4_C1_ADR2"    - IO_T2U_N12_69
set_property PACKAGE_PIN BF7               [ get_ports  {ddr_c0_ddr4_adr[0]} ]         ;# Bank  69 VCCO - VCC1V2 Net "DDR4_C1_ADR0"    - IO_L18N_T2U_N11_AD2N_69
set_property IOSTANDARD  SSTL12_DCI        [ get_ports  {ddr_c0_ddr4_adr[0]} ]         ;# Bank  69 VCCO - VCC1V2 Net "DDR4_C1_ADR0"    - IO_L18N_T2U_N11_AD2N_69
set_property PACKAGE_PIN BF8               [ get_ports  {ddr_c0_ddr4_adr[16]} ]        ;# Bank  69 VCCO - VCC1V2 Net "DDR4_C1_ADR16"   - IO_L18P_T2U_N10_AD2P_69
set_property IOSTANDARD  SSTL12_DCI        [ get_ports  {ddr_c0_ddr4_adr[16]} ]        ;# Bank  69 VCCO - VCC1V2 Net "DDR4_C1_ADR16"   - IO_L18P_T2U_N10_AD2P_69
set_property PACKAGE_PIN BG7               [ get_ports  {ddr_c0_ddr4_adr[7]} ]         ;# Bank  69 VCCO - VCC1V2 Net "DDR4_C1_ADR7"    - IO_L17N_T2U_N9_AD10N_69
set_property IOSTANDARD  SSTL12_DCI        [ get_ports  {ddr_c0_ddr4_adr[7]} ]         ;# Bank  69 VCCO - VCC1V2 Net "DDR4_C1_ADR7"    - IO_L17N_T2U_N9_AD10N_69
set_property PACKAGE_PIN BG8               [ get_ports  {ddr_c0_ddr4_ba[0]} ]          ;# Bank  69 VCCO - VCC1V2 Net "DDR4_C1_BA0"     - IO_L17P_T2U_N8_AD10P_69
set_property IOSTANDARD  SSTL12_DCI        [ get_ports  {ddr_c0_ddr4_ba[0]} ]          ;# Bank  69 VCCO - VCC1V2 Net "DDR4_C1_BA0"     - IO_L17P_T2U_N8_AD10P_69
#set_property PACKAGE_PIN BJ7               [ get_ports  {ddr_c0_ddr4_ck_c[1]} ]        ;# Bank  69 VCCO - VCC1V2 Net "DDR4_C1_CK_C1"   - IO_L16N_T2U_N7_QBC_AD3N_69
#set_property IOSTANDARD  DIFF_SSTL12_DCI   [ get_ports  {ddr_c0_ddr4_ck_c[1]} ]        ;# Bank  69 VCCO - VCC1V2 Net "DDR4_C1_CK_C1"   - IO_L16N_T2U_N7_QBC_AD3N_69
#set_property PACKAGE_PIN BH7               [ get_ports  {ddr_c0_ddr4_ck_t[1]} ]        ;# Bank  69 VCCO - VCC1V2 Net "DDR4_C1_CK_T1"   - IO_L16P_T2U_N6_QBC_AD3P_69
#set_property IOSTANDARD  DIFF_SSTL12_DCI   [ get_ports  {ddr_c0_ddr4_ck_t[1]} ]        ;# Bank  69 VCCO - VCC1V2 Net "DDR4_C1_CK_T1"   - IO_L16P_T2U_N6_QBC_AD3P_69
set_property PACKAGE_PIN BK8               [ get_ports  {ddr_c0_ddr4_adr[14]} ]        ;# Bank  69 VCCO - VCC1V2 Net "DDR4_C1_ADR14"   - IO_L15N_T2L_N5_AD11N_69
set_property IOSTANDARD  SSTL12_DCI        [ get_ports  {ddr_c0_ddr4_adr[14]} ]        ;# Bank  69 VCCO - VCC1V2 Net "DDR4_C1_ADR14"   - IO_L15N_T2L_N5_AD11N_69
set_property PACKAGE_PIN BJ8               [ get_ports  {ddr_c0_ddr4_adr[10]} ]        ;# Bank  69 VCCO - VCC1V2 Net "DDR4_C1_ADR10"   - IO_L15P_T2L_N4_AD11P_69
set_property IOSTANDARD  SSTL12_DCI        [ get_ports  {ddr_c0_ddr4_adr[10]} ]        ;# Bank  69 VCCO - VCC1V2 Net "DDR4_C1_ADR10"   - IO_L15P_T2L_N4_AD11P_69
#set_property PACKAGE_PIN BH4               [ get_ports  {ddr_c0_ddr4_odt[1]} ]         ;# Bank  69 VCCO - VCC1V2 Net "DDR4_C1_ODT1"    - IO_L14N_T2L_N3_GC_69
#set_property IOSTANDARD  SSTL12_DCI        [ get_ports  {ddr_c0_ddr4_odt[1]} ]         ;# Bank  69 VCCO - VCC1V2 Net "DDR4_C1_ODT1"    - IO_L14N_T2L_N3_GC_69
#set_property PACKAGE_PIN BH5               [ get_ports  {ddr_c0_ddr4_cs_n[1]} ]        ;# Bank  69 VCCO - VCC1V2 Net "DDR4_C1_CS_B1"   - IO_L14P_T2L_N2_GC_69
#set_property IOSTANDARD  SSTL12_DCI        [ get_ports  {ddr_c0_ddr4_cs_n[1]} ]        ;# Bank  69 VCCO - VCC1V2 Net "DDR4_C1_CS_B1"   - IO_L14P_T2L_N2_GC_69
## Clocks at top of XDC
#set_property PACKAGE_PIN BJ6               [ get_ports  {sys_clk1_n} ]             ;# Bank  69 VCCO - VCC1V2 Net "SYSCLK1_N"       - IO_L13N_T2L_N1_GC_QBC_69
#set_property IOSTANDARD  LVCMOS18          [ get_ports  {sys_clk1_n} ]             ;# Bank  69 VCCO - VCC1V2 Net "SYSCLK1_N"       - IO_L13N_T2L_N1_GC_QBC_69
#set_property PACKAGE_PIN BH6               [ get_ports  {sys_clk1_p} ]             ;# Bank  69 VCCO - VCC1V2 Net "SYSCLK1_P"       - IO_L13P_T2L_N0_GC_QBC_69
#set_property IOSTANDARD  LVCMOS18          [ get_ports  {sys_clk1_p} ]             ;# Bank  69 VCCO - VCC1V2 Net "SYSCLK1_P"       - IO_L13P_T2L_N0_GC_QBC_69
###  <<<<NOTE>>>> No external BIAS on AC coupled LVDS clock inputs to 1.2V bank so this constraint is added to recenter LVDS signal on 1.2V IO standard.
#set_property DQS_BIAS    TRUE              [ get_ports  {sys_clk1_p} ]             ;# Bank  69 VCCO - VCC1V2 Net "SYSCLK1_P"       - IO_L13P_T2L_N0_GC_QBC_69
set_property PACKAGE_PIN BK4               [ get_ports  {ddr_c0_ddr4_ba[1]} ]          ;# Bank  69 VCCO - VCC1V2 Net "DDR4_C1_BA1"     - IO_L12N_T1U_N11_GC_69
set_property IOSTANDARD  SSTL12_DCI        [ get_ports  {ddr_c0_ddr4_ba[1]} ]          ;# Bank  69 VCCO - VCC1V2 Net "DDR4_C1_BA1"     - IO_L12N_T1U_N11_GC_69
set_property PACKAGE_PIN BK5               [ get_ports  {ddr_c0_ddr4_adr[13]} ]        ;# Bank  69 VCCO - VCC1V2 Net "DDR4_C1_ADR13"   - IO_L12P_T1U_N10_GC_69
set_property IOSTANDARD  SSTL12_DCI        [ get_ports  {ddr_c0_ddr4_adr[13]} ]        ;# Bank  69 VCCO - VCC1V2 Net "DDR4_C1_ADR13"   - IO_L12P_T1U_N10_GC_69
#set_property PACKAGE_PIN BK3               [ get_ports  {ddr_c0_ddr4_alert_n} ]        ;# Bank  69 VCCO - VCC1V2 Net "DDR4_C1_ALERT_B" - IO_L11N_T1U_N9_GC_69
#set_property IOSTANDARD  LVCMOS12          [ get_ports  {ddr_c0_ddr4_alert_n} ]        ;# Bank  69 VCCO - VCC1V2 Net "DDR4_C1_ALERT_B" - IO_L11N_T1U_N9_GC_69
set_property PACKAGE_PIN BJ4               [ get_ports  {ddr_c0_ddr4_adr[15]} ]        ;# Bank  69 VCCO - VCC1V2 Net "DDR4_C1_ADR15"   - IO_L11P_T1U_N8_GC_69
set_property IOSTANDARD  SSTL12_DCI        [ get_ports  {ddr_c0_ddr4_adr[15]} ]        ;# Bank  69 VCCO - VCC1V2 Net "DDR4_C1_ADR15"   - IO_L11P_T1U_N8_GC_69
set_property PACKAGE_PIN BJ2               [ get_ports  {ddr_c0_ddr4_ck_c} ]        ;# Bank  69 VCCO - VCC1V2 Net "DDR4_C1_CK_C0"   - IO_L10N_T1U_N7_QBC_AD4N_69
set_property IOSTANDARD  DIFF_SSTL12_DCI   [ get_ports  {ddr_c0_ddr4_ck_c} ]        ;# Bank  69 VCCO - VCC1V2 Net "DDR4_C1_CK_C0"   - IO_L10N_T1U_N7_QBC_AD4N_69
set_property PACKAGE_PIN BJ3               [ get_ports  {ddr_c0_ddr4_ck_t} ]        ;# Bank  69 VCCO - VCC1V2 Net "DDR4_C1_CK_T0"   - IO_L10P_T1U_N6_QBC_AD4P_69
set_property IOSTANDARD  DIFF_SSTL12_DCI   [ get_ports  {ddr_c0_ddr4_ck_t} ]        ;# Bank  69 VCCO - VCC1V2 Net "DDR4_C1_CK_T0"   - IO_L10P_T1U_N6_QBC_AD4P_69
set_property PACKAGE_PIN BH1               [ get_ports  {ddr_c0_ddr4_parity} ]         ;# Bank  69 VCCO - VCC1V2 Net "DDR4_C1_PAR"     - IO_L9N_T1L_N5_AD12N_69
set_property IOSTANDARD  SSTL12_DCI        [ get_ports  {ddr_c0_ddr4_parity} ]         ;# Bank  69 VCCO - VCC1V2 Net "DDR4_C1_PAR"     - IO_L9N_T1L_N5_AD12N_69
set_property PACKAGE_PIN BH2               [ get_ports  {ddr_c0_ddr4_odt} ]         ;# Bank  69 VCCO - VCC1V2 Net "DDR4_C1_ODT0"    - IO_L9P_T1L_N4_AD12P_69
set_property IOSTANDARD  SSTL12_DCI        [ get_ports  {ddr_c0_ddr4_odt} ]         ;# Bank  69 VCCO - VCC1V2 Net "DDR4_C1_ODT0"    - IO_L9P_T1L_N4_AD12P_69
set_property PACKAGE_PIN BK1               [ get_ports  {ddr_c0_ddr4_adr[1]} ]         ;# Bank  69 VCCO - VCC1V2 Net "DDR4_C1_ADR1"    - IO_L8N_T1L_N3_AD5N_69
set_property IOSTANDARD  SSTL12_DCI        [ get_ports  {ddr_c0_ddr4_adr[1]} ]         ;# Bank  69 VCCO - VCC1V2 Net "DDR4_C1_ADR1"    - IO_L8N_T1L_N3_AD5N_69
set_property PACKAGE_PIN BJ1               [ get_ports  {ddr_c0_ddr4_adr[8]} ]         ;# Bank  69 VCCO - VCC1V2 Net "DDR4_C1_ADR8"    - IO_L8P_T1L_N2_AD5P_69
set_property IOSTANDARD  SSTL12_DCI        [ get_ports  {ddr_c0_ddr4_adr[8]} ]         ;# Bank  69 VCCO - VCC1V2 Net "DDR4_C1_ADR8"    - IO_L8P_T1L_N2_AD5P_69
set_property PACKAGE_PIN BL2               [ get_ports  {ddr_c0_ddr4_adr[12]} ]        ;# Bank  69 VCCO - VCC1V2 Net "DDR4_C1_ADR12"   - IO_L7N_T1L_N1_QBC_AD13N_69
set_property IOSTANDARD  SSTL12_DCI        [ get_ports  {ddr_c0_ddr4_adr[12]} ]        ;# Bank  69 VCCO - VCC1V2 Net "DDR4_C1_ADR12"   - IO_L7N_T1L_N1_QBC_AD13N_69
set_property PACKAGE_PIN BL3               [ get_ports  {ddr_c0_ddr4_cs_n} ]        ;# Bank  69 VCCO - VCC1V2 Net "DDR4_C1_CS_B0"   - IO_L7P_T1L_N0_QBC_AD13P_69
set_property IOSTANDARD  SSTL12_DCI        [ get_ports  {ddr_c0_ddr4_cs_n} ]        ;# Bank  69 VCCO - VCC1V2 Net "DDR4_C1_CS_B0"   - IO_L7P_T1L_N0_QBC_AD13P_69
#set_property PACKAGE_PIN BK6               [ get_ports  {ddr_c0_ddr4_adr[17]} ]        ;# Bank  69 VCCO - VCC1V2 Net "DDR4_C1_ADR17"   - IO_T1U_N12_69
#set_property IOSTANDARD  SSTL12_DCI        [ get_ports  {ddr_c0_ddr4_adr[17]} ]        ;# Bank  69 VCCO - VCC1V2 Net "DDR4_C1_ADR17"   - IO_T1U_N12_69
set_property PACKAGE_PIN BM3               [ get_ports  {ddr_c0_ddr4_dq[32]} ]         ;# Bank  69 VCCO - VCC1V2 Net "DDR4_C1_DQ32"    - IO_L6N_T0U_N11_AD6N_69
set_property IOSTANDARD  POD12_DCI         [ get_ports  {ddr_c0_ddr4_dq[32]} ]         ;# Bank  69 VCCO - VCC1V2 Net "DDR4_C1_DQ32"    - IO_L6N_T0U_N11_AD6N_69
set_property PACKAGE_PIN BM4               [ get_ports  {ddr_c0_ddr4_dq[33]} ]         ;# Bank  69 VCCO - VCC1V2 Net "DDR4_C1_DQ33"    - IO_L6P_T0U_N10_AD6P_69
set_property IOSTANDARD  POD12_DCI         [ get_ports  {ddr_c0_ddr4_dq[33]} ]         ;# Bank  69 VCCO - VCC1V2 Net "DDR4_C1_DQ33"    - IO_L6P_T0U_N10_AD6P_69
set_property PACKAGE_PIN BM5               [ get_ports  {ddr_c0_ddr4_dq[34]} ]         ;# Bank  69 VCCO - VCC1V2 Net "DDR4_C1_DQ34"    - IO_L5N_T0U_N9_AD14N_69
set_property IOSTANDARD  POD12_DCI         [ get_ports  {ddr_c0_ddr4_dq[34]} ]         ;# Bank  69 VCCO - VCC1V2 Net "DDR4_C1_DQ34"    - IO_L5N_T0U_N9_AD14N_69
set_property PACKAGE_PIN BL6               [ get_ports  {ddr_c0_ddr4_dq[35]} ]         ;# Bank  69 VCCO - VCC1V2 Net "DDR4_C1_DQ35"    - IO_L5P_T0U_N8_AD14P_69
set_property IOSTANDARD  POD12_DCI         [ get_ports  {ddr_c0_ddr4_dq[35]} ]         ;# Bank  69 VCCO - VCC1V2 Net "DDR4_C1_DQ35"    - IO_L5P_T0U_N8_AD14P_69
set_property PACKAGE_PIN BM7               [ get_ports  {ddr_c0_ddr4_dqs_c[8]} ]       ;# Bank  69 VCCO - VCC1V2 Net "DDR4_C1_DQS_C4"  - IO_L4N_T0U_N7_DBC_AD7N_69
set_property IOSTANDARD  DIFF_POD12_DCI    [ get_ports  {ddr_c0_ddr4_dqs_c[8]} ]       ;# Bank  69 VCCO - VCC1V2 Net "DDR4_C1_DQS_C4"  - IO_L4N_T0U_N7_DBC_AD7N_69
set_property PACKAGE_PIN BL7               [ get_ports  {ddr_c0_ddr4_dqs_t[8]} ]       ;# Bank  69 VCCO - VCC1V2 Net "DDR4_C1_DQS_T4"  - IO_L4P_T0U_N6_DBC_AD7P_69
set_property IOSTANDARD  DIFF_POD12_DCI    [ get_ports  {ddr_c0_ddr4_dqs_t[8]} ]       ;# Bank  69 VCCO - VCC1V2 Net "DDR4_C1_DQS_T4"  - IO_L4P_T0U_N6_DBC_AD7P_69
set_property PACKAGE_PIN BN4               [ get_ports  {ddr_c0_ddr4_dq[36]} ]         ;# Bank  69 VCCO - VCC1V2 Net "DDR4_C1_DQ36"    - IO_L3N_T0L_N5_AD15N_69
set_property IOSTANDARD  POD12_DCI         [ get_ports  {ddr_c0_ddr4_dq[36]} ]         ;# Bank  69 VCCO - VCC1V2 Net "DDR4_C1_DQ36"    - IO_L3N_T0L_N5_AD15N_69
set_property PACKAGE_PIN BN5               [ get_ports  {ddr_c0_ddr4_dq[37]} ]         ;# Bank  69 VCCO - VCC1V2 Net "DDR4_C1_DQ37"    - IO_L3P_T0L_N4_AD15P_69
set_property IOSTANDARD  POD12_DCI         [ get_ports  {ddr_c0_ddr4_dq[37]} ]         ;# Bank  69 VCCO - VCC1V2 Net "DDR4_C1_DQ37"    - IO_L3P_T0L_N4_AD15P_69
set_property PACKAGE_PIN BN6               [ get_ports  {ddr_c0_ddr4_dq[38]} ]         ;# Bank  69 VCCO - VCC1V2 Net "DDR4_C1_DQ38"    - IO_L2N_T0L_N3_69
set_property IOSTANDARD  POD12_DCI         [ get_ports  {ddr_c0_ddr4_dq[38]} ]         ;# Bank  69 VCCO - VCC1V2 Net "DDR4_C1_DQ38"    - IO_L2N_T0L_N3_69
set_property PACKAGE_PIN BN7               [ get_ports  {ddr_c0_ddr4_dq[39]} ]         ;# Bank  69 VCCO - VCC1V2 Net "DDR4_C1_DQ39"    - IO_L2P_T0L_N2_69
set_property IOSTANDARD  POD12_DCI         [ get_ports  {ddr_c0_ddr4_dq[39]} ]         ;# Bank  69 VCCO - VCC1V2 Net "DDR4_C1_DQ39"    - IO_L2P_T0L_N2_69
set_property PACKAGE_PIN BP6               [ get_ports  {ddr_c0_ddr4_dqs_c[9]} ]       ;# Bank  69 VCCO - VCC1V2 Net "DDR4_C1_DQS_C13" - IO_L1N_T0L_N1_DBC_69
set_property IOSTANDARD  DIFF_POD12_DCI    [ get_ports  {ddr_c0_ddr4_dqs_c[9]} ]       ;# Bank  69 VCCO - VCC1V2 Net "DDR4_C1_DQS_C13" - IO_L1N_T0L_N1_DBC_69
set_property PACKAGE_PIN BP7               [ get_ports  {ddr_c0_ddr4_dqs_t[9]} ]       ;# Bank  69 VCCO - VCC1V2 Net "DDR4_C1_DQS_T13" - IO_L1P_T0L_N0_DBC_69
set_property IOSTANDARD  DIFF_POD12_DCI    [ get_ports  {ddr_c0_ddr4_dqs_t[9]} ]       ;# Bank  69 VCCO - VCC1V2 Net "DDR4_C1_DQS_T13" - IO_L1P_T0L_N0_DBC_69
set_property PACKAGE_PIN BE9               [ get_ports  {ddr_c0_ddr4_dq[64]} ]         ;# Bank  68 VCCO - VCC1V2 Net "DDR4_C1_DQ65"    - IO_L24N_T3U_N11_68
set_property IOSTANDARD  POD12_DCI         [ get_ports  {ddr_c0_ddr4_dq[64]} ]         ;# Bank  68 VCCO - VCC1V2 Net "DDR4_C1_DQ65"    - IO_L24N_T3U_N11_68
set_property PACKAGE_PIN BE10              [ get_ports  {ddr_c0_ddr4_dq[65]} ]         ;# Bank  68 VCCO - VCC1V2 Net "DDR4_C1_DQ67"    - IO_L24P_T3U_N10_68
set_property IOSTANDARD  POD12_DCI         [ get_ports  {ddr_c0_ddr4_dq[65]} ]         ;# Bank  68 VCCO - VCC1V2 Net "DDR4_C1_DQ67"    - IO_L24P_T3U_N10_68
set_property PACKAGE_PIN BF10              [ get_ports  {ddr_c0_ddr4_dq[66]} ]         ;# Bank  68 VCCO - VCC1V2 Net "DDR4_C1_DQ66"    - IO_L23N_T3U_N9_68
set_property IOSTANDARD  POD12_DCI         [ get_ports  {ddr_c0_ddr4_dq[66]} ]         ;# Bank  68 VCCO - VCC1V2 Net "DDR4_C1_DQ66"    - IO_L23N_T3U_N9_68
set_property PACKAGE_PIN BE11              [ get_ports  {ddr_c0_ddr4_dq[67]} ]         ;# Bank  68 VCCO - VCC1V2 Net "DDR4_C1_DQ64"    - IO_L23P_T3U_N8_68
set_property IOSTANDARD  POD12_DCI         [ get_ports  {ddr_c0_ddr4_dq[67]} ]         ;# Bank  68 VCCO - VCC1V2 Net "DDR4_C1_DQ64"    - IO_L23P_T3U_N8_68
set_property PACKAGE_PIN BF11              [ get_ports  {ddr_c0_ddr4_dqs_c[16]} ]      ;# Bank  68 VCCO - VCC1V2 Net "DDR4_C1_DQS_C8"  - IO_L22N_T3U_N7_DBC_AD0N_68
set_property IOSTANDARD  DIFF_POD12_DCI    [ get_ports  {ddr_c0_ddr4_dqs_c[16]} ]      ;# Bank  68 VCCO - VCC1V2 Net "DDR4_C1_DQS_C8"  - IO_L22N_T3U_N7_DBC_AD0N_68
set_property PACKAGE_PIN BF12              [ get_ports  {ddr_c0_ddr4_dqs_t[16]} ]      ;# Bank  68 VCCO - VCC1V2 Net "DDR4_C1_DQS_T8"  - IO_L22P_T3U_N6_DBC_AD0P_68
set_property IOSTANDARD  DIFF_POD12_DCI    [ get_ports  {ddr_c0_ddr4_dqs_t[16]} ]      ;# Bank  68 VCCO - VCC1V2 Net "DDR4_C1_DQS_T8"  - IO_L22P_T3U_N6_DBC_AD0P_68
set_property PACKAGE_PIN BG9               [ get_ports  {ddr_c0_ddr4_dq[70]} ]         ;# Bank  68 VCCO - VCC1V2 Net "DDR4_C1_DQ71"    - IO_L21N_T3L_N5_AD8N_68
set_property IOSTANDARD  POD12_DCI         [ get_ports  {ddr_c0_ddr4_dq[70]} ]         ;# Bank  68 VCCO - VCC1V2 Net "DDR4_C1_DQ71"    - IO_L21N_T3L_N5_AD8N_68
set_property PACKAGE_PIN BG10              [ get_ports  {ddr_c0_ddr4_dq[71]} ]         ;# Bank  68 VCCO - VCC1V2 Net "DDR4_C1_DQ69"    - IO_L21P_T3L_N4_AD8P_68
set_property IOSTANDARD  POD12_DCI         [ get_ports  {ddr_c0_ddr4_dq[71]} ]         ;# Bank  68 VCCO - VCC1V2 Net "DDR4_C1_DQ69"    - IO_L21P_T3L_N4_AD8P_68
set_property PACKAGE_PIN BG12              [ get_ports  {ddr_c0_ddr4_dq[69]} ]         ;# Bank  68 VCCO - VCC1V2 Net "DDR4_C1_DQ70"    - IO_L20N_T3L_N3_AD1N_68
set_property IOSTANDARD  POD12_DCI         [ get_ports  {ddr_c0_ddr4_dq[69]} ]         ;# Bank  68 VCCO - VCC1V2 Net "DDR4_C1_DQ70"    - IO_L20N_T3L_N3_AD1N_68
set_property PACKAGE_PIN BG13              [ get_ports  {ddr_c0_ddr4_dq[68]} ]         ;# Bank  68 VCCO - VCC1V2 Net "DDR4_C1_DQ68"    - IO_L20P_T3L_N2_AD1P_68
set_property IOSTANDARD  POD12_DCI         [ get_ports  {ddr_c0_ddr4_dq[68]} ]         ;# Bank  68 VCCO - VCC1V2 Net "DDR4_C1_DQ68"    - IO_L20P_T3L_N2_AD1P_68
set_property PACKAGE_PIN BH9               [ get_ports  {ddr_c0_ddr4_dqs_c[17]} ]      ;# Bank  68 VCCO - VCC1V2 Net "DDR4_C1_DQS_C17" - IO_L19N_T3L_N1_DBC_AD9N_68
set_property IOSTANDARD  DIFF_POD12_DCI    [ get_ports  {ddr_c0_ddr4_dqs_c[17]} ]      ;# Bank  68 VCCO - VCC1V2 Net "DDR4_C1_DQS_C17" - IO_L19N_T3L_N1_DBC_AD9N_68
set_property PACKAGE_PIN BH10              [ get_ports  {ddr_c0_ddr4_dqs_t[17]} ]      ;# Bank  68 VCCO - VCC1V2 Net "DDR4_C1_DQS_T17" - IO_L19P_T3L_N0_DBC_AD9P_68
set_property IOSTANDARD  DIFF_POD12_DCI    [ get_ports  {ddr_c0_ddr4_dqs_t[17]} ]      ;# Bank  68 VCCO - VCC1V2 Net "DDR4_C1_DQS_T17" - IO_L19P_T3L_N0_DBC_AD9P_68
#set_property PACKAGE_PIN BH11              [ get_ports  {ddr_c0_ddr4_event_n} ]        ;# Bank  68 VCCO - VCC1V2 Net "DDR4_C1_EVENT_B" - IO_T3U_N12_68
#set_property IOSTANDARD  SSTL12_DCI        [ get_ports  {ddr_c0_ddr4_event_n} ]        ;# Bank  68 VCCO - VCC1V2 Net "DDR4_C1_EVENT_B" - IO_T3U_N12_68
set_property PACKAGE_PIN BH12              [ get_ports  {ddr_c0_ddr4_reset_n} ]        ;# Bank  68 VCCO - VCC1V2 Net "DDR4_C1_RESET_N" - IO_T2U_N12_68
set_property IOSTANDARD  LVCMOS12          [ get_ports  {ddr_c0_ddr4_reset_n} ]        ;# Bank  68 VCCO - VCC1V2 Net "DDR4_C1_RESET_N" - IO_T2U_N12_68
set_property PACKAGE_PIN BH14              [ get_ports  {ddr_c0_ddr4_dq[59]} ]         ;# Bank  68 VCCO - VCC1V2 Net "DDR4_C1_DQ59"    - IO_L18N_T2U_N11_AD2N_68
set_property IOSTANDARD  POD12_DCI         [ get_ports  {ddr_c0_ddr4_dq[59]} ]         ;# Bank  68 VCCO - VCC1V2 Net "DDR4_C1_DQ59"    - IO_L18N_T2U_N11_AD2N_68
set_property PACKAGE_PIN BH15              [ get_ports  {ddr_c0_ddr4_dq[58]} ]         ;# Bank  68 VCCO - VCC1V2 Net "DDR4_C1_DQ58"    - IO_L18P_T2U_N10_AD2P_68
set_property IOSTANDARD  POD12_DCI         [ get_ports  {ddr_c0_ddr4_dq[58]} ]         ;# Bank  68 VCCO - VCC1V2 Net "DDR4_C1_DQ58"    - IO_L18P_T2U_N10_AD2P_68
set_property PACKAGE_PIN BJ12              [ get_ports  {ddr_c0_ddr4_dq[57]} ]         ;# Bank  68 VCCO - VCC1V2 Net "DDR4_C1_DQ57"    - IO_L17N_T2U_N9_AD10N_68
set_property IOSTANDARD  POD12_DCI         [ get_ports  {ddr_c0_ddr4_dq[57]} ]         ;# Bank  68 VCCO - VCC1V2 Net "DDR4_C1_DQ57"    - IO_L17N_T2U_N9_AD10N_68
set_property PACKAGE_PIN BJ13              [ get_ports  {ddr_c0_ddr4_dq[56]} ]         ;# Bank  68 VCCO - VCC1V2 Net "DDR4_C1_DQ56"    - IO_L17P_T2U_N8_AD10P_68
set_property IOSTANDARD  POD12_DCI         [ get_ports  {ddr_c0_ddr4_dq[56]} ]         ;# Bank  68 VCCO - VCC1V2 Net "DDR4_C1_DQ56"    - IO_L17P_T2U_N8_AD10P_68
set_property PACKAGE_PIN BK13              [ get_ports  {ddr_c0_ddr4_dqs_c[14]} ]      ;# Bank  68 VCCO - VCC1V2 Net "DDR4_C1_DQS_C7"  - IO_L16N_T2U_N7_QBC_AD3N_68
set_property IOSTANDARD  DIFF_POD12_DCI    [ get_ports  {ddr_c0_ddr4_dqs_c[14]} ]      ;# Bank  68 VCCO - VCC1V2 Net "DDR4_C1_DQS_C7"  - IO_L16N_T2U_N7_QBC_AD3N_68
set_property PACKAGE_PIN BJ14              [ get_ports  {ddr_c0_ddr4_dqs_t[14]} ]      ;# Bank  68 VCCO - VCC1V2 Net "DDR4_C1_DQS_T7"  - IO_L16P_T2U_N6_QBC_AD3P_68
set_property IOSTANDARD  DIFF_POD12_DCI    [ get_ports  {ddr_c0_ddr4_dqs_t[14]} ]      ;# Bank  68 VCCO - VCC1V2 Net "DDR4_C1_DQS_T7"  - IO_L16P_T2U_N6_QBC_AD3P_68
set_property PACKAGE_PIN BK14              [ get_ports  {ddr_c0_ddr4_dq[60]} ]         ;# Bank  68 VCCO - VCC1V2 Net "DDR4_C1_DQ60"    - IO_L15N_T2L_N5_AD11N_68
set_property IOSTANDARD  POD12_DCI         [ get_ports  {ddr_c0_ddr4_dq[60]} ]         ;# Bank  68 VCCO - VCC1V2 Net "DDR4_C1_DQ60"    - IO_L15N_T2L_N5_AD11N_68
set_property PACKAGE_PIN BK15              [ get_ports  {ddr_c0_ddr4_dq[61]} ]         ;# Bank  68 VCCO - VCC1V2 Net "DDR4_C1_DQ61"    - IO_L15P_T2L_N4_AD11P_68
set_property IOSTANDARD  POD12_DCI         [ get_ports  {ddr_c0_ddr4_dq[61]} ]         ;# Bank  68 VCCO - VCC1V2 Net "DDR4_C1_DQ61"    - IO_L15P_T2L_N4_AD11P_68
set_property PACKAGE_PIN BL12              [ get_ports  {ddr_c0_ddr4_dq[62]} ]         ;# Bank  68 VCCO - VCC1V2 Net "DDR4_C1_DQ62"    - IO_L14N_T2L_N3_GC_68
set_property IOSTANDARD  POD12_DCI         [ get_ports  {ddr_c0_ddr4_dq[62]} ]         ;# Bank  68 VCCO - VCC1V2 Net "DDR4_C1_DQ62"    - IO_L14N_T2L_N3_GC_68
set_property PACKAGE_PIN BL13              [ get_ports  {ddr_c0_ddr4_dq[63]} ]         ;# Bank  68 VCCO - VCC1V2 Net "DDR4_C1_DQ63"    - IO_L14P_T2L_N2_GC_68
set_property IOSTANDARD  POD12_DCI         [ get_ports  {ddr_c0_ddr4_dq[63]} ]         ;# Bank  68 VCCO - VCC1V2 Net "DDR4_C1_DQ63"    - IO_L14P_T2L_N2_GC_68
set_property PACKAGE_PIN BK11              [ get_ports  {ddr_c0_ddr4_dqs_c[15]} ]      ;# Bank  68 VCCO - VCC1V2 Net "DDR4_C1_DQS_C16" - IO_L13N_T2L_N1_GC_QBC_68
set_property IOSTANDARD  DIFF_POD12_DCI    [ get_ports  {ddr_c0_ddr4_dqs_c[15]} ]      ;# Bank  68 VCCO - VCC1V2 Net "DDR4_C1_DQS_C16" - IO_L13N_T2L_N1_GC_QBC_68
set_property PACKAGE_PIN BJ11              [ get_ports  {ddr_c0_ddr4_dqs_t[15]} ]      ;# Bank  68 VCCO - VCC1V2 Net "DDR4_C1_DQS_T16" - IO_L13P_T2L_N0_GC_QBC_68
set_property IOSTANDARD  DIFF_POD12_DCI    [ get_ports  {ddr_c0_ddr4_dqs_t[15]} ]      ;# Bank  68 VCCO - VCC1V2 Net "DDR4_C1_DQS_T16" - IO_L13P_T2L_N0_GC_QBC_68
set_property PACKAGE_PIN BK9               [ get_ports  {ddr_c0_ddr4_dq[41]} ]         ;# Bank  68 VCCO - VCC1V2 Net "DDR4_C1_DQ41"    - IO_L12N_T1U_N11_GC_68
set_property IOSTANDARD  POD12_DCI         [ get_ports  {ddr_c0_ddr4_dq[41]} ]         ;# Bank  68 VCCO - VCC1V2 Net "DDR4_C1_DQ41"    - IO_L12N_T1U_N11_GC_68
set_property PACKAGE_PIN BJ9               [ get_ports  {ddr_c0_ddr4_dq[40]} ]         ;# Bank  68 VCCO - VCC1V2 Net "DDR4_C1_DQ40"    - IO_L12P_T1U_N10_GC_68
set_property IOSTANDARD  POD12_DCI         [ get_ports  {ddr_c0_ddr4_dq[40]} ]         ;# Bank  68 VCCO - VCC1V2 Net "DDR4_C1_DQ40"    - IO_L12P_T1U_N10_GC_68
set_property PACKAGE_PIN BL10              [ get_ports  {ddr_c0_ddr4_dq[43]} ]         ;# Bank  68 VCCO - VCC1V2 Net "DDR4_C1_DQ43"    - IO_L11N_T1U_N9_GC_68
set_property IOSTANDARD  POD12_DCI         [ get_ports  {ddr_c0_ddr4_dq[43]} ]         ;# Bank  68 VCCO - VCC1V2 Net "DDR4_C1_DQ43"    - IO_L11N_T1U_N9_GC_68
set_property PACKAGE_PIN BK10              [ get_ports  {ddr_c0_ddr4_dq[42]} ]         ;# Bank  68 VCCO - VCC1V2 Net "DDR4_C1_DQ42"    - IO_L11P_T1U_N8_GC_68
set_property IOSTANDARD  POD12_DCI         [ get_ports  {ddr_c0_ddr4_dq[42]} ]         ;# Bank  68 VCCO - VCC1V2 Net "DDR4_C1_DQ42"    - IO_L11P_T1U_N8_GC_68
set_property PACKAGE_PIN BM8               [ get_ports  {ddr_c0_ddr4_dqs_c[10]} ]      ;# Bank  68 VCCO - VCC1V2 Net "DDR4_C1_DQS_C5"  - IO_L10N_T1U_N7_QBC_AD4N_68
set_property IOSTANDARD  DIFF_POD12_DCI    [ get_ports  {ddr_c0_ddr4_dqs_c[10]} ]      ;# Bank  68 VCCO - VCC1V2 Net "DDR4_C1_DQS_C5"  - IO_L10N_T1U_N7_QBC_AD4N_68
set_property PACKAGE_PIN BL8               [ get_ports  {ddr_c0_ddr4_dqs_t[10]} ]      ;# Bank  68 VCCO - VCC1V2 Net "DDR4_C1_DQS_T5"  - IO_L10P_T1U_N6_QBC_AD4P_68
set_property IOSTANDARD  DIFF_POD12_DCI    [ get_ports  {ddr_c0_ddr4_dqs_t[10]} ]      ;# Bank  68 VCCO - VCC1V2 Net "DDR4_C1_DQS_T5"  - IO_L10P_T1U_N6_QBC_AD4P_68
set_property PACKAGE_PIN BN9               [ get_ports  {ddr_c0_ddr4_dq[45]} ]         ;# Bank  68 VCCO - VCC1V2 Net "DDR4_C1_DQ45"    - IO_L9N_T1L_N5_AD12N_68
set_property IOSTANDARD  POD12_DCI         [ get_ports  {ddr_c0_ddr4_dq[45]} ]         ;# Bank  68 VCCO - VCC1V2 Net "DDR4_C1_DQ45"    - IO_L9N_T1L_N5_AD12N_68
set_property PACKAGE_PIN BM9               [ get_ports  {ddr_c0_ddr4_dq[44]} ]         ;# Bank  68 VCCO - VCC1V2 Net "DDR4_C1_DQ44"    - IO_L9P_T1L_N4_AD12P_68
set_property IOSTANDARD  POD12_DCI         [ get_ports  {ddr_c0_ddr4_dq[44]} ]         ;# Bank  68 VCCO - VCC1V2 Net "DDR4_C1_DQ44"    - IO_L9P_T1L_N4_AD12P_68
set_property PACKAGE_PIN BN10              [ get_ports  {ddr_c0_ddr4_dq[46]} ]         ;# Bank  68 VCCO - VCC1V2 Net "DDR4_C1_DQ46"    - IO_L8N_T1L_N3_AD5N_68
set_property IOSTANDARD  POD12_DCI         [ get_ports  {ddr_c0_ddr4_dq[46]} ]         ;# Bank  68 VCCO - VCC1V2 Net "DDR4_C1_DQ46"    - IO_L8N_T1L_N3_AD5N_68
set_property PACKAGE_PIN BM10              [ get_ports  {ddr_c0_ddr4_dq[47]} ]         ;# Bank  68 VCCO - VCC1V2 Net "DDR4_C1_DQ47"    - IO_L8P_T1L_N2_AD5P_68
set_property IOSTANDARD  POD12_DCI         [ get_ports  {ddr_c0_ddr4_dq[47]} ]         ;# Bank  68 VCCO - VCC1V2 Net "DDR4_C1_DQ47"    - IO_L8P_T1L_N2_AD5P_68
set_property PACKAGE_PIN BP8               [ get_ports  {ddr_c0_ddr4_dqs_c[11]} ]      ;# Bank  68 VCCO - VCC1V2 Net "DDR4_C1_DQS_C14" - IO_L7N_T1L_N1_QBC_AD13N_68
set_property IOSTANDARD  DIFF_POD12_DCI    [ get_ports  {ddr_c0_ddr4_dqs_c[11]} ]      ;# Bank  68 VCCO - VCC1V2 Net "DDR4_C1_DQS_C14" - IO_L7N_T1L_N1_QBC_AD13N_68
set_property PACKAGE_PIN BP9               [ get_ports  {ddr_c0_ddr4_dqs_t[11]} ]      ;# Bank  68 VCCO - VCC1V2 Net "DDR4_C1_DQS_T14" - IO_L7P_T1L_N0_QBC_AD13P_68
set_property IOSTANDARD  DIFF_POD12_DCI    [ get_ports  {ddr_c0_ddr4_dqs_t[11]} ]      ;# Bank  68 VCCO - VCC1V2 Net "DDR4_C1_DQS_T14" - IO_L7P_T1L_N0_QBC_AD13P_68
#set_property PACKAGE_PIN BL11              #N/A                                    ;# Bank  68 VCCO - VCC1V2 Net "Not Connected"   - IO_T1U_N12_68
#set_property IOSTANDARD  LVCMOS18          #N/A                                    ;# Bank  68 VCCO - VCC1V2 Net "Not Connected"   - IO_T1U_N12_68
set_property PACKAGE_PIN BM15              [ get_ports  {ddr_c0_ddr4_dq[48]} ]         ;# Bank  68 VCCO - VCC1V2 Net "DDR4_C1_DQ48"    - IO_L6N_T0U_N11_AD6N_68
set_property IOSTANDARD  POD12_DCI         [ get_ports  {ddr_c0_ddr4_dq[48]} ]         ;# Bank  68 VCCO - VCC1V2 Net "DDR4_C1_DQ48"    - IO_L6N_T0U_N11_AD6N_68
set_property PACKAGE_PIN BL15              [ get_ports  {ddr_c0_ddr4_dq[50]} ]         ;# Bank  68 VCCO - VCC1V2 Net "DDR4_C1_DQ50"    - IO_L6P_T0U_N10_AD6P_68
set_property IOSTANDARD  POD12_DCI         [ get_ports  {ddr_c0_ddr4_dq[50]} ]         ;# Bank  68 VCCO - VCC1V2 Net "DDR4_C1_DQ50"    - IO_L6P_T0U_N10_AD6P_68
set_property PACKAGE_PIN BM13              [ get_ports  {ddr_c0_ddr4_dq[51]} ]         ;# Bank  68 VCCO - VCC1V2 Net "DDR4_C1_DQ51"    - IO_L5N_T0U_N9_AD14N_68
set_property IOSTANDARD  POD12_DCI         [ get_ports  {ddr_c0_ddr4_dq[51]} ]         ;# Bank  68 VCCO - VCC1V2 Net "DDR4_C1_DQ51"    - IO_L5N_T0U_N9_AD14N_68
set_property PACKAGE_PIN BM14              [ get_ports  {ddr_c0_ddr4_dq[49]} ]         ;# Bank  68 VCCO - VCC1V2 Net "DDR4_C1_DQ49"    - IO_L5P_T0U_N8_AD14P_68
set_property IOSTANDARD  POD12_DCI         [ get_ports  {ddr_c0_ddr4_dq[49]} ]         ;# Bank  68 VCCO - VCC1V2 Net "DDR4_C1_DQ49"    - IO_L5P_T0U_N8_AD14P_68
set_property PACKAGE_PIN BN14              [ get_ports  {ddr_c0_ddr4_dqs_c[12]} ]      ;# Bank  68 VCCO - VCC1V2 Net "DDR4_C1_DQS_C6"  - IO_L4N_T0U_N7_DBC_AD7N_68
set_property IOSTANDARD  DIFF_POD12_DCI    [ get_ports  {ddr_c0_ddr4_dqs_c[12]} ]      ;# Bank  68 VCCO - VCC1V2 Net "DDR4_C1_DQS_C6"  - IO_L4N_T0U_N7_DBC_AD7N_68
set_property PACKAGE_PIN BN15              [ get_ports  {ddr_c0_ddr4_dqs_t[12]} ]      ;# Bank  68 VCCO - VCC1V2 Net "DDR4_C1_DQS_T6"  - IO_L4P_T0U_N6_DBC_AD7P_68
set_property IOSTANDARD  DIFF_POD12_DCI    [ get_ports  {ddr_c0_ddr4_dqs_t[12]} ]      ;# Bank  68 VCCO - VCC1V2 Net "DDR4_C1_DQS_T6"  - IO_L4P_T0U_N6_DBC_AD7P_68
set_property PACKAGE_PIN BN12              [ get_ports  {ddr_c0_ddr4_dq[52]} ]         ;# Bank  68 VCCO - VCC1V2 Net "DDR4_C1_DQ52"    - IO_L3N_T0L_N5_AD15N_68
set_property IOSTANDARD  POD12_DCI         [ get_ports  {ddr_c0_ddr4_dq[52]} ]         ;# Bank  68 VCCO - VCC1V2 Net "DDR4_C1_DQ52"    - IO_L3N_T0L_N5_AD15N_68
set_property PACKAGE_PIN BM12              [ get_ports  {ddr_c0_ddr4_dq[53]} ]         ;# Bank  68 VCCO - VCC1V2 Net "DDR4_C1_DQ53"    - IO_L3P_T0L_N4_AD15P_68
set_property IOSTANDARD  POD12_DCI         [ get_ports  {ddr_c0_ddr4_dq[53]} ]         ;# Bank  68 VCCO - VCC1V2 Net "DDR4_C1_DQ53"    - IO_L3P_T0L_N4_AD15P_68
set_property PACKAGE_PIN BP13              [ get_ports  {ddr_c0_ddr4_dq[54]} ]         ;# Bank  68 VCCO - VCC1V2 Net "DDR4_C1_DQ54"    - IO_L2N_T0L_N3_68
set_property IOSTANDARD  POD12_DCI         [ get_ports  {ddr_c0_ddr4_dq[54]} ]         ;# Bank  68 VCCO - VCC1V2 Net "DDR4_C1_DQ54"    - IO_L2N_T0L_N3_68
set_property PACKAGE_PIN BP14              [ get_ports  {ddr_c0_ddr4_dq[55]} ]         ;# Bank  68 VCCO - VCC1V2 Net "DDR4_C1_DQ55"    - IO_L2P_T0L_N2_68
set_property IOSTANDARD  POD12_DCI         [ get_ports  {ddr_c0_ddr4_dq[55]} ]         ;# Bank  68 VCCO - VCC1V2 Net "DDR4_C1_DQ55"    - IO_L2P_T0L_N2_68
set_property PACKAGE_PIN BP11              [ get_ports  {ddr_c0_ddr4_dqs_c[13]} ]      ;# Bank  68 VCCO - VCC1V2 Net "DDR4_C1_DQS_C15" - IO_L1N_T0L_N1_DBC_68
set_property IOSTANDARD  DIFF_POD12_DCI    [ get_ports  {ddr_c0_ddr4_dqs_c[13]} ]      ;# Bank  68 VCCO - VCC1V2 Net "DDR4_C1_DQS_C15" - IO_L1N_T0L_N1_DBC_68
set_property PACKAGE_PIN BP12              [ get_ports  {ddr_c0_ddr4_dqs_t[13]} ]      ;# Bank  68 VCCO - VCC1V2 Net "DDR4_C1_DQS_T15" - IO_L1P_T0L_N0_DBC_68
set_property IOSTANDARD  DIFF_POD12_DCI    [ get_ports  {ddr_c0_ddr4_dqs_t[13]} ]
