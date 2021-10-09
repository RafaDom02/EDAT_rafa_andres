--EJERCICIO 3

SELECT
    DISTINCT a.airport_code, count(*)
FROM
    airports_data a JOIN flights f ON a.airport_code=f.arrival_airport
    JOIN ticket_flights tf ON tf.flight_id=f.flight_id
    JOIN boarding_passes bp ON bp.ticket_no =tf.ticket_no
where
	f.status='Arrived'
group by
	a.airport_code
order by
	count desc;
