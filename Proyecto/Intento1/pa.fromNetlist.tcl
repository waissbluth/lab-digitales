
# PlanAhead Launch Script for Post-Synthesis floorplanning, created by Project Navigator

create_project -name Intento1 -dir "E:/Yo/Documents/U/10sem/Lab digitales/Repo/Proyecto/Intento1/planAhead_run_1" -part xc3s100ecp132-5
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "E:/Yo/Documents/U/10sem/Lab digitales/Repo/Proyecto/Intento1/Proyecto.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {E:/Yo/Documents/U/10sem/Lab digitales/Repo/Proyecto/Intento1} }
set_property target_constrs_file "Proyecto.ucf" [current_fileset -constrset]
add_files [list {Proyecto.ucf}] -fileset [get_property constrset [current_run]]
link_design
