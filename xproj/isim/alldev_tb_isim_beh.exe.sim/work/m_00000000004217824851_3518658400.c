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

/* This file is designed for use with ISim build 0xc3576ebc */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "E:/Git Repos/m0use-c0ntr0113/xproj/src/amba/master.v";
static int ng1[] = {0, 0};
static int ng2[] = {1823, 0};
static int ng3[] = {1, 0};
static unsigned int ng4[] = {2U, 0U};
static unsigned int ng5[] = {15U, 0U};
static int ng6[] = {2, 0};



static void Initial_59_0(char *t0)
{
    char t6[8];
    char t15[8];
    char t16[8];
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
    char *t17;
    char *t18;
    char *t19;
    char *t20;
    char *t21;
    char *t22;
    char *t23;
    char *t24;
    char *t25;
    unsigned int t26;
    int t27;
    char *t28;
    unsigned int t29;
    int t30;
    int t31;
    unsigned int t32;
    unsigned int t33;
    int t34;
    int t35;

LAB0:    xsi_set_current_line(59, ng0);

LAB2:    xsi_set_current_line(60, ng0);
    xsi_set_current_line(60, ng0);
    t1 = ((char*)((ng1)));
    t2 = (t0 + 6080);
    xsi_vlogvar_assign_value(t2, t1, 0, 0, 32);

LAB3:    t1 = (t0 + 6080);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = (t0 + 744);
    t5 = *((char **)t4);
    memset(t6, 0, 8);
    xsi_vlog_signed_leq(t6, 32, t3, 32, t5, 32);
    t4 = (t6 + 4);
    t7 = *((unsigned int *)t4);
    t8 = (~(t7));
    t9 = *((unsigned int *)t6);
    t10 = (t9 & t8);
    t11 = (t10 != 0);
    if (t11 > 0)
        goto LAB4;

LAB5:
LAB1:    return;
LAB4:    xsi_set_current_line(61, ng0);

LAB6:    xsi_set_current_line(62, ng0);
    t12 = ((char*)((ng2)));
    t13 = (t0 + 6240);
    xsi_vlogvar_assign_value(t13, t12, 0, 0, 32);
    xsi_set_current_line(63, ng0);
    t1 = (t0 + 6240);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    memset(t6, 0, 8);
    t4 = (t6 + 4);
    t5 = (t3 + 4);
    t7 = *((unsigned int *)t3);
    t8 = (t7 >> 0);
    *((unsigned int *)t6) = t8;
    t9 = *((unsigned int *)t5);
    t10 = (t9 >> 0);
    *((unsigned int *)t4) = t10;
    t11 = *((unsigned int *)t6);
    *((unsigned int *)t6) = (t11 & 255U);
    t14 = *((unsigned int *)t4);
    *((unsigned int *)t4) = (t14 & 255U);
    t12 = (t0 + 5760);
    t13 = (t0 + 5760);
    t17 = (t13 + 72U);
    t18 = *((char **)t17);
    t19 = (t0 + 5760);
    t20 = (t19 + 64U);
    t21 = *((char **)t20);
    t22 = (t0 + 6080);
    t23 = (t22 + 56U);
    t24 = *((char **)t23);
    xsi_vlog_generic_convert_array_indices(t15, t16, t18, t21, 2, 1, t24, 32, 1);
    t25 = (t15 + 4);
    t26 = *((unsigned int *)t25);
    t27 = (!(t26));
    t28 = (t16 + 4);
    t29 = *((unsigned int *)t28);
    t30 = (!(t29));
    t31 = (t27 && t30);
    if (t31 == 1)
        goto LAB7;

LAB8:    xsi_set_current_line(64, ng0);
    t1 = ((char*)((ng1)));
    t2 = (t0 + 5920);
    t3 = (t0 + 5920);
    t4 = (t3 + 72U);
    t5 = *((char **)t4);
    t12 = (t0 + 5920);
    t13 = (t12 + 64U);
    t17 = *((char **)t13);
    t18 = (t0 + 6080);
    t19 = (t18 + 56U);
    t20 = *((char **)t19);
    xsi_vlog_generic_convert_array_indices(t6, t15, t5, t17, 2, 1, t20, 32, 1);
    t21 = (t6 + 4);
    t7 = *((unsigned int *)t21);
    t27 = (!(t7));
    t22 = (t15 + 4);
    t8 = *((unsigned int *)t22);
    t30 = (!(t8));
    t31 = (t27 && t30);
    if (t31 == 1)
        goto LAB9;

LAB10:    xsi_set_current_line(60, ng0);
    t1 = (t0 + 6080);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = ((char*)((ng3)));
    memset(t6, 0, 8);
    xsi_vlog_signed_add(t6, 32, t3, 32, t4, 32);
    t5 = (t0 + 6080);
    xsi_vlogvar_assign_value(t5, t6, 0, 0, 32);
    goto LAB3;

LAB7:    t32 = *((unsigned int *)t15);
    t33 = *((unsigned int *)t16);
    t34 = (t32 - t33);
    t35 = (t34 + 1);
    xsi_vlogvar_assign_value(t12, t6, 0, *((unsigned int *)t16), t35);
    goto LAB8;

LAB9:    t9 = *((unsigned int *)t6);
    t10 = *((unsigned int *)t15);
    t34 = (t9 - t10);
    t35 = (t34 + 1);
    xsi_vlogvar_assign_value(t2, t1, 0, *((unsigned int *)t15), t35);
    goto LAB10;

}

static void NetDecl_69_1(char *t0)
{
    char t3[8];
    char *t1;
    char *t2;
    char *t4;
    unsigned int t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    char *t10;
    char *t11;
    char *t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    char *t21;
    char *t22;
    char *t23;
    char *t24;
    char *t25;
    unsigned int t26;
    unsigned int t27;
    char *t28;
    unsigned int t29;
    unsigned int t30;
    char *t31;
    unsigned int t32;
    unsigned int t33;
    char *t34;

LAB0:    t1 = (t0 + 9808U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(69, ng0);
    t2 = (t0 + 2160U);
    t4 = *((char **)t2);
    memset(t3, 0, 8);
    t2 = (t4 + 4);
    t5 = *((unsigned int *)t2);
    t6 = (~(t5));
    t7 = *((unsigned int *)t4);
    t8 = (t7 & t6);
    t9 = (t8 & 1U);
    if (t9 != 0)
        goto LAB7;

LAB5:    if (*((unsigned int *)t2) == 0)
        goto LAB4;

LAB6:    t10 = (t3 + 4);
    *((unsigned int *)t3) = 1;
    *((unsigned int *)t10) = 1;

LAB7:    t11 = (t3 + 4);
    t12 = (t4 + 4);
    t13 = *((unsigned int *)t4);
    t14 = (~(t13));
    *((unsigned int *)t3) = t14;
    *((unsigned int *)t11) = 0;
    if (*((unsigned int *)t12) != 0)
        goto LAB9;

LAB8:    t19 = *((unsigned int *)t3);
    *((unsigned int *)t3) = (t19 & 1U);
    t20 = *((unsigned int *)t11);
    *((unsigned int *)t11) = (t20 & 1U);
    t21 = (t0 + 11264);
    t22 = (t21 + 56U);
    t23 = *((char **)t22);
    t24 = (t23 + 56U);
    t25 = *((char **)t24);
    memset(t25, 0, 8);
    t26 = 1U;
    t27 = t26;
    t28 = (t3 + 4);
    t29 = *((unsigned int *)t3);
    t26 = (t26 & t29);
    t30 = *((unsigned int *)t28);
    t27 = (t27 & t30);
    t31 = (t25 + 4);
    t32 = *((unsigned int *)t25);
    *((unsigned int *)t25) = (t32 | t26);
    t33 = *((unsigned int *)t31);
    *((unsigned int *)t31) = (t33 | t27);
    xsi_driver_vfirst_trans(t21, 0, 0U);
    t34 = (t0 + 11120);
    *((int *)t34) = 1;

LAB1:    return;
LAB4:    *((unsigned int *)t3) = 1;
    goto LAB7;

LAB9:    t15 = *((unsigned int *)t3);
    t16 = *((unsigned int *)t12);
    *((unsigned int *)t3) = (t15 | t16);
    t17 = *((unsigned int *)t11);
    t18 = *((unsigned int *)t12);
    *((unsigned int *)t11) = (t17 | t18);
    goto LAB8;

}

static void Always_85_2(char *t0)
{
    char t13[8];
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

LAB0:    t1 = (t0 + 10056U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(85, ng0);
    t2 = (t0 + 11136);
    *((int *)t2) = 1;
    t3 = (t0 + 10088);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(86, ng0);
    t4 = (t0 + 3600U);
    t5 = *((char **)t4);
    t4 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB5;

LAB6:    xsi_set_current_line(94, ng0);

LAB9:    xsi_set_current_line(95, ng0);
    t2 = (t0 + 6400);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 4000);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 8, 0LL);
    xsi_set_current_line(96, ng0);
    t2 = (t0 + 6560);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 4160);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 3, 0LL);
    xsi_set_current_line(97, ng0);
    t2 = (t0 + 7360);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 4320);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 1, 0LL);
    xsi_set_current_line(99, ng0);
    t2 = (t0 + 6720);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 4480);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 32, 0LL);
    xsi_set_current_line(100, ng0);
    t2 = (t0 + 6880);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 4640);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 4, 0LL);
    xsi_set_current_line(101, ng0);
    t2 = (t0 + 7040);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 4800);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 1, 0LL);
    xsi_set_current_line(103, ng0);
    t2 = (t0 + 7200);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 4960);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 1, 0LL);
    xsi_set_current_line(105, ng0);
    t2 = (t0 + 7680);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 7520);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 2, 0LL);

LAB7:    goto LAB2;

LAB5:    xsi_set_current_line(87, ng0);

LAB8:    xsi_set_current_line(88, ng0);
    t11 = ((char*)((ng1)));
    t12 = (t0 + 4320);
    xsi_vlogvar_wait_assign_value(t12, t11, 0, 0, 1, 0LL);
    xsi_set_current_line(89, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 4800);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(90, ng0);
    t2 = ((char*)((ng3)));
    memset(t13, 0, 8);
    xsi_vlog_signed_unary_minus(t13, 32, t2, 32);
    t3 = (t0 + 4000);
    xsi_vlogvar_wait_assign_value(t3, t13, 0, 0, 8, 0LL);
    xsi_set_current_line(91, ng0);
    t2 = (t0 + 880);
    t3 = *((char **)t2);
    t2 = (t0 + 7520);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 2, 0LL);
    goto LAB7;

}

static void Always_108_3(char *t0)
{
    char t9[8];
    char t10[8];
    char t11[8];
    char t46[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    int t8;
    char *t12;
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
    unsigned int t23;
    unsigned int t24;
    char *t25;
    char *t26;
    unsigned int t27;
    unsigned int t28;
    unsigned int t29;
    unsigned int t30;
    unsigned int t31;
    char *t32;
    char *t33;
    unsigned int t34;
    unsigned int t35;
    unsigned int t36;
    char *t37;
    unsigned int t38;
    unsigned int t39;
    unsigned int t40;
    unsigned int t41;
    char *t42;
    char *t43;
    char *t44;
    char *t45;
    char *t47;
    int t48;
    int t49;
    unsigned int t50;
    unsigned int t51;
    unsigned int t52;
    unsigned int t53;
    unsigned int t54;

LAB0:    t1 = (t0 + 10304U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(108, ng0);
    t2 = (t0 + 11152);
    *((int *)t2) = 1;
    t3 = (t0 + 10336);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(109, ng0);

LAB5:    xsi_set_current_line(110, ng0);
    t4 = (t0 + 4000);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = (t0 + 6400);
    xsi_vlogvar_assign_value(t7, t6, 0, 0, 8);
    xsi_set_current_line(111, ng0);
    t2 = (t0 + 4160);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 6560);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 3);
    xsi_set_current_line(112, ng0);
    t2 = (t0 + 4320);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 7360);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 1);
    xsi_set_current_line(114, ng0);
    t2 = (t0 + 4480);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 6720);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 32);
    xsi_set_current_line(115, ng0);
    t2 = (t0 + 4640);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 6880);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 4);
    xsi_set_current_line(116, ng0);
    t2 = (t0 + 4800);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 7040);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 1);
    xsi_set_current_line(118, ng0);
    t2 = (t0 + 4960);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 7200);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 1);
    xsi_set_current_line(120, ng0);
    t2 = (t0 + 7520);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 7680);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 2);
    xsi_set_current_line(122, ng0);
    t2 = (t0 + 7520);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);

LAB6:    t5 = (t0 + 880);
    t6 = *((char **)t5);
    t8 = xsi_vlog_unsigned_case_compare(t4, 2, t6, 32);
    if (t8 == 1)
        goto LAB7;

LAB8:    t2 = (t0 + 1016);
    t3 = *((char **)t2);
    t8 = xsi_vlog_unsigned_case_compare(t4, 2, t3, 32);
    if (t8 == 1)
        goto LAB9;

LAB10:    t2 = (t0 + 1152);
    t3 = *((char **)t2);
    t8 = xsi_vlog_unsigned_case_compare(t4, 2, t3, 32);
    if (t8 == 1)
        goto LAB11;

LAB12:    t2 = (t0 + 1288);
    t3 = *((char **)t2);
    t8 = xsi_vlog_unsigned_case_compare(t4, 2, t3, 32);
    if (t8 == 1)
        goto LAB13;

LAB14:
LAB15:    goto LAB2;

LAB7:    xsi_set_current_line(123, ng0);
    t5 = (t0 + 1016);
    t7 = *((char **)t5);
    t5 = (t0 + 7680);
    xsi_vlogvar_assign_value(t5, t7, 0, 0, 2);
    goto LAB15;

LAB9:    xsi_set_current_line(124, ng0);

LAB16:    xsi_set_current_line(125, ng0);
    t2 = ((char*)((ng3)));
    t5 = (t0 + 7360);
    xsi_vlogvar_assign_value(t5, t2, 0, 0, 1);
    xsi_set_current_line(126, ng0);
    t2 = (t0 + 4000);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t6 = (t0 + 744);
    t7 = *((char **)t6);
    memset(t11, 0, 8);
    t6 = (t5 + 4);
    t12 = (t7 + 4);
    t13 = *((unsigned int *)t5);
    t14 = *((unsigned int *)t7);
    t15 = (t13 ^ t14);
    t16 = *((unsigned int *)t6);
    t17 = *((unsigned int *)t12);
    t18 = (t16 ^ t17);
    t19 = (t15 | t18);
    t20 = *((unsigned int *)t6);
    t21 = *((unsigned int *)t12);
    t22 = (t20 | t21);
    t23 = (~(t22));
    t24 = (t19 & t23);
    if (t24 != 0)
        goto LAB20;

LAB17:    if (t22 != 0)
        goto LAB19;

LAB18:    *((unsigned int *)t11) = 1;

LAB20:    memset(t10, 0, 8);
    t26 = (t11 + 4);
    t27 = *((unsigned int *)t26);
    t28 = (~(t27));
    t29 = *((unsigned int *)t11);
    t30 = (t29 & t28);
    t31 = (t30 & 1U);
    if (t31 != 0)
        goto LAB21;

LAB22:    if (*((unsigned int *)t26) != 0)
        goto LAB23;

LAB24:    t33 = (t10 + 4);
    t34 = *((unsigned int *)t10);
    t35 = *((unsigned int *)t33);
    t36 = (t34 || t35);
    if (t36 > 0)
        goto LAB25;

LAB26:    t38 = *((unsigned int *)t10);
    t39 = (~(t38));
    t40 = *((unsigned int *)t33);
    t41 = (t39 || t40);
    if (t41 > 0)
        goto LAB27;

LAB28:    if (*((unsigned int *)t33) > 0)
        goto LAB29;

LAB30:    if (*((unsigned int *)t10) > 0)
        goto LAB31;

LAB32:    memcpy(t9, t46, 8);

LAB33:    t47 = (t0 + 6400);
    xsi_vlogvar_assign_value(t47, t9, 0, 0, 8);
    xsi_set_current_line(127, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 6560);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 3);
    xsi_set_current_line(129, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 7040);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(130, ng0);
    t2 = (t0 + 5760);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t6 = (t0 + 5760);
    t7 = (t6 + 72U);
    t12 = *((char **)t7);
    t25 = (t0 + 5760);
    t26 = (t25 + 64U);
    t32 = *((char **)t26);
    t33 = (t0 + 6400);
    t37 = (t33 + 56U);
    t42 = *((char **)t37);
    xsi_vlog_generic_get_array_select_value(t9, 32, t5, t12, t32, 2, 1, t42, 8, 2);
    t43 = (t0 + 6720);
    xsi_vlogvar_assign_value(t43, t9, 0, 0, 32);
    xsi_set_current_line(133, ng0);
    t2 = ((char*)((ng5)));
    t3 = (t0 + 6880);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 4);
    xsi_set_current_line(135, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 7200);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(137, ng0);
    t2 = (t0 + 1152);
    t3 = *((char **)t2);
    t2 = (t0 + 7680);
    xsi_vlogvar_assign_value(t2, t3, 0, 0, 2);
    goto LAB15;

LAB11:    xsi_set_current_line(139, ng0);
    t2 = (t0 + 2320U);
    t5 = *((char **)t2);
    t2 = (t0 + 2480U);
    t6 = *((char **)t2);
    t13 = *((unsigned int *)t5);
    t14 = *((unsigned int *)t6);
    t15 = (t13 & t14);
    *((unsigned int *)t9) = t15;
    t2 = (t5 + 4);
    t7 = (t6 + 4);
    t12 = (t9 + 4);
    t16 = *((unsigned int *)t2);
    t17 = *((unsigned int *)t7);
    t18 = (t16 | t17);
    *((unsigned int *)t12) = t18;
    t19 = *((unsigned int *)t12);
    t20 = (t19 != 0);
    if (t20 == 1)
        goto LAB34;

LAB35:
LAB36:    t32 = (t9 + 4);
    t50 = *((unsigned int *)t32);
    t51 = (~(t50));
    t52 = *((unsigned int *)t9);
    t53 = (t52 & t51);
    t54 = (t53 != 0);
    if (t54 > 0)
        goto LAB37;

LAB38:
LAB39:    goto LAB15;

LAB13:    xsi_set_current_line(146, ng0);
    t2 = (t0 + 2800U);
    t5 = *((char **)t2);
    t2 = (t5 + 4);
    t13 = *((unsigned int *)t2);
    t14 = (~(t13));
    t15 = *((unsigned int *)t5);
    t16 = (t15 & t14);
    t17 = (t16 != 0);
    if (t17 > 0)
        goto LAB41;

LAB42:
LAB43:    goto LAB15;

LAB19:    t25 = (t11 + 4);
    *((unsigned int *)t11) = 1;
    *((unsigned int *)t25) = 1;
    goto LAB20;

LAB21:    *((unsigned int *)t10) = 1;
    goto LAB24;

LAB23:    t32 = (t10 + 4);
    *((unsigned int *)t10) = 1;
    *((unsigned int *)t32) = 1;
    goto LAB24;

LAB25:    t37 = ((char*)((ng1)));
    goto LAB26;

LAB27:    t42 = (t0 + 4000);
    t43 = (t42 + 56U);
    t44 = *((char **)t43);
    t45 = ((char*)((ng3)));
    memset(t46, 0, 8);
    xsi_vlog_unsigned_add(t46, 32, t44, 8, t45, 32);
    goto LAB28;

LAB29:    xsi_vlog_unsigned_bit_combine(t9, 32, t37, 32, t46, 32);
    goto LAB33;

LAB31:    memcpy(t9, t37, 8);
    goto LAB33;

LAB34:    t21 = *((unsigned int *)t9);
    t22 = *((unsigned int *)t12);
    *((unsigned int *)t9) = (t21 | t22);
    t25 = (t5 + 4);
    t26 = (t6 + 4);
    t23 = *((unsigned int *)t5);
    t24 = (~(t23));
    t27 = *((unsigned int *)t25);
    t28 = (~(t27));
    t29 = *((unsigned int *)t6);
    t30 = (~(t29));
    t31 = *((unsigned int *)t26);
    t34 = (~(t31));
    t48 = (t24 & t28);
    t49 = (t30 & t34);
    t35 = (~(t48));
    t36 = (~(t49));
    t38 = *((unsigned int *)t12);
    *((unsigned int *)t12) = (t38 & t35);
    t39 = *((unsigned int *)t12);
    *((unsigned int *)t12) = (t39 & t36);
    t40 = *((unsigned int *)t9);
    *((unsigned int *)t9) = (t40 & t35);
    t41 = *((unsigned int *)t9);
    *((unsigned int *)t9) = (t41 & t36);
    goto LAB36;

LAB37:    xsi_set_current_line(140, ng0);

LAB40:    xsi_set_current_line(141, ng0);
    t33 = ((char*)((ng1)));
    t37 = (t0 + 7040);
    xsi_vlogvar_assign_value(t37, t33, 0, 0, 1);
    xsi_set_current_line(142, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 7360);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(144, ng0);
    t2 = (t0 + 1288);
    t3 = *((char **)t2);
    t2 = (t0 + 7680);
    xsi_vlogvar_assign_value(t2, t3, 0, 0, 2);
    goto LAB39;

LAB41:    xsi_set_current_line(147, ng0);

LAB44:    xsi_set_current_line(149, ng0);
    t6 = ((char*)((ng1)));
    t7 = (t0 + 7200);
    xsi_vlogvar_assign_value(t7, t6, 0, 0, 1);
    xsi_set_current_line(150, ng0);
    t2 = (t0 + 1016);
    t3 = *((char **)t2);
    t2 = (t0 + 7680);
    xsi_vlogvar_assign_value(t2, t3, 0, 0, 2);
    goto LAB43;

}

static void Always_163_4(char *t0)
{
    char t13[8];
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

LAB0:    t1 = (t0 + 10552U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(163, ng0);
    t2 = (t0 + 11168);
    *((int *)t2) = 1;
    t3 = (t0 + 10584);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(164, ng0);
    t4 = (t0 + 3600U);
    t5 = *((char **)t4);
    t4 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB5;

LAB6:    xsi_set_current_line(171, ng0);

LAB9:    xsi_set_current_line(172, ng0);
    t2 = (t0 + 7840);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 5120);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 8, 0LL);
    xsi_set_current_line(173, ng0);
    t2 = (t0 + 8000);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 5280);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 3, 0LL);
    xsi_set_current_line(174, ng0);
    t2 = (t0 + 8160);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 5440);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 1, 0LL);
    xsi_set_current_line(175, ng0);
    t2 = (t0 + 8320);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 5600);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 1, 0LL);
    xsi_set_current_line(177, ng0);
    t2 = (t0 + 8640);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 8480);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 2, 0LL);

LAB7:    goto LAB2;

LAB5:    xsi_set_current_line(165, ng0);

LAB8:    xsi_set_current_line(166, ng0);
    t11 = ((char*)((ng1)));
    t12 = (t0 + 5440);
    xsi_vlogvar_wait_assign_value(t12, t11, 0, 0, 1, 0LL);
    xsi_set_current_line(167, ng0);
    t2 = ((char*)((ng6)));
    memset(t13, 0, 8);
    xsi_vlog_signed_unary_minus(t13, 32, t2, 32);
    t3 = (t0 + 5120);
    xsi_vlogvar_wait_assign_value(t3, t13, 0, 0, 8, 0LL);
    xsi_set_current_line(168, ng0);
    t2 = (t0 + 880);
    t3 = *((char **)t2);
    t2 = (t0 + 8480);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 2, 0LL);
    goto LAB7;

}

static void Always_180_5(char *t0)
{
    char t9[8];
    char t10[8];
    char t11[8];
    char t46[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    int t8;
    char *t12;
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
    unsigned int t23;
    unsigned int t24;
    char *t25;
    char *t26;
    unsigned int t27;
    unsigned int t28;
    unsigned int t29;
    unsigned int t30;
    unsigned int t31;
    char *t32;
    char *t33;
    unsigned int t34;
    unsigned int t35;
    unsigned int t36;
    char *t37;
    unsigned int t38;
    unsigned int t39;
    unsigned int t40;
    unsigned int t41;
    char *t42;
    char *t43;
    char *t44;
    char *t45;
    char *t47;
    char *t48;
    char *t49;
    char *t50;
    char *t51;
    char *t52;
    int t53;
    char *t54;
    int t55;
    int t56;
    unsigned int t57;
    unsigned int t58;
    int t59;
    int t60;

LAB0:    t1 = (t0 + 10800U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(180, ng0);
    t2 = (t0 + 11184);
    *((int *)t2) = 1;
    t3 = (t0 + 10832);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(181, ng0);

LAB5:    xsi_set_current_line(182, ng0);
    t4 = (t0 + 5120);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = (t0 + 7840);
    xsi_vlogvar_assign_value(t7, t6, 0, 0, 8);
    xsi_set_current_line(183, ng0);
    t2 = (t0 + 5280);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 8000);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 3);
    xsi_set_current_line(184, ng0);
    t2 = (t0 + 5440);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 8160);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 1);
    xsi_set_current_line(185, ng0);
    t2 = (t0 + 5600);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 8320);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 1);
    xsi_set_current_line(187, ng0);
    t2 = (t0 + 8480);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);

LAB6:    t5 = (t0 + 880);
    t6 = *((char **)t5);
    t8 = xsi_vlog_unsigned_case_compare(t4, 2, t6, 32);
    if (t8 == 1)
        goto LAB7;

LAB8:    t2 = (t0 + 1016);
    t3 = *((char **)t2);
    t8 = xsi_vlog_unsigned_case_compare(t4, 2, t3, 32);
    if (t8 == 1)
        goto LAB9;

LAB10:    t2 = (t0 + 1152);
    t3 = *((char **)t2);
    t8 = xsi_vlog_unsigned_case_compare(t4, 2, t3, 32);
    if (t8 == 1)
        goto LAB11;

LAB12:    t2 = (t0 + 1288);
    t3 = *((char **)t2);
    t8 = xsi_vlog_unsigned_case_compare(t4, 2, t3, 32);
    if (t8 == 1)
        goto LAB13;

LAB14:
LAB15:    goto LAB2;

LAB7:    xsi_set_current_line(188, ng0);
    t5 = (t0 + 1016);
    t7 = *((char **)t5);
    t5 = (t0 + 8640);
    xsi_vlogvar_assign_value(t5, t7, 0, 0, 2);
    goto LAB15;

LAB9:    xsi_set_current_line(189, ng0);

LAB16:    xsi_set_current_line(190, ng0);
    t2 = ((char*)((ng3)));
    t5 = (t0 + 8160);
    xsi_vlogvar_assign_value(t5, t2, 0, 0, 1);
    xsi_set_current_line(191, ng0);
    t2 = (t0 + 5120);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t6 = (t0 + 744);
    t7 = *((char **)t6);
    memset(t11, 0, 8);
    t6 = (t5 + 4);
    t12 = (t7 + 4);
    t13 = *((unsigned int *)t5);
    t14 = *((unsigned int *)t7);
    t15 = (t13 ^ t14);
    t16 = *((unsigned int *)t6);
    t17 = *((unsigned int *)t12);
    t18 = (t16 ^ t17);
    t19 = (t15 | t18);
    t20 = *((unsigned int *)t6);
    t21 = *((unsigned int *)t12);
    t22 = (t20 | t21);
    t23 = (~(t22));
    t24 = (t19 & t23);
    if (t24 != 0)
        goto LAB20;

LAB17:    if (t22 != 0)
        goto LAB19;

LAB18:    *((unsigned int *)t11) = 1;

LAB20:    memset(t10, 0, 8);
    t26 = (t11 + 4);
    t27 = *((unsigned int *)t26);
    t28 = (~(t27));
    t29 = *((unsigned int *)t11);
    t30 = (t29 & t28);
    t31 = (t30 & 1U);
    if (t31 != 0)
        goto LAB21;

LAB22:    if (*((unsigned int *)t26) != 0)
        goto LAB23;

LAB24:    t33 = (t10 + 4);
    t34 = *((unsigned int *)t10);
    t35 = *((unsigned int *)t33);
    t36 = (t34 || t35);
    if (t36 > 0)
        goto LAB25;

LAB26:    t38 = *((unsigned int *)t10);
    t39 = (~(t38));
    t40 = *((unsigned int *)t33);
    t41 = (t39 || t40);
    if (t41 > 0)
        goto LAB27;

LAB28:    if (*((unsigned int *)t33) > 0)
        goto LAB29;

LAB30:    if (*((unsigned int *)t10) > 0)
        goto LAB31;

LAB32:    memcpy(t9, t46, 8);

LAB33:    t47 = (t0 + 7840);
    xsi_vlogvar_assign_value(t47, t9, 0, 0, 8);
    xsi_set_current_line(192, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 8000);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 3);
    xsi_set_current_line(194, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 8320);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(196, ng0);
    t2 = (t0 + 1152);
    t3 = *((char **)t2);
    t2 = (t0 + 8640);
    xsi_vlogvar_assign_value(t2, t3, 0, 0, 2);
    goto LAB15;

LAB11:    xsi_set_current_line(198, ng0);
    t2 = (t0 + 2960U);
    t5 = *((char **)t2);
    t2 = (t5 + 4);
    t13 = *((unsigned int *)t2);
    t14 = (~(t13));
    t15 = *((unsigned int *)t5);
    t16 = (t15 & t14);
    t17 = (t16 != 0);
    if (t17 > 0)
        goto LAB34;

LAB35:
LAB36:    goto LAB15;

LAB13:    xsi_set_current_line(203, ng0);
    t2 = (t0 + 3440U);
    t5 = *((char **)t2);
    t2 = (t5 + 4);
    t13 = *((unsigned int *)t2);
    t14 = (~(t13));
    t15 = *((unsigned int *)t5);
    t16 = (t15 & t14);
    t17 = (t16 != 0);
    if (t17 > 0)
        goto LAB38;

LAB39:
LAB40:    goto LAB15;

LAB19:    t25 = (t11 + 4);
    *((unsigned int *)t11) = 1;
    *((unsigned int *)t25) = 1;
    goto LAB20;

LAB21:    *((unsigned int *)t10) = 1;
    goto LAB24;

LAB23:    t32 = (t10 + 4);
    *((unsigned int *)t10) = 1;
    *((unsigned int *)t32) = 1;
    goto LAB24;

LAB25:    t37 = ((char*)((ng1)));
    goto LAB26;

LAB27:    t42 = (t0 + 5120);
    t43 = (t42 + 56U);
    t44 = *((char **)t43);
    t45 = ((char*)((ng3)));
    memset(t46, 0, 8);
    xsi_vlog_unsigned_add(t46, 32, t44, 8, t45, 32);
    goto LAB28;

LAB29:    xsi_vlog_unsigned_bit_combine(t9, 32, t37, 32, t46, 32);
    goto LAB33;

LAB31:    memcpy(t9, t37, 8);
    goto LAB33;

LAB34:    xsi_set_current_line(199, ng0);

LAB37:    xsi_set_current_line(200, ng0);
    t6 = ((char*)((ng1)));
    t7 = (t0 + 8160);
    xsi_vlogvar_assign_value(t7, t6, 0, 0, 1);
    xsi_set_current_line(201, ng0);
    t2 = (t0 + 1288);
    t3 = *((char **)t2);
    t2 = (t0 + 8640);
    xsi_vlogvar_assign_value(t2, t3, 0, 0, 2);
    goto LAB36;

LAB38:    xsi_set_current_line(204, ng0);

LAB41:    xsi_set_current_line(205, ng0);
    t6 = (t0 + 3280U);
    t7 = *((char **)t6);
    t6 = ((char*)((ng1)));
    memset(t9, 0, 8);
    t12 = (t7 + 4);
    t25 = (t6 + 4);
    t18 = *((unsigned int *)t7);
    t19 = *((unsigned int *)t6);
    t20 = (t18 ^ t19);
    t21 = *((unsigned int *)t12);
    t22 = *((unsigned int *)t25);
    t23 = (t21 ^ t22);
    t24 = (t20 | t23);
    t27 = *((unsigned int *)t12);
    t28 = *((unsigned int *)t25);
    t29 = (t27 | t28);
    t30 = (~(t29));
    t31 = (t24 & t30);
    if (t31 != 0)
        goto LAB45;

LAB42:    if (t29 != 0)
        goto LAB44;

LAB43:    *((unsigned int *)t9) = 1;

LAB45:    t32 = (t9 + 4);
    t34 = *((unsigned int *)t32);
    t35 = (~(t34));
    t36 = *((unsigned int *)t9);
    t38 = (t36 & t35);
    t39 = (t38 != 0);
    if (t39 > 0)
        goto LAB46;

LAB47:
LAB48:    xsi_set_current_line(207, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 8320);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(208, ng0);
    t2 = (t0 + 1016);
    t3 = *((char **)t2);
    t2 = (t0 + 8640);
    xsi_vlogvar_assign_value(t2, t3, 0, 0, 2);
    goto LAB40;

LAB44:    t26 = (t9 + 4);
    *((unsigned int *)t9) = 1;
    *((unsigned int *)t26) = 1;
    goto LAB45;

LAB46:    xsi_set_current_line(206, ng0);
    t33 = (t0 + 3120U);
    t37 = *((char **)t33);
    t33 = (t0 + 5920);
    t42 = (t0 + 5920);
    t43 = (t42 + 72U);
    t44 = *((char **)t43);
    t45 = (t0 + 5920);
    t47 = (t45 + 64U);
    t48 = *((char **)t47);
    t49 = (t0 + 5120);
    t50 = (t49 + 56U);
    t51 = *((char **)t50);
    xsi_vlog_generic_convert_array_indices(t10, t11, t44, t48, 2, 1, t51, 8, 2);
    t52 = (t10 + 4);
    t40 = *((unsigned int *)t52);
    t53 = (!(t40));
    t54 = (t11 + 4);
    t41 = *((unsigned int *)t54);
    t55 = (!(t41));
    t56 = (t53 && t55);
    if (t56 == 1)
        goto LAB49;

LAB50:    goto LAB48;

LAB49:    t57 = *((unsigned int *)t10);
    t58 = *((unsigned int *)t11);
    t59 = (t57 - t58);
    t60 = (t59 + 1);
    xsi_vlogvar_assign_value(t33, t37, 0, *((unsigned int *)t11), t60);
    goto LAB50;

}


extern void work_m_00000000004217824851_3518658400_init()
{
	static char *pe[] = {(void *)Initial_59_0,(void *)NetDecl_69_1,(void *)Always_85_2,(void *)Always_108_3,(void *)Always_163_4,(void *)Always_180_5};
	xsi_register_didat("work_m_00000000004217824851_3518658400", "isim/alldev_tb_isim_beh.exe.sim/work/m_00000000004217824851_3518658400.didat");
	xsi_register_executes(pe);
}
