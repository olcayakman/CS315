%token DOT
%token COMMA
%token STMT_END
%token NOT
%right ASSIGN_OP
%token NEW_LINE
%token COMMENT
%token LB
%token RB
%token LCB
%token RCB
%token ADD_OP
%token SUBT_OP
%token MULT_OP
%token DIV_OP
%token LT_OP
%token GT_OP
%token LTE_OP
%token GTE_OP
%token EQUAL_OP
%token NOTEQUAL_OP
%token DELETE_SET
%token ADD_STMT
%token SUBSET
%token SUPERSET
%token UNION
%token DIFF
%token MEMBOF  
%token INTERSECT
%token CARTESIAN
%token SET_TYPE
%token INT_TYPE
%token STRING_TYPE
%token IF
%token ELSE
%token IN
%token WHILE
%token FOR
%token INPUT
%token OUTPUT
%token READ_FILE
%token WRITEFILE
%token RETURN
%token IDENTIFIER
%token INT
%token STRING
%token SET
%token AND
%token OR
%%
piruli:
    statements {printf("Valid program\n");}
;
statements:
    statement statements | statement  
;

statement:
    if_statement | ifelse_stmt | loop_statement  
    | function_dec_statement  
    | variable_dec_statement 
    | assign_statement | comment | return_statement  
    | file_statement  | in_out_statement  |
    | expression STMT_END | delete_set_statement  | add_statement 
    | NEW_LINE
;    

comment:
    COMMENT
;   

if_statement:
    IF LB condition_statements RB LCB statements RCB STMT_END
;

ifelse_stmt:
    if_statement ELSE LCB statements RCB STMT_END
;

condition_statements:
    condition_statement | condition_statement logic_op condition_statements
;

condition_statement:
    variable MEMBOF set 
    | IDENTIFIER MEMBOF set
    | set condition_op set
    | IDENTIFIER condition_op IDENTIFIER
    | INT math_logic_op INT
    | IDENTIFIER math_logic_op INT
    | IDENTIFIER math_logic_op IDENTIFIER
;

file_statement:
    read_file_statement STMT_END
    | write_file_statement STMT_END
;

read_file_statement:
    READ_FILE LB STRING RB
;

write_file_statement:
    STRING DOT WRITEFILE LB param RB 
;    

in_out_statement:
    input_statement STMT_END
    | output_statement STMT_END
;

input_statement:
    INPUT LB RB 
;
output_statement:
    OUTPUT LB param RB
;


loop_statement:
    while_statement STMT_END
    | for_statement STMT_END
;

while_statement: 
    WHILE LB condition_statements RB LCB statements RCB
;

for_statement: 
    FOR LB INT_TYPE IDENTIFIER ASSIGN_OP INT STMT_END condition_statement STMT_END math_op IDENTIFIER RB LCB statements RCB
    | FOR IDENTIFIER IN IDENTIFIER LCB statements RCB      
;

function_dec_statement:
    type IDENTIFIER function_body STMT_END
;

function_body:
    LB params RB LCB statements RCB
;

function_call:
    IDENTIFIER LB function_call_params RB
;

params:
    | type IDENTIFIER
    | type IDENTIFIER COMMA params
;

function_call_params:
    param
    | param COMMA function_call_params
;

param:
    variables
    | variable
    | IDENTIFIER
;


condition_op:
    SUBSET
    | SUPERSET
    | EQUAL_OP
    | NOTEQUAL_OP
;

math_logic_op:
    LT_OP
    | LTE_OP
    | GT_OP
    | GTE_OP
    | EQUAL_OP
    | NOTEQUAL_OP
;

logic_op: AND 
    | OR
; 

variables:
    variable COMMA variables
;    

variable:
    INT 
    | set
    | set set_operation set
    | IDENTIFIER set_operation IDENTIFIER
    | STRING
    | function_call
    | input_statement
;

set:
    LCB set_elements RCB
;

set_operation:
    UNION
    | DIFF
    | INTERSECT
    | CARTESIAN
;

set_elements: 
    | set_element
    | set_element COMMA set_elements
;

set_element:    
    variable
    | IDENTIFIER
;    

add_statement:
    set ADD_STMT variable STMT_END
    | IDENTIFIER ADD_STMT variable STMT_END
;

delete_set_statement:
    DELETE_SET IDENTIFIER STMT_END
;

variable_dec_statement:
    type IDENTIFIER ASSIGN_OP variable STMT_END
;

type:
    INT_TYPE
    | STRING_TYPE
    | SET_TYPE
;

assign_statement:
    IDENTIFIER ASSIGN_OP variable STMT_END
    | IDENTIFIER ASSIGN_OP expression STMT_END
;

return_statement:
    RETURN STRING STMT_END
    | RETURN set STMT_END
    | RETURN set set_operation set STMT_END
    | RETURN function_call STMT_END
    | RETURN input_statement STMT_END
    | RETURN IDENTIFIER STMT_END
    | RETURN expression STMT_END
    | RETURN STMT_END
;    

expression:
    expression ADD_OP term 
    | expression SUBT_OP term 
    | term 
;

term: term MULT_OP INT
    | term DIV_OP INT
    | exp
;    

exp:
    LB expression RB
    | INT
    | IDENTIFIER
;

math_op:
    ADD_OP
    | SUBT_OP
    | MULT_OP
    | DIV_OP
;
%%
#include "lex.yy.c"
main() {return yyparse();}