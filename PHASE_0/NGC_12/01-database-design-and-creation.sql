CREATE DATABASE IF NOT EXISTS tourism;
USE tourism;

CREATE TABLE IF NOT EXISTS destination (
    id_destination INT AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    country VARCHAR(255) NOT NULL,
    description TEXT,
    rating TINYINT CHECK (rating >= 1 AND rating <= 5 ),

    PRIMARY KEY (id_destination)
);

CREATE TABLE IF NOT EXISTS hotel (
    id_hotel INT AUTO_INCREMENT,
    id_destination INT NOT NULL,
    name VARCHAR(255) NOT NULL,
    address VARCHAR(255) NOT NULL,
    rating TINYINT CHECK (rating >= 1 AND rating <= 5 ),

    PRIMARY KEY (id_hotel),
    FOREIGN KEY (id_destination) REFERENCES destination(id_destination)
);

CREATE TABLE IF NOT EXISTS booking (
    id_booking INT AUTO_INCREMENT,
    id_hotel INT NOT NULL,
    guest_detail VARCHAR(255) NOT NULL,
    check_in DATETIME NOT NULL,
    check_out DATETIME NOT NULL,

    PRIMARY KEY (id_booking),
    FOREIGN KEY (id_booking) REFERENCES hotel(id_hotel)
);