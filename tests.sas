data have;
	input foo;
	datalines;
1
2
3
;
run;

%assert_equals(3, 3, All good);
%assert_equals(5, 3, Equals error);

%assert_equals_sql(3, select count(*) into :actual from have, Query ok);
%assert_equals_sql(4, select count(*) into :actual from have, Query error);

%assert_sql_equals_sql(
    select count(*) into :expected from have, 
    select max(foo) into :actual from have, 
    Query query ok
);

%assert_sql_equals_sql(
    select min(foo) into :expected from have, 
    select max(foo) into :actual from have, 
    Query query error
);

%assert_true((1=1), True ok);
%assert_true((1=0), True error);
