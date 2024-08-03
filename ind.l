%{
#include <stdlib.h>
#include "ind.tab.h"

#define YYSTYPE int
extern YYSTYPE yylval;
%}
      
%%
[+-]*[0-9]+  {return NUM; }
[\n\r]      { return END_LINE;}
[a-z_]+[a-zA-Z_0-9]* { return ID; }
<<EOF>> return END_FILE;
[\t]	;
[ ]*,[ ]*	return COMMA;
.       return yytext[0];
%%

#ifndef yywrap
int yywrap () { return 1; }
#endif

