/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

#include "xsi.h"

struct XSI_INFO xsi_info;



int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    xilinxcorelib_ver_m_00000000001358910285_3968554025_init();
    xilinxcorelib_ver_m_00000000001687936702_0914047351_init();
    xilinxcorelib_ver_m_00000000000277421008_3332201294_init();
    xilinxcorelib_ver_m_00000000001603977570_0266438118_init();
    work_m_00000000000403262735_1254421729_init();
    work_m_00000000003522409966_2632564821_init();
    work_m_00000000001263905577_1775965766_init();
    work_m_00000000004134447467_2073120511_init();


    xsi_register_tops("work_m_00000000001263905577_1775965766");
    xsi_register_tops("work_m_00000000004134447467_2073120511");


    return xsi_run_simulation(argc, argv);

}
