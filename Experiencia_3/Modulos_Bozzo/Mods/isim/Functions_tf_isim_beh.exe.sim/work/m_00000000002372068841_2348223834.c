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
static const char *ng0 = "E:/Yo/Documents/U/10sem/Lab digitales/Repo/Experiencia_3/Modulos_Bozzo/Mods/Functions.v";
static unsigned int ng1[] = {1U, 0U};
static unsigned int ng2[] = {2U, 0U};
static unsigned int ng3[] = {255U, 0U};
static unsigned int ng4[] = {0U, 0U};



static void Always_27_0(char *t0)
{
    char t9[8];
    char t10[8];
    char t11[8];
    char t29[8];
    char t31[8];
    char t41[8];
    char t46[8];
    char t48[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    int t6;
    char *t7;
    char *t8;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    char *t23;
    char *t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    char *t28;
    char *t30;
    char *t32;
    char *t33;
    char *t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    unsigned int t38;
    unsigned int t39;
    unsigned int t40;
    unsigned int t42;
    unsigned int t43;
    unsigned int t44;
    unsigned int t45;
    char *t47;
    char *t49;
    char *t50;
    char *t51;
    unsigned int t52;
    unsigned int t53;
    unsigned int t54;
    unsigned int t55;
    unsigned int t56;
    unsigned int t57;
    char *t58;

LAB0:    t1 = (t0 + 2528U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(27, ng0);
    t2 = (t0 + 2848);
    *((int *)t2) = 1;
    t3 = (t0 + 2560);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(28, ng0);

LAB5:    xsi_set_current_line(29, ng0);
    t4 = (t0 + 1048U);
    t5 = *((char **)t4);

LAB6:    t4 = ((char*)((ng1)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 2, t4, 2);
    if (t6 == 1)
        goto LAB7;

LAB8:    t2 = ((char*)((ng2)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 2, t2, 2);
    if (t6 == 1)
        goto LAB9;

LAB10:
LAB12:
LAB11:    xsi_set_current_line(32, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 8);

LAB13:    goto LAB2;

LAB7:    xsi_set_current_line(30, ng0);
    t7 = (t0 + 1208U);
    t8 = *((char **)t7);
    t7 = (t0 + 1608);
    xsi_vlogvar_assign_value(t7, t8, 0, 0, 8);
    goto LAB13;

LAB9:    xsi_set_current_line(31, ng0);
    t3 = (t0 + 1208U);
    t4 = *((char **)t3);
    memset(t11, 0, 8);
    t3 = (t11 + 4);
    t7 = (t4 + 4);
    t12 = *((unsigned int *)t4);
    t13 = (t12 >> 7);
    t14 = (t13 & 1);
    *((unsigned int *)t11) = t14;
    t15 = *((unsigned int *)t7);
    t16 = (t15 >> 7);
    t17 = (t16 & 1);
    *((unsigned int *)t3) = t17;
    memset(t10, 0, 8);
    t8 = (t11 + 4);
    t18 = *((unsigned int *)t8);
    t19 = (~(t18));
    t20 = *((unsigned int *)t11);
    t21 = (t20 & t19);
    t22 = (t21 & 1U);
    if (t22 != 0)
        goto LAB14;

LAB15:    if (*((unsigned int *)t8) != 0)
        goto LAB16;

LAB17:    t24 = (t10 + 4);
    t25 = *((unsigned int *)t10);
    t26 = *((unsigned int *)t24);
    t27 = (t25 || t26);
    if (t27 > 0)
        goto LAB18;

LAB19:    t42 = *((unsigned int *)t10);
    t43 = (~(t42));
    t44 = *((unsigned int *)t24);
    t45 = (t43 || t44);
    if (t45 > 0)
        goto LAB20;

LAB21:    if (*((unsigned int *)t24) > 0)
        goto LAB22;

LAB23:    if (*((unsigned int *)t10) > 0)
        goto LAB24;

LAB25:    memcpy(t9, t46, 8);

LAB26:    t58 = (t0 + 1608);
    xsi_vlogvar_assign_value(t58, t9, 0, 0, 8);
    goto LAB13;

LAB14:    *((unsigned int *)t10) = 1;
    goto LAB17;

LAB16:    t23 = (t10 + 4);
    *((unsigned int *)t10) = 1;
    *((unsigned int *)t23) = 1;
    goto LAB17;

LAB18:    t28 = ((char*)((ng3)));
    t30 = ((char*)((ng4)));
    t32 = (t0 + 1208U);
    t33 = *((char **)t32);
    memset(t31, 0, 8);
    t32 = (t31 + 4);
    t34 = (t33 + 4);
    t35 = *((unsigned int *)t33);
    t36 = (t35 >> 0);
    *((unsigned int *)t31) = t36;
    t37 = *((unsigned int *)t34);
    t38 = (t37 >> 0);
    *((unsigned int *)t32) = t38;
    t39 = *((unsigned int *)t31);
    *((unsigned int *)t31) = (t39 & 127U);
    t40 = *((unsigned int *)t32);
    *((unsigned int *)t32) = (t40 & 127U);
    xsi_vlogtype_concat(t29, 8, 8, 2U, t31, 7, t30, 1);
    memset(t41, 0, 8);
    xsi_vlog_unsigned_minus(t41, 8, t28, 8, t29, 8);
    goto LAB19;

LAB20:    t47 = ((char*)((ng4)));
    t49 = (t0 + 1208U);
    t50 = *((char **)t49);
    memset(t48, 0, 8);
    t49 = (t48 + 4);
    t51 = (t50 + 4);
    t52 = *((unsigned int *)t50);
    t53 = (t52 >> 0);
    *((unsigned int *)t48) = t53;
    t54 = *((unsigned int *)t51);
    t55 = (t54 >> 0);
    *((unsigned int *)t49) = t55;
    t56 = *((unsigned int *)t48);
    *((unsigned int *)t48) = (t56 & 127U);
    t57 = *((unsigned int *)t49);
    *((unsigned int *)t49) = (t57 & 127U);
    xsi_vlogtype_concat(t46, 8, 8, 2U, t48, 7, t47, 1);
    goto LAB21;

LAB22:    xsi_vlog_unsigned_bit_combine(t9, 8, t41, 8, t46, 8);
    goto LAB26;

LAB24:    memcpy(t9, t41, 8);
    goto LAB26;

}


extern void work_m_00000000002372068841_2348223834_init()
{
	static char *pe[] = {(void *)Always_27_0};
	xsi_register_didat("work_m_00000000002372068841_2348223834", "isim/Functions_tf_isim_beh.exe.sim/work/m_00000000002372068841_2348223834.didat");
	xsi_register_executes(pe);
}
