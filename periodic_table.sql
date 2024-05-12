alter table properties rename column weight to atomic_mass;
alter table properties rename column melting_point to melting_point_celsius;
alter table properties rename column boiling_point to boiling_point_celsius;
alter table properties alter column melting_point_celsius set not null;
alter table properties alter column boiling_point_celsius set not null;
alter table properties add foreign key(atomic_number) references elements(atomic_number);
alter table properties add column type_id integer not null;
alter table elements add unique(symbol);
alter table elements add unique(name);
alter table elements alter column symbol set not null;
alter table elements alter column name set not null;
create table types(
    type_id integer primary key,
    type varchar not null
);
insert into types values(1,'metal'),(2,'nonmetal'),(3,'metalloid');
UPDATE elements SET symbol=UPPER(LEFT(symbol,1));