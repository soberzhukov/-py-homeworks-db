create table if not exists Worker (
	Id serial primary key,
	Name varchar(20) not null,
	Its_boss varchar(20) null 
);

create table if not exists Department(
	Id serial primary key,
	Department_name varchar(30) not null,
	Worker_id integer references Worker(Id)
);