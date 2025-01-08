--                                                            Interview Question Practice

-- Basic Queries

-- Retrieve all columns from the Hotel_Information table.

select * from Hotel_Information

-- Select the HotelName and Location columns from the Hotel_Information table.

select HotelName, Location
from Hotel_Information

-- Retrieve the HotelID and RoomType columns from the Booking_Information table.

select HotelID,RoomType
from Booking_Infomation

--                                                                    Filtering Data

-- Retrieve all hotels with a rating greater than 4.5 from the Hotel_Information table.

select HotelName,round(Rating,2) as rating
from Hotel_Information
where Rating > 4.5

-- Select all bookings with an arrival date before January 15, 2022, from the Booking_Information table.

select BookingID,Arrive_Date
from Booking_Infomation
where Arrive_Date < '2022-01-15'

-- Find all hotels located in New York or Los Angeles from the Hotel_Information table.

select HotelName,Location
from Hotel_Information
where Location = 'New York'

-- Retrieve all bookings with a rate greater than $200 from the Booking_Information table.

select *
from Booking_Infomation
where rate > 200

-- Select all hotels with a rating greter than 4.0 from the Hotel_Information table.

select HotelName,rating
from Hotel_Information
where rating > 4


--                                                                  Sorting and Limiting Data

-- Retrieve all hotels from the Hotel_Information table, sorted by rating in descending order.

select HotelName,round(rating,2) as rating
from Hotel_Information
order by Rating desc

-- Select the top 3 hotels with the highest rating from the Hotel_Information table.

select top 3 HotelName,round(max(rating),2) as highest_rating
from Hotel_Information
group by HotelName
order by highest_rating desc

-- Retrieve all bookings from the Booking_Information table, sorted by arrival date in ascending order.

select BookingID,Arrive_Date
from Booking_Infomation
order by Arrive_Date desc

--  Select the bottom 2 hotels with the lowest rating from the Hotel_Information table.

select top 2 HotelName,round(min(Rating),2) as lowest_rating
from Hotel_Information
group by HotelName
order by lowest_rating asc

-- Retrieve all bookings from the Booking_Information table, sorted by rate in descending order.

select *
from Booking_Infomation
order by Rate desc


--                                                              Joining Tables

-- Retrieve the hotel name and guest name for all bookings from the Booking_Information and Hotel_Information tables.

select HotelName,GuestName
from Hotel_Information hi
inner join Booking_Infomation bi
on hi.HotelID = bi.HotelID

-- Select the hotel location and room type for all bookings from the Booking_Information and Hotel_Information tables.

select Location,RoomType
from Hotel_Information hi
Inner join Booking_Infomation bi
on hi.HotelID = bi.HotelID

-- Find the total revenue for each hotel by joining the Booking_Information and Hotel_Information tables.

select RoomType,sum(rate) as total_revunue
from Booking_Infomation bi
join Hotel_Information hi
on bi.HotelID = hi.HotelID
group by RoomType

-- Retrieve the hotel name and arrival date for all bookings from the Booking_Information and Hotel_Information tables.

select BookingID,HotelName,Arrive_Date
from Booking_Infomation bi
join Hotel_Information hi
on bi.HotelID = hi.HotelID

-- Select the hotel location and departure date for all bookings from the Booking_Information and Hotel_Information tables.

select BookingID,Location,DepartureDate
from Booking_Infomation bi
join Hotel_Information hi
on bi.HotelID = hi.HotelID


--                                                            Grouping and Aggregating Data

-- Calculate the average rating for each location from the Hotel_Information table.

select Location, round(avg(Rating),2) as avg_rating
from Hotel_Information
group by Location
order by avg_rating desc

-- Retrieve the total number of bookings for each hotel from the Booking_Information table.

select HotelID,count(BookingID) as total_booking
from Booking_Infomation
group by HotelID
order by total_booking desc

-- Find the maximum and minimum rates for each room type from the Booking_Information table.

select RoomType,max(Rate) as maximum_rate,
min(rate) as minimum_rate
from Booking_Infomation
group by RoomType

-- Calculate the total revenue for each hotel from the Booking_Information table.

select HotelID,sum(rate) as total_revenue
from Booking_Infomation
group by HotelID
order by total_revenue desc

-- Retrieve the number of bookings for each room type from the Booking_Information table.

select RoomType,count(BookingID) as total_bookings
from Booking_Infomation
group by RoomType
order by total_bookings desc

--                                                                 Subqueries and Nested Queries

-- Retrieve all hotels with a rating higher than the average rating of all hotels from the Hotel_Information table.

select HotelName,round(avg(Rating),2) as avg_rating
from Hotel_Information
where Rating > (select avg(Rating) as avg_rating
from Hotel_Information)
group by HotelName

--  Select all bookings with a rate higher than the maximum rate of the 'Standard' room type from the Booking_Information table.

select BookingID,Rate as maximum_rate,RoomType
from Booking_Infomation
where RoomType = 'Standard' and rate = (select max(Rate) as maximum_rate
from Booking_Infomation where RoomType = 'Standard')

-- Find all hotels with at least one booking from the Booking_Information table.

select *
from Booking_Infomation
where HotelID in (select HotelID from Booking_Infomation)

--  Select all hotels with a rating lower than the minimum rating of all hotels from the Hotel_Information table.

select HotelName, Rating as lower_rating
from Hotel_Information
where rating = (select min(Rating) as minimum_rating from Hotel_Information)

-- Retrieve all bookings with an arrival date before the earliest arrival date of all bookings from the Booking_Information table.

select BookingID,Arrive_Date
from Booking_Infomation
where Arrive_Date = (select min(Arrive_Date) as minimum_date from Booking_Infomation)


--                                                              Advanced Queries

-- Retrieve the top 2 hotels with the highest average rating for each location from the Hotel_Information table.

with ranked_hotels as (
select HotelName,Location, round(avg(rating),2) as avg_rating,
rank() over(partition by location order by avg(rating)desc) as rank
from Hotel_Information
group by HotelName,Location
)
select top 2 HotelName,Location,avg_rating
from ranked_hotels
where rank <= 2

-- Select the bookings with a rate higher than the average rate of the same room type from the Booking_Information table.

with ranked_bookings as (
select *,
AVG(rate) over (partition by RoomType) as avg_rate
from Booking_Infomation
)
select *
from ranked_bookings
where rate > avg_rate