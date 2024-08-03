%{


int int_count = 0;
int id_count = 0;
int total_lines = 0;
int count = 0;
%}

%token NUM ID END_LINE END_FILE COMMA
%start lines

%% 
lines:	line
	| lines line
	;
	
line:	list END_LINE {
		total_lines++;
		printf("Line %d\n", total_lines);
		printf("Integers total: %d\n", int_count);
		printf("ID total: %d\n\n", id_count);
		int_count = 0;
		id_count = 0;
		count = 0;
	}
	| END_LINE {
		printf("Line %d\n", total_lines+1);
		printf("ERROR: empty line\n");
		printf("The programm is finished\n\n");
		printf("Total lines:%d\n", total_lines);
		exit(-1);
	}
	| END_FILE {
		printf("Total lines:%d\n", total_lines);
		exit(-1);
	}
	;
list:	NUM {
		int_count++;
		count++;
		if (count % 3 == 0 || count % 3 == 2) {
			printf("Line %d\n", total_lines+1);
			printf("ERROR: the integer is on the place of the identifier\n");
			printf("The programm is finished\n\n");
			printf("Total lines:%d\n", total_lines);
			exit(-1);
		}
	}
	| ID {
		id_count++;
		count++;
	}
	| list comma NUM {
		int_count++;
		count++;
		if (count % 3 == 0 || count % 3 == 2) {
			printf("Line %d\n", total_lines+1);
			printf("ERROR: the integer is on the place of the identifier\n");
			printf("The programm is finished\n\n");
			printf("Total lines:%d\n", total_lines);
			exit(-1);
		}
	} 
	| list comma ID {
		id_count++;
		count++;
	}
	;
comma:	COMMA
	| comma COMMA {
				printf("Line %d\n", total_lines+1);
				printf("ERROR: several commas in a row\n");
				printf("The programm is finished\n\n");
				printf("Total lines:%d\n", total_lines);
				exit(-1);
	}
	;
%%

