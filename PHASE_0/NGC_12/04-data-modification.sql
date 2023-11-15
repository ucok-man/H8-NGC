-- Update the rating of a destination
UPDATE destination
SET destination.rating = 1
WHERE destination.name = 'Wisata B';

UPDATE hotel
SET hotel.address = 'Jalan Teuku Umar No.100'
WHERE hotel.id_hotel = 2;

DELETE FROM booking 
WHERE id_booking = 1;

