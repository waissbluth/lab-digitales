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
    work_m_00000000001259116175_3803031964_init();
    work_m_00000000003530087775_0574558735_init();
    xilinxcorelib_ver_m_00000000001358910285_0717115059_init();
    xilinxcorelib_ver_m_00000000001687936702_1453250202_init();
    xilinxcorelib_ver_m_00000000001080096809_4173955442_init();
    xilinxcorelib_ver_m_00000000001603977570_0614515659_init();
    work_m_00000000003617559063_1176796855_init();
    work_m_00000000003487420808_0682087495_init();
    work_m_00000000002077308590_3787248241_init();
    xilinxcorelib_ver_m_00000000001358910285_1027517190_init();
    xilinxcorelib_ver_m_00000000001687936702_2033090377_init();
    xilinxcorelib_ver_m_00000000001080096809_0281072050_init();
    xilinxcorelib_ver_m_00000000001603977570_0164882635_init();
    work_m_00000000003617559063_3789695086_init();
    work_m_00000000001728457943_3130334766_init();
    work_m_00000000001127809770_3823007873_init();
    work_m_00000000004134447467_2073120511_init();


    xsi_register_tops("work_m_00000000001127809770_3823007873");
    xsi_register_tops("work_m_00000000004134447467_2073120511");


    return xsi_run_simulation(argc, argv);

}
