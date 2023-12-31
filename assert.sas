/* MIT License

Copyright (c) 2023 Nicolas Hohm

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
*/

%macro assert_equals(expected, actual, message);
    %if &expected ne &actual %then %do;
        %put ERROR: Failed asserting that &actual is equal to &expected - &message;
    %end;
%mend;

%macro assert_not_equals(expected, actual, message);
    %if &expected eq &actual %then %do;
        %put ERROR: Failed asserting that &actual is equal to &expected - &message;
    %end;
%mend;

* Asserts that the value returned by the query in actual is equals to the expectation;
%macro assert_equals_sql(expected, query, message);
    proc sql noprint;
        &query;
    quit;
    %assert_equals(&expected, &actual, &message);
%mend;

* Asserts that the value returned by the query in actual is equals to the expectation;
%macro assert_not_equals_sql(expected, query, message);
    proc sql noprint;
        &query;
    quit;
    %assert_not_equals(&expected, &actual, &message);
%mend;

/**
 * @param expectedQuery SQL Query storing a single value into expected
 * @param actualAquery SQL Query storing a single value into actual
 * @param message Printed in addition to the error message if assert fails
 */
%macro assert_sql_equals_sql(expected_query, actual_query, message);
    proc sql noprint;
        &expected_query;
    quit;
    proc sql noprint;
        &actual_query;
    quit;
    %assert_equals(&expected, &actual, &message);
%mend;

%macro assert_true(expression, message);
	%if not &expression %then %do;
        %put ERROR: Failed asserting that &expression is true - &message;
    %end;
%mend;
