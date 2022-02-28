set_property PACKAGE_PIN W5 [get_ports clock]							
	set_property IOSTANDARD LVCMOS33 [get_ports clock]
	create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports clock]
 


set_property PACKAGE_PIN V17 [get_ports {sw[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {sw[0]}]
set_property PACKAGE_PIN V16 [get_ports {sw[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {sw[1]}]
set_property PACKAGE_PIN W16 [get_ports {sw[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {sw[2]}]
#set_property PACKAGE_PIN W17 [get_ports {sw[3]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {sw[3]}]
#set_property PACKAGE_PIN W15 [get_ports {sw2[0]}]					
#	set_property IOSTANDARD LVCMOS33 [get_ports {sw2[0]}]
#set_property PACKAGE_PIN V15 [get_ports {sw2[1]}]					
#	set_property IOSTANDARD LVCMOS33 [get_ports {sw2[1]}]
#set_property PACKAGE_PIN W14 [get_ports {sw2[2]}]					
#	set_property IOSTANDARD LVCMOS33 [get_ports {sw2[2]}]
#set_property PACKAGE_PIN W13 [get_ports {sw2[3]}]					
#	set_property IOSTANDARD LVCMOS33 [get_ports {sw2[3]}]

					
set_property PACKAGE_PIN U16 [get_ports {led[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {led[0]}]
set_property PACKAGE_PIN E19 [get_ports {led[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {led[1]}]
set_property PACKAGE_PIN U19 [get_ports {led[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {led[2]}]
set_property PACKAGE_PIN V19 [get_ports {led[3]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {led[3]}]
set_property PACKAGE_PIN W18 [get_ports {led[4]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {led[4]}]
#set_property PACKAGE_PIN U15 [get_ports {led[5]}]					
#	set_property IOSTANDARD LVCMOS33 [get_ports {led[5]}]
#set_property PACKAGE_PIN U14 [get_ports {led[6]}]					
#	set_property IOSTANDARD LVCMOS33 [get_ports {led[6]}]
#set_property PACKAGE_PIN V14 [get_ports {led[7]}]					
#	set_property IOSTANDARD LVCMOS33 [get_ports {led[7]}]
	
set_property PACKAGE_PIN U2 [get_ports {an[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {an[0]}]
set_property PACKAGE_PIN U4 [get_ports {an[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {an[1]}]
set_property PACKAGE_PIN V4 [get_ports {an[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {an[2]}]
set_property PACKAGE_PIN W4 [get_ports {an[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {an[3]}]


	
#Sch name = JB1
set_property PACKAGE_PIN A14 [get_ports {in[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {in[0]}]
#Sch name = JB2
set_property PACKAGE_PIN A16 [get_ports {in[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {in[1]}]
#Sch name = JB3
set_property PACKAGE_PIN B15 [get_ports {in[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {in[2]}]
#Sch name = JB4
set_property PACKAGE_PIN B16 [get_ports {in[3]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {in[3]}]
#Sch name = JB7
set_property PACKAGE_PIN A15 [get_ports {enA}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {enA}]
#Sch name = JB8
set_property PACKAGE_PIN A17 [get_ports {enB}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {enB}]
	
set_property PACKAGE_PIN W7 [get_ports {seg[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {seg[0]}]
set_property PACKAGE_PIN W6 [get_ports {seg[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {seg[1]}]
set_property PACKAGE_PIN U8 [get_ports {seg[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {seg[2]}]
set_property PACKAGE_PIN V8 [get_ports {seg[3]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {seg[3]}]
set_property PACKAGE_PIN U5 [get_ports {seg[4]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {seg[4]}]
set_property PACKAGE_PIN V5 [get_ports {seg[5]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {seg[5]}]
set_property PACKAGE_PIN U7 [get_ports {seg[6]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {seg[6]}]


#Sch name = JC1
#set_property PACKAGE_PIN K17 [get_ports {object_sensor}]					
#	set_property IOSTANDARD LVCMOS33 [get_ports {object_sensor}]
###Sch name = JC2
#set_property PACKAGE_PIN M18 [get_ports {sensor[1]}]					
#	set_property IOSTANDARD LVCMOS33 [get_ports {sensor[1]}]
###Sch name = JC3
#set_property PACKAGE_PIN N17 [get_ports {object_sensor}]					
#	set_property IOSTANDARD LVCMOS33 [get_ports {object_sensor}]
####Sch name = JC4
#set_property PACKAGE_PIN P18 [get_ports {object_sensor}]					
#	set_property IOSTANDARD LVCMOS33 [get_ports {object_sensor}]
	
###Sch name = JC7
set_property PACKAGE_PIN L17 [get_ports {sensor3}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {sensor3}]
	
##Sch name = JC8
set_property PACKAGE_PIN M19 [get_ports {sensor[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {sensor[0]}]
##Sch name = JC9
set_property PACKAGE_PIN P17 [get_ports {sensor[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {sensor[1]}]

##Sch name = JA1
set_property PACKAGE_PIN J1 [get_ports {S0}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {S0}]
##Sch name = JA2
set_property PACKAGE_PIN L2 [get_ports {S1}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {S1}]
##Sch name = JA3
set_property PACKAGE_PIN J2 [get_ports {S2}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {S2}]
##Sch name = JA4
set_property PACKAGE_PIN G2 [get_ports {S3}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {S3}]

##Sch name = JA7
set_property PACKAGE_PIN H1 [get_ports {colorsignal}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {colorsignal}]
##Sch name = JA10
set_property PACKAGE_PIN G3 [get_ports {object_sensor}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {object_sensor}]
