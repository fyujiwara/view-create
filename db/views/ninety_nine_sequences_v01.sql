SELECT (d1.digit + (d2.digit * 10)) AS number FROM (digits d1 join digits d2) ORDER BY number asc;
