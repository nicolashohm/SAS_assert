%macro assertEquals(expected, actual, message);
    %if &expected ne &actual %then %do;
        %put ERROR: Failed asserting that &actual is equal to &expected - &message;
    %end;
%mend;

* Asserts that the value returned by the query in actual is equals to the expectation;
%macro assertSqlEquals(expected, query, message);
    proc sql noprint;
        &query;
    quit;
    %assertEquals(&expected, &actual);
%mend;
