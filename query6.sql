--ejercicio 6

WITH flight_no_and_id(flight_no, actual_arrival, scheduled_arrival) as
(
	SELECT
		f.flight_no, f.actual_arrival, f.scheduled_arrival
	FROM
		flights f
),
flight_delays(flight_no, retraso) as
(
	SELECT
		fni.flight_no, (fni.actual_arrival - fni.scheduled_arrival) as retraso
	FROM
		flight_no_and_id fni
	order by
		fni.flight_no asc
),
flight_average_delay(flight_no, retraso_medio) as
(
	SELECT
		fd1.flight_no, AVG(fd1.retraso) as retraso_medio
	FROM
		flight_delays fd1
	GROUP BY
		fd1.flight_no
),
flight_average_delay_max(flight_no, retraso_medio_max) as
(
	SELECT
		fd.flight_no, fd.retraso_medio as retraso_medio_max
	FROM
		flight_average_delay fd
	ORDER BY
		fd.retraso_medio desc limit 1
),
all_flights_with_max_delay as
(
	SELECT
		fad.flight_no, fad.retraso_medio
	FROM
		flight_average_delay fad, flight_average_delay_max fadm
	WHERE
		fad.retraso_medio = fadm.retraso_medio_max
)



SELECT * FROM all_flights_with_max_delay;
