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
static const char *ng0 = "/home/gehin/Documents/insa/projects/ProjetSystemInformatique/microprocessor/register_file.vhd";
extern char *IEEE_P_2592010699;
extern char *IEEE_P_1242562249;

int ieee_p_1242562249_sub_17802405650254020620_1035706684(char *, char *, char *);
unsigned char ieee_p_2592010699_sub_2763492388968962707_503743352(char *, char *, unsigned int , unsigned int );


static void work_a_2615964831_3212880686_p_0(char *t0)
{
    char *t1;
    unsigned char t2;
    char *t3;
    char *t4;
    char *t5;
    int t6;
    int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    unsigned char t17;
    unsigned char t18;
    unsigned char t19;
    char *t20;

LAB0:    xsi_set_current_line(54, ng0);
    t1 = (t0 + 1952U);
    t2 = ieee_p_2592010699_sub_2763492388968962707_503743352(IEEE_P_2592010699, t1, 0U, 0U);
    if (t2 != 0)
        goto LAB2;

LAB4:
LAB3:    t1 = (t0 + 3944);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(56, ng0);
    t3 = (t0 + 2472U);
    t4 = *((char **)t3);
    t3 = (t0 + 1032U);
    t5 = *((char **)t3);
    t3 = (t0 + 7080U);
    t6 = ieee_p_1242562249_sub_17802405650254020620_1035706684(IEEE_P_1242562249, t5, t3);
    t7 = (t6 - 0);
    t8 = (t7 * 1);
    xsi_vhdl_check_range_of_index(0, 15, 1, t6);
    t9 = (8U * t8);
    t10 = (0 + t9);
    t11 = (t4 + t10);
    t12 = (t0 + 4024);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    t15 = (t14 + 56U);
    t16 = *((char **)t15);
    memcpy(t16, t11, 8U);
    xsi_driver_first_trans_fast_port(t12);
    xsi_set_current_line(57, ng0);
    t1 = (t0 + 2472U);
    t3 = *((char **)t1);
    t1 = (t0 + 1192U);
    t4 = *((char **)t1);
    t1 = (t0 + 7096U);
    t6 = ieee_p_1242562249_sub_17802405650254020620_1035706684(IEEE_P_1242562249, t4, t1);
    t7 = (t6 - 0);
    t8 = (t7 * 1);
    xsi_vhdl_check_range_of_index(0, 15, 1, t6);
    t9 = (8U * t8);
    t10 = (0 + t9);
    t5 = (t3 + t10);
    t11 = (t0 + 4088);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    memcpy(t15, t5, 8U);
    xsi_driver_first_trans_fast_port(t11);
    xsi_set_current_line(59, ng0);
    t1 = (t0 + 1512U);
    t3 = *((char **)t1);
    t2 = *((unsigned char *)t3);
    t17 = (t2 == (unsigned char)3);
    if (t17 != 0)
        goto LAB5;

LAB7:
LAB6:    xsi_set_current_line(63, ng0);
    t1 = (t0 + 1512U);
    t3 = *((char **)t1);
    t17 = *((unsigned char *)t3);
    t18 = (t17 == (unsigned char)3);
    if (t18 == 1)
        goto LAB11;

LAB12:    t2 = (unsigned char)0;

LAB13:    if (t2 != 0)
        goto LAB8;

LAB10:
LAB9:    xsi_set_current_line(66, ng0);
    t1 = (t0 + 1512U);
    t3 = *((char **)t1);
    t17 = *((unsigned char *)t3);
    t18 = (t17 == (unsigned char)3);
    if (t18 == 1)
        goto LAB23;

LAB24:    t2 = (unsigned char)0;

LAB25:    if (t2 != 0)
        goto LAB20;

LAB22:
LAB21:    xsi_set_current_line(70, ng0);
    t1 = (t0 + 1832U);
    t3 = *((char **)t1);
    t2 = *((unsigned char *)t3);
    t17 = (t2 == (unsigned char)3);
    if (t17 != 0)
        goto LAB32;

LAB34:
LAB33:    goto LAB3;

LAB5:    xsi_set_current_line(60, ng0);
    t1 = (t0 + 1672U);
    t4 = *((char **)t1);
    t1 = (t0 + 1352U);
    t5 = *((char **)t1);
    t1 = (t0 + 7112U);
    t6 = ieee_p_1242562249_sub_17802405650254020620_1035706684(IEEE_P_1242562249, t5, t1);
    t7 = (t6 - 0);
    t8 = (t7 * 1);
    t9 = (8U * t8);
    t10 = (0U + t9);
    t11 = (t0 + 4152);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    memcpy(t15, t4, 8U);
    xsi_driver_first_trans_delta(t11, t10, 8U, 0LL);
    goto LAB6;

LAB8:    xsi_set_current_line(64, ng0);
    t12 = (t0 + 1672U);
    t13 = *((char **)t12);
    t12 = (t0 + 4024);
    t14 = (t12 + 56U);
    t15 = *((char **)t14);
    t16 = (t15 + 56U);
    t20 = *((char **)t16);
    memcpy(t20, t13, 8U);
    xsi_driver_first_trans_fast_port(t12);
    goto LAB9;

LAB11:    t1 = (t0 + 1032U);
    t4 = *((char **)t1);
    t1 = (t0 + 1352U);
    t5 = *((char **)t1);
    t19 = 1;
    if (4U == 4U)
        goto LAB14;

LAB15:    t19 = 0;

LAB16:    t2 = t19;
    goto LAB13;

LAB14:    t8 = 0;

LAB17:    if (t8 < 4U)
        goto LAB18;
    else
        goto LAB16;

LAB18:    t1 = (t4 + t8);
    t11 = (t5 + t8);
    if (*((unsigned char *)t1) != *((unsigned char *)t11))
        goto LAB15;

LAB19:    t8 = (t8 + 1);
    goto LAB17;

LAB20:    xsi_set_current_line(67, ng0);
    t12 = (t0 + 1672U);
    t13 = *((char **)t12);
    t12 = (t0 + 4088);
    t14 = (t12 + 56U);
    t15 = *((char **)t14);
    t16 = (t15 + 56U);
    t20 = *((char **)t16);
    memcpy(t20, t13, 8U);
    xsi_driver_first_trans_fast_port(t12);
    goto LAB21;

LAB23:    t1 = (t0 + 1192U);
    t4 = *((char **)t1);
    t1 = (t0 + 1352U);
    t5 = *((char **)t1);
    t19 = 1;
    if (4U == 4U)
        goto LAB26;

LAB27:    t19 = 0;

LAB28:    t2 = t19;
    goto LAB25;

LAB26:    t8 = 0;

LAB29:    if (t8 < 4U)
        goto LAB30;
    else
        goto LAB28;

LAB30:    t1 = (t4 + t8);
    t11 = (t5 + t8);
    if (*((unsigned char *)t1) != *((unsigned char *)t11))
        goto LAB27;

LAB31:    t8 = (t8 + 1);
    goto LAB29;

LAB32:    xsi_set_current_line(71, ng0);
    t1 = xsi_get_transient_memory(128U);
    memset(t1, 0, 128U);
    t4 = t1;
    t5 = (t0 + 7367);
    t18 = (8U != 0);
    if (t18 == 1)
        goto LAB35;

LAB36:    t12 = (t0 + 4152);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    t15 = (t14 + 56U);
    t16 = *((char **)t15);
    memcpy(t16, t1, 128U);
    xsi_driver_first_trans_fast(t12);
    goto LAB33;

LAB35:    t8 = (128U / 8U);
    xsi_mem_set_data(t4, t5, 8U, t8);
    goto LAB36;

}


extern void work_a_2615964831_3212880686_init()
{
	static char *pe[] = {(void *)work_a_2615964831_3212880686_p_0};
	xsi_register_didat("work_a_2615964831_3212880686", "isim/datapath_test_bench_isim_beh.exe.sim/work/a_2615964831_3212880686.didat");
	xsi_register_executes(pe);
}
