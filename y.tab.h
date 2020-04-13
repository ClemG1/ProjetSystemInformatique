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
    tINF = 263,
    tSUP = 264,
    tMAIN = 265,
    tPRINTF = 266,
    tIF = 267,
    tELSE = 268,
    tOPENBRACE = 269,
    tCLOSEBRACE = 270,
    tOPENBRACKET = 271,
    tCLOSEBRACKET = 272,
    tCONSTDECLARE = 273,
    tCOMMA = 274,
    tSEMICOLON = 275,
    tNAME = 276,
    tINTDECLARE = 277,
    tINT = 278,
    tEXPONENT = 279,
    tWHILE = 280
  };
#endif
/* Tokens.  */
#define tMUL 258
#define tDIV 259
#define tADD 260
#define tSUB 261
#define tEQ 262
#define tINF 263
#define tSUP 264
#define tMAIN 265
#define tPRINTF 266
#define tIF 267
#define tELSE 268
#define tOPENBRACE 269
#define tCLOSEBRACE 270
#define tOPENBRACKET 271
#define tCLOSEBRACKET 272
#define tCONSTDECLARE 273
#define tCOMMA 274
#define tSEMICOLON 275
#define tNAME 276
#define tINTDECLARE 277
#define tINT 278
#define tEXPONENT 279
#define tWHILE 280

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED

union YYSTYPE
{
#line 10 "compiler.y" /* yacc.c:1909  */

    int nb;
    char* str;

#line 109 "y.tab.h" /* yacc.c:1909  */
};

typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
