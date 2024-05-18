
begin transaction
delete from customer;
insert into customer values(1, '101', 'Rohit', 'Rajasthan', 'Jhunjhunu', 'Pilani',333031,null,'999234533', 'rohit@gmail.com');
insert into customer values(2, '102', 'Prakash', 'Karnataka', 'Hosur', 'Bangalore',200031,null,'981000544', 'prakash@gmail.com');
insert into customer values(3, '103', 'Suresh', 'Rajasthan', 'Jodhpur', 'Jodhpur',350011,null,'981234512', 'suresh@gmail.com');
insert into customer values(4, '104', 'Pooja', 'Rajasthan', 'Jhunjhunu', 'Pilani',333031,null,'981239944', 'pooja@gmail.com');
insert into customer values(5, '105', 'Rashmi', 'Karnataka', 'Hosur', 'Bangalore',200031,null,'981436503', 'rashmi@hotmail.com');
insert into customer values(6, '106', 'Akshay', 'West Bengal', 'Kolkata', 'Kolkata',410060,null,'981134544', 'akshay@yahoo.com');
insert into customer values(7, '107', 'Naveen', 'West Bengal', 'Kolkata', 'Kolkata',410018,null,'980034593', 'naveen@rediffmail.com');
insert into customer values(8, '108', 'Yash', 'Rajasthan', 'Jaipur', 'Jaipur',133030,null,'981234544', 'yash@gmail.com');
insert into customer values(9, '109', 'Yeeshaj', 'Punjab', 'Malwa', 'Jalandhar',233031,null,'981032221', 'yeeshaj@gmail.com');
insert into customer values(10,'110', 'Debanjan', 'West Bengal', 'Kolkata', 'Kolkata',410055,null,'981236677', 'debanjan@gmail.com');
commit transaction

select * from customer;

-- PropertyType table
begin transaction
delete from propertytype;
insert into propertytype values(1, 'Shop',1);
insert into propertytype values(2, 'Office',1);
insert into propertytype values(3, '1-BHK',0);
insert into propertytype values(4, '2-BHK',0);
insert into propertytype values(5, '3-BHK',0);
insert into propertytype values(6, 'Villa',0);
commit transaction

select * from propertytype;

-- Property table
begin transaction
delete from property;
insert into property values (1, 2, 2500, 'Uttar Pradesh','West UP','Noida',122011, 1,6);
insert into property values (2, 6, 4800, 'Uttar Pradesh','East UP','Prayagraj',123055,1, 12);
insert into property values (3, 3, 1200, 'Rajasthan','Jhunjhunu','Pilani',333031, 1,4);
insert into property values (4, 3, 1400, 'Rajasthan','Jhunjhunu','Pilani',333031,1,5);
insert into property values (5, 3, 1500, 'Karnataka','Hosur','Bangalore', 200048,1,5);
insert into property values (6, 4, 1800, 'Rajasthan','Jhunjhunu','Pilani',333031,1,6);
insert into property values (7, 4, 1800, 'Rajasthan','Jhunjhunu','Pilani',333031,1,6);
insert into property values (8, 5, 2450, 'West Bengal','Kolkata','Kolkata',411010,1,9);
insert into property values (9, 5, 2600, 'Punjab','Malwa','Jalandhar',245611,1,10);
insert into property values (10,5, 2600, 'Punjab','Malwa','Ludhiana',245644,1,10);
insert into property values (11,2, 100, 'Rajasthan','Churu','Ratangarh',331022,1,2);
insert into property values (12,2, 100, 'Rajasthan','Churu','Chhapar',3315021,1,2);
insert into property values (13,1, 500, 'Rajasthan','Churu','Bidasar',3315011,1,3);
insert into property values (14,3, 100, 'Rajasthan','Churu','Ratannagar',331021,1,2);
insert into property values (15,5, 300, 'Rajasthan','Churu','Ratannagar',331021,1,4);
insert into property values (16, 2, 300, 'Rajasthan','Jhunjhunu','Vidyavihar',333031,1,4);
insert into property values (17,4, 3000, 'Rajasthan','Jhunjhunu','Chirawa',333026,1,12);
insert into property values (18,4, 3000, 'Rajasthan','Jhunjhunu','Chirawa',	333023,1,12);
insert into property values (19,4, 1200, 'Rajasthan','Jaipur','Jaipur',331024,2,18);
commit transaction

select * from property;

-- Agent table
begin transaction
delete from agent;
insert into agent values(1, 'A101', 'Priyansh',2 ,null,98020011,'priyansh@gmail.com');
insert into agent values(2, 'A102', 'Kailash', 4,null,98220022,'kailash@rediffmail.com');
insert into agent values(3, 'A103', 'Pratyut', 6,null,98110066,'pratyut@gmail.com');
insert into agent values(4, 'B101', 'Megha', 1,null,98120056,'megha@yahoo.com');
insert into agent values(5, 'B102', 'Rakesh', 1,null,88110033,'rakesh@hotmail.com');
commit transaction

select * from agent;

-- PaymentType table
begin transaction
delete from paymenttype;
insert into paymenttype values(1, 'Lump Sum');
insert into paymenttype values(2, 'EMI Monthly');
insert into paymenttype values(3, 'EMI Quarterly');
commit transaction
select * from paymenttype;

-- Time table

-- Let's put 5 year data in the Time dimension table
-- from 2016 to 2020.
begin transaction
delete from time;
declare @date int = 1;
declare @month int = 1;
declare @year int = 2016;
declare @maxdate int = 31;
declare @timepk int = 1;

while @year <= 2020
begin
   set @month = 1;

   while @month <= 12
   begin
     set @date = 1;

	 -- No of days in a month varies as per month.
	 if (@month = 4) or (@month = 6) or (@month = 9) or (@month = 11)
		set @maxdate = 30;
	 else if (@month = 2)
	    if (@year%4 = 0)  -- check for leap year
			set @maxdate = 29;
		else
			set @maxdate = 28;
	 else
		set @maxdate = 31;

	 while @date <= @maxdate
	 begin
	   -- Now insert the record into Time dimension table.
	   insert into time values(@timepk,@date,@month,@year);

	   -- Increment the primary key for the next insert
	   set @timepk = @timepk + 1;

	   set @date = @date + 1;
	 end;

     set @month = @month + 1;
   end;

   set @year = @year + 1;
end;

commit transaction

select * from time;

-- Now let's populate all the Fact tables.

-- Sale fact table
begin transaction
delete from sale;
insert into sale values(1,7,3,8,4,1811,2,5512100,5000,8000,4.0,4.0);
insert into sale values(2,1,4,5,2,1801,2,6612100,7000,4000,5.0,5.0);
insert into sale values(3,4,7,2,5,1854,1,7512100,9000,2000,3.0,2.0);
insert into sale values(4,4,4,1,1,1839,1,112100,7000,8000,2,4.0);
insert into sale values(5,10,6,9,1,1844,3,2512100,6000,6000,3,5);
insert into sale values(6,2,2,1,3,1782,3,3412100,7000,7000,4,3);
insert into sale values(7,6,7,4,2,1822,1,212100,8000,6000,1,2);
insert into sale values(8,9,2,10,2,1860,2,8512100,50000,40000,1,2);
insert into sale values(9,7,5,1,5,1889,2,9112100,30000,30000,4,5);
insert into sale values(10,5,4,3,5,1837,2,6612100,6000,8000,3,4);
insert into sale values(11,3,2,6,1,1827,3,7712100,6000,6000,4,4);
insert into sale values(12,6,9,3,3,1827,3,9912100,20000,20000,5,5);
insert into sale values(13,6,4,7,3,1800,3,2312100,25000,25000,5,3);
insert into sale values(14,8,2,10,5,1809,1,4912100,25000,30000,4,4);
insert into sale values(15,2,5,7,5,1824,2,3312100,25000,20000,3,3);
insert into sale values(16,8,8,3,2,1870,1,6612100,15000,15000,4,4);
insert into sale values(17,10,7,2,2,1800,1,8812100,5000,5000,4,4);
insert into sale values(18,8,4,2,3,1799,3,2512100,5000,2000,5,3);
insert into sale values(19,3,5,3,4,1810,1,7512100,15000,10000,3,4);
insert into sale values(20,6,9,3,4,1809,2,6512100,15000,20000,3,3);
insert into sale values(21,11,1,3,5,1811,2,7512100,15000,20000,5,2);
insert into sale values(22,12,8,3,4,1812,3,6512100,15000,20000,5,3);
insert into sale values(23,13,4,8,5,1813,2,7512100,15000,20000,5,3);
insert into sale values(24,14,3,1,4,1814,3,8512100,15000,20000,5,3);
insert into sale values(25,15,1,8,5,1815,1,6512100,15000,20000,4,1);
insert into sale values(26,16,4,3,5,1816,1,1512100,15000,20000,5,5);
insert into sale values(27,17,9,4,5,1819,1,6512100,15000,20000,3,3);
insert into sale values(28,18,4,1,4,1800,3,7512100,15000,20000,5,4);
insert into sale values(29,19,4,2,4,1800,3,9512100,15000,20000,4,5);
commit transaction
select * from sale;

-- Rental fact table
begin transaction
delete from rental;
insert into rental values(1,8,4,7,3,1032,20000,11,20000,5000,0,4,4);
insert into rental values(2,9,1,6,5,835,10000,11,10000,10000,1000,5,5);
insert into rental values(3,2,4,5,1,112,25000,11,10000,6000,0,3,5);
insert into rental values(4,3,5,8,3,1788,22000,22,11000,2000,0,3,4);
insert into rental values(5,6,6,2,3,511,4000,11,8000,3000,0,4,2);
insert into rental values(6,2,6,10,2,968,25000,11,25000,4500,0,4,5);
insert into rental values(7,1,10,4,2,18,18000,11,18000,10000,2500,5,4);
insert into rental values(8,10,1,2,4,1810,10000,11,10000,10000,0,5,3);
insert into rental values(9,5,6,1,1,1456,15000,22,30000,7000,0,5,5);
insert into rental values(10,7,5,8,5,981,10000,11,10000,5000,0,1,2);
insert into rental values(11,6,4,9,1,667,9000,22,4500,8000,0,2,2);
insert into rental values(12,1,1,10,1,1001,10000,11,10000,4000,0,2,5);
insert into rental values(13,3,4,5,4,772,15000,22,30000,6000,2000,3,3);
insert into rental values(14,9,1,5,5,848,8000,11,4000,5000,5000,4,4);
insert into rental values(15,7,3,8,5,1235,5000,11,5000,5000,0,4,5);
insert into rental values(16,7,10,7,1,1488,10000,11,10000,6000,0,3,2);
insert into rental values(17,6,3,8,2,980,20000,11,10000,7500,0,1,1);
insert into rental values(18,3,5,9,3,786,10000,11,20000,10000,0,4,2);
insert into rental values(19,8,8,3,4,440,50000,22,25000,12000,6000,3,4);
insert into rental values(20,10,1,2,1,222,8000,22,8000,15000,0,3,3);
commit transaction
select * from rental;

-- Quotation fact table
begin transaction
delete from quotation;
insert into quotation values(1,5,3,2,1805,1,11585000);
insert into quotation values(2,7,5,4,840,1,10585000);
insert into quotation values(3,2,7,5,288,1,9350000);
insert into quotation values(4,8,6,1,1648,1,9560000);
insert into quotation values(5,10,1,1,1712,1,9585000);
insert into quotation values(6,1,2,3,678,1,9876500);
insert into quotation values(7,4,7,3,1055,1,9775000);
insert into quotation values(8,5,6,1,1200,1,9666000);
insert into quotation values(9,9,1,4,445,1,9456000);
insert into quotation values(10,3,5,5,955,1,9789000);
insert into quotation values(11,6,9,1,205,1,9445000);
insert into quotation values(12,6,7,2,79,1,9234000);
insert into quotation values(13,8,4,3,28,1,9456000);
insert into quotation values(14,8,8,3,1751,1,9880000);
insert into quotation values(15,9,5,2,1192,1,9228000);
insert into quotation values(16,7,6,5,288,1,9335000);
insert into quotation values(17,1,7,2,772,1,11772000);
insert into quotation values(18,2,2,3,1288,1,9320000);
insert into quotation values(19,10,9,4,1361,1,12500000);
insert into quotation values(20,8,8,4,1798,1,12680000);
insert into quotation values(21,11,3,4,1799,0,15000);
insert into quotation values(22,12,3,5,1800,0,20000);
insert into quotation values(23,13,3,4,1801,0,20000);
insert into quotation values(24,14,3,5,1802,0,15000);
insert into quotation values(25,15,3,4,1803,0,20000);
insert into quotation values(26,16,3,5,1804,0,15000);
insert into quotation values(27,17,3,4,1805,0,20000);
insert into quotation values(28,18,3,5,1806,0,15000);
insert into quotation values(29,19,3,4,1807,0,20000);
insert into quotation values(30,19,1,3,1782,2,NULL);
insert into quotation values(31,17,4,5,1800,2,NULL);
commit transaction
select * from quotation;


-- Office table
begin transaction
delete from office;
insert into office values(1,'Real Estate Company Pilani', 'Rajasthan', 'Jhunjhunu', 'Pilani', 333031, '01596-222333','pilani@realestatecompany.com');
insert into office values(2,'Real Estate Company Karnataka', 'Karnataka', 'Hosur', 'Bangalore', 200055, '080-44222311','bangalore@realestatecompany.com');
insert into office values(3,'Real Estate Company Ludhiana', 'Punjab','Malwa','Ludhiana',245640, '0161-55222300','ludhiana@realestatecompany.com');
insert into office values(4,'Real Estate Company Jalandhar', 'Punjab', 'Malwa', 'Jalandhar',233030, '0181-34222355','jalandhar@realestatecompany.com');
insert into office values(5,'Real Estate Company Jaipur', 'Rajasthan', 'Jaipur', 'Jaipur',133035, '0141-50222350','jaipur@realestatecompany.com');
insert into office values(6,'Real Estate Company Kolkata', 'West Bengal', 'Kolkata', 'Kolkata',410050, '033-66622399','kolkata@realestatecompany.com');
commit transaction
select * from office;