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



static void Always_46_0(char *t0)
{
    char t6[8];
    char t21[8];
    char t29[8];
    char t57[8];
    char t73[8];
    char t81[8];
    char t117[8];
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

LAB0:    t1 = (t0 + 4560U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(46, ng0);
    t2 = (t0 + 4880);
    *((int *)t2) = 1;
    t3 = (t0 + 4592);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(47, ng0);

LAB5:    xsi_set_current_line(49, ng0);
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

LAB35:    xsi_set_current_line(59, ng0);

LAB38:    xsi_set_current_line(60, ng0);
    t2 = (t0 + 3160);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    memset(t21, 0, 8);
    t5 = (t4 + 4);
    t7 = *((unsigned int *)t5);
    t8 = (~(t7));
    t9 = *((unsigned int *)t4);
    t10 = (t9 & t8);
    t11 = (t10 & 1U);
    if (t11 != 0)
        goto LAB39;

LAB40:    if (*((unsigned int *)t5) != 0)
        goto LAB41;

LAB42:    t13 = (t21 + 4);
    t14 = *((unsigned int *)t21);
    t15 = *((unsigned int *)t13);
    t16 = (t14 || t15);
    if (t16 > 0)
        goto LAB43;

LAB44:    t39 = *((unsigned int *)t21);
    t40 = (~(t39));
    t41 = *((unsigned int *)t13);
    t42 = (t40 || t41);
    if (t42 > 0)
        goto LAB45;

LAB46:    if (*((unsigned int *)t13) > 0)
        goto LAB47;

LAB48:    if (*((unsigned int *)t21) > 0)
        goto LAB49;

LAB50:    memcpy(t6, t117, 8);

LAB51:    t80 = (t0 + 3480);
    xsi_vlogvar_wait_assign_value(t80, t6, 0, 0, 11, 0LL);
    xsi_set_current_line(61, ng0);
    t2 = (t0 + 3320);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    memset(t21, 0, 8);
    t5 = (t4 + 4);
    t7 = *((unsigned int *)t5);
    t8 = (~(t7));
    t9 = *((unsigned int *)t4);
    t10 = (t9 & t8);
    t11 = (t10 & 1U);
    if (t11 != 0)
        goto LAB65;

LAB66:    if (*((unsigned int *)t5) != 0)
        goto LAB67;

LAB68:    t13 = (t21 + 4);
    t14 = *((unsigned int *)t21);
    t15 = *((unsigned int *)t13);
    t16 = (t14 || t15);
    if (t16 > 0)
        goto LAB69;

LAB70:    t39 = *((unsigned int *)t21);
    t40 = (~(t39));
    t41 = *((unsigned int *)t13);
    t42 = (t40 || t41);
    if (t42 > 0)
        goto LAB71;

LAB72:    if (*((unsigned int *)t13) > 0)
        goto LAB73;

LAB74:    if (*((unsigned int *)t21) > 0)
        goto LAB75;

LAB76:    memcpy(t6, t117, 8);

LAB77:    t80 = (t0 + 3640);
    xsi_vlogvar_wait_assign_value(t80, t6, 0, 0, 10, 0LL);

LAB36:    xsi_set_current_line(65, ng0);
    t2 = (t0 + 3480);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng5)));
    memset(t6, 0, 8);
    t12 = (t4 + 4);
    if (*((unsigned int *)t12) != 0)
        goto LAB92;

LAB91:    t13 = (t5 + 4);
    if (*((unsigned int *)t13) != 0)
        goto LAB92;

LAB95:    if (*((unsigned int *)t4) > *((unsigned int *)t5))
        goto LAB93;

LAB94:    t19 = (t6 + 4);
    t7 = *((unsigned int *)t19);
    t8 = (~(t7));
    t9 = *((unsigned int *)t6);
    t10 = (t9 & t8);
    t11 = (t10 != 0);
    if (t11 > 0)
        goto LAB96;

LAB97:    xsi_set_current_line(67, ng0);
    t2 = (t0 + 3480);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng6)));
    memset(t6, 0, 8);
    t12 = (t4 + 4);
    if (*((unsigned int *)t12) != 0)
        goto LAB100;

LAB99:    t13 = (t5 + 4);
    if (*((unsigned int *)t13) != 0)
        goto LAB100;

LAB103:    if (*((unsigned int *)t4) < *((unsigned int *)t5))
        goto LAB101;

LAB102:    t19 = (t6 + 4);
    t7 = *((unsigned int *)t19);
    t8 = (~(t7));
    t9 = *((unsigned int *)t6);
    t10 = (t9 & t8);
    t11 = (t10 != 0);
    if (t11 > 0)
        goto LAB104;

LAB105:    xsi_set_current_line(70, ng0);
    t2 = (t0 + 3480);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 2200);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 11, 0LL);

LAB106:
LAB98:    xsi_set_current_line(73, ng0);
    t2 = (t0 + 3640);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng7)));
    memset(t6, 0, 8);
    t12 = (t4 + 4);
    if (*((unsigned int *)t12) != 0)
        goto LAB108;

LAB107:    t13 = (t5 + 4);
    if (*((unsigned int *)t13) != 0)
        goto LAB108;

LAB111:    if (*((unsigned int *)t4) > *((unsigned int *)t5))
        goto LAB109;

LAB110:    t19 = (t6 + 4);
    t7 = *((unsigned int *)t19);
    t8 = (~(t7));
    t9 = *((unsigned int *)t6);
    t10 = (t9 & t8);
    t11 = (t10 != 0);
    if (t11 > 0)
        goto LAB112;

LAB113:    xsi_set_current_line(76, ng0);
    t2 = (t0 + 3640);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng6)));
    memset(t6, 0, 8);
    t12 = (t4 + 4);
    if (*((unsigned int *)t12) != 0)
        goto LAB117;

LAB116:    t13 = (t5 + 4);
    if (*((unsigned int *)t13) != 0)
        goto LAB117;

LAB120:    if (*((unsigned int *)t4) < *((unsigned int *)t5))
        goto LAB118;

LAB119:    t19 = (t6 + 4);
    t7 = *((unsigned int *)t19);
    t8 = (~(t7));
    t9 = *((unsigned int *)t6);
    t10 = (t9 & t8);
    t11 = (t10 != 0);
    if (t11 > 0)
        goto LAB121;

LAB122:    xsi_set_current_line(80, ng0);
    t2 = (t0 + 3640);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 2360);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 10, 0LL);

LAB123:
LAB114:    goto LAB2;

LAB6:    *((unsigned int *)t6) = 1;
    goto LAB9;

LAB8:    t12 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t12) = 1;
    goto LAB9;

LAB10:    t18 = (t0 + 2520);
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

LAB24:    t70 = (t0 + 2680);
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

LAB34:    xsi_set_current_line(49, ng0);

LAB37:    xsi_set_current_line(50, ng0);
    t115 = ((char*)((ng1)));
    t116 = (t0 + 3480);
    xsi_vlogvar_wait_assign_value(t116, t115, 0, 0, 11, 0LL);
    xsi_set_current_line(51, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 3640);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 10, 0LL);
    xsi_set_current_line(52, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 2520);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(53, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 2680);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(54, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 3160);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(55, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 3320);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(56, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 3000);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(57, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 2840);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    goto LAB36;

LAB39:    *((unsigned int *)t21) = 1;
    goto LAB42;

LAB41:    t12 = (t21 + 4);
    *((unsigned int *)t21) = 1;
    *((unsigned int *)t12) = 1;
    goto LAB42;

LAB43:    t18 = (t0 + 2840);
    t19 = (t18 + 56U);
    t20 = *((char **)t19);
    memset(t57, 0, 8);
    t22 = (t20 + 4);
    t17 = *((unsigned int *)t22);
    t23 = (~(t17));
    t24 = *((unsigned int *)t20);
    t25 = (t24 & t23);
    t26 = (t25 & 1U);
    if (t26 != 0)
        goto LAB52;

LAB53:    if (*((unsigned int *)t22) != 0)
        goto LAB54;

LAB55:    t33 = (t57 + 4);
    t27 = *((unsigned int *)t57);
    t30 = *((unsigned int *)t33);
    t31 = (t27 || t30);
    if (t31 > 0)
        goto LAB56;

LAB57:    t32 = *((unsigned int *)t57);
    t36 = (~(t32));
    t37 = *((unsigned int *)t33);
    t38 = (t36 || t37);
    if (t38 > 0)
        goto LAB58;

LAB59:    if (*((unsigned int *)t33) > 0)
        goto LAB60;

LAB61:    if (*((unsigned int *)t57) > 0)
        goto LAB62;

LAB63:    memcpy(t29, t81, 8);

LAB64:    goto LAB44;

LAB45:    t70 = (t0 + 2200);
    t72 = (t70 + 56U);
    t74 = *((char **)t72);
    memcpy(t117, t74, 8);
    goto LAB46;

LAB47:    xsi_vlog_unsigned_bit_combine(t6, 32, t29, 32, t117, 32);
    goto LAB51;

LAB49:    memcpy(t6, t29, 8);
    goto LAB51;

LAB52:    *((unsigned int *)t57) = 1;
    goto LAB55;

LAB54:    t28 = (t57 + 4);
    *((unsigned int *)t57) = 1;
    *((unsigned int *)t28) = 1;
    goto LAB55;

LAB56:    t34 = (t0 + 2200);
    t35 = (t34 + 56U);
    t43 = *((char **)t35);
    t44 = (t0 + 472);
    t58 = *((char **)t44);
    memset(t73, 0, 8);
    xsi_vlog_unsigned_add(t73, 32, t43, 11, t58, 32);
    goto LAB57;

LAB58:    t44 = (t0 + 2200);
    t64 = (t44 + 56U);
    t65 = *((char **)t64);
    t70 = (t0 + 472);
    t71 = *((char **)t70);
    memset(t81, 0, 8);
    xsi_vlog_unsigned_minus(t81, 32, t65, 11, t71, 32);
    goto LAB59;

LAB60:    xsi_vlog_unsigned_bit_combine(t29, 32, t73, 32, t81, 32);
    goto LAB64;

LAB62:    memcpy(t29, t73, 8);
    goto LAB64;

LAB65:    *((unsigned int *)t21) = 1;
    goto LAB68;

LAB67:    t12 = (t21 + 4);
    *((unsigned int *)t21) = 1;
    *((unsigned int *)t12) = 1;
    goto LAB68;

LAB69:    t18 = (t0 + 3000);
    t19 = (t18 + 56U);
    t20 = *((char **)t19);
    memset(t57, 0, 8);
    t22 = (t20 + 4);
    t17 = *((unsigned int *)t22);
    t23 = (~(t17));
    t24 = *((unsigned int *)t20);
    t25 = (t24 & t23);
    t26 = (t25 & 1U);
    if (t26 != 0)
        goto LAB78;

LAB79:    if (*((unsigned int *)t22) != 0)
        goto LAB80;

LAB81:    t33 = (t57 + 4);
    t27 = *((unsigned int *)t57);
    t30 = *((unsigned int *)t33);
    t31 = (t27 || t30);
    if (t31 > 0)
        goto LAB82;

LAB83:    t32 = *((unsigned int *)t57);
    t36 = (~(t32));
    t37 = *((unsigned int *)t33);
    t38 = (t36 || t37);
    if (t38 > 0)
        goto LAB84;

LAB85:    if (*((unsigned int *)t33) > 0)
        goto LAB86;

LAB87:    if (*((unsigned int *)t57) > 0)
        goto LAB88;

LAB89:    memcpy(t29, t81, 8);

LAB90:    goto LAB70;

LAB71:    t70 = (t0 + 2360);
    t72 = (t70 + 56U);
    t74 = *((char **)t72);
    memcpy(t117, t74, 8);
    goto LAB72;

LAB73:    xsi_vlog_unsigned_bit_combine(t6, 32, t29, 32, t117, 32);
    goto LAB77;

LAB75:    memcpy(t6, t29, 8);
    goto LAB77;

LAB78:    *((unsigned int *)t57) = 1;
    goto LAB81;

LAB80:    t28 = (t57 + 4);
    *((unsigned int *)t57) = 1;
    *((unsigned int *)t28) = 1;
    goto LAB81;

LAB82:    t34 = (t0 + 2360);
    t35 = (t34 + 56U);
    t43 = *((char **)t35);
    t44 = (t0 + 608);
    t58 = *((char **)t44);
    memset(t73, 0, 8);
    xsi_vlog_unsigned_add(t73, 32, t43, 10, t58, 32);
    goto LAB83;

LAB84:    t44 = (t0 + 2360);
    t64 = (t44 + 56U);
    t65 = *((char **)t64);
    t70 = (t0 + 608);
    t71 = *((char **)t70);
    memset(t81, 0, 8);
    xsi_vlog_unsigned_minus(t81, 32, t65, 10, t71, 32);
    goto LAB85;

LAB86:    xsi_vlog_unsigned_bit_combine(t29, 32, t73, 32, t81, 32);
    goto LAB90;

LAB88:    memcpy(t29, t73, 8);
    goto LAB90;

LAB92:    t18 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t18) = 1;
    goto LAB94;

LAB93:    *((unsigned int *)t6) = 1;
    goto LAB94;

LAB96:    xsi_set_current_line(66, ng0);
    t20 = ((char*)((ng4)));
    t22 = (t0 + 2520);
    xsi_vlogvar_wait_assign_value(t22, t20, 0, 0, 1, 0LL);
    goto LAB98;

LAB100:    t18 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t18) = 1;
    goto LAB102;

LAB101:    *((unsigned int *)t6) = 1;
    goto LAB102;

LAB104:    xsi_set_current_line(68, ng0);
    t20 = ((char*)((ng4)));
    t22 = (t0 + 2680);
    xsi_vlogvar_wait_assign_value(t22, t20, 0, 0, 1, 0LL);
    goto LAB106;

LAB108:    t18 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t18) = 1;
    goto LAB110;

LAB109:    *((unsigned int *)t6) = 1;
    goto LAB110;

LAB112:    xsi_set_current_line(73, ng0);

LAB115:    xsi_set_current_line(74, ng0);
    t20 = ((char*)((ng7)));
    t22 = (t0 + 3640);
    xsi_vlogvar_wait_assign_value(t22, t20, 0, 0, 10, 0LL);
    xsi_set_current_line(75, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 3000);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    goto LAB114;

LAB117:    t18 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t18) = 1;
    goto LAB119;

LAB118:    *((unsigned int *)t6) = 1;
    goto LAB119;

LAB121:    xsi_set_current_line(76, ng0);

LAB124:    xsi_set_current_line(77, ng0);
    t20 = ((char*)((ng6)));
    t22 = (t0 + 3640);
    xsi_vlogvar_wait_assign_value(t22, t20, 0, 0, 10, 0LL);
    xsi_set_current_line(78, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 3000);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    goto LAB123;

}


extern void work_m_00000000003949303685_3658743824_init()
{
	static char *pe[] = {(void *)Always_46_0};
	xsi_register_didat("work_m_00000000003949303685_3658743824", "isim/ball_tf_isim_beh.exe.sim/work/m_00000000003949303685_3658743824.didat");
	xsi_register_executes(pe);
}
