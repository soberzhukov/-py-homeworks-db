create table if not exists Genre (
	Id serial primary key,
	Name varchar(20) not null unique
);

create table if not exists Music_group(
	Id serial primary key,
	Name varchar(30) not null,
	Genre_id integer references Genre(Id)
);

create table if not exists Album (
	Id serial primary key,
	Name varchar(30) not null,
	Date date null,
	Group_id integer references Music_group(Id)
);

create table if not exists Track (
	Id serial primary key,
	Name varchar(30) not null,
	Duration integer not null check(Duration > 0),
	Album_id integer references Album(Id)
);
