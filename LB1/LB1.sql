CREATE TYPE security_levels AS ENUM ('надежно', 'ненадежно');
CREATE TYPE type_enum AS ENUM('животное', 'человек');

CREATE TABLE  terrain(
id SERIAL PRIMARY KEY,
name VARCHAR(80) UNIQUE NOT NULL,
security security_levels NOT NULL
);

CREATE TABLE  condition(
id SERIAL PRIMARY KEY,
condition_name VARCHAR(80) NOT NULL
);

CREATE TABLE  terrain_condition(
id SERIAL PRIMARY KEY,
terrain_id INT REFERENCES terrain (id),
condition_id INT REFERENCES condition (id)
);

CREATE TABLE entity(
id SERIAL PRIMARY KEY,
location_id INT REFERENCES terrain (id),
name VARCHAR(80) UNIQUE NOT NULL,
type type_enum NOT NULL,
entity_2 INT REFERENCES entity (id),
relationship VARCHAR(80) NOT NULL,
CHECK (entity.entity_2 != id)
);
CREATE TABLE actions(
id SERIAL PRIMARY KEY,
action_name VARCHAR(80) NOT NULL
);
CREATE TABLE actions_of_entities(
id SERIAL PRIMARY KEY,
entity_id INT REFERENCES entity(id),
action_id INT REFERENCES actions(id)
);

CREATE TABLE objects(
id SERIAL PRIMARY KEY,
location_id INT REFERENCES terrain (id),
name VARCHAR(80) NOT NULL
);
INSERT INTO terrain(name, security) VALUES ('валуны', 'ненадежно'),
                                           ('холм', 'ненадежно'),
                                           ('дорога', 'ненадежно');
INSERT INTO condition(condition_name) VALUES ('мокро'), ('грязно'), ('скользко');
INSERT INTO terrain_condition(terrain_id, condition_id) VALUES (1, 1), (2, 2);
INSERT INTO entity(location_id, name, type, entity_2, relationship) VALUES (2, 'Эд Реджис', 'человек', 2, 'испуг'),
                                                   (3, 'Динозавр', 'животное', 1, 'агрессия');

INSERT INTO actions(action_name) VALUES ('вскочить'),
                                                 ('утереться'),
                                                 ('прятаться'),
                                                 ('понимать'),
                                                 ('охватиться ужасом'),
                                                 ('не мочь рассуждать'),
                                                 ('шлепнуться'),
                                                 ('пытаться взять себя в руки'),
                                                 ('стоять'),
                                                 ('идти');
INSERT INTO actions_of_entities(entity_id, action_id) VALUES (1, 1), (1, 2),
                                                             (1, 3), (1, 4),
                                                             (1, 5), (1, 6),
                                                             (1, 7), (1, 8),
                                                             (2, 9), (2,10);
INSERT INTO objects(location_id, name) VALUES (3, 'машина');
select * from terrain_condition WHERE condition_id = 1;
select * from terrain;
select * from condition;
select * from terrain_condition;
select * from entity;
select * from objects;
select * from actions;
select * from actions_of_entities;

