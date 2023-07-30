CREATE TABLE IF NOT EXISTS Genres (
	id SERIAL PRIMARY KEY,
	name VARCHAR(30) NOT NULL
);

CREATE TABLE IF NOT EXISTS Artists (
	id SERIAL PRIMARY KEY,
	name VARCHAR(40) NOT NULL
);

CREATE TABLE IF NOT EXISTS GenresArtists (
	Genre_id INTEGER REFERENCES Genres(id),
	Artist_id INTEGER REFERENCES Artists(id),
	CONSTRAINT pk_GenresArtists PRIMARY KEY (Genre_id, Artist_id)
);


CREATE TABLE IF NOT EXISTS Albums (
	id SERIAL PRIMARY KEY,
	name VARCHAR(40) unique NOT NULL,
	Year INTEGER CHECK (Year > 1930 and Year < 2030)
);


CREATE TABLE IF NOT EXISTS ArtistsAlbums (
	Album_id INTEGER REFERENCES Albums(id),
	Artist_id INTEGER REFERENCES Artists(id),
	CONSTRAINT pk_BandAlbum PRIMARY KEY (Album_id, Artist_id)
);


CREATE TABLE IF NOT EXISTS Tracks (
	id SERIAL PRIMARY KEY,
	Album_id INTEGER REFERENCES Albums(id),
	name VARCHAR(80) NOT NULL,
	Duration INTEGER NOT NULL CHECK (Duration > 0),
	CONSTRAINT pk_Tracks UNIQUE (Name, Album_id)
);

CREATE TABLE IF NOT EXISTS Compilations (
	id SERIAL PRIMARY KEY,
	name VARCHAR(40) unique NOT NULL,
	Year INTEGER CHECK (Year > 1930 and Year < 2030)
);

CREATE TABLE IF NOT EXISTS CompailationsTracks (
    Compilation_id INTEGER REFERENCES Compilations(id),
	Track_id INTEGER REFERENCES Tracks(id),
	CONSTRAINT pk_CompilationsTracks PRIMARY KEY (Compilation_id, Track_id)
);