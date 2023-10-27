%macro assertEquals(expected, actual, message);
    %if &expected ne &actual %then %do;
        %put ERROR: Failed asserting that &actual is equal to &expected - &message;
    %end;
%mend;