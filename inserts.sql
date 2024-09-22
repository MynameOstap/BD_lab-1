USE mydb;

-- brand queries
INSERT INTO brand (name, country) VALUES ('Toyota', 'Japan');
INSERT INTO brand (name, country) VALUES ('Ford', 'USA');
INSERT INTO brand (name, country) VALUES ('BMW', 'Germany');
INSERT INTO brand (name, country) VALUES ('Hyundai', 'South Korea');
INSERT INTO brand (name, country) VALUES ('Ferrari', 'Italy');
INSERT INTO brand (name, country) VALUES ('Nissan', 'Japan');
INSERT INTO brand (name, country) VALUES ('Kia', 'South Korea');
INSERT INTO brand (name, country) VALUES ('Chevrolet', 'USA');
INSERT INTO brand (name, country) VALUES ('Renault', 'France');
INSERT INTO brand (name, country) VALUES ('Mercedes-Benz', 'Germany');

-- user queries
INSERT INTO user (name) VALUES ('valera');
INSERT INTO user (name) VALUES ('zina');
INSERT INTO user (name) VALUES ('patron');
INSERT INTO user (name) VALUES ('artem');
INSERT INTO user (name) VALUES ('stas');
INSERT INTO user (name) VALUES ('dimas');
INSERT INTO user (name) VALUES ('grigor');
INSERT INTO user (name) VALUES ('gamlet');
INSERT INTO user (name) VALUES ('merlin');
INSERT INTO user (name) VALUES ('baron');


-- engine queries
INSERT INTO engine (eng_vol, hp, name, brand_id) VALUES (2.5, 180, 'Engine A', 1);
INSERT INTO engine (eng_vol, hp, name, brand_id) VALUES (3.0, 250, 'Engine B', 2);
INSERT INTO engine (eng_vol, hp, name, brand_id) VALUES (4.0, 400, 'Engine C', 3);
INSERT INTO engine (eng_vol, hp, name, brand_id) VALUES (1.6, 130, 'Engine D', 4);
INSERT INTO engine (eng_vol, hp, name, brand_id) VALUES (2.0, 220, 'Engine E', 5);
INSERT INTO engine (eng_vol, hp, name, brand_id) VALUES (1.8, 140, 'Engine F', 6);
INSERT INTO engine (eng_vol, hp, name, brand_id) VALUES (3.5, 300, 'Engine G', 7);
INSERT INTO engine (eng_vol, hp, name, brand_id) VALUES (2.2, 170, 'Engine H', 8);
INSERT INTO engine (eng_vol, hp, name, brand_id) VALUES (1.5, 110, 'Engine I', 9);
INSERT INTO engine (eng_vol, hp, name, brand_id) VALUES (2.8, 210, 'Engine J', 10);

-- model queries
INSERT INTO model (body_type, engine_id, brand_id) VALUES ('sedan', 1, 1);
INSERT INTO model (body_type, engine_id, brand_id) VALUES ('hatchback', 2, 2);
INSERT INTO model (body_type, engine_id, brand_id) VALUES ('suv', 3, 3);
INSERT INTO model (body_type, engine_id, brand_id) VALUES ('coupe', 4, 4);
INSERT INTO model (body_type, engine_id, brand_id) VALUES ('sedan', 5, 5);
INSERT INTO model (body_type, engine_id, brand_id) VALUES ('hatchback', 6, 6);
INSERT INTO model (body_type, engine_id, brand_id) VALUES ('suv', 7, 7);
INSERT INTO model (body_type, engine_id, brand_id) VALUES ('coupe', 8, 8);
INSERT INTO model (body_type, engine_id, brand_id) VALUES ('sedan', 9, 9);
INSERT INTO model (body_type, engine_id, brand_id) VALUES ('suv', 10, 10);

INSERT INTO location ( country, city, street, building) VALUES ( 'Ukraine', 'Kyiv', 'Khreshchatyk', '10');
INSERT INTO location ( country, city, street, building) VALUES ( 'Ukraine', 'Lviv', 'Svobody Avenue', '15');
INSERT INTO location ( country, city, street, building) VALUES ( 'Ukraine', 'Odessa', 'Deribasivska', '3');
INSERT INTO location ( country, city, street, building) VALUES ( 'Ukraine', 'Kharkiv', 'Sumskaya', '12');
INSERT INTO location ( country, city, street, building) VALUES ( 'Poland', 'Warsaw', 'Marszałkowska', '25');
INSERT INTO location ( country, city, street, building) VALUES ( 'Germany', 'Berlin', 'Unter den Linden', '55');
INSERT INTO location ( country, city, street, building) VALUES ( 'France', 'Paris', 'Champs-Élysées', '102');
INSERT INTO location ( country, city, street, building) VALUES ( 'Italy', 'Rome', 'Via del Corso', '78');
INSERT INTO location ( country, city, street, building) VALUES ( 'Spain', 'Madrid', 'Gran Via', '30');
INSERT INTO location (country, city, street, building) VALUES ( 'USA', 'New York', '5th Avenue', '120');

INSERT INTO company (name) VALUES ('Audi');
INSERT INTO company (name) VALUES ('BMW');
INSERT INTO company (name) VALUES ('Mercedes-Benz');
INSERT INTO company (name) VALUES ('Tesla');
INSERT INTO company (name) VALUES ('Toyota');
INSERT INTO company (name) VALUES ('Ford');
INSERT INTO company (name) VALUES ('Honda');
INSERT INTO company (name) VALUES ('Volkswagen');
INSERT INTO company (name) VALUES ('Porsche');
INSERT INTO company (name) VALUES ('Ferrari');

-- seller queries with user_id
-- seller queries with user_id and location_id
INSERT INTO seller (user_id, location_id, company_id) VALUES (1, 1, 1); 
INSERT INTO seller (user_id, location_id, company_id) VALUES (2, 2, 2); 
INSERT INTO seller (user_id, location_id, company_id) VALUES (3, 3, 3); 
INSERT INTO seller (user_id, location_id, company_id) VALUES (4, 4, 4); 
INSERT INTO seller (user_id, location_id, company_id) VALUES (5, 5, 5); 
INSERT INTO seller (user_id, location_id, company_id) VALUES (6, 6, 6); 
INSERT INTO seller (user_id, location_id, company_id) VALUES (7, 7, 7);
INSERT INTO seller (user_id, location_id, company_id) VALUES (8, 8, 8); 
INSERT INTO seller (user_id, location_id, company_id) VALUES (9, 9, 9); 
INSERT INTO seller (user_id, location_id, company_id) VALUES (10, 10, 10);


-- test_drive queries
INSERT INTO test_drive (location_id) VALUES (1);
INSERT INTO test_drive (location_id) VALUES (2);
INSERT INTO test_drive (location_id) VALUES (3);
INSERT INTO test_drive (location_id) VALUES (4);
INSERT INTO test_drive (location_id) VALUES (5);
INSERT INTO test_drive (location_id) VALUES (6);
INSERT INTO test_drive (location_id) VALUES (7);
INSERT INTO test_drive (location_id) VALUES (8);
INSERT INTO test_drive (location_id) VALUES (9);
INSERT INTO test_drive (location_id) VALUES (10);


-- car queries
INSERT INTO car (model_id, damage, seller_id, price, test_drive_id) VALUES (1, 'cosmetic_damage', 1, 20000, 1);
INSERT INTO car (model_id, damage, seller_id, price, test_drive_id) VALUES (2, 'severely_damaged', 2, 25000, 2);
INSERT INTO car (model_id, damage, seller_id, price, test_drive_id) VALUES (3, 'moderately_damaged', 3, 40000, 3);
INSERT INTO car (model_id, damage, seller_id, price, test_drive_id) VALUES (4, 'excellent_condition', 4, 35000, 4);
INSERT INTO car (model_id, damage, seller_id, price, test_drive_id) VALUES (5, 'cosmetic_damage', 5, 30000, 5);
INSERT INTO car (model_id, damage, seller_id, price, test_drive_id) VALUES (6, 'severely_damaged', 6, 45000, 6);
INSERT INTO car (model_id, damage, seller_id, price, test_drive_id) VALUES (7, 'moderately_damaged', 7, 32000, 7);
INSERT INTO car (model_id, damage, seller_id, price, test_drive_id) VALUES (8, 'excellent_condition', 8, 22000, 8);
INSERT INTO car (model_id, damage, seller_id, price, test_drive_id) VALUES (9, 'cosmetic_damage', 9, 28000, 9);
INSERT INTO car (model_id, damage, seller_id, price, test_drive_id) VALUES (10, 'excellent_condition', 10, 50000, 10);



-- timeslot queries
INSERT INTO timeslot (time, test_drive_id) VALUES ('2024-09-22 10:00:00', 1);
INSERT INTO timeslot (time, test_drive_id) VALUES ('2024-09-22 11:00:00', 2);
INSERT INTO timeslot (time, test_drive_id) VALUES ('2024-09-22 12:00:00', 3);
INSERT INTO timeslot (time, test_drive_id) VALUES ('2024-09-22 13:00:00', 4);
INSERT INTO timeslot (time, test_drive_id) VALUES ('2024-09-22 14:00:00', 5);
INSERT INTO timeslot (time, test_drive_id) VALUES ('2024-09-22 15:00:00', 6);
INSERT INTO timeslot (time, test_drive_id) VALUES ('2024-09-22 16:00:00', 7);
INSERT INTO timeslot (time, test_drive_id) VALUES ('2024-09-22 17:00:00', 8);
INSERT INTO timeslot (time, test_drive_id) VALUES ('2024-09-22 18:00:00', 9);
INSERT INTO timeslot (time, test_drive_id) VALUES ('2024-09-22 19:00:00', 10);

-- car_img queries
INSERT INTO car_img (url, car_id) VALUES ('http://example.com/img1.jpg', 1);
INSERT INTO car_img (url, car_id) VALUES ('http://example.com/img2.jpg', 2);
INSERT INTO car_img (url, car_id) VALUES ('http://example.com/img3.jpg', 3);
INSERT INTO car_img (url, car_id) VALUES ('http://example.com/img4.jpg', 4);
INSERT INTO car_img (url, car_id) VALUES ('http://example.com/img5.jpg', 5);
INSERT INTO car_img (url, car_id) VALUES ('http://example.com/img6.jpg', 6);
INSERT INTO car_img (url, car_id) VALUES ('http://example.com/img7.jpg', 7);
INSERT INTO car_img (url, car_id) VALUES ('http://example.com/img8.jpg', 8);
INSERT INTO car_img (url, car_id) VALUES ('http://example.com/img9.jpg', 9);
INSERT INTO car_img (url, car_id) VALUES ('http://example.com/img10.jpg', 10);

-- feedback queries
INSERT INTO feedback (user_id, comment, rating, car_id) VALUES (1, 'Great car!', 5, 1);
INSERT INTO feedback (user_id, comment, rating, car_id) VALUES (2, 'Not bad.', 4, 2);
INSERT INTO feedback (user_id, comment, rating, car_id) VALUES (3, 'Needs improvement.', 3, 3);
INSERT INTO feedback (user_id, comment, rating, car_id) VALUES (4, 'Amazing!', 5, 4);
INSERT INTO feedback (user_id, comment, rating, car_id) VALUES (5, 'Pretty good', 4, 5);
INSERT INTO feedback (user_id, comment, rating, car_id) VALUES (6, 'Could be better', 3, 6);
INSERT INTO feedback (user_id, comment, rating, car_id) VALUES (7, 'Satisfied', 5, 7);
INSERT INTO feedback (user_id, comment, rating, car_id) VALUES (8, 'Average', 3, 8);
INSERT INTO feedback (user_id, comment, rating, car_id) VALUES (9, 'Excellent!', 5, 9);
INSERT INTO feedback (user_id, comment, rating, car_id) VALUES (10, 'Good value', 4, 10);


