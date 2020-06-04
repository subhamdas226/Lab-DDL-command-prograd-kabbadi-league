-- PROGRESSION - 1


-- 1. **Create table city**
create table city(
id NUMBER (11) not null PRIMARY KEY,
name varchar(50)not null
);
-- 2. **Create table referee**
create table referee(
id NUMBER (11)not null PRIMARY KEY,
name varchar(50)
);
-- 3. **Create table innings**
create table innings(
id NUMBER (11) not null PRIMARY KEY,
innings_number NUMBER(11) NOT NULL
);
-- 4. **Create table extra_type**
create table extra_type(
id number (11) not null primary key,
name varchar(50) not null
);
-- 5. **Create table skill**
create table skill(
id number (11) not null primary key,
name varchar (50) not null
);
-- 6. **Create table team**
create table team(
id number (11) not null primary key,
name varchar (50) not null,
coach varchar (50) not null,
home_city number (11) not null,
captain number(11) not null,
CONSTRAINT fk_team FOREIGN KEY(home_city) REFERENCES city(id)
);
-- 7. **Create table player**
create table player(
id number (11) not null primary key,
Name varchar(50),
country varchar(30) not null,
skills_id number (11) not null,
teams_id number (11)not null,
CONSTRAINT fk_players FOREIGN KEY(skills_id) REFERENCES skill(id),
FOREIGN KEY(teams_id) REFERENCES team(id)
);
-- 8. **Create table venue**
create table venue(
id number (11) not null primary key,
stadium_name varchar (50) not null,
city_id number (11)not null,
CONSTRAINT fk_venue FOREIGN KEY(city_id) REFERENCES city(id)
);
-- 9. **Create table event**
create table event(
id number (11) not null primary key,
innings_id number(11) not null,
event_no number (11) not null,
raider_id number(11) not null,
raid_point number(11) not null,
defending_points NUMBER (11) not null,
clock_in_seconds number (11) not null,
team_one_score number (11) not null,
team_two_score number (11) not null,
CONSTRAINT fk_event FOREIGN KEY(innings_id) REFERENCES innings(id),
FOREIGN KEY(raider_id) REFERENCES player(id)
);

-- 10. **Create table extra_event**
create table extra_event(
id number (11) not null primary key,
event_id number (11) not null,
extra_type_id number (11) not null,
points number (11) not null,
scoring_team_id number (11) not null,
CONSTRAINT fk_extra_event FOREIGN KEY(event_id) REFERENCES event(id),
FOREIGN KEY(extra_type_id) REFERENCES extra_type(id),
FOREIGN KEY(scoring_team_id) REFERENCES team(id)
);

-- 11. **Create table outcome**
create table outcome(
id number (11) not null primary key,
status varchar (100) not null,
winner_team_id number (11),
score number (11),
player_of_match number (11),
CONSTRAINT fk_outcome FOREIGN KEY(winner_team_id) REFERENCES team(id),
FOREIGN KEY(player_of_match) REFERENCES player(id)
);
-- 12. **Create table game**
create table game(
id number (11) not null primary key,
game_data DATE,
team_id_1 number (11)not null,
team_id_2 number (11)not null,
venue_id number (11)not null,
outcome_id number (11)not null,
referee_id_1 number (11)not null,
referee_id_2 number (11)not null,
first_innings_id number (11)not null,
second_innings_id number (11)not null,
CONSTRAINT fk_game FOREIGN KEY(team_id_1) REFERENCES team(id),
FOREIGN KEY(team_id_2) REFERENCES team(id),
FOREIGN KEY(venue_id) REFERENCES venue(id),
FOREIGN KEY(outcome_id) REFERENCES outcome(id),
FOREIGN KEY(referee_id_1) REFERENCES referee(id),
FOREIGN KEY(referee_id_2) REFERENCES referee(id),
FOREIGN KEY(first_innings_id) REFERENCES innings(id),
FOREIGN KEY(second_innings_id) REFERENCES innings(id)
);

-- 13. **Drop table city**
alter table team
drop constraint fk_team;

alter table venue
drop constraint fk_venue;

drop table city;

-- 14. **Drop table innings**
alter table game
drop constraint fk_game;
alter table event
drop constraint fk_event;
Drop table innings;

-- 15. **Drop table skill**
alter table player
drop constraint fk_players;
Drop table skill;

-- 16. **Drop table extra_type**
alter table extra_event
drop constraint fk_extra_event;
Drop table extra_type;

select * from extra_type;

SELECT table_name
  FROM user_tables