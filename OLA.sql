create database ola ;
use ola ;
select count(*) from ola.bookings ;
# 1. Retrieve all successful bookings:
create view Sucessful_Bookings as 
select * from ola.bookings where Booking_Status = "Success" ;

select * from Sucessful_Bookings ;

# 2. Find the average ride distance for each vehicle type:
CREATE VIEW RIDE_DISTANCE_FOR_EACH_VEHICAL AS 
select Vehicle_Type , AVG(Ride_Distance) as avg_distance from bookings
Group BY vehicle_Type;

select * from RIDE_DISTANCE_FOR_EACH_VEHICAL ;
# 3. Get the total number of cancelled rides by customers:
CREATE VIEW Canceled_Ride_By_Customer as 
select count(*) from bookings  WHERE Booking_Status = "Canceled by Customer" ;

select * from Canceled_Ride_By_Customer ;

# 4. List the top 5 customers who booked the highest number of rides:
CREATE VIEW TOP_5_CUSTOMERS AS 
select  Customer_ID , COUNT(Booking_ID) as total_rides from bookings
 group by Customer_ID order by  total_rides DESC LIMIT 5 ;
 
 SELECT * from TOP_5_CUSTOMERS ;
 
# 5. Get the number of rides cancelled by drivers due to personal and car-related issues: 
Create view Canceled_by_driver as 
SELECT COUNT(*) FROM bookings where Canceled_Rides_by_Driver = "Personal & Car related issue";

select * from canceled_by_driver;

# 6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
CREATE VIEW RATINGS AS 
select max(Driver_Ratings) as max_rating , min(Driver_Ratings) as min_rating from bookings
 where Vehicle_Type = "Prime Sedan";
 
 SELECT * FROM RATINGS ;
 
# 7. Retrieve all rides where payment was made using UPI:
CREATE VIEW UPI AS 
SELECT * FROM bookings where Payment_Method = "UPI" ;

SELECT * FROM UPI ;

# 8. Find the average customer rating per vehicle type:
create VIEW AVG_RATING AS 
SELECT Vehicle_Type , avg(Customer_Rating) AS avg_cust_rating from bookings
 group by Vehicle_Type;
 
 SELECT * FROM AVG_RATING ;
# 9. Calculate the total booking value of rides completed successfully:
create view Total_amount_by_successful_ride as 
SELECT SUM(Booking_Value) as total_value_Success from bookings 
where Booking_Status = "Success";

select * from  Total_amount_by_successful_ride ;

# 10. List all incomplete rides along with the reason:
create view  Incomplete_Ride as 
select Booking_ID, Incomplete_Rides_Reason from bookings where Incomplete_Rides = "Yes";

Select * from  Incomplete_Ride ;
