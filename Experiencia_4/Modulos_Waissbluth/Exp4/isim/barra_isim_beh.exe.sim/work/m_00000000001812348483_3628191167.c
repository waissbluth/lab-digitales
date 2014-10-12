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
static const char *ng0 = "//psf/Home/Desktop/LabDigitales/Experiencia_4/Modulos_Waissbluth/Exp4/barra.v";
static int ng1[] = {180, 0};



static void Initial_36_0(char *t0)
{
    char *t1;
    char *t2;

LAB0:    xsi_set_current_line(36, ng0);
    t1 = ((char*)((ng1)));
    t2 = (t0 + 2336);
    xsi_vlogvar_assign_value(t2, t1, 0, 0, 10);

LAB1:    return;
}

static void Always_38_1(char *t0)
{
    char t13[8];
    char t20[8];
    char t23[8];
    char t31[8];
    char t63[8];
    char t75[8];
    char t84[8];
    char t92[8];
    char t130[8];
    char t131[8];
    char t137[8];
    char t139[8];
    char t158[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    char *t11;
    char *t12;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    char *t17;
    char *t18;
    char *t19;
    char *t21;
    char *t22;
    char *t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    unsigned int t28;
    unsigned int t29;
    char *t30;
    unsigned int t32;
    unsigned int t33;
    unsigned int t34;
    char *t35;
    char *t36;
    char *t37;
    unsigned int t38;
    unsigned int t39;
    unsigned int t40;
    unsigned int t41;
    unsigned int t42;
    unsigned int t43;
    unsigned int t44;
    char *t45;
    char *t46;
    unsigned int t47;
    unsigned int t48;
    unsigned int t49;
    unsigned int t50;
    unsigned int t51;
    unsigned int t52;
    unsigned int t53;
    unsigned int t54;
    int t55;
    int t56;
    unsigned int t57;
    unsigned int t58;
    unsigned int t59;
    unsigned int t60;
    unsigned int t61;
    unsigned int t62;
    char *t64;
    unsigned int t65;
    unsigned int t66;
    unsigned int t67;
    unsigned int t68;
    unsigned int t69;
    char *t70;
    char *t71;
    unsigned int t72;
    unsigned int t73;
    unsigned int t74;
    char *t76;
    char *t77;
    unsigned int t78;
    unsigned int t79;
    unsigned int t80;
    unsigned int t81;
    unsigned int t82;
    char *t83;
    char *t85;
    unsigned int t86;
    unsigned int t87;
    unsigned int t88;
    unsigned int t89;
    unsigned int t90;
    char *t91;
    unsigned int t93;
    unsigned int t94;
    unsigned int t95;
    char *t96;
    char *t97;
    char *t98;
    unsigned int t99;
    unsigned int t100;
    unsigned int t101;
    unsigned int t102;
    unsigned int t103;
    unsigned int t104;
    unsigned int t105;
    char *t106;
    char *t107;
    unsigned int t108;
    unsigned int t109;
    unsigned int t110;
    unsigned int t111;
    unsigned int t112;
    unsigned int t113;
    unsigned int t114;
    unsigned int t115;
    int t116;
    int t117;
    unsigned int t118;
    unsigned int t119;
    unsigned int t120;
    unsigned int t121;
    unsigned int t122;
    unsigned int t123;
    char *t124;
    unsigned int t125;
    unsigned int t126;
    unsigned int t127;
    unsigned int t128;
    unsigned int t129;
    char *t132;
    char *t133;
    char *t134;
    char *t135;
    char *t136;
    char *t138;
    char *t140;
    char *t141;
    char *t142;
    unsigned int t143;
    unsigned int t144;
    unsigned int t145;
    unsigned int t146;
    unsigned int t147;
    char *t148;
    char *t149;
    unsigned int t150;
    unsigned int t151;
    unsigned int t152;
    char *t153;
    char *t154;
    char *t155;
    char *t156;
    char *t157;
    unsigned int t159;
    unsigned int t160;
    unsigned int t161;
    unsigned int t162;
    char *t163;

LAB0:    t1 = (t0 + 3504U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(38, ng0);
    t2 = (t0 + 3824);
    *((int *)t2) = 1;
    t3 = (t0 + 3536);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(39, ng0);

LAB5:    xsi_set_current_line(41, ng0);
    t4 = (t0 + 1616U);
    t5 = *((char **)t4);
    t4 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB6;

LAB7:    xsi_set_current_line(43, ng0);
    t2 = (t0 + 1776U);
    t3 = *((char **)t2);
    memset(t13, 0, 8);
    t2 = (t3 + 4);
    t6 = *((unsigned int *)t2);
    t7 = (~(t6));
    t8 = *((unsigned int *)t3);
    t9 = (t8 & t7);
    t10 = (t9 & 1U);
    if (t10 != 0)
        goto LAB9;

LAB10:    if (*((unsigned int *)t2) != 0)
        goto LAB11;

LAB12:    t5 = (t13 + 4);
    t14 = *((unsigned int *)t13);
    t15 = *((unsigned int *)t5);
    t16 = (t14 || t15);
    if (t16 > 0)
        goto LAB13;

LAB14:    memcpy(t31, t13, 8);

LAB15:    memset(t63, 0, 8);
    t64 = (t31 + 4);
    t65 = *((unsigned int *)t64);
    t66 = (~(t65));
    t67 = *((unsigned int *)t31);
    t68 = (t67 & t66);
    t69 = (t68 & 1U);
    if (t69 != 0)
        goto LAB28;

LAB29:    if (*((unsigned int *)t64) != 0)
        goto LAB30;

LAB31:    t71 = (t63 + 4);
    t72 = *((unsigned int *)t63);
    t73 = *((unsigned int *)t71);
    t74 = (t72 || t73);
    if (t74 > 0)
        goto LAB32;

LAB33:    memcpy(t92, t63, 8);

LAB34:    t124 = (t92 + 4);
    t125 = *((unsigned int *)t124);
    t126 = (~(t125));
    t127 = *((unsigned int *)t92);
    t128 = (t127 & t126);
    t129 = (t128 != 0);
    if (t129 > 0)
        goto LAB46;

LAB47:    xsi_set_current_line(46, ng0);
    t2 = (t0 + 1936U);
    t3 = *((char **)t2);
    memset(t13, 0, 8);
    t2 = (t3 + 4);
    t6 = *((unsigned int *)t2);
    t7 = (~(t6));
    t8 = *((unsigned int *)t3);
    t9 = (t8 & t7);
    t10 = (t9 & 1U);
    if (t10 != 0)
        goto LAB67;

LAB68:    if (*((unsigned int *)t2) != 0)
        goto LAB69;

LAB70:    t5 = (t13 + 4);
    t14 = *((unsigned int *)t13);
    t15 = *((unsigned int *)t5);
    t16 = (t14 || t15);
    if (t16 > 0)
        goto LAB71;

LAB72:    memcpy(t31, t13, 8);

LAB73:    memset(t63, 0, 8);
    t64 = (t31 + 4);
    t65 = *((unsigned int *)t64);
    t66 = (~(t65));
    t67 = *((unsigned int *)t31);
    t68 = (t67 & t66);
    t69 = (t68 & 1U);
    if (t69 != 0)
        goto LAB86;

LAB87:    if (*((unsigned int *)t64) != 0)
        goto LAB88;

LAB89:    t71 = (t63 + 4);
    t72 = *((unsigned int *)t63);
    t73 = *((unsigned int *)t71);
    t74 = (t72 || t73);
    if (t74 > 0)
        goto LAB90;

LAB91:    memcpy(t92, t63, 8);

LAB92:    t124 = (t92 + 4);
    t125 = *((unsigned int *)t124);
    t126 = (~(t125));
    t127 = *((unsigned int *)t92);
    t128 = (t127 & t126);
    t129 = (t128 != 0);
    if (t129 > 0)
        goto LAB104;

LAB105:    xsi_set_current_line(50, ng0);
    t2 = (t0 + 2336);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 2336);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 10, 0LL);

LAB106:
LAB48:
LAB8:    goto LAB2;

LAB6:    xsi_set_current_line(42, ng0);
    t11 = ((char*)((ng1)));
    t12 = (t0 + 2336);
    xsi_vlogvar_wait_assign_value(t12, t11, 0, 0, 10, 0LL);
    goto LAB8;

LAB9:    *((unsigned int *)t13) = 1;
    goto LAB12;

LAB11:    t4 = (t13 + 4);
    *((unsigned int *)t13) = 1;
    *((unsigned int *)t4) = 1;
    goto LAB12;

LAB13:    t11 = (t0 + 2336);
    t12 = (t11 + 56U);
    t17 = *((char **)t12);
    t18 = (t0 + 608);
    t19 = *((char **)t18);
    memset(t20, 0, 8);
    t18 = (t17 + 4);
    if (*((unsigned int *)t18) != 0)
        goto LAB17;

LAB16:    t21 = (t19 + 4);
    if (*((unsigned int *)t21) != 0)
        goto LAB17;

LAB20:    if (*((unsigned int *)t17) < *((unsigned int *)t19))
        goto LAB18;

LAB19:    memset(t23, 0, 8);
    t24 = (t20 + 4);
    t25 = *((unsigned int *)t24);
    t26 = (~(t25));
    t27 = *((unsigned int *)t20);
    t28 = (t27 & t26);
    t29 = (t28 & 1U);
    if (t29 != 0)
        goto LAB21;

LAB22:    if (*((unsigned int *)t24) != 0)
        goto LAB23;

LAB24:    t32 = *((unsigned int *)t13);
    t33 = *((unsigned int *)t23);
    t34 = (t32 & t33);
    *((unsigned int *)t31) = t34;
    t35 = (t13 + 4);
    t36 = (t23 + 4);
    t37 = (t31 + 4);
    t38 = *((unsigned int *)t35);
    t39 = *((unsigned int *)t36);
    t40 = (t38 | t39);
    *((unsigned int *)t37) = t40;
    t41 = *((unsigned int *)t37);
    t42 = (t41 != 0);
    if (t42 == 1)
        goto LAB25;

LAB26:
LAB27:    goto LAB15;

LAB17:    t22 = (t20 + 4);
    *((unsigned int *)t20) = 1;
    *((unsigned int *)t22) = 1;
    goto LAB19;

LAB18:    *((unsigned int *)t20) = 1;
    goto LAB19;

LAB21:    *((unsigned int *)t23) = 1;
    goto LAB24;

LAB23:    t30 = (t23 + 4);
    *((unsigned int *)t23) = 1;
    *((unsigned int *)t30) = 1;
    goto LAB24;

LAB25:    t43 = *((unsigned int *)t31);
    t44 = *((unsigned int *)t37);
    *((unsigned int *)t31) = (t43 | t44);
    t45 = (t13 + 4);
    t46 = (t23 + 4);
    t47 = *((unsigned int *)t13);
    t48 = (~(t47));
    t49 = *((unsigned int *)t45);
    t50 = (~(t49));
    t51 = *((unsigned int *)t23);
    t52 = (~(t51));
    t53 = *((unsigned int *)t46);
    t54 = (~(t53));
    t55 = (t48 & t50);
    t56 = (t52 & t54);
    t57 = (~(t55));
    t58 = (~(t56));
    t59 = *((unsigned int *)t37);
    *((unsigned int *)t37) = (t59 & t57);
    t60 = *((unsigned int *)t37);
    *((unsigned int *)t37) = (t60 & t58);
    t61 = *((unsigned int *)t31);
    *((unsigned int *)t31) = (t61 & t57);
    t62 = *((unsigned int *)t31);
    *((unsigned int *)t31) = (t62 & t58);
    goto LAB27;

LAB28:    *((unsigned int *)t63) = 1;
    goto LAB31;

LAB30:    t70 = (t63 + 4);
    *((unsigned int *)t63) = 1;
    *((unsigned int *)t70) = 1;
    goto LAB31;

LAB32:    t76 = (t0 + 1936U);
    t77 = *((char **)t76);
    memset(t75, 0, 8);
    t76 = (t77 + 4);
    t78 = *((unsigned int *)t76);
    t79 = (~(t78));
    t80 = *((unsigned int *)t77);
    t81 = (t80 & t79);
    t82 = (t81 & 1U);
    if (t82 != 0)
        goto LAB38;

LAB36:    if (*((unsigned int *)t76) == 0)
        goto LAB35;

LAB37:    t83 = (t75 + 4);
    *((unsigned int *)t75) = 1;
    *((unsigned int *)t83) = 1;

LAB38:    memset(t84, 0, 8);
    t85 = (t75 + 4);
    t86 = *((unsigned int *)t85);
    t87 = (~(t86));
    t88 = *((unsigned int *)t75);
    t89 = (t88 & t87);
    t90 = (t89 & 1U);
    if (t90 != 0)
        goto LAB39;

LAB40:    if (*((unsigned int *)t85) != 0)
        goto LAB41;

LAB42:    t93 = *((unsigned int *)t63);
    t94 = *((unsigned int *)t84);
    t95 = (t93 & t94);
    *((unsigned int *)t92) = t95;
    t96 = (t63 + 4);
    t97 = (t84 + 4);
    t98 = (t92 + 4);
    t99 = *((unsigned int *)t96);
    t100 = *((unsigned int *)t97);
    t101 = (t99 | t100);
    *((unsigned int *)t98) = t101;
    t102 = *((unsigned int *)t98);
    t103 = (t102 != 0);
    if (t103 == 1)
        goto LAB43;

LAB44:
LAB45:    goto LAB34;

LAB35:    *((unsigned int *)t75) = 1;
    goto LAB38;

LAB39:    *((unsigned int *)t84) = 1;
    goto LAB42;

LAB41:    t91 = (t84 + 4);
    *((unsigned int *)t84) = 1;
    *((unsigned int *)t91) = 1;
    goto LAB42;

LAB43:    t104 = *((unsigned int *)t92);
    t105 = *((unsigned int *)t98);
    *((unsigned int *)t92) = (t104 | t105);
    t106 = (t63 + 4);
    t107 = (t84 + 4);
    t108 = *((unsigned int *)t63);
    t109 = (~(t108));
    t110 = *((unsigned int *)t106);
    t111 = (~(t110));
    t112 = *((unsigned int *)t84);
    t113 = (~(t112));
    t114 = *((unsigned int *)t107);
    t115 = (~(t114));
    t116 = (t109 & t111);
    t117 = (t113 & t115);
    t118 = (~(t116));
    t119 = (~(t117));
    t120 = *((unsigned int *)t98);
    *((unsigned int *)t98) = (t120 & t118);
    t121 = *((unsigned int *)t98);
    *((unsigned int *)t98) = (t121 & t119);
    t122 = *((unsigned int *)t92);
    *((unsigned int *)t92) = (t122 & t118);
    t123 = *((unsigned int *)t92);
    *((unsigned int *)t92) = (t123 & t119);
    goto LAB45;

LAB46:    xsi_set_current_line(45, ng0);
    t132 = (t0 + 2336);
    t133 = (t132 + 56U);
    t134 = *((char **)t133);
    t135 = (t0 + 744);
    t136 = *((char **)t135);
    memset(t137, 0, 8);
    xsi_vlog_unsigned_add(t137, 32, t134, 10, t136, 32);
    t135 = (t0 + 608);
    t138 = *((char **)t135);
    memset(t139, 0, 8);
    t135 = (t137 + 4);
    if (*((unsigned int *)t135) != 0)
        goto LAB50;

LAB49:    t140 = (t138 + 4);
    if (*((unsigned int *)t140) != 0)
        goto LAB50;

LAB53:    if (*((unsigned int *)t137) < *((unsigned int *)t138))
        goto LAB51;

LAB52:    memset(t131, 0, 8);
    t142 = (t139 + 4);
    t143 = *((unsigned int *)t142);
    t144 = (~(t143));
    t145 = *((unsigned int *)t139);
    t146 = (t145 & t144);
    t147 = (t146 & 1U);
    if (t147 != 0)
        goto LAB54;

LAB55:    if (*((unsigned int *)t142) != 0)
        goto LAB56;

LAB57:    t149 = (t131 + 4);
    t150 = *((unsigned int *)t131);
    t151 = *((unsigned int *)t149);
    t152 = (t150 || t151);
    if (t152 > 0)
        goto LAB58;

LAB59:    t159 = *((unsigned int *)t131);
    t160 = (~(t159));
    t161 = *((unsigned int *)t149);
    t162 = (t160 || t161);
    if (t162 > 0)
        goto LAB60;

LAB61:    if (*((unsigned int *)t149) > 0)
        goto LAB62;

LAB63:    if (*((unsigned int *)t131) > 0)
        goto LAB64;

LAB65:    memcpy(t130, t163, 8);

LAB66:    t156 = (t0 + 2336);
    xsi_vlogvar_wait_assign_value(t156, t130, 0, 0, 10, 0LL);
    goto LAB48;

LAB50:    t141 = (t139 + 4);
    *((unsigned int *)t139) = 1;
    *((unsigned int *)t141) = 1;
    goto LAB52;

LAB51:    *((unsigned int *)t139) = 1;
    goto LAB52;

LAB54:    *((unsigned int *)t131) = 1;
    goto LAB57;

LAB56:    t148 = (t131 + 4);
    *((unsigned int *)t131) = 1;
    *((unsigned int *)t148) = 1;
    goto LAB57;

LAB58:    t153 = (t0 + 2336);
    t154 = (t153 + 56U);
    t155 = *((char **)t154);
    t156 = (t0 + 744);
    t157 = *((char **)t156);
    memset(t158, 0, 8);
    xsi_vlog_unsigned_add(t158, 32, t155, 10, t157, 32);
    goto LAB59;

LAB60:    t156 = (t0 + 608);
    t163 = *((char **)t156);
    goto LAB61;

LAB62:    xsi_vlog_unsigned_bit_combine(t130, 32, t158, 32, t163, 32);
    goto LAB66;

LAB64:    memcpy(t130, t158, 8);
    goto LAB66;

LAB67:    *((unsigned int *)t13) = 1;
    goto LAB70;

LAB69:    t4 = (t13 + 4);
    *((unsigned int *)t13) = 1;
    *((unsigned int *)t4) = 1;
    goto LAB70;

LAB71:    t11 = (t0 + 2336);
    t12 = (t11 + 56U);
    t17 = *((char **)t12);
    t18 = (t0 + 472);
    t19 = *((char **)t18);
    memset(t20, 0, 8);
    t18 = (t17 + 4);
    if (*((unsigned int *)t18) != 0)
        goto LAB75;

LAB74:    t21 = (t19 + 4);
    if (*((unsigned int *)t21) != 0)
        goto LAB75;

LAB78:    if (*((unsigned int *)t17) > *((unsigned int *)t19))
        goto LAB76;

LAB77:    memset(t23, 0, 8);
    t24 = (t20 + 4);
    t25 = *((unsigned int *)t24);
    t26 = (~(t25));
    t27 = *((unsigned int *)t20);
    t28 = (t27 & t26);
    t29 = (t28 & 1U);
    if (t29 != 0)
        goto LAB79;

LAB80:    if (*((unsigned int *)t24) != 0)
        goto LAB81;

LAB82:    t32 = *((unsigned int *)t13);
    t33 = *((unsigned int *)t23);
    t34 = (t32 & t33);
    *((unsigned int *)t31) = t34;
    t35 = (t13 + 4);
    t36 = (t23 + 4);
    t37 = (t31 + 4);
    t38 = *((unsigned int *)t35);
    t39 = *((unsigned int *)t36);
    t40 = (t38 | t39);
    *((unsigned int *)t37) = t40;
    t41 = *((unsigned int *)t37);
    t42 = (t41 != 0);
    if (t42 == 1)
        goto LAB83;

LAB84:
LAB85:    goto LAB73;

LAB75:    t22 = (t20 + 4);
    *((unsigned int *)t20) = 1;
    *((unsigned int *)t22) = 1;
    goto LAB77;

LAB76:    *((unsigned int *)t20) = 1;
    goto LAB77;

LAB79:    *((unsigned int *)t23) = 1;
    goto LAB82;

LAB81:    t30 = (t23 + 4);
    *((unsigned int *)t23) = 1;
    *((unsigned int *)t30) = 1;
    goto LAB82;

LAB83:    t43 = *((unsigned int *)t31);
    t44 = *((unsigned int *)t37);
    *((unsigned int *)t31) = (t43 | t44);
    t45 = (t13 + 4);
    t46 = (t23 + 4);
    t47 = *((unsigned int *)t13);
    t48 = (~(t47));
    t49 = *((unsigned int *)t45);
    t50 = (~(t49));
    t51 = *((unsigned int *)t23);
    t52 = (~(t51));
    t53 = *((unsigned int *)t46);
    t54 = (~(t53));
    t55 = (t48 & t50);
    t56 = (t52 & t54);
    t57 = (~(t55));
    t58 = (~(t56));
    t59 = *((unsigned int *)t37);
    *((unsigned int *)t37) = (t59 & t57);
    t60 = *((unsigned int *)t37);
    *((unsigned int *)t37) = (t60 & t58);
    t61 = *((unsigned int *)t31);
    *((unsigned int *)t31) = (t61 & t57);
    t62 = *((unsigned int *)t31);
    *((unsigned int *)t31) = (t62 & t58);
    goto LAB85;

LAB86:    *((unsigned int *)t63) = 1;
    goto LAB89;

LAB88:    t70 = (t63 + 4);
    *((unsigned int *)t63) = 1;
    *((unsigned int *)t70) = 1;
    goto LAB89;

LAB90:    t76 = (t0 + 1776U);
    t77 = *((char **)t76);
    memset(t75, 0, 8);
    t76 = (t77 + 4);
    t78 = *((unsigned int *)t76);
    t79 = (~(t78));
    t80 = *((unsigned int *)t77);
    t81 = (t80 & t79);
    t82 = (t81 & 1U);
    if (t82 != 0)
        goto LAB96;

LAB94:    if (*((unsigned int *)t76) == 0)
        goto LAB93;

LAB95:    t83 = (t75 + 4);
    *((unsigned int *)t75) = 1;
    *((unsigned int *)t83) = 1;

LAB96:    memset(t84, 0, 8);
    t85 = (t75 + 4);
    t86 = *((unsigned int *)t85);
    t87 = (~(t86));
    t88 = *((unsigned int *)t75);
    t89 = (t88 & t87);
    t90 = (t89 & 1U);
    if (t90 != 0)
        goto LAB97;

LAB98:    if (*((unsigned int *)t85) != 0)
        goto LAB99;

LAB100:    t93 = *((unsigned int *)t63);
    t94 = *((unsigned int *)t84);
    t95 = (t93 & t94);
    *((unsigned int *)t92) = t95;
    t96 = (t63 + 4);
    t97 = (t84 + 4);
    t98 = (t92 + 4);
    t99 = *((unsigned int *)t96);
    t100 = *((unsigned int *)t97);
    t101 = (t99 | t100);
    *((unsigned int *)t98) = t101;
    t102 = *((unsigned int *)t98);
    t103 = (t102 != 0);
    if (t103 == 1)
        goto LAB101;

LAB102:
LAB103:    goto LAB92;

LAB93:    *((unsigned int *)t75) = 1;
    goto LAB96;

LAB97:    *((unsigned int *)t84) = 1;
    goto LAB100;

LAB99:    t91 = (t84 + 4);
    *((unsigned int *)t84) = 1;
    *((unsigned int *)t91) = 1;
    goto LAB100;

LAB101:    t104 = *((unsigned int *)t92);
    t105 = *((unsigned int *)t98);
    *((unsigned int *)t92) = (t104 | t105);
    t106 = (t63 + 4);
    t107 = (t84 + 4);
    t108 = *((unsigned int *)t63);
    t109 = (~(t108));
    t110 = *((unsigned int *)t106);
    t111 = (~(t110));
    t112 = *((unsigned int *)t84);
    t113 = (~(t112));
    t114 = *((unsigned int *)t107);
    t115 = (~(t114));
    t116 = (t109 & t111);
    t117 = (t113 & t115);
    t118 = (~(t116));
    t119 = (~(t117));
    t120 = *((unsigned int *)t98);
    *((unsigned int *)t98) = (t120 & t118);
    t121 = *((unsigned int *)t98);
    *((unsigned int *)t98) = (t121 & t119);
    t122 = *((unsigned int *)t92);
    *((unsigned int *)t92) = (t122 & t118);
    t123 = *((unsigned int *)t92);
    *((unsigned int *)t92) = (t123 & t119);
    goto LAB103;

LAB104:    xsi_set_current_line(48, ng0);
    t132 = (t0 + 2336);
    t133 = (t132 + 56U);
    t134 = *((char **)t133);
    t135 = (t0 + 744);
    t136 = *((char **)t135);
    memset(t137, 0, 8);
    xsi_vlog_unsigned_minus(t137, 32, t134, 10, t136, 32);
    t135 = (t0 + 472);
    t138 = *((char **)t135);
    memset(t139, 0, 8);
    t135 = (t137 + 4);
    if (*((unsigned int *)t135) != 0)
        goto LAB108;

LAB107:    t140 = (t138 + 4);
    if (*((unsigned int *)t140) != 0)
        goto LAB108;

LAB111:    if (*((unsigned int *)t137) > *((unsigned int *)t138))
        goto LAB109;

LAB110:    memset(t131, 0, 8);
    t142 = (t139 + 4);
    t143 = *((unsigned int *)t142);
    t144 = (~(t143));
    t145 = *((unsigned int *)t139);
    t146 = (t145 & t144);
    t147 = (t146 & 1U);
    if (t147 != 0)
        goto LAB112;

LAB113:    if (*((unsigned int *)t142) != 0)
        goto LAB114;

LAB115:    t149 = (t131 + 4);
    t150 = *((unsigned int *)t131);
    t151 = *((unsigned int *)t149);
    t152 = (t150 || t151);
    if (t152 > 0)
        goto LAB116;

LAB117:    t159 = *((unsigned int *)t131);
    t160 = (~(t159));
    t161 = *((unsigned int *)t149);
    t162 = (t160 || t161);
    if (t162 > 0)
        goto LAB118;

LAB119:    if (*((unsigned int *)t149) > 0)
        goto LAB120;

LAB121:    if (*((unsigned int *)t131) > 0)
        goto LAB122;

LAB123:    memcpy(t130, t163, 8);

LAB124:    t156 = (t0 + 2336);
    xsi_vlogvar_wait_assign_value(t156, t130, 0, 0, 10, 0LL);
    goto LAB106;

LAB108:    t141 = (t139 + 4);
    *((unsigned int *)t139) = 1;
    *((unsigned int *)t141) = 1;
    goto LAB110;

LAB109:    *((unsigned int *)t139) = 1;
    goto LAB110;

LAB112:    *((unsigned int *)t131) = 1;
    goto LAB115;

LAB114:    t148 = (t131 + 4);
    *((unsigned int *)t131) = 1;
    *((unsigned int *)t148) = 1;
    goto LAB115;

LAB116:    t153 = (t0 + 2336);
    t154 = (t153 + 56U);
    t155 = *((char **)t154);
    t156 = (t0 + 744);
    t157 = *((char **)t156);
    memset(t158, 0, 8);
    xsi_vlog_unsigned_minus(t158, 32, t155, 10, t157, 32);
    goto LAB117;

LAB118:    t156 = (t0 + 472);
    t163 = *((char **)t156);
    goto LAB119;

LAB120:    xsi_vlog_unsigned_bit_combine(t130, 32, t158, 32, t163, 32);
    goto LAB124;

LAB122:    memcpy(t130, t158, 8);
    goto LAB124;

}


extern void work_m_00000000001812348483_3628191167_init()
{
	static char *pe[] = {(void *)Initial_36_0,(void *)Always_38_1};
	xsi_register_didat("work_m_00000000001812348483_3628191167", "isim/barra_isim_beh.exe.sim/work/m_00000000001812348483_3628191167.didat");
	xsi_register_executes(pe);
}
