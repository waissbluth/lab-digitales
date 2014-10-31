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
    work_m_00000000001760337835_3996337969_init();
    work_m_00000000002171720258_4077258405_init();
    work_m_00000000004284994209_1651254414_init();
    work_m_00000000003575148866_0613195390_init();
    work_m_00000000001906444306_2696034987_init();
    work_m_00000000004134447467_2073120511_init();


    xsi_register_tops("work_m_00000000001906444306_2696034987");
    xsi_register_tops("work_m_00000000004134447467_2073120511");


    return xsi_run_simulation(argc, argv);

}
