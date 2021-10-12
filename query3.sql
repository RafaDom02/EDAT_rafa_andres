--EJERCICIO 3

SELECT
    a.airport_code, count(*) as total_passengers
FROM
    airports_data a JOIN flights f ON a.airport_code=f.arrival_airport
    join boarding_passes bp on bp.flight_id=f.flight_id 
group by
	a.airport_code
order by
	total_passengers;
