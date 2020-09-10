
CREATE TABLE employees(
SIN_num integer PRIMARY KEY, 
job VARCHAR(10),
name VARCHAR(20),
address VARCHAR(40),
phone_num VARCHAR(20),
salary VARCHAR(20),
specify VARCHAR(40),
expert VARCHAR(20),
date_of_exam DATE);

CREATE TABLE the_union (
SIN_num integer,
FOREIGN KEY (SIN_num) REFERENCES employee(SIN_num),

union_num integer PRIMARY KEY,
type VARCHAR(20) 
);

INSERT INTO the_union VALUES
('10001','1','Technician'),
('10002','2','Technician'),('10003','3','Technician'),('10004','4','Guide'),('10005','5','Guide');


CREATE TABLE technicians(
SIN_num integer PRIMARY KEY,
FOREIGN KEY (SIN_num) REFERENCES the_union(SIN_num),
name VARCHAR(20),
address VARCHAR(20),
phone_num VARCHAR(20),
salary VARCHAR(20),
specify VARCHAR(20),
expert VARCHAR(20),
);

INSERT INTO technicians VALUES
('10001','Amy','1075 W PenderSt','778-926-2333','CAD$5000’,’conservationist','gold'),
('10002','Bob','355 W Queens Rd','607-6223-5549','CAD$5000','restorer','clay'),
('10003','Candy','250-13450 102 Ave','607-9995-3269','CAD$8000','restorer & conservationist','bronze & gold');

 
CREATE TABLE guides(
SIN_num integer PRIMARY KEY,
FOREIGN KEY (SIN_num) REFERENCES the_union(SIN_num),            
name VARCHAR(20),
address VARCHAR(20),
phone_num VARCHAR(20),
salary VARCHAR(20),
date_of_exam DATE 
);

INSERT INTO guides VALUES ('10004', 'Doney', '8888 University Dr','607-8888-8888','CAD$ 2000','2018-12-8'), ('10005','Emma','7456 Pandora Dr','778-6666-5566','CAD$ 2000','2018-12-7');

CREATE TABLE historic(
arti_num VARCHAR(20) PRIMARY KEY,
dimensions VARCHAR(20),
weight VARCHAR(20),
material VARCHAR(20),
humidity VARCHAR(20)      
);

INSERT INTO historic VALUES('DC001','10.6 m^3','11.9 kg’,’clay','45%');

INSERT INTO historic VALUES
('DC002','5.6 m^3','20.8 kg','gold','45%');




CREATE TABLE test(
test_num integer PRIMARY KEY,
name VARCHAR(20),    
max_score integer
);
INSERT INTO test VALUES
('101','Clay test','100'),
('102','Gold test','100'), 
('103','Bronze test','100');

CREATE TABLE test_event(
test_event_num integer PRIMARY KEY,
test_num integer REFERENCES test(test_num),
date DATE,
hours integer,
score integer
);
INSERT INTO test_event VALUES
('601','101','2018-12-06','2','81'),
('602','101','2018-12-12','2','96'),
('603','102','2018-11-08','3','87'),
('604','102','2018-11-20','3','99'),
('605','103','2018-10-02','2','100');

