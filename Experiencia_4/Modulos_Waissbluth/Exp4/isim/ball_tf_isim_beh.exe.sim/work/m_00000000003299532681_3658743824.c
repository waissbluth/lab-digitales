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
static const char *ng0 = "//psf/Home/Desktop/LabDigitales/Experiencia_4/Modulos_Waissbluth/Exp4/ball.v";
static int ng1[] = {310, 0};
static int ng2[] = {180, 0};
static int ng3[] = {0, 0};
static int ng4[] = {1, 0};
static int ng5[] = {615, 0};
static int ng6[] = {4, 0};
static int ng7[] = {355, 0};



static void NetDecl_44_0(char *t0)
{
    char t3[8];
    char t4[8];
    char t18[8];
    char t19[8];
    char t39[8];
    char t48[8];
    char t55[8];
    char *t1;
    char *t2;
    char *t5;
    char *t6;
    char *t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    char *t13;
    char *t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    char *t20;
    char *t21;
    char *t22;
    char *t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    unsigned int t28;
    char *t29;
    char *t30;
    unsigned int t31;
    unsigned int t32;
    unsigned int t33;
    char *t34;
    char *t35;
    char *t36;
    char *t37;
    char *t38;
    unsigned int t40;
    unsigned int t41;
    unsigned int t42;
    unsigned int t43;
    char *t44;
    char *t45;
    char *t46;
    char *t47;
    unsigned int t49;
    unsigned int t50;
    unsigned int t51;
    unsigned int t52;
    char *t53;
    char *t54;
    char *t56;
    char *t57;
    char *t58;
    char *t59;
    char *t60;
    unsigned int t61;
    unsigned int t62;
    char *t63;
    unsigned int t64;
    unsigned int t65;
    char *t66;
    unsigned int t67;
    unsigned int t68;
    char *t69;

LAB0:    t1 = (t0 + 4560U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(44, ng0);
    t2 = (t0 + 3480);
    t5 = (t2 + 56U);
    t6 = *((char **)t5);
    memset(t4, 0, 8);
    t7 = (t6 + 4);
    t8 = *((unsigned int *)t7);
    t9 = (~(t8));
    t10 = *((unsigned int *)t6);
    t11 = (t10 & t9);
    t12 = (t11 & 1U);
    if (t12 != 0)
        goto LAB4;

LAB5:    if (*((unsigned int *)t7) != 0)
        goto LAB6;

LAB7:    t14 = (t4 + 4);
    t15 = *((unsigned int *)t4);
    t16 = *((unsigned int *)t14);
    t17 = (t15 || t16);
    if (t17 > 0)
        goto LAB8;

LAB9:    t49 = *((unsigned int *)t4);
    t50 = (~(t49));
    t51 = *((unsigned int *)t14);
    t52 = (t50 || t51);
    if (t52 > 0)
        goto LAB10;

LAB11:    if (*((unsigned int *)t14) > 0)
        goto LAB12;

LAB13:    if (*((unsigned int *)t4) > 0)
        goto LAB14;

LAB15:    memcpy(t3, t55, 8);

LAB16:    t56 = (t0 + 5488);
    t57 = (t56 + 56U);
    t58 = *((char **)t57);
    t59 = (t58 + 56U);
    t60 = *((char **)t59);
    memset(t60, 0, 8);
    t61 = 2047U;
    t62 = t61;
    t63 = (t3 + 4);
    t64 = *((unsigned int *)t3);
    t61 = (t61 & t64);
    t65 = *((unsigned int *)t63);
    t62 = (t62 & t65);
    t66 = (t60 + 4);
    t67 = *((unsigned int *)t60);
    *((unsigned int *)t60) = (t67 | t61);
    t68 = *((unsigned int *)t66);
    *((unsigned int *)t66) = (t68 | t62);
    xsi_driver_vfirst_trans(t56, 0, 10U);
    t69 = (t0 + 5376);
    *((int *)t69) = 1;

LAB1:    return;
LAB4:    *((unsigned int *)t4) = 1;
    goto LAB7;

LAB6:    t13 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t13) = 1;
    goto LAB7;

LAB8:    t20 = (t0 + 3160);
    t21 = (t20 + 56U);
    t22 = *((char **)t21);
    memset(t19, 0, 8);
    t23 = (t22 + 4);
    t24 = *((unsigned int *)t23);
    t25 = (~(t24));
    t26 = *((unsigned int *)t22);
    t27 = (t26 & t25);
    t28 = (t27 & 1U);
    if (t28 != 0)
        goto LAB17;

LAB18:    if (*((unsigned int *)t23) != 0)
        goto LAB19;

LAB20:    t30 = (t19 + 4);
    t31 = *((unsigned int *)t19);
    t32 = *((unsigned int *)t30);
    t33 = (t31 || t32);
    if (t33 > 0)
        goto LAB21;

LAB22:    t40 = *((unsigned int *)t19);
    t41 = (~(t40));
    t42 = *((unsigned int *)t30);
    t43 = (t41 || t42);
    if (t43 > 0)
        goto LAB23;

LAB24:    if (*((unsigned int *)t30) > 0)
        goto LAB25;

LAB26:    if (*((unsigned int *)t19) > 0)
        goto LAB27;

LAB28:    memcpy(t18, t48, 8);

LAB29:    goto LAB9;

LAB10:    t46 = (t0 + 2520);
    t53 = (t46 + 56U);
    t54 = *((char **)t53);
    memcpy(t55, t54, 8);
    goto LAB11;

LAB12:    xsi_vlog_unsigned_bit_combine(t3, 32, t18, 32, t55, 32);
    goto LAB16;

LAB14:    memcpy(t3, t18, 8);
    goto LAB16;

LAB17:    *((unsigned int *)t19) = 1;
    goto LAB20;

LAB19:    t29 = (t19 + 4);
    *((unsigned int *)t19) = 1;
    *((unsigned int *)t29) = 1;
    goto LAB20;

LAB21:    t34 = (t0 + 2520);
    t35 = (t34 + 56U);
    t36 = *((char **)t35);
    t37 = (t0 + 608);
    t38 = *((char **)t37);
    memset(t39, 0, 8);
    xsi_vlog_unsigned_add(t39, 32, t36, 11, t38, 32);
    goto LAB22;

LAB23:    t37 = (t0 + 2520);
    t44 = (t37 + 56U);
    t45 = *((char **)t44);
    t46 = (t0 + 608);
    t47 = *((char **)t46);
    memset(t48, 0, 8);
    xsi_vlog_unsigned_minus(t48, 32, t45, 11, t47, 32);
    goto LAB24;

LAB25:    xsi_vlog_unsigned_bit_combine(t18, 32, t39, 32, t48, 32);
    goto LAB29;

LAB27:    memcpy(t18, t39, 8);
    goto LAB29;

}

static void NetDecl_45_1(char *t0)
{
    char t3[8];
    char t4[8];
    char t18[8];
    char t19[8];
    char t39[8];
    char t48[8];
    char t55[8];
    char *t1;
    char *t2;
    char *t5;
    char *t6;
    char *t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    char *t13;
    char *t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    char *t20;
    char *t21;
    char *t22;
    char *t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    unsigned int t28;
    char *t29;
    char *t30;
    unsigned int t31;
    unsigned int t32;
    unsigned int t33;
    char *t34;
    char *t35;
    char *t36;
    char *t37;
    char *t38;
    unsigned int t40;
    unsigned int t41;
    unsigned int t42;
    unsigned int t43;
    char *t44;
    char *t45;
    char *t46;
    char *t47;
    unsigned int t49;
    unsigned int t50;
    unsigned int t51;
    unsigned int t52;
    char *t53;
    char *t54;
    char *t56;
    char *t57;
    char *t58;
    char *t59;
    char *t60;
    unsigned int t61;
    unsigned int t62;
    char *t63;
    unsigned int t64;
    unsigned int t65;
    char *t66;
    unsigned int t67;
    unsigned int t68;
    char *t69;

LAB0:    t1 = (t0 + 4808U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(45, ng0);
    t2 = (t0 + 3640);
    t5 = (t2 + 56U);
    t6 = *((char **)t5);
    memset(t4, 0, 8);
    t7 = (t6 + 4);
    t8 = *((unsigned int *)t7);
    t9 = (~(t8));
    t10 = *((unsigned int *)t6);
    t11 = (t10 & t9);
    t12 = (t11 & 1U);
    if (t12 != 0)
        goto LAB4;

LAB5:    if (*((unsigned int *)t7) != 0)
        goto LAB6;

LAB7:    t14 = (t4 + 4);
    t15 = *((unsigned int *)t4);
    t16 = *((unsigned int *)t14);
    t17 = (t15 || t16);
    if (t17 > 0)
        goto LAB8;

LAB9:    t49 = *((unsigned int *)t4);
    t50 = (~(t49));
    t51 = *((unsigned int *)t14);
    t52 = (t50 || t51);
    if (t52 > 0)
        goto LAB10;

LAB11:    if (*((unsigned int *)t14) > 0)
        goto LAB12;

LAB13:    if (*((unsigned int *)t4) > 0)
        goto LAB14;

LAB15:    memcpy(t3, t55, 8);

LAB16:    t56 = (t0 + 5552);
    t57 = (t56 + 56U);
    t58 = *((char **)t57);
    t59 = (t58 + 56U);
    t60 = *((char **)t59);
    memset(t60, 0, 8);
    t61 = 1023U;
    t62 = t61;
    t63 = (t3 + 4);
    t64 = *((unsigned int *)t3);
    t61 = (t61 & t64);
    t65 = *((unsigned int *)t63);
    t62 = (t62 & t65);
    t66 = (t60 + 4);
    t67 = *((unsigned int *)t60);
    *((unsigned int *)t60) = (t67 | t61);
    t68 = *((unsigned int *)t66);
    *((unsigned int *)t66) = (t68 | t62);
    xsi_driver_vfirst_trans(t56, 0, 9U);
    t69 = (t0 + 5392);
    *((int *)t69) = 1;

LAB1:    return;
LAB4:    *((unsigned int *)t4) = 1;
    goto LAB7;

LAB6:    t13 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t13) = 1;
    goto LAB7;

LAB8:    t20 = (t0 + 3320);
    t21 = (t20 + 56U);
    t22 = *((char **)t21);
    memset(t19, 0, 8);
    t23 = (t22 + 4);
    t24 = *((unsigned int *)t23);
    t25 = (~(t24));
    t26 = *((unsigned int *)t22);
    t27 = (t26 & t25);
    t28 = (t27 & 1U);
    if (t28 != 0)
        goto LAB17;

LAB18:    if (*((unsigned int *)t23) != 0)
        goto LAB19;

LAB20:    t30 = (t19 + 4);
    t31 = *((unsigned int *)t19);
    t32 = *((unsigned int *)t30);
    t33 = (t31 || t32);
    if (t33 > 0)
        goto LAB21;

LAB22:    t40 = *((unsigned int *)t19);
    t41 = (~(t40));
    t42 = *((unsigned int *)t30);
    t43 = (t41 || t42);
    if (t43 > 0)
        goto LAB23;

LAB24:    if (*((unsigned int *)t30) > 0)
        goto LAB25;

LAB26:    if (*((unsigned int *)t19) > 0)
        goto LAB27;

LAB28:    memcpy(t18, t48, 8);

LAB29:    goto LAB9;

LAB10:    t46 = (t0 + 2680);
    t53 = (t46 + 56U);
    t54 = *((char **)t53);
    memcpy(t55, t54, 8);
    goto LAB11;

LAB12:    xsi_vlog_unsigned_bit_combine(t3, 32, t18, 32, t55, 32);
    goto LAB16;

LAB14:    memcpy(t3, t18, 8);
    goto LAB16;

LAB17:    *((unsigned int *)t19) = 1;
    goto LAB20;

LAB19:    t29 = (t19 + 4);
    *((unsigned int *)t19) = 1;
    *((unsigned int *)t29) = 1;
    goto LAB20;

LAB21:    t34 = (t0 + 2680);
    t35 = (t34 + 56U);
    t36 = *((char **)t35);
    t37 = (t0 + 472);
    t38 = *((char **)t37);
    memset(t39, 0, 8);
    xsi_vlog_unsigned_add(t39, 32, t36, 10, t38, 32);
    goto LAB22;

LAB23:    t37 = (t0 + 2680);
    t44 = (t37 + 56U);
    t45 = *((char **)t44);
    t46 = (t0 + 472);
    t47 = *((char **)t46);
    memset(t48, 0, 8);
    xsi_vlog_unsigned_minus(t48, 32, t45, 10, t47, 32);
    goto LAB24;

LAB25:    xsi_vlog_unsigned_bit_combine(t18, 32, t39, 32, t48, 32);
    goto LAB29;

LAB27:    memcpy(t18, t39, 8);
    goto LAB29;

}

static void Always_47_2(char *t0)
{
    char t6[8];
    char t21[8];
    char t29[8];
    char t57[8];
    char t73[8];
    char t81[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    char *t12;
    char *t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    char *t18;
    char *t19;
    char *t20;
    char *t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    char *t28;
    unsigned int t30;
    unsigned int t31;
    unsigned int t32;
    char *t33;
    char *t34;
    char *t35;
    unsigned int t36;
    unsigned int t37;
    unsigned int t38;
    unsigned int t39;
    unsigned int t40;
    unsigned int t41;
    unsigned int t42;
    char *t43;
    char *t44;
    unsigned int t45;
    unsigned int t46;
    unsigned int t47;
    int t48;
    unsigned int t49;
    unsigned int t50;
    unsigned int t51;
    int t52;
    unsigned int t53;
    unsigned int t54;
    unsigned int t55;
    unsigned int t56;
    char *t58;
    unsigned int t59;
    unsigned int t60;
    unsigned int t61;
    unsigned int t62;
    unsigned int t63;
    char *t64;
    char *t65;
    unsigned int t66;
    unsigned int t67;
    unsigned int t68;
    unsigned int t69;
    char *t70;
    char *t71;
    char *t72;
    char *t74;
    unsigned int t75;
    unsigned int t76;
    unsigned int t77;
    unsigned int t78;
    unsigned int t79;
    char *t80;
    unsigned int t82;
    unsigned int t83;
    unsigned int t84;
    char *t85;
    char *t86;
    char *t87;
    unsigned int t88;
    unsigned int t89;
    unsigned int t90;
    unsigned int t91;
    unsigned int t92;
    unsigned int t93;
    unsigned int t94;
    char *t95;
    char *t96;
    unsigned int t97;
    unsigned int t98;
    unsigned int t99;
    int t100;
    unsigned int t101;
    unsigned int t102;
    unsigned int t103;
    int t104;
    unsigned int t105;
    unsigned int t106;
    unsigned int t107;
    unsigned int t108;
    char *t109;
    unsigned int t110;
    unsigned int t111;
    unsigned int t112;
    unsigned int t113;
    unsigned int t114;
    char *t115;
    char *t116;

LAB0:    t1 = (t0 + 5056U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(47, ng0);
    t2 = (t0 + 5408);
    *((int *)t2) = 1;
    t3 = (t0 + 5088);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(48, ng0);

LAB5:    xsi_set_current_line(50, ng0);
    t4 = (t0 + 1480U);
    t5 = *((char **)t4);
    memset(t6, 0, 8);
    t4 = (t5 + 4);
    t7 = *((unsigned int *)t4);
    t8 = (~(t7));
    t9 = *((unsigned int *)t5);
    t10 = (t9 & t8);
    t11 = (t10 & 1U);
    if (t11 != 0)
        goto LAB6;

LAB7:    if (*((unsigned int *)t4) != 0)
        goto LAB8;

LAB9:    t13 = (t6 + 4);
    t14 = *((unsigned int *)t6);
    t15 = (!(t14));
    t16 = *((unsigned int *)t13);
    t17 = (t15 || t16);
    if (t17 > 0)
        goto LAB10;

LAB11:    memcpy(t29, t6, 8);

LAB12:    memset(t57, 0, 8);
    t58 = (t29 + 4);
    t59 = *((unsigned int *)t58);
    t60 = (~(t59));
    t61 = *((unsigned int *)t29);
    t62 = (t61 & t60);
    t63 = (t62 & 1U);
    if (t63 != 0)
        goto LAB20;

LAB21:    if (*((unsigned int *)t58) != 0)
        goto LAB22;

LAB23:    t65 = (t57 + 4);
    t66 = *((unsigned int *)t57);
    t67 = (!(t66));
    t68 = *((unsigned int *)t65);
    t69 = (t67 || t68);
    if (t69 > 0)
        goto LAB24;

LAB25:    memcpy(t81, t57, 8);

LAB26:    t109 = (t81 + 4);
    t110 = *((unsigned int *)t109);
    t111 = (~(t110));
    t112 = *((unsigned int *)t81);
    t113 = (t112 & t111);
    t114 = (t113 != 0);
    if (t114 > 0)
        goto LAB34;

LAB35:    xsi_set_current_line(60, ng0);

LAB38:    xsi_set_current_line(63, ng0);
    t2 = (t0 + 1960U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng5)));
    memset(t6, 0, 8);
    t4 = (t3 + 4);
    if (*((unsigned int *)t4) != 0)
        goto LAB40;

LAB39:    t5 = (t2 + 4);
    if (*((unsigned int *)t5) != 0)
        goto LAB40;

LAB43:    if (*((unsigned int *)t3) > *((unsigned int *)t2))
        goto LAB41;

LAB42:    t13 = (t6 + 4);
    t7 = *((unsigned int *)t13);
    t8 = (~(t7));
    t9 = *((unsigned int *)t6);
    t10 = (t9 & t8);
    t11 = (t10 != 0);
    if (t11 > 0)
        goto LAB44;

LAB45:    xsi_set_current_line(65, ng0);
    t2 = (t0 + 1960U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng6)));
    memset(t6, 0, 8);
    t4 = (t3 + 4);
    if (*((unsigned int *)t4) != 0)
        goto LAB48;

LAB47:    t5 = (t2 + 4);
    if (*((unsigned int *)t5) != 0)
        goto LAB48;

LAB51:    if (*((unsigned int *)t3) < *((unsigned int *)t2))
        goto LAB49;

LAB50:    t13 = (t6 + 4);
    t7 = *((unsigned int *)t13);
    t8 = (~(t7));
    t9 = *((unsigned int *)t6);
    t10 = (t9 & t8);
    t11 = (t10 != 0);
    if (t11 > 0)
        goto LAB52;

LAB53:    xsi_set_current_line(68, ng0);
    t2 = (t0 + 1960U);
    t3 = *((char **)t2);
    t2 = (t0 + 2520);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 11, 0LL);

LAB54:
LAB46:    xsi_set_current_line(71, ng0);
    t2 = (t0 + 2120U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng7)));
    memset(t6, 0, 8);
    t4 = (t3 + 4);
    if (*((unsigned int *)t4) != 0)
        goto LAB56;

LAB55:    t5 = (t2 + 4);
    if (*((unsigned int *)t5) != 0)
        goto LAB56;

LAB59:    if (*((unsigned int *)t3) > *((unsigned int *)t2))
        goto LAB57;

LAB58:    t13 = (t6 + 4);
    t7 = *((unsigned int *)t13);
    t8 = (~(t7));
    t9 = *((unsigned int *)t6);
    t10 = (t9 & t8);
    t11 = (t10 != 0);
    if (t11 > 0)
        goto LAB60;

LAB61:    xsi_set_current_line(74, ng0);
    t2 = (t0 + 2120U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng6)));
    memset(t6, 0, 8);
    t4 = (t3 + 4);
    if (*((unsigned int *)t4) != 0)
        goto LAB65;

LAB64:    t5 = (t2 + 4);
    if (*((unsigned int *)t5) != 0)
        goto LAB65;

LAB68:    if (*((unsigned int *)t3) < *((unsigned int *)t2))
        goto LAB66;

LAB67:    t13 = (t6 + 4);
    t7 = *((unsigned int *)t13);
    t8 = (~(t7));
    t9 = *((unsigned int *)t6);
    t10 = (t9 & t8);
    t11 = (t10 != 0);
    if (t11 > 0)
        goto LAB69;

LAB70:    xsi_set_current_line(78, ng0);
    t2 = (t0 + 2120U);
    t3 = *((char **)t2);
    t2 = (t0 + 2680);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 10, 0LL);

LAB71:
LAB62:
LAB36:    goto LAB2;

LAB6:    *((unsigned int *)t6) = 1;
    goto LAB9;

LAB8:    t12 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t12) = 1;
    goto LAB9;

LAB10:    t18 = (t0 + 2840);
    t19 = (t18 + 56U);
    t20 = *((char **)t19);
    memset(t21, 0, 8);
    t22 = (t20 + 4);
    t23 = *((unsigned int *)t22);
    t24 = (~(t23));
    t25 = *((unsigned int *)t20);
    t26 = (t25 & t24);
    t27 = (t26 & 1U);
    if (t27 != 0)
        goto LAB13;

LAB14:    if (*((unsigned int *)t22) != 0)
        goto LAB15;

LAB16:    t30 = *((unsigned int *)t6);
    t31 = *((unsigned int *)t21);
    t32 = (t30 | t31);
    *((unsigned int *)t29) = t32;
    t33 = (t6 + 4);
    t34 = (t21 + 4);
    t35 = (t29 + 4);
    t36 = *((unsigned int *)t33);
    t37 = *((unsigned int *)t34);
    t38 = (t36 | t37);
    *((unsigned int *)t35) = t38;
    t39 = *((unsigned int *)t35);
    t40 = (t39 != 0);
    if (t40 == 1)
        goto LAB17;

LAB18:
LAB19:    goto LAB12;

LAB13:    *((unsigned int *)t21) = 1;
    goto LAB16;

LAB15:    t28 = (t21 + 4);
    *((unsigned int *)t21) = 1;
    *((unsigned int *)t28) = 1;
    goto LAB16;

LAB17:    t41 = *((unsigned int *)t29);
    t42 = *((unsigned int *)t35);
    *((unsigned int *)t29) = (t41 | t42);
    t43 = (t6 + 4);
    t44 = (t21 + 4);
    t45 = *((unsigned int *)t43);
    t46 = (~(t45));
    t47 = *((unsigned int *)t6);
    t48 = (t47 & t46);
    t49 = *((unsigned int *)t44);
    t50 = (~(t49));
    t51 = *((unsigned int *)t21);
    t52 = (t51 & t50);
    t53 = (~(t48));
    t54 = (~(t52));
    t55 = *((unsigned int *)t35);
    *((unsigned int *)t35) = (t55 & t53);
    t56 = *((unsigned int *)t35);
    *((unsigned int *)t35) = (t56 & t54);
    goto LAB19;

LAB20:    *((unsigned int *)t57) = 1;
    goto LAB23;

LAB22:    t64 = (t57 + 4);
    *((unsigned int *)t57) = 1;
    *((unsigned int *)t64) = 1;
    goto LAB23;

LAB24:    t70 = (t0 + 3000);
    t71 = (t70 + 56U);
    t72 = *((char **)t71);
    memset(t73, 0, 8);
    t74 = (t72 + 4);
    t75 = *((unsigned int *)t74);
    t76 = (~(t75));
    t77 = *((unsigned int *)t72);
    t78 = (t77 & t76);
    t79 = (t78 & 1U);
    if (t79 != 0)
        goto LAB27;

LAB28:    if (*((unsigned int *)t74) != 0)
        goto LAB29;

LAB30:    t82 = *((unsigned int *)t57);
    t83 = *((unsigned int *)t73);
    t84 = (t82 | t83);
    *((unsigned int *)t81) = t84;
    t85 = (t57 + 4);
    t86 = (t73 + 4);
    t87 = (t81 + 4);
    t88 = *((unsigned int *)t85);
    t89 = *((unsigned int *)t86);
    t90 = (t88 | t89);
    *((unsigned int *)t87) = t90;
    t91 = *((unsigned int *)t87);
    t92 = (t91 != 0);
    if (t92 == 1)
        goto LAB31;

LAB32:
LAB33:    goto LAB26;

LAB27:    *((unsigned int *)t73) = 1;
    goto LAB30;

LAB29:    t80 = (t73 + 4);
    *((unsigned int *)t73) = 1;
    *((unsigned int *)t80) = 1;
    goto LAB30;

LAB31:    t93 = *((unsigned int *)t81);
    t94 = *((unsigned int *)t87);
    *((unsigned int *)t81) = (t93 | t94);
    t95 = (t57 + 4);
    t96 = (t73 + 4);
    t97 = *((unsigned int *)t95);
    t98 = (~(t97));
    t99 = *((unsigned int *)t57);
    t100 = (t99 & t98);
    t101 = *((unsigned int *)t96);
    t102 = (~(t101));
    t103 = *((unsigned int *)t73);
    t104 = (t103 & t102);
    t105 = (~(t100));
    t106 = (~(t104));
    t107 = *((unsigned int *)t87);
    *((unsigned int *)t87) = (t107 & t105);
    t108 = *((unsigned int *)t87);
    *((unsigned int *)t87) = (t108 & t106);
    goto LAB33;

LAB34:    xsi_set_current_line(50, ng0);

LAB37:    xsi_set_current_line(51, ng0);
    t115 = ((char*)((ng1)));
    t116 = (t0 + 2520);
    xsi_vlogvar_wait_assign_value(t116, t115, 0, 0, 11, 0LL);
    xsi_set_current_line(52, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 2680);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 10, 0LL);
    xsi_set_current_line(53, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 2840);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(54, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 3000);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(55, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 3480);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(56, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 3640);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(57, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 3320);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(58, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 3160);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    goto LAB36;

LAB40:    t12 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t12) = 1;
    goto LAB42;

LAB41:    *((unsigned int *)t6) = 1;
    goto LAB42;

LAB44:    xsi_set_current_line(64, ng0);
    t18 = ((char*)((ng4)));
    t19 = (t0 + 2840);
    xsi_vlogvar_wait_assign_value(t19, t18, 0, 0, 1, 0LL);
    goto LAB46;

LAB48:    t12 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t12) = 1;
    goto LAB50;

LAB49:    *((unsigned int *)t6) = 1;
    goto LAB50;

LAB52:    xsi_set_current_line(66, ng0);
    t18 = ((char*)((ng4)));
    t19 = (t0 + 3000);
    xsi_vlogvar_wait_assign_value(t19, t18, 0, 0, 1, 0LL);
    goto LAB54;

LAB56:    t12 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t12) = 1;
    goto LAB58;

LAB57:    *((unsigned int *)t6) = 1;
    goto LAB58;

LAB60:    xsi_set_current_line(71, ng0);

LAB63:    xsi_set_current_line(72, ng0);
    t18 = ((char*)((ng7)));
    t19 = (t0 + 2680);
    xsi_vlogvar_wait_assign_value(t19, t18, 0, 0, 10, 0LL);
    xsi_set_current_line(73, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 3320);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    goto LAB62;

LAB65:    t12 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t12) = 1;
    goto LAB67;

LAB66:    *((unsigned int *)t6) = 1;
    goto LAB67;

LAB69:    xsi_set_current_line(74, ng0);

LAB72:    xsi_set_current_line(75, ng0);
    t18 = ((char*)((ng6)));
    t19 = (t0 + 2680);
    xsi_vlogvar_wait_assign_value(t19, t18, 0, 0, 10, 0LL);
    xsi_set_current_line(76, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 3320);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    goto LAB71;

}


extern void work_m_00000000003299532681_3658743824_init()
{
	static char *pe[] = {(void *)NetDecl_44_0,(void *)NetDecl_45_1,(void *)Always_47_2};
	xsi_register_didat("work_m_00000000003299532681_3658743824", "isim/ball_tf_isim_beh.exe.sim/work/m_00000000003299532681_3658743824.didat");
	xsi_register_executes(pe);
}
