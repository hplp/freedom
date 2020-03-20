#-------------- MCS Generation ----------------------
# verified, should be good
set_property BITSTREAM.CONFIG.EXTMASTERCCLK_EN div-1 [current_design]
set_property BITSTREAM.CONFIG.SPI_FALL_EDGE YES [current_design]
set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 8 [current_design]
set_property BITSTREAM.GENERAL.COMPRESS TRUE [current_design]
set_property BITSTREAM.CONFIG.UNUSEDPIN Pullnone [current_design]
set_property CFGBVS GND [current_design]
set_property CONFIG_VOLTAGE 1.8 [current_design]
set_property CONFIG_MODE SPIx8 [current_design]


#---------------Physical Constraints-----------------

# 300 MHz clock, Modified
set_property IOSTANDARD DIFF_SSTL12 [get_ports sys_diff_clock_clk_p]

set_property PACKAGE_PIN J24 [get_ports sys_diff_clock_clk_p]
set_property PACKAGE_PIN H24 [get_ports sys_diff_clock_clk_n]
set_property IOSTANDARD DIFF_SSTL12 [get_ports sys_diff_clock_clk_n]

set_property PACKAGE_PIN J29 [get_ports reset]
set_property IOSTANDARD LVCMOS12 [get_ports reset]
set_false_path -from [get_ports reset]

create_clock -period 3.330 -name sys_diff_clk [get_ports sys_diff_clock_clk_p]
set_input_jitter [get_clocks -of_objects [get_ports sys_diff_clock_clk_p]] 0.050


# UART Modified
set_property PACKAGE_PIN AR20 [get_ports uart_rx]
set_property IOSTANDARD LVCMOS18 [get_ports uart_rx]
#set_property IOB TRUE [get_ports uart_rx]
set_property PACKAGE_PIN AR19 [get_ports uart_ctsn]
set_property IOSTANDARD LVCMOS18 [get_ports uart_ctsn]
#set_property IOB TRUE [get_ports uart_ctsn]
set_property PACKAGE_PIN AT20 [get_ports uart_tx]
set_property IOSTANDARD LVCMOS18 [get_ports uart_tx]
#set_property IOB TRUE [get_ports uart_tx]
set_property PACKAGE_PIN AU19 [get_ports uart_rtsn]
set_property IOSTANDARD LVCMOS18 [get_ports uart_rtsn]
#set_property IOB TRUE [get_ports uart_rtsn]

# Platform specific constraints
set_property IOB TRUE [get_cells "U500VCU118System/uarts_0/txm/out_reg"]
set_property IOB TRUE [get_cells "uart_rxd_sync/sync_1"]

# JTAG, it seems it is used for internal debugging
# It is connected to Pmod1, try not connect it, see what happens
# No, have to connect it, otherwise vivado complain about it
# Move this to the JTAG Port 3 on vcu110 board
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets jtag_TCK_IBUF_inst/O]
set_property -dict {PACKAGE_PIN BF30 IOSTANDARD LVCMOS12} [get_ports jtag_TCK]
set_property -dict {PACKAGE_PIN BF31 IOSTANDARD LVCMOS12} [get_ports jtag_TMS]
set_property -dict {PACKAGE_PIN BD30 IOSTANDARD LVCMOS12} [get_ports jtag_TDI]
set_property -dict {PACKAGE_PIN BC31 IOSTANDARD LVCMOS12} [get_ports jtag_TDO]

# SDIO
# Connect to Pmod0, double check!
# comflict with user guide

#Pmod 0 L23 -> k23
#Pmod 1 J22 -> k21
#Pmod 2 J21 -> L24
#Pmod 3 J25 -> H25
#Pmod 4 k23 -> L23
#Pmod 5 k21 -> J22
#Pmod 6 L24 -> J21
#Pmod 7 H25 -> J25


set_property -dict {PACKAGE_PIN H25 IOSTANDARD LVCMOS12} [get_ports sdio_clk]
set_property -dict {PACKAGE_PIN K21 IOSTANDARD LVCMOS12} [get_ports sdio_cmd]
set_property -dict {PACKAGE_PIN L24 IOSTANDARD LVCMOS12} [get_ports {sdio_dat[0]}]
set_property -dict {PACKAGE_PIN L23 IOSTANDARD LVCMOS12} [get_ports {sdio_dat[1]}]
set_property -dict {PACKAGE_PIN J22 IOSTANDARD LVCMOS12} [get_ports {sdio_dat[2]}]
set_property -dict {PACKAGE_PIN K23 IOSTANDARD LVCMOS12} [get_ports {sdio_dat[3]}]

#set_property -dict {PACKAGE_PIN J25 IOSTANDARD LVCMOS12} [get_ports sdio_clk] # Pmod 3 - >
#set_property -dict {PACKAGE_PIN J22 IOSTANDARD LVCMOS12} [get_ports sdio_cmd] #
#set_property -dict {PACKAGE_PIN J21 IOSTANDARD LVCMOS12} [get_ports {sdio_dat[0]}]
#set_property -dict {PACKAGE_PIN K23 IOSTANDARD LVCMOS12} [get_ports {sdio_dat[1]}]
#set_property -dict {PACKAGE_PIN K21 IOSTANDARD LVCMOS12} [get_ports {sdio_dat[2]}]
#set_property -dict {PACKAGE_PIN L23 IOSTANDARD LVCMOS12} [get_ports {sdio_dat[3]}]

set_property DRIVE 8 [get_ports sdio_clk]
set_property DRIVE 8 [get_ports sdio_cmd]
set_property DRIVE 8 [get_ports {sdio_dat[0]}]
set_property DRIVE 8 [get_ports {sdio_dat[1]}]
set_property DRIVE 8 [get_ports {sdio_dat[2]}]
set_property DRIVE 8 [get_ports {sdio_dat[3]}]

# It is not required to provide IO standards for GT clock
set_property PACKAGE_PIN AC10 [get_ports refclk_n]
set_property PACKAGE_PIN AC11 [get_ports refclk_p]
create_clock -period 8.000 -name refclk_p -waveform {0.000 4.000} [get_ports refclk_p]

# clk_in
set_property IOSTANDARD LVDS [get_ports diff_clk_in_p]
set_property PACKAGE_PIN AV20 [get_ports diff_clk_in_p]
set_property PACKAGE_PIN AW20 [get_ports diff_clk_in_n]
set_property IOSTANDARD LVDS [get_ports diff_clk_in_n]
create_clock -period 8.000 -name diff_clk_in_p -waveform {0.000 4.000} [get_ports diff_clk_in_p]


## HMC Interface
set_property PACKAGE_PIN BA26 [get_ports refclk_boot_0]
set_property IOSTANDARD LVCMOS15 [get_ports refclk_boot_0]
set_property PACKAGE_PIN BB26 [get_ports refclk_boot_1]
set_property IOSTANDARD LVCMOS15 [get_ports refclk_boot_1]
set_property PACKAGE_PIN AV30 [get_ports refclk_sel]
set_property IOSTANDARD LVCMOS15 [get_ports refclk_sel]
set_property PACKAGE_PIN AW28 [get_ports device_p_rst_n]
set_property IOSTANDARD LVCMOS15 [get_ports device_p_rst_n]



set_property PACKAGE_PIN AV21 [get_ports iic_main_sda_ls]
set_property IOSTANDARD LVCMOS18 [get_ports iic_main_sda_ls]
set_property PACKAGE_PIN AV19 [get_ports iic_main_scl_ls]
set_property IOSTANDARD LVCMOS18 [get_ports iic_main_scl_ls]

set_property PACKAGE_PIN AW27 [get_ports lxrxps]
set_property IOSTANDARD LVCMOS15 [get_ports lxrxps]
set_property PACKAGE_PIN AY30 [get_ports lxtxps]
set_property IOSTANDARD LVCMOS15 [get_ports lxtxps]

#GPIO
set_property PACKAGE_PIN N25 [get_ports gpio_led_0_ls]
set_property IOSTANDARD LVCMOS12 [get_ports gpio_led_0_ls]
set_property PACKAGE_PIN N22 [get_ports gpio_led_1_ls]
set_property IOSTANDARD LVCMOS12 [get_ports gpio_led_1_ls]
set_property PACKAGE_PIN M22 [get_ports gpio_led_2_ls]
set_property IOSTANDARD LVCMOS12 [get_ports gpio_led_2_ls]
set_property PACKAGE_PIN M26 [get_ports gpio_led_3_ls]
set_property IOSTANDARD LVCMOS12 [get_ports gpio_led_3_ls]
set_property PACKAGE_PIN M25 [get_ports gpio_led_4_ls]
set_property IOSTANDARD LVCMOS12 [get_ports gpio_led_4_ls]
set_property PACKAGE_PIN P24 [get_ports gpio_led_5_ls]
set_property IOSTANDARD LVCMOS12 [get_ports gpio_led_5_ls]
set_property PACKAGE_PIN N24 [get_ports gpio_led_6_ls]
set_property IOSTANDARD LVCMOS12 [get_ports gpio_led_6_ls]
set_property PACKAGE_PIN N23 [get_ports gpio_led_7_ls]
set_property IOSTANDARD LVCMOS12 [get_ports gpio_led_7_ls]

set_property DRIVE 8 [get_ports gpio_led_0_ls]
set_property DRIVE 8 [get_ports gpio_led_1_ls]
set_property DRIVE 8 [get_ports gpio_led_2_ls]
set_property DRIVE 8 [get_ports gpio_led_3_ls]
set_property DRIVE 8 [get_ports gpio_led_4_ls]
set_property DRIVE 8 [get_ports gpio_led_5_ls]
set_property DRIVE 8 [get_ports gpio_led_6_ls]
set_property DRIVE 8 [get_ports gpio_led_7_ls]

set_property PACKAGE_PIN AR18 [get_ports iic_mux_reset_b_ls]
set_property IOSTANDARD LVCMOS18 [get_ports iic_mux_reset_b_ls]

set_property PACKAGE_PIN AW21 [get_ports si5328_rst_n_ls]
set_property IOSTANDARD LVCMOS18 [get_ports si5328_rst_n_ls]

set_property PACKAGE_PIN AT21 [get_ports sm_fan_pwm]
set_property IOSTANDARD LVCMOS18 [get_ports sm_fan_pwm]
set_property PACKAGE_PIN AT19 [get_ports sm_fan_tach]
set_property IOSTANDARD LVCMOS18 [get_ports sm_fan_tach]


# PCIE
set_property PACKAGE_PIN D14 [get_ports {pcie_7x_mgt_rtl_rxp[0]}]
set_property PACKAGE_PIN C16 [get_ports {pcie_7x_mgt_rtl_rxp[1]}]
set_property PACKAGE_PIN B14 [get_ports {pcie_7x_mgt_rtl_rxp[2]}]
set_property PACKAGE_PIN A16 [get_ports {pcie_7x_mgt_rtl_rxp[3]}]

set_property PACKAGE_PIN A11 [get_ports {pcie_7x_mgt_rtl_txp[3]}]
set_property PACKAGE_PIN B9 [get_ports {pcie_7x_mgt_rtl_txp[2]}]
set_property PACKAGE_PIN C11 [get_ports {pcie_7x_mgt_rtl_txp[1]}]
set_property PACKAGE_PIN D9 [get_ports {pcie_7x_mgt_rtl_txp[0]}]

set_property PACKAGE_PIN A15 [get_ports {pcie_7x_mgt_rtl_rxn[3]}]
set_property PACKAGE_PIN B13 [get_ports {pcie_7x_mgt_rtl_rxn[2]}]
set_property PACKAGE_PIN C15 [get_ports {pcie_7x_mgt_rtl_rxn[1]}]
set_property PACKAGE_PIN D13 [get_ports {pcie_7x_mgt_rtl_rxn[0]}]

set_property PACKAGE_PIN AN16 [get_ports pcie_resetn]

set_property IOSTANDARD LVCMOS18 [get_ports pcie_resetn]

set_property PACKAGE_PIN J11 [get_ports pcie_clk_p]
create_clock -period 10.000 -name sys_clk [get_ports pcie_clk_p]
