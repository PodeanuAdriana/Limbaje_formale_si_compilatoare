%{
#include<studio.h>
#include<stdlib.h>
void yyerror(char *s);
%}
%token IF THEN ELSE PR PL  MINUS SEMI PLUS EXIT NUMBER ID
%left PLUS MINUS
%start line;
%%
line:	
		|ifElse line	
		|	EXIT {printf("In exit");exit(0);}
		;
ifElse:	IF PR condition PL THEN statement SEMI	{printf("Accept if/else");}
		 | IF PR condition PL THEN statement SEMI ELSE statement SEMI {printf("Accept if/else\n");}	
		;
condition: expression '>' expression
		 | expression '<' expression
		;
statement: expression PLUS expression
		 | expression MINUS expression
		;
expression: NUMBER	
			|ID
	;
%%
void yyerror(char *s){
 printf("Error intamplat! %s",s);
}
void yywrap(){
return 1;
}
int main(void){
return yyparse();
}
