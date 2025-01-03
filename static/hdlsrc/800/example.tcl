# TCL script to generate a Vivado project for the PYNQ-Z2 board 
#
create_project project_demo /home/jvliegen/project_demo -part xc7z020clg400-1
set_property board_part tul.com.tw:pynq-z2:part0:1.0 [current_project]
set_property target_language VHDL [current_project]