-- retrive all destination
SELECT * FROM destination;

-- retrive all hotel
SELECT * FROM hotel;

-- retrive all booking
SELECT * FROM booking;

-- retrive hotel in specific destination
SELECT * FROM hotel
INNER JOIN  destination
ON destination.id_destination = hotel.id_destination
WHERE destination.name = 'Wisata A';

-- Calculate and display the average rating of hotels in a particular destination
SELECT AVG(hotel.rating) as `average_hotel_rating`
FROM hotel
INNER JOIN  destination
ON destination.id_destination = hotel.id_destination
WHERE destination.name = 'Wisata A';


