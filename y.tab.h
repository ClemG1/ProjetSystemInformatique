/* A Bison parser, made by GNU Bison 3.0.4.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015 Free Software Foundation, Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

#ifndef YY_YY_Y_TAB_H_INCLUDED
# define YY_YY_Y_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    tMUL = 258,
    tDIV = 259,
    tADD = 260,
    tSUB = 261,
    tEQ = 262,
    tMAIN = 263,
    tPRINTF = 264,
    tIF = 265,
    tELSE = 266,
    tOPENBRACE = 267,
    tCLOSEBRACE = 268,
    tOPENBRACKET = 269,
    tCLOSEBRACKET = 270,
    tCONSTDECLARE = 271,
    tCOMMA = 272,
    tSEMICOLON = 273,
    tNAME = 274,
    tINTDECLARE = 275,
    tINT = 276,
    tEXPONENT = 277
  };
#endif
/* Tokens.  */
#define tMUL 258
#define tDIV 259
#define tADD 260
#define tSUB 261
#define tEQ 262
#define tMAIN 263
#define tPRINTF 264
#define tIF 265
#define tELSE 266
#define tOPENBRACE 267
#define tCLOSEBRACE 268
#define tOPENBRACKET 269
#define tCLOSEBRACKET 270
#define tCONSTDECLARE 271
#define tCOMMA 272
#define tSEMICOLON 273
#define tNAME 274
#define tINTDECLARE 275
#define tINT 276
#define tEXPONENT 277

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED

union YYSTYPE
{
#line 9 "compiler.y" /* yacc.c:1909  */

    int nb;
    char* str;

#line 103 "y.tab.h" /* yacc.c:1909  */
};

typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
