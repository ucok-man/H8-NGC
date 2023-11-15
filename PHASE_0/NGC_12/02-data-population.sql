INSERT INTO destination (name, country, description, rating)
VALUES 
    (
        'Wisata A',
        'Indonesia',
        'Lorem ipsum dolor sit, amet consectetur adipisicing elit. Hic, dolorum.',
        5
    ),
    (
        'Wisata B',
        'Indonesia',
        'Lorem ipsum dolor sit, amet consectetur adipisicing elit. Hic, dolorum.',
        2
    ),
    (
        'Wisata C',
        'Indonesia',
        'Lorem ipsum dolor sit, amet consectetur adipisicing elit. Hic, dolorum.',
        4
    );

INSERT INTO hotel (id_destination, name, address, rating)
VALUES 
    ( 2, 'Hotel A', 'Jalan ABC No.12', 5),
    ( 1,'Hotel B','Jalan DEF No.10', 3),
    ( 3, 'Hotel C', 'Jalan XYZ No.80', 4),
    ( 1, 'Hotel D', 'Jalan HHH No.41', 2),
    ( 2, 'Hotel E', 'Jalan ZZZ No.60', 3);



INSERT INTO booking (id_hotel, guest_detail, check_in, check_out)
VALUES
    (3, 'John Salim', '2023-10-01 19:00:00', '2023-10-08 19:00:00'),
    (2, 'Budi Salim', '2023-10-10 09:00:00', '2023-10-17 09:00:00'),
    (1, 'Agus Salim', '2023-10-20 12:00:00', '2023-10-27 12:00:00');
