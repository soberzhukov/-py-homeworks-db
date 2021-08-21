create table if not exists Genre (
	Id serial primary key,
	Name varchar(20) not null unique
);

create table if not exists Music_group (
	Id serial primary key,
	Name varchar(30) not null
);

create table if not exists GenreGroup (
	genre_id integer references Genre(id),
	group_id integer references Music_group(id),
	constraint pk_GenreGroup primary key (genre_id, group_id)
);

create table if not exists Album (
	Id serial primary key,
	Name varchar(30) not null,
	Date date null
);

create table if not exists GroupAlbum (
	group_id integer references Music_group(id),
	album_id integer references Album(id),
	constraint pk_GroupAlbum primary key (group_id, album_id)
);

create table if not exists Track (
	Id serial primary key,
	Name varchar(30) not null,
	Duration integer not null check(Duration > 0),
	Album_id integer references Album(Id),
	unique(Id, album_id)
);

create table if not exists Collection (
	Id serial primary key,
	Name varchar(30) not null,
	Date date null
);

create table if not exists TrackCollection (
	collection_id integer references Collection(id),
	track_id integer references Track(id),
	constraint pk_TrackCollection primary key (collection_id, track_id)
);

