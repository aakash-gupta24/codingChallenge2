if not exists (select name from sys.databases where name='LoanManagementSystem')
	begin
		create database  LoanManagementSystem;
	end;
else
	begin
		print 'LoanManagementSystem Databse already exists';
	end;

use LoanManagementSystem;



if not exists (select name from sys.tables where name='loginCustomer')
begin

create table loginCustomer(customer_id int primary key identity(1,1),name varchar(100) not null,
email varchar(100) not null unique check (email like '%_@_%._%'),password varchar(50) not null 
check (LEN(password)>=8));

end;
else 
begin 
print 'loginCustomer Table already exists'
end;




if not exists (select name from sys.tables where name='Customer')
begin

create table Customer(customer_id int primary key identity(1,1),name varchar(50) not null, 
email_address varchar(50) unique not null,phone_number varchar(15) not null,address varchar(300) not null, 
creditscore int not null,check (email_address like '%@%.%'));

end;
else 
begin 
print 'Customer Table already exists'
end;




if not exists (select name from sys.tables where name='Loan')
begin

create table Loan(loan_id int primary key identity(1,1),customer_id int not null,principal_amount float not null,
interest_rate float not null,loan_term int not null,loan_type varchar(50) not null,loan_status varchar(20) not null,
foreign key (customer_id) references Customer(customer_id),check (loan_type in ('Car Loan','Home Loan')),
check (loan_status in ('Pending','Approved','Rejected')));

end;
else 
begin 
print 'Loan Table already exists'
end;



drop table loan;
drop table Customer;
drop table loginCustomer;

select * from loginCustomer;
select * from Customer;
select * from Loan;