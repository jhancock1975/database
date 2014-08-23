# create database SuppliersAndParts;
# use SuppliersAndParts;
create table S (snum varchar(255) not null, sname varchar(255),  status int,  city varchar(255), primary key(snum));
create table P (pnum varchar(255) not null, pname varchar(255), color varchar(255), weight int, city varchar(255), primary key(pnum));
create table J (jnum varchar(255) not null, jname varchar(255), city varchar(255), primary key(jnum));
create table SPJ (snum varchar(255), pnum varchar(255), jnum varchar(255), qty int, 
	primary key(snum,pnum,jnum), foreign key(snum) references S, foreign key(pnum) references P, foreign key(jnum) references J);
create table SP (snum varchar(255), pnum varchar(255), qty int, primary key (snum,pnum), foreign key(snum) references S, foreign key(pnum) references P);
insert into S values
('S1',  'Smith',  '20',  'London' ),
('S2',  'Jones',  '10',  'Paris' ),
('S3',  'Blake',  '30',  'Paris' ),
('S4',  'Clark',  '20',  'London' ),
('S5',  'Adams',  '30',  'Athens' );

insert into P values
('P1',  'Nut',  'Red',  '12',  'London' ),
('P2',  'Bolt',  'Green',  '17',  'Paris' ),
('P3',  'Screw',  'Blue',  '17',  'Rome' ),
('P4',  'Screw',  'Red',  '14',  'London' ),
('P5',  'Cam',  'Blue',  '12',  'Paris' ),
('P6',  'Cog',  'Red',  '19',  'London' );

insert into J values
('J1',  'Sorter',  'Paris' ),
('J2',  'Punch',  'Rome' ),
('J3',  'Reader',  'Athens' ),
('J4',  'Console',  'Athens' ),
('J5',  'Collator',  'London' ),
('J6',  'Terminal',  'Oslo' ),
('J7',  'Tape',  'London' );

insert into SPJ values
('S1',  'P1',  'J1',  '200' ),
('S1',  'P1',  'J4',  '700' ),
('S2',  'P3',  'J1',  '400' ),
('S2',  'P3',  'J2',  '200' ),
('S2',  'P3',  'J3',  '200' ),
('S2',  'P3',  'J4',  '500' ),
('S2',  'P3',  'J5',  '600' ),
('S2',  'P3',  'J6',  '400' ),
('S2',  'P3',  'J7',  '800' ),
('S2',  'P5',  'J2',  '100' ),
('S3',  'P3',  'J1',  '200' ),
('S3',  'P4',  'J2',  '500' ),
('S4',  'P6',  'J3',  '300' ),
('S4',  'P6',  'J7',  '300' ),
('S5',  'P2',  'J2',  '200' ),
('S5',  'P2',  'J4',  '100' ),
('S5',  'P5',  'J5',  '500' ),
('S5',  'P5',  'J7',  '100' ),
('S5',  'P6',  'J2',  '200' ),
('S5',  'P1',  'J4',  '100' ),
('S5',  'P3',  'J4',  '200' ),
('S5',  'P4',  'J4',  '800' ),
('S5',  'P5',  'J4',  '400' ),
('S5',  'P6',  'J4',  '500' );


create view GOOD_SUPPLIERS as select snum, status, city from S where status > 15;

insert into SP values
('S1', 'P1', '300'),
('S1', 'P2', '200'),
('S1', 'P3', '400'),
('S1', 'P4', '200'),
('S1', 'P5', '100'),
('S1', 'P6', '100'),
('S2', 'P1', '300'),
('S2', 'P2', '400'),
('S3', 'P2', '200'),
('S4', 'P2', '200'),
('S4', 'P4', '300'),
('S4', 'P5', '400');
