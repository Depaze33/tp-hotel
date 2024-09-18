/*1*/
create or replace view hotel_reservation
as
select b.id as reseravation,
b.room_id,
b.client_id, 
b.booking_date,
b.stay_start_date,
b.stay_end_date,
b.price,
b.deposit, 
c.last_name
from booking b 
join client c 
on c.id = b.client_id;


select * 
from hotel_reservation; 

/*2*/
create or replace view room_list
as
select 
r.id as room_list,
h."name" as hotel_name,
s."name" as station_name
from station s 
join hotel h 
on s.id = h.station_id 
join room r 
on h.id = r.hotel_id;

select * 
from room_list rl ; 

/*3*/
create or replace view booking_list
as
select 
b.id as booking_list,
h.name as hotel_name,
s.name as station_name
from station s 
join hotel h 
on s.id = h.station_id 
join room r 
on h.id =r.hotel_id
join booking b 
on r.id = b.room_id;

select * 
from booking_list ;

/*4*/
CREATE role application_admin 
LOGIN 
PASSWORD 'Azerty'; 

GRANT select, update, delete 
ON booking, client, hotel, room 
TO application_admin;

/*SUPER ADMIN */     
--     ALTER USER user_name WITH PASSWORD 'new_password';

/*5*/

/*6*/
CREATE role application_client
LOGIN 
PASSWORD 'Azerty33';

/*7*/
grant select 
on table hotel_reservation 
to application_client; 

/*8*/
