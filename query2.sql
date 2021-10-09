--EJERCICIO 2

select
	distinct b.book_ref, b.total_amount, sum(tf.amount) 
from
	bookings b natural join tickets t
	natural join ticket_flights tf
group by
	b.book_ref
order by
	b.book_ref
