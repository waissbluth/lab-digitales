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

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "//psf/Home/Desktop/LabDigitales/Experiencia_3/Modulos_Waissbluth/modulos/LEDs_mgmt.v";
static int ng1[] = {0, 0};
static unsigned int ng2[] = {0U, 0U};
static int ng3[] = {1, 0};
static unsigned int ng4[] = {1U, 0U};
static int ng5[] = {2, 0};
static int ng6[] = {3, 0};
static unsigned int ng7[] = {3U, 0U};
static int ng8[] = {4, 0};
static int ng9[] = {5, 0};
static unsigned int ng10[] = {7U, 0U};
static int ng11[] = {6, 0};
static int ng12[] = {7, 0};
static unsigned int ng13[] = {15U, 0U};
static int ng14[] = {8, 0};
static int ng15[] = {9, 0};
static unsigned int ng16[] = {31U, 0U};
static int ng17[] = {10, 0};
static int ng18[] = {11, 0};
static unsigned int ng19[] = {63U, 0U};
static int ng20[] = {12, 0};
static int ng21[] = {13, 0};
static unsigned int ng22[] = {127U, 0U};
static int ng23[] = {14, 0};
static int ng24[] = {15, 0};
static unsigned int ng25[] = {255U, 0U};



static void Always_26_0(char *t0)
{
    char t4[8];
    char *t1;
    char *t2;
    char *t3;
    char *t5;
    char *t6;
    char *t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    char *t14;
    int t15;
    char *t16;
    char *t17;

LAB0:    t1 = (t0 + 2368U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(26, ng0);
    t2 = (t0 + 2688);
    *((int *)t2) = 1;
    t3 = (t0 + 2400);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(28, ng0);
    t5 = (t0 + 1048U);
    t6 = *((char **)t5);
    memset(t4, 0, 8);
    t5 = (t4 + 4);
    t7 = (t6 + 4);
    t8 = *((unsigned int *)t6);
    t9 = (t8 >> 4);
    *((unsigned int *)t4) = t9;
    t10 = *((unsigned int *)t7);
    t11 = (t10 >> 4);
    *((unsigned int *)t5) = t11;
    t12 = *((unsigned int *)t4);
    *((unsigned int *)t4) = (t12 & 15U);
    t13 = *((unsigned int *)t5);
    *((unsigned int *)t5) = (t13 & 15U);

LAB5:    t14 = ((char*)((ng1)));
    t15 = xsi_vlog_unsigned_case_compare(t4, 32, t14, 32);
    if (t15 == 1)
        goto LAB6;

LAB7:    t2 = ((char*)((ng3)));
    t15 = xsi_vlog_unsigned_case_compare(t4, 32, t2, 32);
    if (t15 == 1)
        goto LAB8;

LAB9:    t2 = ((char*)((ng5)));
    t15 = xsi_vlog_unsigned_case_compare(t4, 32, t2, 32);
    if (t15 == 1)
        goto LAB10;

LAB11:    t2 = ((char*)((ng6)));
    t15 = xsi_vlog_unsigned_case_compare(t4, 32, t2, 32);
    if (t15 == 1)
        goto LAB12;

LAB13:    t2 = ((char*)((ng8)));
    t15 = xsi_vlog_unsigned_case_compare(t4, 32, t2, 32);
    if (t15 == 1)
        goto LAB14;

LAB15:    t2 = ((char*)((ng9)));
    t15 = xsi_vlog_unsigned_case_compare(t4, 32, t2, 32);
    if (t15 == 1)
        goto LAB16;

LAB17:    t2 = ((char*)((ng11)));
    t15 = xsi_vlog_unsigned_case_compare(t4, 32, t2, 32);
    if (t15 == 1)
        goto LAB18;

LAB19:    t2 = ((char*)((ng12)));
    t15 = xsi_vlog_unsigned_case_compare(t4, 32, t2, 32);
    if (t15 == 1)
        goto LAB20;

LAB21:    t2 = ((char*)((ng14)));
    t15 = xsi_vlog_unsigned_case_compare(t4, 32, t2, 32);
    if (t15 == 1)
        goto LAB22;

LAB23:    t2 = ((char*)((ng15)));
    t15 = xsi_vlog_unsigned_case_compare(t4, 32, t2, 32);
    if (t15 == 1)
        goto LAB24;

LAB25:    t2 = ((char*)((ng17)));
    t15 = xsi_vlog_unsigned_case_compare(t4, 32, t2, 32);
    if (t15 == 1)
        goto LAB26;

LAB27:    t2 = ((char*)((ng18)));
    t15 = xsi_vlog_unsigned_case_compare(t4, 32, t2, 32);
    if (t15 == 1)
        goto LAB28;

LAB29:    t2 = ((char*)((ng20)));
    t15 = xsi_vlog_unsigned_case_compare(t4, 32, t2, 32);
    if (t15 == 1)
        goto LAB30;

LAB31:    t2 = ((char*)((ng21)));
    t15 = xsi_vlog_unsigned_case_compare(t4, 32, t2, 32);
    if (t15 == 1)
        goto LAB32;

LAB33:    t2 = ((char*)((ng23)));
    t15 = xsi_vlog_unsigned_case_compare(t4, 32, t2, 32);
    if (t15 == 1)
        goto LAB34;

LAB35:    t2 = ((char*)((ng24)));
    t15 = xsi_vlog_unsigned_case_compare(t4, 32, t2, 32);
    if (t15 == 1)
        goto LAB36;

LAB37:
LAB38:    goto LAB2;

LAB6:    xsi_set_current_line(29, ng0);
    t16 = ((char*)((ng2)));
    t17 = (t0 + 1448);
    xsi_vlogvar_assign_value(t17, t16, 0, 0, 8);
    goto LAB38;

LAB8:    xsi_set_current_line(30, ng0);
    t3 = ((char*)((ng4)));
    t5 = (t0 + 1448);
    xsi_vlogvar_assign_value(t5, t3, 0, 0, 8);
    goto LAB38;

LAB10:    xsi_set_current_line(31, ng0);
    t3 = ((char*)((ng4)));
    t5 = (t0 + 1448);
    xsi_vlogvar_assign_value(t5, t3, 0, 0, 8);
    goto LAB38;

LAB12:    xsi_set_current_line(32, ng0);
    t3 = ((char*)((ng7)));
    t5 = (t0 + 1448);
    xsi_vlogvar_assign_value(t5, t3, 0, 0, 8);
    goto LAB38;

LAB14:    xsi_set_current_line(33, ng0);
    t3 = ((char*)((ng7)));
    t5 = (t0 + 1448);
    xsi_vlogvar_assign_value(t5, t3, 0, 0, 8);
    goto LAB38;

LAB16:    xsi_set_current_line(34, ng0);
    t3 = ((char*)((ng10)));
    t5 = (t0 + 1448);
    xsi_vlogvar_assign_value(t5, t3, 0, 0, 8);
    goto LAB38;

LAB18:    xsi_set_current_line(35, ng0);
    t3 = ((char*)((ng10)));
    t5 = (t0 + 1448);
    xsi_vlogvar_assign_value(t5, t3, 0, 0, 8);
    goto LAB38;

LAB20:    xsi_set_current_line(36, ng0);
    t3 = ((char*)((ng13)));
    t5 = (t0 + 1448);
    xsi_vlogvar_assign_value(t5, t3, 0, 0, 8);
    goto LAB38;

LAB22:    xsi_set_current_line(37, ng0);
    t3 = ((char*)((ng13)));
    t5 = (t0 + 1448);
    xsi_vlogvar_assign_value(t5, t3, 0, 0, 8);
    goto LAB38;

LAB24:    xsi_set_current_line(38, ng0);
    t3 = ((char*)((ng16)));
    t5 = (t0 + 1448);
    xsi_vlogvar_assign_value(t5, t3, 0, 0, 8);
    goto LAB38;

LAB26:    xsi_set_current_line(39, ng0);
    t3 = ((char*)((ng16)));
    t5 = (t0 + 1448);
    xsi_vlogvar_assign_value(t5, t3, 0, 0, 8);
    goto LAB38;

LAB28:    xsi_set_current_line(40, ng0);
    t3 = ((char*)((ng19)));
    t5 = (t0 + 1448);
    xsi_vlogvar_assign_value(t5, t3, 0, 0, 8);
    goto LAB38;

LAB30:    xsi_set_current_line(41, ng0);
    t3 = ((char*)((ng19)));
    t5 = (t0 + 1448);
    xsi_vlogvar_assign_value(t5, t3, 0, 0, 8);
    goto LAB38;

LAB32:    xsi_set_current_line(42, ng0);
    t3 = ((char*)((ng22)));
    t5 = (t0 + 1448);
    xsi_vlogvar_assign_value(t5, t3, 0, 0, 8);
    goto LAB38;

LAB34:    xsi_set_current_line(43, ng0);
    t3 = ((char*)((ng22)));
    t5 = (t0 + 1448);
    xsi_vlogvar_assign_value(t5, t3, 0, 0, 8);
    goto LAB38;

LAB36:    xsi_set_current_line(44, ng0);
    t3 = ((char*)((ng25)));
    t5 = (t0 + 1448);
    xsi_vlogvar_assign_value(t5, t3, 0, 0, 8);
    goto LAB38;

}


extern void work_m_00000000000356926397_1898360426_init()
{
	static char *pe[] = {(void *)Always_26_0};
	xsi_register_didat("work_m_00000000000356926397_1898360426", "isim/LEDs_mgmt_tf_isim_beh.exe.sim/work/m_00000000000356926397_1898360426.didat");
	xsi_register_executes(pe);
}
