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
    work_m_00000000002766243908_0284352366_init();
    work_m_00000000004284994209_1448365076_init();
    work_m_00000000002372068841_2348223834_init();
    work_m_00000000000729601853_3885880349_init();
    work_m_00000000004134447467_2073120511_init();


    xsi_register_tops("work_m_00000000000729601853_3885880349");
    xsi_register_tops("work_m_00000000004134447467_2073120511");


    return xsi_run_simulation(argc, argv);

}
