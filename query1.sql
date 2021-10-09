--EJERCICIO 1
with VIAJE_IDA as
	(
		select 
			f.departure_airport, t.passenger_id, f.scheduled_arrival 
		from
			tickets t join ticket_flights tf on t.ticket_no=tf.ticket_no 
			join flights f on tf.flight_id=f.flight_id
	),
	VIAJE_VUELTA as
	(
		select 
			f.arrival_airport, t.passenger_id, f.scheduled_departure 
		from
			tickets t join ticket_flights tf on t.ticket_no=tf.ticket_no 
			join flights f on tf.flight_id=f.flight_id
	)

select
	vi.departure_airport, count(*)
from
	viaje_ida vi, viaje_vuelta vv 
	where
		vi.departure_airport=vv.arrival_airport
		and vi.passenger_id=vv.passenger_id and vi.scheduled_arrival<vv.scheduled_departure
group by
	vi.departure_airport
order by
	vi.departure_airport;
