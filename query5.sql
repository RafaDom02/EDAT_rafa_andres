--Ejercicio 5

with book_ref_with_tickets(book_ref, ticket_no, flight_id) as
	(
		select 
			t.book_ref , t.ticket_no ,tf.flight_id
		from 
			tickets t, ticket_flights tf 
		where
			t.ticket_no = tf.ticket_no
		group by 
			t.ticket_no, tf.flight_id 
	)

select 
	distinct brwt.book_ref, brwt.flight_id
from
	book_ref_with_tickets brwt left join boarding_passes bp 
on
	bp.ticket_no = brwt.ticket_no
where 
	bp.ticket_no is null
order by 
	brwt.book_ref asc, brwt.flight_id asc;
