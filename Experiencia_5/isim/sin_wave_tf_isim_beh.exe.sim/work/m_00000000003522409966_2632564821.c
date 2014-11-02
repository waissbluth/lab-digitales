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
static const char *ng0 = "//psf/Home/Desktop/LabDigitales/Experiencia_5/sin_wave.v";
static int ng1[] = {127, 0};
static int ng2[] = {255, 0};
static int ng3[] = {383, 0};
static int ng4[] = {511, 0};
static int ng5[] = {0, 0};



static void Always_38_0(char *t0)
{
    char t6[8];
    char t18[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    char *t16;
    char *t17;

LAB0:    t1 = (t0 + 3168U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(38, ng0);
    t2 = (t0 + 3984);
    *((int *)t2) = 1;
    t3 = (t0 + 3200);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(39, ng0);

LAB5:    xsi_set_current_line(40, ng0);
    t4 = (t0 + 1208U);
    t5 = *((char **)t4);
    t4 = ((char*)((ng1)));
    memset(t6, 0, 8);
    t7 = (t5 + 4);
    if (*((unsigned int *)t7) != 0)
        goto LAB7;

LAB6:    t8 = (t4 + 4);
    if (*((unsigned int *)t8) != 0)
        goto LAB7;

LAB10:    if (*((unsigned int *)t5) > *((unsigned int *)t4))
        goto LAB9;

LAB8:    *((unsigned int *)t6) = 1;

LAB9:    t10 = (t6 + 4);
    t11 = *((unsigned int *)t10);
    t12 = (~(t11));
    t13 = *((unsigned int *)t6);
    t14 = (t13 & t12);
    t15 = (t14 != 0);
    if (t15 > 0)
        goto LAB11;

LAB12:    xsi_set_current_line(42, ng0);
    t2 = (t0 + 1208U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng2)));
    memset(t6, 0, 8);
    t4 = (t3 + 4);
    if (*((unsigned int *)t4) != 0)
        goto LAB15;

LAB14:    t5 = (t2 + 4);
    if (*((unsigned int *)t5) != 0)
        goto LAB15;

LAB18:    if (*((unsigned int *)t3) > *((unsigned int *)t2))
        goto LAB17;

LAB16:    *((unsigned int *)t6) = 1;

LAB17:    t8 = (t6 + 4);
    t11 = *((unsigned int *)t8);
    t12 = (~(t11));
    t13 = *((unsigned int *)t6);
    t14 = (t13 & t12);
    t15 = (t14 != 0);
    if (t15 > 0)
        goto LAB19;

LAB20:    xsi_set_current_line(44, ng0);
    t2 = (t0 + 1208U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng3)));
    memset(t6, 0, 8);
    t4 = (t3 + 4);
    if (*((unsigned int *)t4) != 0)
        goto LAB23;

LAB22:    t5 = (t2 + 4);
    if (*((unsigned int *)t5) != 0)
        goto LAB23;

LAB26:    if (*((unsigned int *)t3) > *((unsigned int *)t2))
        goto LAB25;

LAB24:    *((unsigned int *)t6) = 1;

LAB25:    t8 = (t6 + 4);
    t11 = *((unsigned int *)t8);
    t12 = (~(t11));
    t13 = *((unsigned int *)t6);
    t14 = (t13 & t12);
    t15 = (t14 != 0);
    if (t15 > 0)
        goto LAB27;

LAB28:    xsi_set_current_line(47, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 1208U);
    t4 = *((char **)t3);
    memset(t6, 0, 8);
    xsi_vlog_unsigned_minus(t6, 32, t2, 32, t4, 9);
    t3 = (t0 + 2248);
    xsi_vlogvar_wait_assign_value(t3, t6, 0, 0, 7, 0LL);

LAB29:
LAB21:
LAB13:    xsi_set_current_line(49, ng0);
    t2 = (t0 + 1208U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng2)));
    memset(t6, 0, 8);
    t4 = (t3 + 4);
    if (*((unsigned int *)t4) != 0)
        goto LAB31;

LAB30:    t5 = (t2 + 4);
    if (*((unsigned int *)t5) != 0)
        goto LAB31;

LAB34:    if (*((unsigned int *)t3) > *((unsigned int *)t2))
        goto LAB33;

LAB32:    *((unsigned int *)t6) = 1;

LAB33:    t8 = (t6 + 4);
    t11 = *((unsigned int *)t8);
    t12 = (~(t11));
    t13 = *((unsigned int *)t6);
    t14 = (t13 & t12);
    t15 = (t14 != 0);
    if (t15 > 0)
        goto LAB35;

LAB36:    xsi_set_current_line(52, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 1368U);
    t4 = *((char **)t3);
    memset(t6, 0, 8);
    xsi_vlog_unsigned_minus(t6, 32, t2, 32, t4, 8);
    t3 = (t0 + 2088);
    xsi_vlogvar_wait_assign_value(t3, t6, 0, 0, 9, 0LL);

LAB37:    goto LAB2;

LAB7:    t9 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t9) = 1;
    goto LAB9;

LAB11:    xsi_set_current_line(41, ng0);
    t16 = (t0 + 1208U);
    t17 = *((char **)t16);
    t16 = (t0 + 2248);
    xsi_vlogvar_wait_assign_value(t16, t17, 0, 0, 7, 0LL);
    goto LAB13;

LAB15:    t7 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t7) = 1;
    goto LAB17;

LAB19:    xsi_set_current_line(43, ng0);
    t9 = ((char*)((ng2)));
    t10 = (t0 + 1208U);
    t16 = *((char **)t10);
    memset(t18, 0, 8);
    xsi_vlog_unsigned_minus(t18, 32, t9, 32, t16, 9);
    t10 = (t0 + 2248);
    xsi_vlogvar_wait_assign_value(t10, t18, 0, 0, 7, 0LL);
    goto LAB21;

LAB23:    t7 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t7) = 1;
    goto LAB25;

LAB27:    xsi_set_current_line(45, ng0);
    t9 = (t0 + 1208U);
    t10 = *((char **)t9);
    t9 = ((char*)((ng3)));
    memset(t18, 0, 8);
    xsi_vlog_unsigned_minus(t18, 32, t10, 9, t9, 32);
    t16 = (t0 + 2248);
    xsi_vlogvar_wait_assign_value(t16, t18, 0, 0, 7, 0LL);
    goto LAB29;

LAB31:    t7 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t7) = 1;
    goto LAB33;

LAB35:    xsi_set_current_line(50, ng0);
    t9 = ((char*)((ng2)));
    t10 = (t0 + 1368U);
    t16 = *((char **)t10);
    memset(t18, 0, 8);
    xsi_vlog_unsigned_add(t18, 32, t9, 32, t16, 8);
    t10 = (t0 + 2088);
    xsi_vlogvar_wait_assign_value(t10, t18, 0, 0, 9, 0LL);
    goto LAB37;

}

static void implSig1_execute(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;

LAB0:    t1 = (t0 + 3416U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    t2 = ((char*)((ng5)));
    t3 = (t0 + 4064);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    memcpy(t7, t2, 8);
    xsi_driver_vfirst_trans(t3, 0, 31);

LAB1:    return;
}

static void implSig2_execute(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;

LAB0:    t1 = (t0 + 3664U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    t2 = ((char*)((ng5)));
    t3 = (t0 + 4128);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    memcpy(t7, t2, 8);
    xsi_driver_vfirst_trans(t3, 0, 31);

LAB1:    return;
}


extern void work_m_00000000003522409966_2632564821_init()
{
	static char *pe[] = {(void *)Always_38_0,(void *)implSig1_execute,(void *)implSig2_execute};
	xsi_register_didat("work_m_00000000003522409966_2632564821", "isim/sin_wave_tf_isim_beh.exe.sim/work/m_00000000003522409966_2632564821.didat");
	xsi_register_executes(pe);
}
