-- EJERCICIO 4
with A_AVION_T(aircrafts_code, totalasientos) as
	(
		select 
			ad.aircraft_code, count(*) as totalasioentos
	 	from
	 		aircrafts_data ad join seats s on ad.aircraft_code=s.aircraft_code
	 	group by
	 		ad.aircraft_code
	),
	A_AVION_OC(flight_id, aircrafts_code, ocupadosasientos) as
	(
		select 
			f.flight_id, f.aircraft_code, count(*) as ocupadosasientos
		from
			flights f join ticket_flights tf on f.flight_id=tf.flight_id
		group by
			f.flight_id, f.aircraft_code
	),
	A_AVION_AV as
	(
		select 
			aoc.flight_id, (ato.totalasientos - aoc.ocupadosasientos) as asientos_vacios
		from
			A_AVION_T ato, A_AVION_OC aoc
		where
			ato.aircrafts_code= aoc.aircrafts_code
		group by
			aoc.flight_id, ato.totalasientos, aoc.ocupadosasientos
	),
	A_AVION_AV_MAS_VACIO as
	(
		select *
		from
			a_avion_av av
		order by
			av.asientos_vacios desc limit 1
	)
	
	select av.flight_id, av.asientos_vacios
	
	from 
		A_AVION_AV av join A_AVION_AV_MAS_VACIO avmv on av.asientos_vacios = avmv.asientos_vacios
	order by av.asientos_vacios;
