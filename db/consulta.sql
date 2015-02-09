SELECT ss.id, SUM(t.price) as Facturado, mo.name
FROM Movies mo, Shows sh, Show_transactions ss, Tickets t
WHERE t.show_transaction_id = ss.id AND
      ss.show_id = sh.id AND
      sh.movie_id = mo.id
GROUP BY ss.id, mo.id
HAVING
      DATE(ss.datetime_transaction) = '2015-02-06'
ORDER BY Facturado DESC;