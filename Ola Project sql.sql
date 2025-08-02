CREATE DATABASE IF NOT EXISTS ola;
USE ola;
-- Retrieve all successful bookings
CREATE VIEW Successful_Bookings AS
SELECT * FROM bookings
WHERE Booking_Status="Success";
SELECT * FROM Successful_Bookings;

-- find the average ride distance for each vehicle type:
CREATE VIEW ride_distance_for_each_vehicle AS
SELECT Vehicle_Type,AVG(Ride_Distance)
AS avg_distance FROM bookings 
GROUP BY Vehicle_Type;
SELECT * FROM ride_distance_for_each_vehicle;


-- Get the total number of cancelled rides by customers:
CREATE VIEW cancelled_rides_by_customers AS
SELECT COUNT(*) FROM bookings
WHERE Booking_Status="Canceled by Customer";
SELECT * FROM cancelled_rides_by_customers;

-- List the top 5 customers who booked the highest number of rides:
CREATE VIEW Top_5_Customers AS
SELECT Customer_ID,COUNT(Booking_ID) AS total_rides
FROM bookings
GROUP BY Customer_ID
ORDER BY total_rides DESC LIMIT 5;
SELECT * FROM Top_5_Customers;

-- Get the number of rides canceled by drivers due to personal and car-related issues:
CREATE VIEW Rides_Canceled_by_drivers_P_C_Issues AS
SELECT COUNT(*) FROM bookings
WHERE Canceled_Rides_by_Driver="Personal & Car related issue"; 
SELECT * FROM Rides_Canceled_by_drivers_P_C_Issues;

-- Find the maximum and minimum driver ratings for primr sedan bookings:
CREATE VIEW Max_Min_Driver_Rating AS
SELECT MAX(Driver_Ratings) AS max_rating,
MIN(Driver_Ratings) AS min_rating
FROM bookings WHERE Vehicle_Type="Prime Sedan"; 
SELECT * FROM Max_Min_Driver_Rating;

-- Retrieve all rides where payment eas made using UPI:
CREATE VIEW UPI_Payment AS
SELECT * FROM bookings
WHERE Payment_Method="UPI";
SELECT * FROM UPI_Payment;

-- Find the average customer rating per vehicle type:
CREATE VIEW AVG_Cost_Rating AS
SELECT Vehicle_Type,AVG(Customer_Rating) AS avg_customer_rating
FROM bookings
GROUP BY Vehicle_Type;
SELECT * FROM VG_Cost_Rating;

-- Calculate the total booking value of rides completed successfully:
CREATE VIEW total_successful_ride_value AS
SELECT SUM(Booking_Value) AS total_successful_ride_value
FROM bookings
WHERE Booking_Status="Success";
SELECT * FROM total_successful_ride_value;

-- List all incomplete rides along with the reason:
CREATE VIEW Incomplete_Rides_Reason AS
SELECT Booking_ID,Incomplete_Rides_Reason
FROM bookings
WHERE Incomplete_Rides="Yes";
SELECT * FROM Incomplete_Rides_Reason;




