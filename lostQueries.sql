--Drop table if exists TOUR
CREATE TABLE TOUR (tour_id int identity primary key,tour_name varchar(35), tour_length int, tour_fee decimal);

--Drop table if exists LOCATIONS
CREATE TABLE LOCATIONS (location_id int identity primary key,
location_name varchar(35), location_type varchar(35), location_description varchar(150));


--Drop table if exists CLIENTS
CREATE TABLE CLIENTS (client_id int identity primary key,
client_name varchar(35), client_telno varchar(35));


--Drop table if exists GUIDE
CREATE TABLE GUIDE (guide_id int identity primary key,
guide_name varchar(35), guide_address varchar(50), guide_date_of_hire date);


--Drop table if exists STOP
CREATE TABLE STOP (tour_id int, location_id int,order_info varchar(50),
primary key (tour_id, location_id), 
foreign key(tour_id) references TOUR (tour_id) on delete cascade, 
foreign key(location_id) references LOCATIONS (location_id) on delete cascade);



--Drop table if exists QUALIFY
CREATE TABLE QUALIFY (tour_id int, guide_id int, QL_Date date, 
primary key (tour_id,guide_id), foreign key (tour_id) references TOUR (tour_id) on delete cascade, 
foreign key (guide_id) references GUIDE (guide_id) on delete cascade);


--Drop table if exists OUTING
CREATE TABLE OUTING (out_id int primary key, out_date date,out_time time,
tour_id int, 
guide_id int, foreign key (tour_id, guide_id) references QUALIFY (tour_id, guide_id) on delete cascade);



--Drop table if exists SIGN_UP
CREATE TABLE SIGN_UP (out_id int, client_id int, 
primary key (out_id, client_id), foreign key (out_id) references OUTING (out_id) on delete cascade, 
foreign key(client_id) references CLIENTS (client_id) on delete cascade);

insert into tour(tour_name,tour_length, tour_fee) values('Atlanta',4,300.00);
insert into tour(tour_name,tour_length, tour_fee) values('Dallas',8,500.00);



insert into locations(location_name,location_type,location_description) 
values('Park Museum','Museum','It is located in downtown');
insert into locations(location_name,location_type,location_description) 
values('Coca Cola factory','Factory','It is located in mobile');



insert into clients(client_name,client_telno) 
values('Niharika','+13457813874');
insert into clients(client_name,client_telno) 
values('Manogna','+16248992413');



insert into guide(guide_name, guide_address, guide_date_of_hire) 
values('RR','31st Ave Hattiesburg MS 39401','12-22-2021');
insert into guide(guide_name, guide_address, guide_date_of_hire) 
values('Wik','30th Ave Hattiesburg MS 39401','08-02-2019');


insert into STOP(tour_id, location_id, order_info)
values (1,1,'Coca Cola factory,Park Museum');


insert into qualify(tour_id, guide_id, QL_date) values(1,1,'12-31-2021');


insert into outing(out_id,out_date,out_time,tour_id,guide_id) values(1101,'01-22-2022','22:00:00',1,1);

insert into sign_up(out_id, client_id) values(1101,1);