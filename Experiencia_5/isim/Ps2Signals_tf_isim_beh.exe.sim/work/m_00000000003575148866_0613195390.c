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
static const char *ng0 = "E:/Yo/Documents/U/10sem/Lab digitales/Repo/Experiencia_5/Modulos_Bozzo/Exp5/Ps2Signals.v";
static int ng1[] = {0, 0};
static int ng2[] = {1, 0};
static unsigned int ng3[] = {1U, 0U};
static unsigned int ng4[] = {0U, 0U};
static int ng5[] = {2, 0};
static int ng6[] = {3, 0};
static int ng7[] = {4, 0};
static int ng8[] = {5, 0};
static int ng9[] = {6, 0};
static int ng10[] = {7, 0};



static void Initial_46_0(char *t0)
{
    char *t1;
    char *t2;

LAB0:    xsi_set_current_line(47, ng0);

LAB2:    xsi_set_current_line(48, ng0);
    t1 = ((char*)((ng1)));
    t2 = (t0 + 3024);
    xsi_vlogvar_wait_assign_value(t2, t1, 0, 0, 1, 0LL);
    xsi_set_current_line(49, ng0);
    t1 = ((char*)((ng2)));
    t2 = (t0 + 3504);
    xsi_vlogvar_wait_assign_value(t2, t1, 0, 0, 1, 0LL);
    xsi_set_current_line(50, ng0);
    t1 = ((char*)((ng2)));
    t2 = (t0 + 3824);
    xsi_vlogvar_wait_assign_value(t2, t1, 0, 0, 1, 0LL);
    xsi_set_current_line(51, ng0);
    t1 = ((char*)((ng2)));
    t2 = (t0 + 3664);
    xsi_vlogvar_wait_assign_value(t2, t1, 0, 0, 1, 0LL);
    xsi_set_current_line(52, ng0);
    t1 = ((char*)((ng2)));
    t2 = (t0 + 4144);
    xsi_vlogvar_wait_assign_value(t2, t1, 0, 0, 1, 0LL);
    xsi_set_current_line(53, ng0);
    t1 = ((char*)((ng1)));
    t2 = (t0 + 2704);
    xsi_vlogvar_wait_assign_value(t2, t1, 0, 0, 1, 0LL);

LAB1:    return;
}

static void Always_56_1(char *t0)
{
    char t7[8];
    char t16[8];
    char t56[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t8;
    char *t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    char *t15;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    char *t20;
    char *t21;
    char *t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    unsigned int t28;
    unsigned int t29;
    char *t30;
    char *t31;
    unsigned int t32;
    unsigned int t33;
    unsigned int t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    unsigned int t38;
    unsigned int t39;
    int t40;
    int t41;
    unsigned int t42;
    unsigned int t43;
    unsigned int t44;
    unsigned int t45;
    unsigned int t46;
    unsigned int t47;
    char *t48;
    unsigned int t49;
    unsigned int t50;
    unsigned int t51;
    unsigned int t52;
    unsigned int t53;
    char *t54;
    char *t55;
    char *t57;
    unsigned int t58;
    char *t59;
    char *t60;
    unsigned int t61;
    unsigned int t62;
    unsigned int t63;
    unsigned int t64;
    unsigned int t65;
    unsigned int t66;
    unsigned int t67;
    unsigned int t68;
    int t69;
    int t70;
    unsigned int t71;
    unsigned int t72;
    unsigned int t73;
    unsigned int t74;
    unsigned int t75;
    unsigned int t76;
    char *t77;

LAB0:    t1 = (t0 + 5312U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(56, ng0);
    t2 = (t0 + 5880);
    *((int *)t2) = 1;
    t3 = (t0 + 5344);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(57, ng0);

LAB5:    xsi_set_current_line(59, ng0);
    t4 = (t0 + 3184);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t8 = (t0 + 1344U);
    t9 = *((char **)t8);
    memset(t7, 0, 8);
    t8 = (t9 + 4);
    t10 = *((unsigned int *)t8);
    t11 = (~(t10));
    t12 = *((unsigned int *)t9);
    t13 = (t12 & t11);
    t14 = (t13 & 1U);
    if (t14 != 0)
        goto LAB9;

LAB7:    if (*((unsigned int *)t8) == 0)
        goto LAB6;

LAB8:    t15 = (t7 + 4);
    *((unsigned int *)t7) = 1;
    *((unsigned int *)t15) = 1;

LAB9:    t17 = *((unsigned int *)t6);
    t18 = *((unsigned int *)t7);
    t19 = (t17 & t18);
    *((unsigned int *)t16) = t19;
    t20 = (t6 + 4);
    t21 = (t7 + 4);
    t22 = (t16 + 4);
    t23 = *((unsigned int *)t20);
    t24 = *((unsigned int *)t21);
    t25 = (t23 | t24);
    *((unsigned int *)t22) = t25;
    t26 = *((unsigned int *)t22);
    t27 = (t26 != 0);
    if (t27 == 1)
        goto LAB10;

LAB11:
LAB12:    t48 = (t16 + 4);
    t49 = *((unsigned int *)t48);
    t50 = (~(t49));
    t51 = *((unsigned int *)t16);
    t52 = (t51 & t50);
    t53 = (t52 != 0);
    if (t53 > 0)
        goto LAB13;

LAB14:    xsi_set_current_line(65, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 3504);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);

LAB15:    xsi_set_current_line(67, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 2704);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(68, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 3824);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(69, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 3984);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(70, ng0);
    t2 = (t0 + 3024);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 3504);
    t6 = (t5 + 56U);
    t8 = *((char **)t6);
    t10 = *((unsigned int *)t4);
    t11 = *((unsigned int *)t8);
    t12 = (t10 | t11);
    *((unsigned int *)t7) = t12;
    t9 = (t4 + 4);
    t15 = (t8 + 4);
    t20 = (t7 + 4);
    t13 = *((unsigned int *)t9);
    t14 = *((unsigned int *)t15);
    t17 = (t13 | t14);
    *((unsigned int *)t20) = t17;
    t18 = *((unsigned int *)t20);
    t19 = (t18 != 0);
    if (t19 == 1)
        goto LAB17;

LAB18:
LAB19:    t30 = (t0 + 1344U);
    t31 = *((char **)t30);
    memset(t16, 0, 8);
    t30 = (t31 + 4);
    t37 = *((unsigned int *)t30);
    t38 = (~(t37));
    t39 = *((unsigned int *)t31);
    t42 = (t39 & t38);
    t43 = (t42 & 1U);
    if (t43 != 0)
        goto LAB23;

LAB21:    if (*((unsigned int *)t30) == 0)
        goto LAB20;

LAB22:    t48 = (t16 + 4);
    *((unsigned int *)t16) = 1;
    *((unsigned int *)t48) = 1;

LAB23:    t44 = *((unsigned int *)t7);
    t45 = *((unsigned int *)t16);
    t46 = (t44 & t45);
    *((unsigned int *)t56) = t46;
    t54 = (t7 + 4);
    t55 = (t16 + 4);
    t57 = (t56 + 4);
    t47 = *((unsigned int *)t54);
    t49 = *((unsigned int *)t55);
    t50 = (t47 | t49);
    *((unsigned int *)t57) = t50;
    t51 = *((unsigned int *)t57);
    t52 = (t51 != 0);
    if (t52 == 1)
        goto LAB24;

LAB25:
LAB26:    t77 = (t0 + 3024);
    xsi_vlogvar_wait_assign_value(t77, t56, 0, 0, 1, 0LL);
    xsi_set_current_line(72, ng0);
    t2 = (t0 + 1984U);
    t3 = *((char **)t2);
    t2 = (t0 + 3664);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t10 = *((unsigned int *)t3);
    t11 = *((unsigned int *)t5);
    t12 = (t10 & t11);
    *((unsigned int *)t7) = t12;
    t6 = (t3 + 4);
    t8 = (t5 + 4);
    t9 = (t7 + 4);
    t13 = *((unsigned int *)t6);
    t14 = *((unsigned int *)t8);
    t17 = (t13 | t14);
    *((unsigned int *)t9) = t17;
    t18 = *((unsigned int *)t9);
    t19 = (t18 != 0);
    if (t19 == 1)
        goto LAB27;

LAB28:
LAB29:    t21 = (t7 + 4);
    t43 = *((unsigned int *)t21);
    t44 = (~(t43));
    t45 = *((unsigned int *)t7);
    t46 = (t45 & t44);
    t47 = (t46 != 0);
    if (t47 > 0)
        goto LAB30;

LAB31:
LAB32:    xsi_set_current_line(105, ng0);
    t2 = (t0 + 1344U);
    t3 = *((char **)t2);
    t2 = (t0 + 3184);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 1, 0LL);
    goto LAB2;

LAB6:    *((unsigned int *)t7) = 1;
    goto LAB9;

LAB10:    t28 = *((unsigned int *)t16);
    t29 = *((unsigned int *)t22);
    *((unsigned int *)t16) = (t28 | t29);
    t30 = (t6 + 4);
    t31 = (t7 + 4);
    t32 = *((unsigned int *)t6);
    t33 = (~(t32));
    t34 = *((unsigned int *)t30);
    t35 = (~(t34));
    t36 = *((unsigned int *)t7);
    t37 = (~(t36));
    t38 = *((unsigned int *)t31);
    t39 = (~(t38));
    t40 = (t33 & t35);
    t41 = (t37 & t39);
    t42 = (~(t40));
    t43 = (~(t41));
    t44 = *((unsigned int *)t22);
    *((unsigned int *)t22) = (t44 & t42);
    t45 = *((unsigned int *)t22);
    *((unsigned int *)t22) = (t45 & t43);
    t46 = *((unsigned int *)t16);
    *((unsigned int *)t16) = (t46 & t42);
    t47 = *((unsigned int *)t16);
    *((unsigned int *)t16) = (t47 & t43);
    goto LAB12;

LAB13:    xsi_set_current_line(60, ng0);

LAB16:    xsi_set_current_line(61, ng0);
    t54 = (t0 + 1504U);
    t55 = *((char **)t54);
    t54 = (t0 + 3344);
    xsi_vlogvar_wait_assign_value(t54, t55, 0, 0, 1, 0LL);
    xsi_set_current_line(62, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 3504);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(63, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 3664);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    goto LAB15;

LAB17:    t23 = *((unsigned int *)t7);
    t24 = *((unsigned int *)t20);
    *((unsigned int *)t7) = (t23 | t24);
    t21 = (t4 + 4);
    t22 = (t8 + 4);
    t25 = *((unsigned int *)t21);
    t26 = (~(t25));
    t27 = *((unsigned int *)t4);
    t40 = (t27 & t26);
    t28 = *((unsigned int *)t22);
    t29 = (~(t28));
    t32 = *((unsigned int *)t8);
    t41 = (t32 & t29);
    t33 = (~(t40));
    t34 = (~(t41));
    t35 = *((unsigned int *)t20);
    *((unsigned int *)t20) = (t35 & t33);
    t36 = *((unsigned int *)t20);
    *((unsigned int *)t20) = (t36 & t34);
    goto LAB19;

LAB20:    *((unsigned int *)t16) = 1;
    goto LAB23;

LAB24:    t53 = *((unsigned int *)t56);
    t58 = *((unsigned int *)t57);
    *((unsigned int *)t56) = (t53 | t58);
    t59 = (t7 + 4);
    t60 = (t16 + 4);
    t61 = *((unsigned int *)t7);
    t62 = (~(t61));
    t63 = *((unsigned int *)t59);
    t64 = (~(t63));
    t65 = *((unsigned int *)t16);
    t66 = (~(t65));
    t67 = *((unsigned int *)t60);
    t68 = (~(t67));
    t69 = (t62 & t64);
    t70 = (t66 & t68);
    t71 = (~(t69));
    t72 = (~(t70));
    t73 = *((unsigned int *)t57);
    *((unsigned int *)t57) = (t73 & t71);
    t74 = *((unsigned int *)t57);
    *((unsigned int *)t57) = (t74 & t72);
    t75 = *((unsigned int *)t56);
    *((unsigned int *)t56) = (t75 & t71);
    t76 = *((unsigned int *)t56);
    *((unsigned int *)t56) = (t76 & t72);
    goto LAB26;

LAB27:    t23 = *((unsigned int *)t7);
    t24 = *((unsigned int *)t9);
    *((unsigned int *)t7) = (t23 | t24);
    t15 = (t3 + 4);
    t20 = (t5 + 4);
    t25 = *((unsigned int *)t3);
    t26 = (~(t25));
    t27 = *((unsigned int *)t15);
    t28 = (~(t27));
    t29 = *((unsigned int *)t5);
    t32 = (~(t29));
    t33 = *((unsigned int *)t20);
    t34 = (~(t33));
    t40 = (t26 & t28);
    t41 = (t32 & t34);
    t35 = (~(t40));
    t36 = (~(t41));
    t37 = *((unsigned int *)t9);
    *((unsigned int *)t9) = (t37 & t35);
    t38 = *((unsigned int *)t9);
    *((unsigned int *)t9) = (t38 & t36);
    t39 = *((unsigned int *)t7);
    *((unsigned int *)t7) = (t39 & t35);
    t42 = *((unsigned int *)t7);
    *((unsigned int *)t7) = (t42 & t36);
    goto LAB29;

LAB30:    xsi_set_current_line(74, ng0);

LAB33:    xsi_set_current_line(75, ng0);
    t22 = (t0 + 4144);
    t30 = (t22 + 56U);
    t31 = *((char **)t30);
    t48 = (t31 + 4);
    t49 = *((unsigned int *)t48);
    t50 = (~(t49));
    t51 = *((unsigned int *)t31);
    t52 = (t51 & t50);
    t53 = (t52 != 0);
    if (t53 > 0)
        goto LAB34;

LAB35:    xsi_set_current_line(78, ng0);

LAB37:    xsi_set_current_line(80, ng0);
    t2 = (t0 + 2144U);
    t3 = *((char **)t2);
    t2 = (t3 + 4);
    t10 = *((unsigned int *)t2);
    t11 = (~(t10));
    t12 = *((unsigned int *)t3);
    t13 = (t12 & t11);
    t14 = (t13 != 0);
    if (t14 > 0)
        goto LAB38;

LAB39:    xsi_set_current_line(87, ng0);

LAB52:    xsi_set_current_line(88, ng0);
    t2 = (t0 + 2864);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    memset(t7, 0, 8);
    t5 = (t7 + 4);
    t6 = (t4 + 4);
    t10 = *((unsigned int *)t4);
    t11 = (t10 >> 1);
    t12 = (t11 & 1);
    *((unsigned int *)t7) = t12;
    t13 = *((unsigned int *)t6);
    t14 = (t13 >> 1);
    t17 = (t14 & 1);
    *((unsigned int *)t5) = t17;
    t8 = (t0 + 2864);
    t9 = (t0 + 2864);
    t15 = (t9 + 72U);
    t20 = *((char **)t15);
    t21 = ((char*)((ng1)));
    xsi_vlog_generic_convert_bit_index(t16, t20, 2, t21, 32, 1);
    t22 = (t16 + 4);
    t18 = *((unsigned int *)t22);
    t40 = (!(t18));
    if (t40 == 1)
        goto LAB53;

LAB54:    xsi_set_current_line(89, ng0);
    t2 = (t0 + 2864);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    memset(t7, 0, 8);
    t5 = (t7 + 4);
    t6 = (t4 + 4);
    t10 = *((unsigned int *)t4);
    t11 = (t10 >> 2);
    t12 = (t11 & 1);
    *((unsigned int *)t7) = t12;
    t13 = *((unsigned int *)t6);
    t14 = (t13 >> 2);
    t17 = (t14 & 1);
    *((unsigned int *)t5) = t17;
    t8 = (t0 + 2864);
    t9 = (t0 + 2864);
    t15 = (t9 + 72U);
    t20 = *((char **)t15);
    t21 = ((char*)((ng2)));
    xsi_vlog_generic_convert_bit_index(t16, t20, 2, t21, 32, 1);
    t22 = (t16 + 4);
    t18 = *((unsigned int *)t22);
    t40 = (!(t18));
    if (t40 == 1)
        goto LAB55;

LAB56:    xsi_set_current_line(90, ng0);
    t2 = (t0 + 2864);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    memset(t7, 0, 8);
    t5 = (t7 + 4);
    t6 = (t4 + 4);
    t10 = *((unsigned int *)t4);
    t11 = (t10 >> 3);
    t12 = (t11 & 1);
    *((unsigned int *)t7) = t12;
    t13 = *((unsigned int *)t6);
    t14 = (t13 >> 3);
    t17 = (t14 & 1);
    *((unsigned int *)t5) = t17;
    t8 = (t0 + 2864);
    t9 = (t0 + 2864);
    t15 = (t9 + 72U);
    t20 = *((char **)t15);
    t21 = ((char*)((ng5)));
    xsi_vlog_generic_convert_bit_index(t16, t20, 2, t21, 32, 1);
    t22 = (t16 + 4);
    t18 = *((unsigned int *)t22);
    t40 = (!(t18));
    if (t40 == 1)
        goto LAB57;

LAB58:    xsi_set_current_line(91, ng0);
    t2 = (t0 + 2864);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    memset(t7, 0, 8);
    t5 = (t7 + 4);
    t6 = (t4 + 4);
    t10 = *((unsigned int *)t4);
    t11 = (t10 >> 4);
    t12 = (t11 & 1);
    *((unsigned int *)t7) = t12;
    t13 = *((unsigned int *)t6);
    t14 = (t13 >> 4);
    t17 = (t14 & 1);
    *((unsigned int *)t5) = t17;
    t8 = (t0 + 2864);
    t9 = (t0 + 2864);
    t15 = (t9 + 72U);
    t20 = *((char **)t15);
    t21 = ((char*)((ng6)));
    xsi_vlog_generic_convert_bit_index(t16, t20, 2, t21, 32, 1);
    t22 = (t16 + 4);
    t18 = *((unsigned int *)t22);
    t40 = (!(t18));
    if (t40 == 1)
        goto LAB59;

LAB60:    xsi_set_current_line(92, ng0);
    t2 = (t0 + 2864);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    memset(t7, 0, 8);
    t5 = (t7 + 4);
    t6 = (t4 + 4);
    t10 = *((unsigned int *)t4);
    t11 = (t10 >> 5);
    t12 = (t11 & 1);
    *((unsigned int *)t7) = t12;
    t13 = *((unsigned int *)t6);
    t14 = (t13 >> 5);
    t17 = (t14 & 1);
    *((unsigned int *)t5) = t17;
    t8 = (t0 + 2864);
    t9 = (t0 + 2864);
    t15 = (t9 + 72U);
    t20 = *((char **)t15);
    t21 = ((char*)((ng7)));
    xsi_vlog_generic_convert_bit_index(t16, t20, 2, t21, 32, 1);
    t22 = (t16 + 4);
    t18 = *((unsigned int *)t22);
    t40 = (!(t18));
    if (t40 == 1)
        goto LAB61;

LAB62:    xsi_set_current_line(93, ng0);
    t2 = (t0 + 2864);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    memset(t7, 0, 8);
    t5 = (t7 + 4);
    t6 = (t4 + 4);
    t10 = *((unsigned int *)t4);
    t11 = (t10 >> 6);
    t12 = (t11 & 1);
    *((unsigned int *)t7) = t12;
    t13 = *((unsigned int *)t6);
    t14 = (t13 >> 6);
    t17 = (t14 & 1);
    *((unsigned int *)t5) = t17;
    t8 = (t0 + 2864);
    t9 = (t0 + 2864);
    t15 = (t9 + 72U);
    t20 = *((char **)t15);
    t21 = ((char*)((ng8)));
    xsi_vlog_generic_convert_bit_index(t16, t20, 2, t21, 32, 1);
    t22 = (t16 + 4);
    t18 = *((unsigned int *)t22);
    t40 = (!(t18));
    if (t40 == 1)
        goto LAB63;

LAB64:    xsi_set_current_line(94, ng0);
    t2 = (t0 + 2864);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    memset(t7, 0, 8);
    t5 = (t7 + 4);
    t6 = (t4 + 4);
    t10 = *((unsigned int *)t4);
    t11 = (t10 >> 7);
    t12 = (t11 & 1);
    *((unsigned int *)t7) = t12;
    t13 = *((unsigned int *)t6);
    t14 = (t13 >> 7);
    t17 = (t14 & 1);
    *((unsigned int *)t5) = t17;
    t8 = (t0 + 2864);
    t9 = (t0 + 2864);
    t15 = (t9 + 72U);
    t20 = *((char **)t15);
    t21 = ((char*)((ng9)));
    xsi_vlog_generic_convert_bit_index(t16, t20, 2, t21, 32, 1);
    t22 = (t16 + 4);
    t18 = *((unsigned int *)t22);
    t40 = (!(t18));
    if (t40 == 1)
        goto LAB65;

LAB66:    xsi_set_current_line(96, ng0);
    t2 = (t0 + 1504U);
    t3 = *((char **)t2);
    t2 = (t0 + 2864);
    t4 = (t0 + 2864);
    t5 = (t4 + 72U);
    t6 = *((char **)t5);
    t8 = ((char*)((ng10)));
    xsi_vlog_generic_convert_bit_index(t7, t6, 2, t8, 32, 1);
    t9 = (t7 + 4);
    t10 = *((unsigned int *)t9);
    t40 = (!(t10));
    if (t40 == 1)
        goto LAB67;

LAB68:    xsi_set_current_line(98, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 3984);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);

LAB40:
LAB36:    xsi_set_current_line(102, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 3664);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    goto LAB32;

LAB34:    xsi_set_current_line(76, ng0);
    t54 = ((char*)((ng1)));
    t55 = (t0 + 4144);
    xsi_vlogvar_wait_assign_value(t55, t54, 0, 0, 1, 0LL);
    goto LAB36;

LAB38:    xsi_set_current_line(81, ng0);

LAB41:    xsi_set_current_line(82, ng0);
    t4 = ((char*)((ng3)));
    t5 = (t0 + 3824);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 1, 0LL);
    xsi_set_current_line(83, ng0);
    t2 = (t0 + 3344);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 2864);
    t6 = (t5 + 56U);
    t8 = *((char **)t6);
    memset(t7, 0, 8);
    t9 = (t8 + 4);
    t10 = *((unsigned int *)t8);
    t11 = *((unsigned int *)t8);
    t11 = (t11 & 1);
    if (*((unsigned int *)t9) != 0)
        goto LAB42;

LAB43:    t12 = 1;

LAB45:    t13 = (t12 <= 7);
    if (t13 == 1)
        goto LAB46;

LAB47:    *((unsigned int *)t7) = t11;

LAB44:    t17 = *((unsigned int *)t4);
    t18 = *((unsigned int *)t7);
    t19 = (t17 ^ t18);
    *((unsigned int *)t16) = t19;
    t20 = (t4 + 4);
    t21 = (t7 + 4);
    t22 = (t16 + 4);
    t23 = *((unsigned int *)t20);
    t24 = *((unsigned int *)t21);
    t25 = (t23 | t24);
    *((unsigned int *)t22) = t25;
    t26 = *((unsigned int *)t22);
    t27 = (t26 != 0);
    if (t27 == 1)
        goto LAB49;

LAB50:
LAB51:    t30 = (t0 + 2704);
    xsi_vlogvar_wait_assign_value(t30, t16, 0, 0, 1, 0LL);
    xsi_set_current_line(84, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 4144);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    goto LAB40;

LAB42:    t15 = (t7 + 4);
    *((unsigned int *)t7) = 1;
    *((unsigned int *)t15) = 1;
    goto LAB44;

LAB46:    t10 = (t10 >> 1);
    t14 = (t10 & 1);
    t11 = (t11 ^ t14);

LAB48:    t12 = (t12 + 1);
    goto LAB45;

LAB49:    t28 = *((unsigned int *)t16);
    t29 = *((unsigned int *)t22);
    *((unsigned int *)t16) = (t28 | t29);
    goto LAB51;

LAB53:    xsi_vlogvar_wait_assign_value(t8, t7, 0, *((unsigned int *)t16), 1, 0LL);
    goto LAB54;

LAB55:    xsi_vlogvar_wait_assign_value(t8, t7, 0, *((unsigned int *)t16), 1, 0LL);
    goto LAB56;

LAB57:    xsi_vlogvar_wait_assign_value(t8, t7, 0, *((unsigned int *)t16), 1, 0LL);
    goto LAB58;

LAB59:    xsi_vlogvar_wait_assign_value(t8, t7, 0, *((unsigned int *)t16), 1, 0LL);
    goto LAB60;

LAB61:    xsi_vlogvar_wait_assign_value(t8, t7, 0, *((unsigned int *)t16), 1, 0LL);
    goto LAB62;

LAB63:    xsi_vlogvar_wait_assign_value(t8, t7, 0, *((unsigned int *)t16), 1, 0LL);
    goto LAB64;

LAB65:    xsi_vlogvar_wait_assign_value(t8, t7, 0, *((unsigned int *)t16), 1, 0LL);
    goto LAB66;

LAB67:    xsi_vlogvar_wait_assign_value(t2, t3, 0, *((unsigned int *)t7), 1, 0LL);
    goto LAB68;

}

static void implSig1_execute(char *t0)
{
    char t8[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    char *t12;
    char *t13;
    char *t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    char *t22;
    char *t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    int t27;
    unsigned int t28;
    unsigned int t29;
    unsigned int t30;
    int t31;
    unsigned int t32;
    unsigned int t33;
    unsigned int t34;
    unsigned int t35;
    char *t36;
    char *t37;
    char *t38;
    char *t39;
    char *t40;
    unsigned int t41;
    unsigned int t42;
    char *t43;
    unsigned int t44;
    unsigned int t45;
    char *t46;
    unsigned int t47;
    unsigned int t48;
    char *t49;

LAB0:    t1 = (t0 + 5560U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    t2 = (t0 + 3824);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 4144);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t9 = *((unsigned int *)t4);
    t10 = *((unsigned int *)t7);
    t11 = (t9 | t10);
    *((unsigned int *)t8) = t11;
    t12 = (t4 + 4);
    t13 = (t7 + 4);
    t14 = (t8 + 4);
    t15 = *((unsigned int *)t12);
    t16 = *((unsigned int *)t13);
    t17 = (t15 | t16);
    *((unsigned int *)t14) = t17;
    t18 = *((unsigned int *)t14);
    t19 = (t18 != 0);
    if (t19 == 1)
        goto LAB4;

LAB5:
LAB6:    t36 = (t0 + 5976);
    t37 = (t36 + 56U);
    t38 = *((char **)t37);
    t39 = (t38 + 56U);
    t40 = *((char **)t39);
    memset(t40, 0, 8);
    t41 = 1U;
    t42 = t41;
    t43 = (t8 + 4);
    t44 = *((unsigned int *)t8);
    t41 = (t41 & t44);
    t45 = *((unsigned int *)t43);
    t42 = (t42 & t45);
    t46 = (t40 + 4);
    t47 = *((unsigned int *)t40);
    *((unsigned int *)t40) = (t47 | t41);
    t48 = *((unsigned int *)t46);
    *((unsigned int *)t46) = (t48 | t42);
    xsi_driver_vfirst_trans(t36, 0, 0);
    t49 = (t0 + 5896);
    *((int *)t49) = 1;

LAB1:    return;
LAB4:    t20 = *((unsigned int *)t8);
    t21 = *((unsigned int *)t14);
    *((unsigned int *)t8) = (t20 | t21);
    t22 = (t4 + 4);
    t23 = (t7 + 4);
    t24 = *((unsigned int *)t22);
    t25 = (~(t24));
    t26 = *((unsigned int *)t4);
    t27 = (t26 & t25);
    t28 = *((unsigned int *)t23);
    t29 = (~(t28));
    t30 = *((unsigned int *)t7);
    t31 = (t30 & t29);
    t32 = (~(t27));
    t33 = (~(t31));
    t34 = *((unsigned int *)t14);
    *((unsigned int *)t14) = (t34 & t32);
    t35 = *((unsigned int *)t14);
    *((unsigned int *)t14) = (t35 & t33);
    goto LAB6;

}


extern void work_m_00000000003575148866_0613195390_init()
{
	static char *pe[] = {(void *)Initial_46_0,(void *)Always_56_1,(void *)implSig1_execute};
	xsi_register_didat("work_m_00000000003575148866_0613195390", "isim/Ps2Signals_tf_isim_beh.exe.sim/work/m_00000000003575148866_0613195390.didat");
	xsi_register_executes(pe);
}
