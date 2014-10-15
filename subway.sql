CREATE TABLE stations (
 id CHAR(10) NOT NULL,
 name CHAR(10)
);

ALTER TABLE stations ADD CONSTRAINT PK_stations PRIMARY KEY (id);


CREATE TABLE subways (
 id CHAR(10) NOT NULL,
 name CHAR(10)
);

ALTER TABLE subways ADD CONSTRAINT PK_subways PRIMARY KEY (id);


CREATE TABLE transfer_infos (
 id CHAR(10) NOT NULL,
 subway_id CHAR(10),
 station_id CHAR(10)
);

ALTER TABLE transfer_infos ADD CONSTRAINT PK_transfer_infos PRIMARY KEY (id);


CREATE TABLE station_infos (
 id CHAR(10) NOT NULL,
 subway_id CHAR(10),
 station_id CHAR(10),
 station_order CHAR(10),
 distance CHAR(10)
);

ALTER TABLE station_infos ADD CONSTRAINT PK_station_infos PRIMARY KEY (id);


ALTER TABLE transfer_infos ADD CONSTRAINT FK_transfer_infos_0 FOREIGN KEY (subway_id) REFERENCES subways (id);
ALTER TABLE transfer_infos ADD CONSTRAINT FK_transfer_infos_1 FOREIGN KEY (station_id) REFERENCES stations (id);


ALTER TABLE station_infos ADD CONSTRAINT FK_station_infos_0 FOREIGN KEY (subway_id) REFERENCES subways (id);
ALTER TABLE station_infos ADD CONSTRAINT FK_station_infos_1 FOREIGN KEY (station_id) REFERENCES stations (id);


INSERT INTO subways(id,name) VALUES(1,"銀座線");
INSERT INTO subways(id,name) VALUES(2,"丸の内線");
INSERT INTO subways(id,name) VALUES(3,"半蔵門線");

INSERT INTO stations(id,name) VALUES(1,"渋谷");
INSERT INTO stations(id,name) VALUES(2,"表参道");
INSERT INTO stations(id,name) VALUES(3,"赤坂見附");
INSERT INTO stations(id,name) VALUES(4,"新橋");
INSERT INTO stations(id,name) VALUES(5,"銀座");
INSERT INTO stations(id,name) VALUES(6,"京橋");
INSERT INTO stations(id,name) VALUES(7,"新宿");
INSERT INTO stations(id,name) VALUES(8,"四ツ谷");
INSERT INTO stations(id,name) VALUES(9,"東京");
INSERT INTO stations(id,name) VALUES(10,"神保町");
INSERT INTO stations(id,name) VALUES(11,"大手町");
INSERT INTO stations(id,name) VALUES(12,"三越前");

INSERT INTO station_infos(id,subway_id,station_id,station_order,distance) VALUES(1,1,1,1,1);
INSERT INTO station_infos(id,subway_id,station_id,station_order,distance) VALUES(2,1,2,2,2);
INSERT INTO station_infos(id,subway_id,station_id,station_order,distance) VALUES(3,1,3,3,5);
INSERT INTO station_infos(id,subway_id,station_id,station_order,distance) VALUES(4,1,4,4,8);
INSERT INTO station_infos(id,subway_id,station_id,station_order,distance) VALUES(5,1,5,5,9);
INSERT INTO station_infos(id,subway_id,station_id,station_order,distance) VALUES(6,1,6,6,10);

INSERT INTO station_infos(id,subway_id,station_id,station_order,distance) VALUES(7,2,7,1,1);
INSERT INTO station_infos(id,subway_id,station_id,station_order,distance) VALUES(8,2,8,2,5);
INSERT INTO station_infos(id,subway_id,station_id,station_order,distance) VALUES(9,2,3,3,6);
INSERT INTO station_infos(id,subway_id,station_id,station_order,distance) VALUES(10,2,5,4,9);
INSERT INTO station_infos(id,subway_id,station_id,station_order,distance) VALUES(11,2,9,5,10);
INSERT INTO station_infos(id,subway_id,station_id,station_order,distance) VALUES(12,2,11,6,11);

INSERT INTO station_infos(id,subway_id,station_id,station_order,distance) VALUES(13,3,1,1,1);
INSERT INTO station_infos(id,subway_id,station_id,station_order,distance) VALUES(14,3,2,2,2);
INSERT INTO station_infos(id,subway_id,station_id,station_order,distance) VALUES(15,3,10,3,6);
INSERT INTO station_infos(id,subway_id,station_id,station_order,distance) VALUES(16,3,11,4,10);
INSERT INTO station_infos(id,subway_id,station_id,station_order,distance) VALUES(17,3,12,5,11);

INSERT INTO transfer_infos(id,subway_id,station_id) VALUES(1,1,1);
INSERT INTO transfer_infos(id,subway_id,station_id) VALUES(2,1,2);
INSERT INTO transfer_infos(id,subway_id,station_id) VALUES(3,1,3);
INSERT INTO transfer_infos(id,subway_id,station_id) VALUES(4,1,5);

INSERT INTO transfer_infos(id,subway_id,station_id) VALUES(5,2,3);
INSERT INTO transfer_infos(id,subway_id,station_id) VALUES(6,2,5);
INSERT INTO transfer_infos(id,subway_id,station_id) VALUES(7,2,11);

INSERT INTO transfer_infos(id,subway_id,station_id) VALUES(8,3,1);
INSERT INTO transfer_infos(id,subway_id,station_id) VALUES(9,3,2);
INSERT INTO transfer_infos(id,subway_id,station_id) VALUES(10,3,11);













