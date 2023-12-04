create database if not exists resort;
use resort;

create table facility_type(
	id int primary key auto_increment,
    name nvarchar(45),
    is_delete bit(1)
);

create table rent_type(
	id int primary key auto_increment,
    name nvarchar(45),
    is_delete bit(1)
);

create table role(
	role_id int primary key auto_increment,
    role_name nvarchar(255),
    is_delete bit(1)
);

create table contract_detail(
	id int primary key auto_increment,
    contract_id int,
    attach_facility_id int,
    quantity int,
    is_delete bit(1)
);

create table customer_type(
	id int primary key auto_increment,
    name nvarchar(50),
    is_delete bit(1)
);

create table education_degree(
	id int primary key auto_increment,
    name nvarchar(45),
    is_delete bit(1)
);

create table division(
	id int primary key auto_increment,
    name nvarchar(45),
    is_delete bit(1)
);

create table facility(
	id int primary key auto_increment,
    name nvarchar(50),
    area int,
    cost double,
    max_people int,
    foreign key(rent_type_id) references rent_type(id),
    foreign key(facility_type) references facility_type(id),
    standard_room nvarchar(45),
    description_other_convenience nvarchar(45),
    pool_area double,
    number_of_floors int,
    facility_free text,
    is_delete bit(1)
);

create table user(
	user_name nvarchar(255) primary key auto_increment,
    password nvarchar(255),
    is_delete bit(1)
);
    
create table user_role(
	foreign key(role_id) references role(role_id),
    foreign key(user_name) references user(user_name),
    is_delete bit(1)
);

create table customer(
	id int primary key auto_increment,
    foreign key(customer_type_id) references customer_type(id),
    name nvarchar(50),
    gender bit(1),
    date_of_birth nvarchar(50),
    id_card nvarchar(12),
    phone_number nvarchar(12),
    email nvarchar(45),
    address nvarchar(50),
    is_delete bit(1)
);
  
  create table `position`(
	id int primary key auto_increment,
    name nvarchar(45),
    is_delete bit(1)
);

create table attach_facility(
	id int primary key auto_increment,
    name nvarchar(45),
    cost double,
    unit nvarchar(10),
    status nvarchar(45),
    is_delete bit(1)
);

create table contract(
	id int primary key auto_increment,
    start_date datetime,
    end_date datetime,
    deposit double,
    employee_id int,
    foreign key(customer_id) references customer(id),
    foreign key(facility_id) references attach_facility(id),
    is_delete bit(1)
);

create table employee(
	id int primary key auto_increment,
    name nvarchar(50),
    date_of_birth nvarchar(50),
    id_card nvarchar(12),
    salary double,
    phone_number nvarchar(12),
    email nvarchar(45),
    address nvarchar(50),
    foreign key(position_id) references `position`(id),
    foreign key(education_degree_id) references education_degree(id),
    foreign key(division_id) references division(id),
    foreign key(user_name) references user(user_name),
    is_delete bit(1)
);
