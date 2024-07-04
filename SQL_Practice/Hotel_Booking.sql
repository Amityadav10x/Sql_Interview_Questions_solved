 select * from Book1;


-- Total Bookings

select count(is_canceled)  as total_bookings
from book1
where is_canceled = 0

-- Total cancelation

select count(is_canceled)  as total_bookings
from book1
where is_canceled = 1

-- Most bookings by client name
select name, count(is_canceled) as Booking_numbers
from Book1
where is_canceled = 0
group by name 
order by Booking_numbers desc;

--Booking numbers country wise

select country,  count(is_canceled) as Booking_number
from Book1
where is_canceled = 0
group by country
order by Booking_number desc;

-- cancilation number country wise

select country,  count(is_canceled) as cancilation_numbers
from Book1
where is_canceled = 1
group by country
order by cancilation_numbers desc;


--  canceled number by distribution_channel

select distribution_channel , count(is_canceled) as canceled_by_distribution_channel
from Book1
group by distribution_channel
order by canceled_by_distribution_channel desc;

-- cancelation by assigned room type

select assigned_room_type, count(is_canceled) as canceled_by_assigned_room_type
from Book1
group by assigned_room_type
order by canceled_by_assigned_room_type desc;

-- cancelation by reserved room type

select reserved_room_type, count(is_canceled) as canceled_by_reserved_room_type
from Book1
group by reserved_room_type
order by canceled_by_reserved_room_type desc;

-- number of hotels by hotel type

select hotel,count(hotel) as number_of_hotel_type
from Book1
group by hotel
order by number_of_hotel_type desc

-- Total hotels

Select count(hotel)
from Book1

-- fetching suspects's data

select * from Book1
where name = 'Ernest Barnes'
order by name

--solving questions given by META AI

-- 1. select all columns for reservations where the arrival date is in july 2015.

select * from Book1
where arrival_date_month = 'July' AND arrival_date_year = 2015

-- 2. Find the name and email of all guests who have a reservation in the desired family room type

select name, email
from Book1
where room_status = 'Desired' and guest_type = 'Family';

-- 3.Select the total number of reservations made by guests from Portugal (country code "PRT").

select count(is_canceled) as total_bookings
from Book1
where is_canceled = 0 and country = 'PRT'

-- 4. Find the phone number and credit card number of guests who have a reservation with a deposit type of "No Deposit".

select phone_number, credit_card
from Book1
where deposit_type = 'No Deposit'
order by phone_number, credit_card

-- 5. Select all columns for reservations where the number of adults is greater than 2.

select * from Book1
where adults > 2;

-- Find the total number of reservations made by guests from the USA (country code "USA").

select count(is_canceled) as total_reservations_USA
from Book1
where is_canceled = 0 and country = 'USA'

-- Select the name and email of all guests who have a reservation in the "Resort Hotel" room type.

select name, email 
from Book1
where hotel = 'Resort Hotel'
group by name, email

-- Find the total number of special requests made by all guests.

select count(total_of_special_requests) as total_special_request
from Book1

-- Select all columns for reservations where the assigned room type is "C".

select * from Book1
where assigned_room_type = 'C'

-- intermedite level

-- Find the total numbert of special requests made by guests who have a reservation in the "Resort Hotel" room type.

select  hotel, count(total_of_special_requests) as special_request
from Book1
where hotel = 'Resort hotel'
group by hotel
order by special_request

-- Select the phone number and credit card number of guests who have a reservation with a deposit type of "No Deposit" and are staying for more than 3 days.

select phone_number, credit_card
from Book1
where deposit_type = 'No Deposit' and lead_time = 3

-- Find the total number of rooms reserved by guests type is family.


select count(is_canceled) as total_rooms_booked
from Book1
where is_canceled = 0 and guest_type = 'Family'

-- Select the name and email of all guests who have a reservation in the "Desired Family" room type and have made more than 1 special request.

select name, email
from Book1
where room_status = 'Desired' and total_of_special_requests > 1


-- Find the total number of reservations made by guests from Portugal (country code "PRT") who are staying for more than 2 days.

select count(is_canceled) as total_reservations
from Book1
where country = 'PRT' and lead_time > 2

-- Select all columns for reservations where the number of adults is greater than 2 and the number of children is greater than 1.

select * from Book1
where adults > 2 and children > 1

-- Find the average number of days stayed by guests who have a reservation in the "Resort Hotel" room type.

select avg(lead_time) as number_of_days_stays
from Book1
where hotel = 'Resort Hotel'

-- Select the name and email of all guests who have a reservation with a deposit type of "No Deposit" and have made no special requests.

select name,email
from Book1
where deposit_type = 'No Deposit' and total_of_special_requests = 0

-- Select all columns for reservations where the assigned room type is "C" and the number of special requests is greater than 1.

select * from Book1
where assigned_room_type = 'C' and total_of_special_requests > 1
