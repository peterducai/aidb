
--- Insert LOCATIONS
INSERT INTO aidb.location (country,description,town,street,zipcode) VALUES ((SELECT aidb.location.id FROM aidb.location WHERE aidb.location.town = 'Bratislava'),'BA1','Bratislava','some_street 343','84463');
INSERT INTO aidb.location (country,description,town,street,zipcode) VALUES ((SELECT aidb.location.id FROM aidb.location WHERE aidb.location.town = 'Zagreb'),'ZA1','Zagreb','some_street 343','84463');
INSERT INTO aidb.location (country,description,town,street,zipcode) VALUES ((SELECT aidb.location.id FROM aidb.location WHERE aidb.location.town = 'Athens'),'ATH1','Athens','some_street 343','84463');
--- Insert ROOMs into locations
INSERT INTO aidb.room (loc, floor, room_number, room_name) VALUES ((SELECT aidb.location.id FROM aidb.location WHERE aidb.location.town = 'Bratislava'), 2, 244, 'R1');
INSERT INTO aidb.room (loc, floor, room_number, room_name) VALUES ((SELECT aidb.location.id FROM aidb.location WHERE aidb.location.town = 'Bratislava'), 4, 412, 'R2');
INSERT INTO aidb.room (loc, floor, room_number, room_name) VALUES ((SELECT aidb.location.id FROM aidb.location WHERE aidb.location.town = 'Zagreb'), 1, 155, 'R1');
INSERT INTO aidb.room (loc, floor, room_number, room_name) VALUES ((SELECT aidb.location.id FROM aidb.location WHERE aidb.location.town = 'Athens'), 5, 532, 'R1');
---
INSERT INTO aidb.rack (rack_name, rack_positions, purchase_order,room)
  VALUES ('rack_a1', 64, 'jsdfj4t3jt24234', (SELECT aidb.room.id FROM aidb.room WHERE aidb.room.room_name = 'room_ba1'));
---

INSERT INTO aidb.hw (manufacturer, model, serial_number, cpus, warranty_to, purchase_order) 
  VALUES ('Lenovo','X5','342345tagag344q5',4,NOW(),'84463'),
  ('Lenovo','X54','rtegs543534534fg',4,NOW(),'86663'),
  ('Lenovo','X54','dfgfgsdfgsdgfsdg',4,NOW(),'84863');


INSERT INTO aidb.hw_pos_in_rack (rack, hw)
  VALUES ((SELECT aidb.rack.id FROM aidb.rack WHERE aidb.rack.rack_name = 'rack_a1'), (SELECT aidb.hw.id FROM aidb.hw WHERE aidb.hw.serial_number = '342345tagag344q5'));
