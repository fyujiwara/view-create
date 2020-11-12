SELECT
    Date('now', 'LocalTime', 'start of month', '+' || nns.number || ' Day') as registered_on,
    IFNULL(COUNT(u.id),0) as users_count
FROM ninety_nine_sequences as nns
LEFT JOIN users as u ON Date('now', 'LocalTime', 'start of month', '+' || nns.number || ' Day') = Date(u.created_at, 'LocalTime')
WHERE Date('now', 'LocalTime', 'start of month', '+' || nns.number || ' Day')
    BETWEEN Date('now', 'LocalTime', 'start of month') AND Date('now', 'LocalTime', 'start of month', '+1 month', '-1 day')
GROUP BY Date('now', 'LocalTime', 'start of month',  '+' || nns.number || ' Day');
