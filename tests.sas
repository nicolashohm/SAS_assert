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
