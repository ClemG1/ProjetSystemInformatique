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

/* This file is designed for use with ISim build 0xfbc00daa */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
extern char *STD_TEXTIO;
static const char *ng1 = "f_handler";
extern char *IEEE_P_2592010699;
extern char *STD_STANDARD;
extern char *IEEE_P_3564397177;
static const char *ng5 = "/home/gehin/Documents/insa/projects/ProjetSystemInformatique/microprocessor/banc_instr.vhd";
extern char *IEEE_P_1242562249;

int ieee_p_1242562249_sub_17802405650254020620_1035706684(char *, char *, char *);
unsigned char ieee_p_2592010699_sub_2763492388968962707_503743352(char *, char *, unsigned int , unsigned int );
void ieee_p_3564397177_sub_3261834094259370027_91900896(char *, char *, char *, char *, char *, char *);


char *work_a_4197615856_3212880686_sub_442426573864257750_3057020925(char *t1, char *t2, char *t3)
{
    char t4[568];
    char t5[24];
    char t9[32];
    char t18[8192];
    char t30[16];
    char t36[32];
    char t43[8];
    char t49[8];
    char *t0;
    char *t6;
    char *t7;
    char *t8;
    char *t10;
    char *t11;
    int t12;
    unsigned int t13;
    char *t14;
    int t15;
    char *t16;
    char *t17;
    char *t19;
    char *t20;
    char *t21;
    char *t22;
    char *t23;
    char *t24;
    char *t25;
    char *t26;
    char *t27;
    char *t28;
    char *t29;
    char *t31;
    char *t32;
    int t33;
    char *t34;
    char *t35;
    char *t37;
    char *t38;
    char *t39;
    char *t40;
    char *t41;
    char *t42;
    char *t44;
    char *t45;
    char *t46;
    char *t47;
    char *t48;
    char *t50;
    char *t51;
    char *t52;
    unsigned char t53;
    char *t54;
    char *t55;
    char *t56;
    char *t57;
    unsigned char t58;
    unsigned int t59;
    char *t60;
    char *t61;
    unsigned int t62;
    unsigned int t63;

LAB0:    t6 = ((STD_TEXTIO) + 3400);
    t7 = (t4 + 4U);
    t8 = xsi_create_file_variable_in_buffer(0, ng1, t6, 0, 0, 1);
    *((char **)t7) = t8;
    t10 = (t9 + 0U);
    t11 = (t10 + 0U);
    *((int *)t11) = 0;
    t11 = (t10 + 4U);
    *((int *)t11) = 255;
    t11 = (t10 + 8U);
    *((int *)t11) = 1;
    t12 = (255 - 0);
    t13 = (t12 * 1);
    t13 = (t13 + 1);
    t11 = (t10 + 12U);
    *((unsigned int *)t11) = t13;
    t11 = (t9 + 16U);
    t14 = (t11 + 0U);
    *((int *)t14) = 31;
    t14 = (t11 + 4U);
    *((int *)t14) = 0;
    t14 = (t11 + 8U);
    *((int *)t14) = -1;
    t15 = (0 - 31);
    t13 = (t15 * -1);
    t13 = (t13 + 1);
    t14 = (t11 + 12U);
    *((unsigned int *)t14) = t13;
    t14 = (t4 + 12U);
    t16 = (t1 + 3600);
    t17 = (t14 + 88U);
    *((char **)t17) = t16;
    t19 = (t14 + 56U);
    *((char **)t19) = t18;
    xsi_type_set_default_value(t16, t18, 0);
    t20 = (t14 + 64U);
    t21 = (t16 + 72U);
    t22 = *((char **)t21);
    *((char **)t20) = t22;
    t23 = (t14 + 80U);
    *((unsigned int *)t23) = 8192U;
    t24 = (t4 + 132U);
    t25 = ((STD_TEXTIO) + 3248);
    t26 = (t24 + 56U);
    *((char **)t26) = t25;
    t27 = (t24 + 40U);
    *((char **)t27) = 0;
    t28 = (t24 + 64U);
    *((int *)t28) = 1;
    t29 = (t24 + 48U);
    *((char **)t29) = 0;
    t31 = (t30 + 0U);
    t32 = (t31 + 0U);
    *((int *)t32) = 31;
    t32 = (t31 + 4U);
    *((int *)t32) = 0;
    t32 = (t31 + 8U);
    *((int *)t32) = -1;
    t33 = (0 - 31);
    t13 = (t33 * -1);
    t13 = (t13 + 1);
    t32 = (t31 + 12U);
    *((unsigned int *)t32) = t13;
    t32 = (t4 + 204U);
    t34 = ((IEEE_P_2592010699) + 4000);
    t35 = (t32 + 88U);
    *((char **)t35) = t34;
    t37 = (t32 + 56U);
    *((char **)t37) = t36;
    xsi_type_set_default_value(t34, t36, t30);
    t38 = (t32 + 64U);
    *((char **)t38) = t30;
    t39 = (t32 + 80U);
    *((unsigned int *)t39) = 32U;
    t40 = (t4 + 324U);
    t41 = ((STD_STANDARD) + 0);
    t42 = (t40 + 88U);
    *((char **)t42) = t41;
    t44 = (t40 + 56U);
    *((char **)t44) = t43;
    xsi_type_set_default_value(t41, t43, 0);
    t45 = (t40 + 80U);
    *((unsigned int *)t45) = 1U;
    t46 = (t4 + 444U);
    t47 = ((STD_STANDARD) + 384);
    t48 = (t46 + 88U);
    *((char **)t48) = t47;
    t50 = (t46 + 56U);
    *((char **)t50) = t49;
    *((int *)t49) = 0;
    t51 = (t46 + 80U);
    *((unsigned int *)t51) = 4U;
    t52 = (t5 + 4U);
    t53 = (t2 != 0);
    if (t53 == 1)
        goto LAB3;

LAB2:    t54 = (t5 + 12U);
    *((char **)t54) = t3;
    t55 = xsi_get_transient_memory(8192U);
    memset(t55, 0, 8192U);
    t56 = t55;
    t13 = (32U * 1U);
    t57 = t56;
    memset(t57, (unsigned char)2, t13);
    t58 = (t13 != 0);
    if (t58 == 1)
        goto LAB4;

LAB5:    t60 = (t14 + 56U);
    t61 = *((char **)t60);
    t60 = (t61 + 0);
    memcpy(t60, t55, 8192U);
    t6 = (t4 + 4U);
    t7 = *((char **)t6);
    std_textio_file_open1(t7, t2, t3, (unsigned char)0);

LAB6:    t6 = (t4 + 4U);
    t7 = *((char **)t6);
    t53 = std_textio_endfile(t7);
    t58 = (!(t53));
    if (t58 != 0)
        goto LAB7;

LAB9:    t6 = (t4 + 4U);
    t7 = *((char **)t6);
    std_textio_file_close(t7);
    t6 = (t14 + 56U);
    t7 = *((char **)t6);
    t53 = (8192U != 8192U);
    if (t53 == 1)
        goto LAB12;

LAB13:    t0 = xsi_get_transient_memory(8192U);
    memcpy(t0, t7, 8192U);

LAB1:    xsi_access_variable_delete(t24);
    t6 = (t4 + 4U);
    t7 = *((char **)t6);
    xsi_delete_file_variable(t7);
    return t0;
LAB3:    *((char **)t52) = t2;
    goto LAB2;

LAB4:    t59 = (8192U / t13);
    xsi_mem_set_data(t56, t56, t13, t59);
    goto LAB5;

LAB7:    t8 = (t4 + 4U);
    t10 = *((char **)t8);
    std_textio_readline(STD_TEXTIO, (char *)0, t10, t24);
    t6 = (t32 + 56U);
    t7 = *((char **)t6);
    t6 = (t40 + 56U);
    t8 = *((char **)t6);
    t6 = (t8 + 0);
    ieee_p_3564397177_sub_3261834094259370027_91900896(IEEE_P_3564397177, (char *)0, t24, t7, t30, t6);
    t6 = (t40 + 56U);
    t7 = *((char **)t6);
    t53 = *((unsigned char *)t7);
    if (t53 == 0)
        goto LAB10;

LAB11:    t6 = (t32 + 56U);
    t7 = *((char **)t6);
    t6 = (t14 + 56U);
    t8 = *((char **)t6);
    t6 = (t46 + 56U);
    t10 = *((char **)t6);
    t12 = *((int *)t10);
    t15 = (t12 - 0);
    t13 = (t15 * 1);
    xsi_vhdl_check_range_of_index(0, 255, 1, t12);
    t59 = (32U * t13);
    t62 = (0 + t59);
    t6 = (t8 + t62);
    t11 = (t30 + 12U);
    t63 = *((unsigned int *)t11);
    t63 = (t63 * 1U);
    memcpy(t6, t7, t63);
    t6 = (t46 + 56U);
    t7 = *((char **)t6);
    t12 = *((int *)t7);
    t15 = (t12 + 1);
    t6 = (t46 + 56U);
    t8 = *((char **)t6);
    t6 = (t8 + 0);
    *((int *)t6) = t15;
    goto LAB6;

LAB8:;
LAB10:    t6 = (t1 + 13689);
    xsi_report(t6, 10U, (unsigned char)1);
    goto LAB11;

LAB12:    xsi_size_not_matching(8192U, 8192U, 0);
    goto LAB13;

LAB14:;
}

static void work_a_4197615856_3212880686_p_0(char *t0)
{
    char t3[16];
    char *t1;
    char *t2;
    char *t4;
    char *t5;
    int t6;
    unsigned int t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    unsigned char t13;
    int t14;
    unsigned int t15;
    unsigned int t16;
    char *t17;

LAB0:    xsi_set_current_line(72, ng5);
    t1 = (t0 + 13699);
    t4 = (t3 + 0U);
    t5 = (t4 + 0U);
    *((int *)t5) = 1;
    t5 = (t4 + 4U);
    *((int *)t5) = 8;
    t5 = (t4 + 8U);
    *((int *)t5) = 1;
    t6 = (8 - 1);
    t7 = (t6 * 1);
    t7 = (t7 + 1);
    t5 = (t4 + 12U);
    *((unsigned int *)t5) = t7;
    t5 = work_a_4197615856_3212880686_sub_442426573864257750_3057020925(t0, t1, t3);
    t8 = (t0 + 3064);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    memcpy(t12, t5, 8192U);
    xsi_driver_first_trans_fast(t8);
    xsi_set_current_line(73, ng5);
    t1 = (t0 + 1152U);
    t13 = ieee_p_2592010699_sub_2763492388968962707_503743352(IEEE_P_2592010699, t1, 0U, 0U);
    if (t13 != 0)
        goto LAB2;

LAB4:
LAB3:    t1 = (t0 + 2984);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(74, ng5);
    t2 = (t0 + 1512U);
    t4 = *((char **)t2);
    t2 = (t0 + 1032U);
    t5 = *((char **)t2);
    t2 = (t0 + 5416U);
    t6 = ieee_p_1242562249_sub_17802405650254020620_1035706684(IEEE_P_1242562249, t5, t2);
    t14 = (t6 - 0);
    t7 = (t14 * 1);
    xsi_vhdl_check_range_of_index(0, 255, 1, t6);
    t15 = (32U * t7);
    t16 = (0 + t15);
    t8 = (t4 + t16);
    t9 = (t0 + 3128);
    t10 = (t9 + 56U);
    t11 = *((char **)t10);
    t12 = (t11 + 56U);
    t17 = *((char **)t12);
    memcpy(t17, t8, 32U);
    xsi_driver_first_trans_fast_port(t9);
    goto LAB3;

}


extern void work_a_4197615856_3212880686_init()
{
	static char *pe[] = {(void *)work_a_4197615856_3212880686_p_0};
	static char *se[] = {(void *)work_a_4197615856_3212880686_sub_442426573864257750_3057020925};
	xsi_register_didat("work_a_4197615856_3212880686", "isim/datapath_test_bench_isim_beh.exe.sim/work/a_4197615856_3212880686.didat");
	xsi_register_executes(pe);
	xsi_register_subprogram_executes(se);
}
