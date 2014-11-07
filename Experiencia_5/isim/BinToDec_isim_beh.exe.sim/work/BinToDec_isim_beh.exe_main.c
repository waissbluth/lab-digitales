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
    work_m_00000000003399578363_2363856206_init();
    work_m_00000000000205550961_3258481755_init();
    work_m_00000000003745634881_3156934937_init();
    work_m_00000000003399578363_0699429489_init();
    work_m_00000000000205550961_2963908069_init();
    work_m_00000000003745634881_1034729070_init();
    work_m_00000000000438927456_4117813453_init();
    work_m_00000000000395537316_1878860892_init();
    work_m_00000000000124948953_2180627835_init();
    work_m_00000000004134447467_2073120511_init();


    xsi_register_tops("work_m_00000000000124948953_2180627835");
    xsi_register_tops("work_m_00000000004134447467_2073120511");


    return xsi_run_simulation(argc, argv);

}
