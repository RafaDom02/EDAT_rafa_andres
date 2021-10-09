--ejercicio 5

with bookref_to_ticket_no(book_ref, ticket_no) as 
	(
	select
		 b.book_ref, t.ticket_no
	from
		bookings b , tickets t
	where
		b.book_ref = t.book_ref 
	group by 
		b.book_ref, t.ticket_no
	),
	
	ticket_no_to_flight_id(ticket_no, flight_id) as
	(
		select 
			t.ticket_no, tf.flight_id
		from 
			tickets t, ticket_flights tf 
		where
			t.ticket_no = tf.ticket_no
		group by 
			t.ticket_no, tf.flight_id 
	),
	
	book_ref_with_tickets(book_ref, flight_id, ticket_no) as
	(
		select
			  distinct bft.book_ref, tnd.flight_id, tnd.ticket_no
		from 
			bookref_to_ticket_no bft join ticket_no_to_flight_id tnd
		on
			bft.ticket_no = tnd.ticket_no
		where
			bft.ticket_no = tnd.ticket_no
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
