DOT \.
COMMA \,
STMT_END \;
NOT \!
ASSIGN_OP \=
NEW_LINE \n
COMMENT \$\$.*
LB \(
RB \)
LCB \{
RCB \}
ADD_OP \+
SUBT_OP \-
MULT_OP \*
DIV_OP \/
LT_OP \<
GT_OP \>
LTE_OP <=
GTE_OP >=
EQUAL_OP ==
NOTEQUAL_OP !=
DELETE_SET delete
ADD_STMT add
SUBSET subset
SUPERSET superset
UNION union
DIFF diff
INTERSECT intersect
CARTESIAN cartesian
SET_TYPE set
INT_TYPE int
STRING_TYPE string
IF if
ELSE else
IN in
WHILE while
FOR for
INPUT piread
OUTPUT piwrite
READ_FILE readFile
WRITEFILE writeFile
RETURN return 
MEMBOF membof 
IDENTIFIER {LETTER}({LETTER}|{CHAR})*
NUMBER [0-9]+
LETTER [A-Za-z]
CHAR {LETTER}|{NUMBER}
INT [+-]?{NUMBER}
SPACE [ \t]
STRING \"({IDENTIFIER}|{CHAR}|{SPACE})*\"
VARIABLES ({INT}({COMMA}{INT})+)|({STRING}({COMMA}{STRING})+)
AND \&\&
OR \|\|
%option yylineno
%%
{DOT} return DOT;
{COMMA} return COMMA;
{STMT_END} return STMT_END;
{NOT} return NOT;
{ASSIGN_OP} return ASSIGN_OP;
{NEW_LINE} return NEW_LINE;
{COMMENT} return COMMENT;
{LB} return LB;
{RB} return RB;
{LCB} return LCB;
{RCB} return RCB;
{ADD_OP} return ADD_OP;
{SUBT_OP} return SUBT_OP;
{MULT_OP} return  MULT_OP;
{DIV_OP} return DIV_OP;
{LT_OP} return LT_OP;
{GT_OP} return GT_OP;
{LTE_OP} return LTE_OP;
{GTE_OP} return GTE_OP;
{EQUAL_OP} return EQUAL_OP;
{NOTEQUAL_OP} return NOTEQUAL_OP;
{DELETE_SET} return DELETE_SET;
{ADD_STMT} return ADD_STMT;
{SUBSET} return SUBSET;
{SUPERSET} return SUPERSET;
{UNION} return UNION;
{DIFF} return DIFF;
{INTERSECT} return INTERSECT;
{CARTESIAN} return CARTESIAN;
{SET_TYPE} return SET_TYPE;
{INT_TYPE} return INT_TYPE;
{STRING_TYPE} return STRING_TYPE;
{IF} return IF;
{ELSE} return ELSE;
{IN} return IN;
{WHILE} return WHILE;
{FOR} return FOR;
{INPUT} return INPUT;
{OUTPUT} return OUTPUT;
{READ_FILE} return READ_FILE;
{WRITEFILE} return WRITEFILE;
{RETURN} return RETURN;
{MEMBOF} return MEMBOF;
{IDENTIFIER} return IDENTIFIER;
{INT} return INT;
{STRING} return STRING;
{AND} return AND;
{OR} return OR;
%%
yyerror(char *s) { printf("%s at line:%d!\n", s,yylineno); }
int yywrap() { return 1; }
