test:
	grep '^\s*ERROR' test.log | sed 's/^[ \t]*//' | diff - expected_test.log