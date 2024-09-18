/*1*/
select "name", city 
from hotel;

/*2*/
select city 
from client c 
where last_name = 'White';

/*3*/
select "name", altitude  
from station 
where altitude <1000;

/*4*/
select "number", capacity 
from room r 
where capacity > 1;

/*5*/
select concat(last_name, ' ', first_name), city
from client
where city != 'Londres';

/*6*/
select "name", city, category 
from hotel h 
where city = 'Bretou'
and category > 3;

/*7*/
select s."name", h."name", h.category, h.city 
from hotel h 
join station s 
on h.station_id = s.id;

/*8*/
select h."name", h.category, h.city, r.id
from hotel h 
join room r 
on h.station_id = r.id;

/*9*/
select h."name", h.category, h.city, r."number", r.capacity 
from hotel h
join room r 
on h.id = r.hotel_id 
where capacity > 1
and city = 'Bretou';

/*10*/
select  c.last_name, b.booking_date, h."name" 
from booking b 
join client c 
on b.client_id = c.id 
join room r 
on b.room_id = r.id
join hotel h 
on h.id = r.hotel_id ;

/*11*/
select s."name", h."name", r."number", r.capacity 
from room r 
join hotel h 
on r.hotel_id = h.id 
join station s 
on h.station_id = s.id;
/*12*/
select  c.last_name, h."name", b.stay_start_date, (stay_end_date - stay_start_date) duration 
from booking b 
join client c 
on b.client_id = c.id 
join room r 
on b.room_id = r.id
join hotel h 
on h.id = r.hotel_id ;

/*13*/
select station_id, count(id) as number_hotel
from hotel 
group by station_id ;

/*14*/
select s."name", count(r.number) as room_number
from room r 
join hotel h 
on h.id = r.hotel_id 
join station s 
on s.id = h.station_id 
group by s.name
order by room_number asc;

/*15*/
select s."name", count(r.number) as room_number
from room r 
join hotel h 
on h.id = r.hotel_id 
join station s 
on s.id = h.station_id 
where r.capacity > 1
group by s."name" 
order by room_number asc;

/*16*/
select h."name", c.last_name, r.hotel_id
from hotel h 
join room r 
on r.hotel_id = h.id 
join booking b 
on b.room_id = r.id 
join client c 
on b.client_id = c.id 
where c.last_name = 'Squire';

/*17*/
select avg(b.stay_end_date - b.stay_start_date) as duree_moyenne, s.name as station_name
from booking b
join room r on b.room_id = r.id
join hotel h on r.hotel_id = h.id
join station s on h.station_id = s.id
group by s.name;