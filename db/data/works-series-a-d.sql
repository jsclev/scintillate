-- A
insert into series (name, genre) values ('All Clear', 'Science Fiction');
insert into work_series (work_id, series_id, ordinal, ordinal_name) values (
    (select id from work where title = 'Blackout' and image_name = 'blackout2'),
    (select id from series where name = 'All Clear'),
    1,
    'Book 1'
);
insert into work_series (work_id, series_id, ordinal, ordinal_name) values (
    (select id from work where title = 'All Clear'),
    (select id from series where name = 'All Clear'),
    2,
    'Book 2'
);

insert into series (name, genre) values ('Arbai', 'Science Fiction');
insert into work_series (work_id, series_id, ordinal, ordinal_name) values (
    (select id from work where title = 'Grass'),
    (select id from series where name = 'Arbai'),
    1,
    'Book 1'
);

insert into series (name, genre) values ('Aton', 'Science Fiction');
insert into work_series (work_id, series_id, ordinal, ordinal_name) values (
    (select id from work where title = 'Chthon'),
    (select id from series where name = 'Aton'),
    1,
    'Book 1'
);

-- B
insert into series (name, genre) values ('Bas-Lag', 'Science Fiction');
insert into work_series (work_id, series_id, ordinal, ordinal_name) values (
    (select id from work where title = 'Perdido Street Station'),
    (select id from series where name = 'Bas-Lag'),
    1,
    'Book 1'
);
insert into work_series (work_id, series_id, ordinal, ordinal_name) values (
    (select id from work where title = 'The Scar'),
    (select id from series where name = 'Bas-Lag'),
    2,
    'Book 2'
);
insert into work_series (work_id, series_id, ordinal, ordinal_name) values (
    (select id from work where title = 'Iron Council'),
    (select id from series where name = 'Bas-Lag'),
    3,
    'Book 3'
);

insert into series (name, genre) values ('Beggars Trilogy', 'Science Fiction');
insert into work_series (work_id, series_id, ordinal, ordinal_name) values (
    (select id from work where title = 'Beggars in Spain'),
    (select id from series where name = 'Beggars Trilogy'),
    2,
    'Book 2'
);
insert into work_series (work_id, series_id, ordinal, ordinal_name) values (
    (select id from work where title = 'Beggars and Choosers'),
    (select id from series where name = 'Beggars Trilogy'),
    2,
    'Book 2'
);

insert into series (name, genre) values ('Between Earth and Sky', 'Science Fiction');
insert into work_series (work_id, series_id, ordinal, ordinal_name) values (
    (select id from work where title = 'Black Sun'),
    (select id from series where name = 'Between Earth and Sky'),
    1,
    'Book 1 of 2'
);

insert into series (name, genre) values ('Black Dragon', 'Science Fiction');
insert into work_series (work_id, series_id, ordinal, ordinal_name) values (
    (select id from work where title = 'Tea with the Black Dragon'),
    (select id from series where name = 'Black Dragon'),
    1,
    'Book 1'
);

insert into series (name, genre) values ('The Book of the New Sun', 'Science Fiction');
insert into work_series (work_id, series_id, ordinal, ordinal_name) values (
    (select id from work where title = 'The Sword of the Lictor'),
    (select id from series where name = 'The Book of the New Sun'),
    3,
    'Book 3'
);

insert into series (name, genre) values ('Bridge Trilogy', 'Science Fiction');
insert into work_series (work_id, series_id, ordinal, ordinal_name) values (
    (select id from work where title = 'Virtual Light'),
    (select id from series where name = 'Bridge Trilogy'),
    1,
    'Book 1'
);

insert into series (name, genre) values ('The Broken Earth', 'Science Fiction');
insert into work_series (work_id, series_id, ordinal, ordinal_name) values (
    (select id from work where title = 'The Fifth Season'),
    (select id from series where name = 'The Broken Earth'),
    1,
    'Book 1'
);
insert into work_series (work_id, series_id, ordinal, ordinal_name) values (
    (select id from work where title = 'The Obelisk Gate'),
    (select id from series where name = 'The Broken Earth'),
    2,
    'Book 2'
);
insert into work_series (work_id, series_id, ordinal, ordinal_name) values (
    (select id from work where title = 'The Stone Sky'),
    (select id from series where name = 'The Broken Earth'),
    3,
    'Book 3'
);

insert into series (name, genre) values ('The Budayeen Cycle', 'Science Fiction');
insert into work_series (work_id, series_id, ordinal, ordinal_name) values (
    (select id from work where title = 'When Gravity Fails'),
    (select id from series where name = 'The Budayeen Cycle'),
    1,
    'Book 1'
);
insert into work_series (work_id, series_id, ordinal, ordinal_name) values (
    (select id from work where title = 'A Fire in the Sun'),
    (select id from series where name = 'The Budayeen Cycle'),
    2,
    'Book 2'
);

-- C
insert into series (name, genre) values ('Chalion', 'Science Fiction');
insert into work_series (work_id, series_id, ordinal, ordinal_name) values (
    (select id from work where title = 'The Curse of Chalion'),
    (select id from series where name = 'Chalion'),
    1,
    'Book 1'
);
insert into work_series (work_id, series_id, ordinal, ordinal_name) values (
    (select id from work where title = 'Paladin of Souls'),
    (select id from series where name = 'Chalion'),
    2,
    'Book 2'
);

insert into series (name, genre) values ('Chanur', 'Science Fiction');
insert into work_series (work_id, series_id, ordinal, ordinal_name) values (
    (select id from work where title = 'The Pride of Chanur'),
    (select id from series where name = 'Chanur'),
    1,
    'Book 1'
);

insert into series (name, genre) values ('Childe Cycle', 'Science Fiction');
insert into work_series (work_id, series_id, ordinal, ordinal_name) values (
    (select id from work where title = 'Dorsai!'),
    (select id from series where name = 'Childe Cycle'),
    1,
    'Book 1'
);

insert into series (name, genre) values ('The Clockwork Century', 'Science Fiction');
insert into work_series (work_id, series_id, ordinal, ordinal_name) values (
    (select id from work where title = 'Boneshaker'),
    (select id from series where name = 'The Clockwork Century'),
    1,
    'Book 1'
);

insert into series (name, genre) values ('Crescent Moon Kingdoms', 'Science Fiction');
insert into work_series (work_id, series_id, ordinal, ordinal_name) values (
    (select id from work where title = 'Throne of the Crescent Moon'),
    (select id from series where name = 'Crescent Moon Kingdoms'),
    1,
    'Book 1'
);

insert into series (name, genre) values ('Company Wars', 'Science Fiction');
insert into work_series (work_id, series_id, ordinal, ordinal_name) values (
    (select id from work where title = 'Downbelow Station'),
    (select id from series where name = 'Company Wars'),
    1,
    'Book 1'
);

-- D
insert into series (name, genre) values ('Darkover series', 'Science Fiction');
insert into work_series (work_id, series_id, ordinal, ordinal_name) values (
    (select id from work where title = 'The Forbidden Tower'),
    (select id from series where name = 'Darkover series'),
    4,
    'Book 4'
);
insert into work_series (work_id, series_id, ordinal, ordinal_name) values (
    (select id from work where title = 'The Sword of Aldones'),
    (select id from series where name = 'Darkover series'),
    20,
    'Book 20'
);

insert into series (name, genre) values ('Darwin''s Radio', 'Science Fiction');
insert into work_series (work_id, series_id, ordinal, ordinal_name) values (
    (select id from work where title = 'Darwin''s Radio'),
    (select id from series where name = 'Darwin''s Radio'),
    2,
    'Book 2'
);

insert into series (name, genre) values ('Deathworld', 'Science Fiction');
insert into work_series (work_id, series_id, ordinal, ordinal_name) values (
    (select id from work where title = 'Deathworld'),
    (select id from series where name = 'Deathworld'),
    2,
    'Book 2'
);

insert into series (name, genre) values ('Dresden Files', 'Science Fiction');
insert into work_series (work_id, series_id, ordinal, ordinal_name) values (
    (select id from work where title = 'Skin Game'),
    (select id from series where name = 'Dresden Files'),
    15,
    'Book 15'
);

insert into series (name, genre) values ('Dune', 'Science Fiction');
insert into work_series (work_id, series_id, ordinal, ordinal_name) values (
    (select id from work where title = 'Dune'),
    (select id from series where name = 'Dune'),
    1,
    'Book 1'
);
insert into work_series (work_id, series_id, ordinal, ordinal_name) values (
    (select id from work where title = 'Dune World'),
    (select id from series where name = 'Dune'),
    1,
    'Book 1'
);
insert into work_series (work_id, series_id, ordinal, ordinal_name) values (
    (select id from work where title = 'Children of Dune'),
    (select id from series where name = 'Dune'),
    3,
    'Book 3'
);
