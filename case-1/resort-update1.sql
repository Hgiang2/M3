drop database resort;

create database if not exists resort;
use resort;

create table facility_type(
	id int primary key auto_increment,
    name varchar(45),
    is_delete bit(1)
);

create table rent_type(
	id int primary key auto_increment,
    name varchar(45),
    is_delete bit(1)
);

create table role(
	role_id int primary key auto_increment,
    role_name varchar(255),
    is_delete bit(1)
);

create table contract_detail(
	id int primary key auto_increment,
    contract_id int,
    attach_facility_id int,
    quantity int not null,
    is_delete bit(1)
);

create table customer_type(
	id int primary key auto_increment,
    name varchar(50),
    is_delete bit(1)
);

create table education_degree(
	id int primary key auto_increment,
    name varchar(45),
    is_delete bit(1)
);

create table division(
	id int primary key auto_increment,
    name varchar(45),
    is_delete bit(1)
);

  create table `position`(
	id int primary key auto_increment,
    name varchar(45),
    is_delete bit(1)
);

create table facility(
	id int primary key auto_increment,
    name varchar(50) not null,
    area int,
    cost double,
    max_people int,
    rent_type_id int,
    facility_type_id int,
    foreign key(rent_type_id) references rent_type(id),
    foreign key(facility_type_id) references facility_type(id),
    standard_room varchar(45),
    description_other_convenience varchar(45),
    pool_area double,
    number_of_floors int,
    facility_free text,
    is_delete bit(1)
);

create table user(
	user_name varchar(255) primary key,
    password varchar(255),
    is_delete bit(1)
);
    
create table user_role(
	role_id int,
    user_name varchar(255),
    primary key (role_id, user_name),
	foreign key(role_id) references role(role_id),
    foreign key(user_name) references user(user_name),
    is_delete bit(1)
);

create table customer(
	id int primary key auto_increment,
    customer_type_id int,
    foreign key(customer_type_id) references customer_type(id),
    name varchar(50) not null,
    gender bit(1) not null,
    date_of_birth datetime not null,
    id_card varchar(12) not null,
    phone_number varchar(12) not null,
    email varchar(45),
    address varchar(50),
    is_delete bit(1)
);

create table attach_facility(
	id int primary key auto_increment,
    name varchar(45) not null,
    cost double not null,
    unit varchar(10) not null,
    status varchar(45),
    is_delete bit(1)
);

create table contract(
	id int primary key auto_increment,
    start_date datetime not null,
    end_date datetime not null,
    deposit double not null,
    employee_id int,
    customer_id int,
    facility_id int,
    foreign key(customer_id) references customer(id),
    foreign key(facility_id) references attach_facility(id),
    is_delete bit(1)
);

create table employee(
	id int primary key auto_increment,
    name varchar(50) not null,
    date_of_birth datetime not null,
    id_card varchar(12) not null,
    salary double not null,
    phone_number varchar(12) not null,
    email varchar(45),
    address varchar(50),
    position_id int,
    education_degree_id int,
    division_id int,
    user_name varchar(255),
    foreign key(position_id) references `position`(id),
    foreign key(education_degree_id) references education_degree(id),
    foreign key(division_id) references division(id),
    foreign key(user_name) references user(user_name),
    is_delete bit(1)
);

create table service_type(
	id int primary key auto_increment,
    name varchar(45),
    is_delete bit(1)
);

create table service(
	id int primary key auto_increment,
    name varchar(45),
    service_type_id int,
    foreign key(service_type_id) references service_type(id),
    price varchar(45),
    is_delete bit(1)
);

create table contract_service(
	contract_id int,
    service_id int,
    primary key(contract_id, service_id),
    foreign key(contract_id) references contract(id),
    foreign key(service_id) references service(id),
	quantity int,
    is_delete bit (1)
);

-- CREATE TABLE DONE

-- INSERT VALUES

insert into role values
(1, 'Admin', 0),
(2, 'Normal Staff', 0)
;

insert into education_degree values
(1, 'Intermediate', 0),
(2, 'College', 0),
(3, 'Bachelor', 0),
(4, 'Postgraduate', 0)
;

insert into division values
(1, 'Sale - Marketing', 0),
(2, 'Finance', 0),
(3, 'Waiter', 0),
(4, 'Manager', 0)
;

insert into position values
(1, 'Reception', 0),
(2, 'Waiter', 0),
(3, 'Specialist', 0),
(4, 'Supervisor', 0),
(5, 'Manager', 0),
(6, 'Director', 0)
;

insert into rent_type values 
(1, 'year', 0),
(2, 'month', 0),
(3, 'day', 0),
(4, 'hour', 0)
;

insert into facility_type values
(1, 'Villa', 0),
(2, 'House', 0),
(3, 'Room', 0)
;

INSERT INTO user (user_name, password, is_delete) VALUES
('AliceJohnson', 'P@ssw0rd123', 0),
('BobSmith', 'SecurePwd456', 0),
('CharlieDavis', 'P@ssw0rd789', 0),
('DavidMiller', 'Secret123', 0),
('EvaWilliams', 'Qwerty!123', 0),
('FrankBrown', 'P@ssw0rd567', 0),
('GraceWhite', 'LetMeIn789', 0),
('HenryTaylor', 'MyP@ss!23', 0),
('IsabelClark', 'P@ssword123', 0),
('JackAdams', 'Admin456', 0),
('KatherineMoore', 'ILoveCoding!', 0),
('LeoJones', 'Abc123Xyz', 0),
('MiaLee', 'SuperSecret456', 0),
('NathanWilson', 'UserPass789', 0),
('OliviaEvans', 'Pa$$word890', 0),
('PaulHill', 'P@ssw0rd123!', 0),
('QuinnWoods', 'ChangeMeNow', 0),
('RachelRoberts', 'ILoveMovies456', 0),
('SamCollins', 'SecretP@ss789', 0),
('SophieKing', 'Qazwsx!123', 0),
('TomBaker', 'LetMeInNow456', 0),
('UrsulaBrooks', 'MyP@ss123!', 0),
('VincentBarnes', 'Password!234', 0),
('WendyWard', 'NewPassword789', 0),
('XavierFisher', 'Secure123!', 0),
('YvonneWright', 'ChangePass789', 0),
('ZackMoore', 'PassPass456', 0),
('EmmaRussell', 'Admin123!', 0),
('AlexCarter', 'TestPassword789', 0),
('HaileyTurner', '123456789', 0);


INSERT INTO employee (name, date_of_birth, id_card, salary, phone_number, email, address, position_id, education_degree_id, division_id, user_name, is_delete) VALUES
('Alice Johnson', '1990-05-15', '123456789012', 50000.00, '555-1234', 'john.doe@email.com', '123 Main St', 1, 1, 1, 'AliceJohnson', 0),
('Bob Smith', '1988-08-21', '987654321098', 60000.00, '555-5678', 'alice.smith@email.com', '456 Oak St', 2, 2, 2, 'BobSmith', 0),
('Charlie Davis', '1995-02-10', '456789012345', 55000.00, '555-8765', 'bob.johnson@email.com', '789 Pine St', 3, 3, 3, 'CharlieDavis', 0),
('David Miller', '1992-11-30', '345678901234', 70000.00, '555-4321', 'eva.miller@email.com', '234 Cedar St', 4, 4, 4, 'DavidMiller', 0),
('Eva Williams', '1987-04-05', '567890123456', 80000.00, '555-9876', 'charlie.brown@email.com', '567 Elm St', 5, 1, 1, 'EvaWilliams', 0),
('Frank Brown', '1993-07-18', '678901234567', 75000.00, '555-2345', 'grace.white@email.com', '890 Maple St', 6, 2, 2, 'FrankBrown', 0),
('Grace White', '1989-09-25', '789012345678', 60000.00, '555-8765', 'sam.jones@email.com', '123 Birch St', 1, 3, 3, 'GraceWhite', 0),
('Henry Taylor', '1991-12-12', '890123456789', 65000.00, '555-3210', 'linda.davis@email.com', '456 Pine St', 2, 4, 4, 'HenryTaylor', 0),
('Isabel Clark', '1994-06-08', '901234567890', 70000.00, '555-6543', 'daniel.clark@email.com', '789 Oak St', 3, 1, 1, 'IsabelClark', 0),
('Jack Adams', '1986-03-03', '123456789012', 80000.00, '555-0123', 'sophie.adams@email.com', '234 Cedar St', 4, 2, 2, 'JackAdams', 0),
('Katherine Moore', '1990-05-15', '234567890123', 90000.00, '555-7890', 'michael.taylor@email.com', '567 Elm St', 5, 3, 3, 'KatherineMoore', 0),
('Leo Jones', '1988-08-21', '345678901234', 85000.00, '555-4567', 'olivia.moore@email.com', '890 Maple St', 6, 4, 4, 'LeoJones', 0),
('Mia Lee', '1995-02-10', '456789012345', 75000.00, '555-2345', 'david.lee@email.com', '123 Birch St', 1, 1, 1, 'MiaLee', 0),
('Nathan Wilson', '1992-11-30', '567890123456', 70000.00, '555-6789', 'emma.wilson@email.com', '456 Pine St', 2, 2, 2, 'NathanWilson', 0),
('Olivia Evans', '1987-04-05', '678901234567', 60000.00, '555-3456', 'ryan.evans@email.com', '789 Oak St', 3, 3, 3, 'OliviaEvans', 0),
('Paul Hill', '1993-07-18', '789012345678', 65000.00, '555-8901', 'ava.hill@email.com', '123 Main St', 4, 4, 4, 'PaulHill', 0),
('Quinn Woods', '1989-09-25', '890123456789', 70000.00, '555-5678', 'chris.woods@email.com', '234 Cedar St', 5, 1, 1, 'QuinnWoods', 0),
('Rachel Roberts', '1991-12-12', '901234567890', 80000.00, '555-8765', 'julia.roberts@email.com', '567 Elm St', 6, 2, 2, 'RachelRoberts', 0),
('Sam Collins', '1994-06-08', '123456789012', 85000.00, '555-4321', 'mark.collins@email.com', '890 Maple St', 1, 3, 3, 'SamCollins', 0),
('Sophie King', '1986-03-03', '234567890123', 90000.00, '555-9876', 'sophia.king@email.com', '123 Birch St', 2, 4, 4, 'SophieKing', 0),
('Tom Baker', '1990-05-15', '345678901234', 75000.00, '555-6543', 'andrew.baker@email.com', '456 Pine St', 3, 1, 1, 'TomBaker', 0),
('Ursula Brooks', '1988-08-21', '456789012345', 70000.00, '555-3210', 'isabella.brooks@email.com', '789 Oak St', 4, 2, 2, 'UrsulaBrooks', 0),
('Vincent Barnes', '1995-02-10', '567890123456', 60000.00, '555-0123', 'nathan.barnes@email.com', '234 Cedar St', 5, 3, 3, 'VincentBarnes', 0),
('Wendy Ward', '1992-11-30', '678901234567', 65000.00, '555-7890', 'madison.ward@email.com', '567 Elm St', 6, 4, 4, 'WendyWard', 0),
('Xavier Fisher', '1987-04-05', '789012345678', 70000.00, '555-4567', 'jordan.fisher@email.com', '890 Maple St', 1, 1, 1, 'XavierFisher', 0),
('Yvonne Wright', '1993-07-18', '890123456789', 80000.00, '555-2345', 'chloe.wright@email.com', '123 Birch St', 2, 2, 2, 'YvonneWright', 0),
('Zack Moore', '1989-09-25', '901234567890', 85000.00, '555-6789', 'christopher.moore@email.com', '456 Pine St', 3, 3, 3, 'ZackMoore', 0),
('Emma Russell', '1991-12-12', '123456789012', 90000.00, '555-3456', 'emily.russell@email.com', '789 Oak St', 4, 4, 4, 'EmmaRussell', 0),
('Alex Carter', '1994-06-08', '234567890123', 75000.00, '555-8901', 'alex.carter@email.com', '123 Main St', 5, 1, 1, 'AlexCarter', 0),
('Hailey Turner', '1986-03-03', '345678901234', 70000.00, '555-5678', 'hailey.turner@email.com', '234 Cedar St', 6, 2, 2, 'HaileyTurner', 0);

INSERT INTO facility (name, area, cost, max_people, rent_type_id, facility_type_id, standard_room, description_other_convenience, pool_area, number_of_floors, facility_free, is_delete) VALUES
('Villa A', 300, 1500.00, 8, 1, 1, 'Luxury Suite', 'Private Pool, Jacuzzi', 100.00, 2, 'Free Wi-Fi, Parking & Breakfast', 0),
('Villa B', 250, 1200.00, 6, 2, 1, 'Deluxe Room', 'Garden View, BBQ Area', 80.00, 1, 'Free Wi-Fi, Parking & Breakfast', 0),
('Villa C', 400, 2000.00, 10, 3, 1, 'Master Suite', 'Ocean View, Private Beach Access', 120.00, 3, 'Free Wi-Fi, Parking & Breakfast', 0),
('Villa D', 350, 1800.00, 9, 4, 1, 'Executive Suite', 'Mountain View, Sauna', 110.00, 2, 'Free Wi-Fi, Parking & Breakfast', 0),
('House A', 200, 800.00, 5, 1, 2, 'Standard Room', 'Fireplace, Backyard', NULL, 2, 'Free Wi-Fi, Parking & Breakfast', 0),
('House B', 180, 750.00, 4, 2, 2, 'Cozy Bedroom', 'Patio, Outdoor Dining', NULL, 1, 'Free Wi-Fi, Parking & Breakfast', 0),
('House C', 220, 900.00, 6, 3, 2, 'Family Room', 'Playroom, Garden', NULL, 2, 'Free Wi-Fi, Parking & Breakfast', 0),
('House D', 250, 1000.00, 7, 4, 2, 'Master Bedroom', 'Sunroom, Deck', NULL, 3, 'Free Wi-Fi, Parking & Breakfast', 0),
('Room A', 30, 100.00, 2, 1, 3, 'Standard Room', 'City View', NULL, NULL, 'Free Wi-Fi, Parking', 0),
('Room B', 25, 80.00, 2, 2, 3, 'Economy Room', 'Street View', NULL, NULL, 'Free Wi-Fi, Parking', 0),
('Room C', 35, 120.00, 3, 3, 3, 'Deluxe Room', 'Sea View', NULL, NULL, 'Free Wi-Fi, Parking', 0),
('Room D', 40, 150.00, 4, 4, 3, 'Executive Suite', 'Mountain View', NULL, NULL, 'Free Wi-Fi, Parking', 0),
('Villa E', 320, 1600.00, 8, 1, 1, 'Luxury Suite', 'Private Pool, Jacuzzi', 110.00, 2, 'Free Wi-Fi, Parking & Breakfast', 0),
('Villa F', 280, 1300.00, 6, 2, 1, 'Deluxe Room', 'Garden View, BBQ Area', 90.00, 1, 'Free Wi-Fi, Parking & Breakfast', 0),
('Villa G', 420, 2200.00, 10, 3, 1, 'Master Suite', 'Ocean View, Private Beach Access', 130.00, 3, 'Free Wi-Fi, Parking & Breakfast', 0),
('Villa H', 370, 1900.00, 9, 4, 1, 'Executive Suite', 'Mountain View, Sauna', 120.00, 2, 'Free Wi-Fi, Parking & Breakfast', 0),
('House E', 220, 900.00, 5, 1, 2, 'Standard Room', 'Fireplace, Backyard', NULL, 2, 'Free Wi-Fi, Parking & Breakfast', 0),
('House F', 200, 850.00, 4, 2, 2, 'Cozy Bedroom', 'Patio, Outdoor Dining', NULL, 1, 'Free Wi-Fi, Parking & Breakfast', 0),
('House G', 240, 1000.00, 6, 3, 2, 'Family Room', 'Playroom, Garden', NULL, 2, 'Free Wi-Fi, Parking & Breakfast', 0),
('House H', 270, 1100.00, 7, 4, 2, 'Master Bedroom', 'Sunroom, Deck', NULL, 3, 'Free Wi-Fi, Parking & Breakfast', 0),
('Room E', 32, 110.00, 2, 1, 3, 'Standard Room', 'City View', NULL, NULL, 'Free Wi-Fi, Parking', 0),
('Room F', 28, 90.00, 2, 2, 3, 'Economy Room', 'Street View', NULL, NULL, 'Free Wi-Fi, Parking', 0),
('Room G', 38, 130.00, 3, 3, 3, 'Deluxe Room', 'Sea View', NULL, NULL, 'Free Wi-Fi, Parking', 0),
('Room H', 42, 160.00, 4, 4, 3, 'Executive Suite', 'Mountain View', NULL, NULL, 'Free Wi-Fi, Parking', 0);

insert into customer_type values
(1, 'Member', 0),
(2, 'Silver', 0),
(3, 'Gold', 0),
(4, 'Platinum', 0),
(5, 'Diamond', 0);

insert into service_type values
(1, 'free', 0),
(2, 'paid', 0);

insert into service values
(1, 'massage', 2, 200000, 0),
(2, 'karaoke', 2,  100000, 0),
(3, 'food', 1, 0, 0),
(4, 'beverage', 1, 0, 0),
(5, 'vehicle', 1, 0, 0);

INSERT INTO customer (customer_type_id, name, gender, date_of_birth, id_card, phone_number, email, address, is_delete) VALUES
(1, 'Xander Frost', 1, '1990-05-15', '123456789012', '555-1234', 'xander.frost@email.com', '123 Main St', 0),
(2, 'Zara Shadow', 0, '1988-08-21', '987654321098', '555-5678', 'zara.shadow@email.com', '456 Oak St', 0),
(3, 'Quincy Storm', 1, '1995-02-10', '456789012345', '555-8765', 'quincy.storm@email.com', '789 Pine St', 0),
(4, 'Raven Nightshade', 0, '1992-09-30', '345678901234', '555-9876', 'raven.nightshade@email.com', '234 Cedar St', 0),
(5, 'Luna Eclipse', 1, '1985-12-18', '567890123456', '555-3456', 'luna.eclipse@email.com', '567 Elm St', 0),
(1, 'Blaze Thunder', 0, '1998-04-25', '678901234567', '555-0123', 'blaze.thunder@email.com', '890 Maple St', 0),
(2, 'Vortex Nebula', 1, '1993-06-07', '789012345678', '555-7890', 'vortex.nebula@email.com', '123 Birch St', 0),
(3, 'Athena Starlight', 0, '1990-11-15', '890123456789', '555-2345', 'athena.starlight@email.com', '456 Pine St', 0),
(4, 'Orion Galaxy', 1, '1987-03-22', '901234567890', '555-6789', 'orion.galaxy@email.com', '789 Oak St', 0),
(5, 'Nova Solaris', 0, '1995-08-10', '123456789012', '555-8901', 'nova.solaris@email.com', '123 Main St', 0),
(1, 'Lyra Stardust', 1, '1992-02-28', '234567890123', '555-5678', 'lyra.stardust@email.com', '234 Cedar St', 0),
(2, 'Cosmo Celestial', 0, '1988-06-15', '345678901234', '555-1234', 'cosmo.celestial@email.com', '567 Elm St', 0),
(3, 'Lunar Eclipse', 1, '1997-09-05', '456789012345', '555-0123', 'lunar.eclipse@email.com', '890 Maple St', 0),
(4, 'Serenity Shadow', 0, '1985-12-12', '567890123456', '555-7890', 'serenity.shadow@email.com', '123 Birch St', 0),
(5, 'Nebula Nebulon', 1, '1991-07-18', '678901234567', '555-2345', 'nebula.nebulon@email.com', '456 Pine St', 0),
(1, 'Zephyr Whisper', 0, '1994-10-25', '789012345678', '555-6789', 'zephyr.whisper@email.com', '789 Oak St', 0),
(2, 'Aurora Lights', 1, '1989-03-15', '901234567890', '555-8901', 'aurora.lights@email.com', '123 Main St', 0),
(3, 'Venus Moonlight', 0, '1996-06-30', '123456789012', '555-1234', 'venus.moonlight@email.com', '234 Cedar St', 0),
(4, 'Zodiac Horizon', 1, '1993-01-08', '234567890123', '555-5678', 'zodiac.horizon@email.com', '567 Elm St', 0),
(5, 'Phoebe Starfall', 0, '1987-04-20', '345678901234', '555-0123', 'phoebe.starfall@email.com', '890 Maple St', 0),
(1, 'Astro Comet', 1, '1990-11-05', '456789012345', '555-7890', 'astro.comet@email.com', '123 Birch St', 0),
(2, 'Stellar Galaxy', 0, '1995-02-22', '567890123456', '555-2345', 'stellar.galaxy@email.com', '456 Pine St', 0),
(3, 'Nyx Twilight', 1, '1988-07-10', '678901234567', '555-6789', 'nyx.twilight@email.com', '789 Oak St', 0),
(4, 'Lumina Nova', 0, '1997-09-28', '789012345678', '555-8901', 'lumina.nova@email.com', '123 Main St', 0),
(5, 'Starlyn Quasar', 1, '1985-12-15', '901234567890', '555-1234', 'starlyn.quasar@email.com', '234 Cedar St', 0),
(1, 'Galaxy Cosmos', 0, '1992-03-28', '123456789012', '555-5678', 'galaxy.cosmos@email.com', '567 Elm St', 0),
(2, 'Andromeda Infinity', 1, '1989-08-10', '234567890123', '555-0123', 'andromeda.infinity@email.com', '890 Maple St', 0),
(3, 'Zenith Horizon', 0, '1994-01-25', '345678901234', '555-7890', 'zenith.horizon@email.com', '123 Birch St', 0),
(4, 'Celestia Radiance', 1, '1987-05-12', '456789012345', '555-2345', 'celestia.radiance@email.com', '456 Pine St', 0),
(5, 'Astral Comet', 0, '1990-10-05', '567890123456', '555-6789', 'astral.comet@email.com', '789 Oak St', 0);

INSERT INTO contract (start_date, end_date, deposit, employee_id, customer_id, facility_id, is_delete) VALUES
('2022-01-01', '2022-01-10', 500.00, 1, 1, 1, 0),
('2022-02-05', '2022-02-15', 600.00, 2, 2, 2, 0),
('2022-03-10', '2022-03-20', 550.00, 3, 3, 3, 0),
('2022-04-15', '2022-04-25', 700.00, 4, 4, 4, 0),
('2022-05-20', '2022-05-30', 800.00, 5, 5, 5, 0),
('2022-06-25', '2022-07-05', 750.00, 6, 6, 6, 0),
('2022-07-30', '2022-08-09', 600.00, 7, 7, 7, 0),
('2022-08-05', '2022-08-15', 650.00, 8, 8, 8, 0),
('2022-09-10', '2022-09-20', 700.00, 9, 9, 9, 0),
('2022-10-15', '2022-10-25', 800.00, 10, 10, 10, 0),
('2022-11-20', '2022-11-30', 900.00, 11, 11, 11, 0),
('2022-12-25', '2023-01-05', 850.00, 12, 12, 12, 0),
('2023-01-30', '2023-02-09', 750.00, 13, 13, 13, 0),
('2023-02-05', '2023-02-15', 700.00, 14, 14, 14, 0),
('2023-03-10', '2023-03-20', 650.00, 15, 15, 15, 0),
('2023-04-15', '2023-04-25', 700.00, 16, 16, 16, 0),
('2023-05-20', '2023-05-30', 800.00, 17, 17, 17, 0),
('2023-06-25', '2023-07-05', 850.00, 18, 18, 18, 0),
('2023-07-30', '2023-08-09', 750.00, 19, 19, 19, 0),
('2023-08-05', '2023-08-15', 700.00, 20, 20, 20, 0),
('2023-09-10', '2023-09-20', 650.00, 21, 21, 21, 0),
('2023-10-15', '2023-10-25', 700.00, 22, 22, 22, 0),
('2023-11-20', '2023-11-30', 800.00, 23, 23, 23, 0),
('2023-12-25', '2023-01-05', 900.00, 24, 24, 24, 0),
('2023-01-30', '2023-02-09', 850.00, 25, 25, 25, 0),
('2023-02-05', '2023-02-15', 750.00, 26, 26, 26, 0),
('2023-03-10', '2023-03-20', 700.00, 27, 27, 27, 0),
('2023-04-15', '2023-04-25', 650.00, 28, 28, 28, 0),
('2023-05-20', '2023-05-30', 700.00, 29, 29, 29, 0),
('2023-06-25', '2023-07-05', 800.00, 30, 30, 30, 0);

INSERT INTO contract_detail (contract_id, attach_facility_id, quantity, is_delete) VALUES
(1, 1, 2, 0),
(2, 2, 3, 0),
(3, 3, 1, 0),
(4, 4, 2, 0),
(5, 5, 1, 0),
(6, 6, 3, 0),
(7, 7, 2, 0),
(8, 8, 1, 0),
(9, 9, 3, 0),
(10, 10, 2, 0),
(11, 11, 1, 0),
(12, 12, 2, 0),
(13, 13, 3, 0),
(14, 14, 1, 0),
(15, 15, 2, 0),
(16, 16, 1, 0),
(17, 17, 3, 0),
(18, 18, 2, 0),
(19, 19, 1, 0),
(20, 20, 2, 0),
(21, 21, 3, 0),
(22, 22, 1, 0),
(23, 23, 2, 0),
(24, 24, 1, 0),
(25, 25, 3, 0),
(26, 26, 2, 0),
(27, 27, 1, 0),
(28, 28, 2, 0),
(29, 29, 3, 0),
(30, 30, 1, 0);

-- Mock Data for Attach_Facility
INSERT INTO attach_facility (name, cost, VND, status, is_delete) VALUES
('Facility A', 200.00, 'VND', 'Active', 0),
('Facility B', 150.00, 'VND', 'Active', 0),
('Facility C', 100.00, 'VND', 'Active', 0),
('Facility D', 120.00, 'VND', 'Active', 0),
('Facility E', 180.00, 'VND', 'Active', 0),
('Facility F', 250.00, 'VND', 'Active', 0),
('Facility G', 300.00, 'VND', 'Active', 0),
('Facility H', 170.00, 'VND', 'Active', 0),
('Facility I', 220.00, 'VND', 'Active', 0),
('Facility J', 200.00, 'VND', 'Active', 0),
('Facility K', 150.00, 'VND', 'Active', 0),
('Facility L', 130.00, 'VND', 'Active', 0),
('Facility M', 160.00, 'VND', 'Active', 0),
('Facility N', 190.00, 'VND', 'Active', 0),
('Facility O', 210.00, 'VND', 'Active', 0),
('Facility P', 140.00, 'VND', 'Active', 0),
('Facility Q', 180.00, 'VND', 'Active', 0),
('Facility R', 230.00, 'VND', 'Active', 0),
('Facility S', 270.00, 'VND', 'Active', 0),
('Facility T', 200.00, 'VND', 'Active', 0),
('Facility U', 150.00, 'VND', 'Active', 0),
('Facility V', 120.00, 'VND', 'Active', 0),
('Facility W', 250.00, 'VND', 'Active', 0),
('Facility X', 300.00, 'VND', 'Active', 0),
('Facility Y', 170.00, 'VND', 'Active', 0),
('Facility Z', 220.00, 'VND', 'Active', 0);

-- Mock Data for Contract_Service
INSERT INTO contract_service (contract_id, service_description, service_cost, is_delete) VALUES
(1, 'Good', 50.00, 0),
(2, 'Excellent', 80.00, 0),
(3, 'Fine', 60.00, 0),
(4, 'Good', 70.00, 0),
(5, 'Fine', 90.00, 0),
(6, 'Good', 55.00, 0),
(7, 'Excellent', 75.00, 0),
(8, 'Fine', 65.00, 0),
(9, 'Good', 75.00, 0),
(10, 'Fine', 85.00, 0),
(11, 'Good', 60.00, 0),
(12, 'Excellent', 85.00, 0),
(13, 'Fine', 70.00, 0),
(14, 'Good', 80.00, 0),
(15, 'Fine', 95.00, 0),
(16, 'Good', 65.00, 0),
(17, 'Excellent', 70.00, 0),
(18, 'Fine', 75.00, 0),
(19, 'Good', 85.00, 0),
(20, 'Fine', 80.00, 0),
(21, 'Good', 70.00, 0),
(22, 'Excellent', 75.00, 0),
(23, 'Fine', 80.00, 0),
(24, 'Good', 90.00, 0),
(25, 'Fine', 100.00, 0),
(26, 'Good', 75.00, 0),
(27, 'Excellent', 80.00, 0),
(28, 'Fine', 85.00, 0),
(29, 'Good', 95.00, 0),
(30, 'Fine', 90.00, 0);