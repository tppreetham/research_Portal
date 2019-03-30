create DATABASE resportal;
use resportal;
create TABLE resguide(staffid varchar(100) primary key, gname varchar (100) not null , guname varchar(100) unique not null , gpwd varchar(100) not null, gdept varchar(100) not null);
CREATE table coordinator (staffid varchar(100) PRIMARY key, cname varchar (100) not null, cuname varchar(100) UNIQUE not null, cpwd varchar(100) not null);
CREATE TABLE notification(ntimestamp timestamp PRIMARY KEY, gstaffid varchar(100) not null, content varchar(200), corr varchar(100) not null, cstaffid varchar(100) not null, FOREIGN key (gstaffid) REFERENCES resguide(staffid), FOREIGN key (cstaffid) REFERENCES coordinator(staffid));
create table rscholar(susn varchar(100) PRIMARY key, guideid varchar(100) not null,  rescenter varchar(100) not null, suname varchar(100) UNIQUE not null, spwd varchar(100) not null, sjoindate varchar(100) not null, semail varchar(100) UNIQUE not null, smob varchar(100) UNIQUE not null, sareaofstudy varchar(100));
CREATE table course(courseid varchar(100) primary key, susn varchar(100), cname varchar(100), marks int, foreign key (susn) references rscholar(susn) );
create table phdviva (date varchar(100) primary key, guideid varchar(100) not null, susn varchar(100) not null, approvedornot varchar(100), FOREIGN key (guideid) REFERENCES resguide(staffid), FOREIGN key (susn) REFERENCES rscholar(susn) );
create table edu (susn varchar(100) UNIQUE not null, prevusn varchar(100) PRIMARY key, prevuni varchar(100), prevdeg varchar(100) not null, prevcolj varchar(100) not null, prevpercent int , FOREIGN key (susn) REFERENCES rscholar(susn));
create table personal (adharno varchar(100) PRIMARY key, susn varchar(100) not null UNIQUE, photo varchar(100), dob varchar(100), gender varchar(100) not null, religion varchar(100) not null, spfaname varchar(100) not null, caste varchar(100) not null, subcaste varchar(100) not null, FOREIGN key (susn) REFERENCES rscholar(susn));
create table fee (challanno int(10), susn varchar(100), semester int, amount float(10,2), datefilled date, FOREIGN key (susn) REFERENCES rscholar (susn));

