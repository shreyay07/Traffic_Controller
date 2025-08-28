set_db init_lib_search_path /home/nilet/Desktop/shreya/alu/RTLtoGDSII/counter_design_database_45nm/lib
set_db init_hdl_search_path /home/nilet/Desktop/shreya/Traffic_Controller/Traffic_controller_git/src

read_lib /home/nilet/Desktop/shreya/alu/RTLtoGDSII/counter_design_database_45nm/lib/slow_vdd1v0_basicCells.lib
read_hdl /home/nilet/Desktop/shreya/Traffic_Controller/Traffic_controller_git/src/Traffic_controller.v

set_db lp_insert_clock_gating true

elab

syn_gen
syn_map
syn_opt

gui_show
