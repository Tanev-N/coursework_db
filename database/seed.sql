USE clinic;

-- Сначала заполняем роли
INSERT INTO role (id_role, name) VALUES
(1, 'admin'),
(2, 'patient'),
(3, 'doctor'),
(4, 'manager');

-- Заполняем отделения
INSERT INTO department (name, floor, head) VALUES
('Терапия', 1, 'Иванов Иван Иванович'),
('Хирургия', 2, 'Петров Пётр Петрович'),
('Диагностический центр', 3, 'Сидорова Светлана Сергеевна');

-- Заполняем кабинеты
INSERT INTO cabinet (department_id_dep, type, square) VALUES
(1, 'Приемный кабинет', 30),
(2, 'Хирургический зал', 45),
(3, 'Диагностический кабинет', 35);

-- Добавляем докторов с полным именем
INSERT INTO doctor (department_id_dep, full_name, passport_data, address, birth, specialization, employment) VALUES
(1, 'Зимина Ольга Владимировна', '123456', 'ул. Ленина, д.1', '1980-01-15', 'Педиатр', '2010-01-01'),
(1, 'Воробьева Галина Николаевна', '234567', 'ул. Пушкина, д.2', '1975-05-20', 'Педиатр', '2008-03-15'),
(1, 'Пузырева Анна Александровна', '345678', 'ул. Гоголя, д.3', '1982-07-10', 'Педиатр', '2012-06-20');

-- Добавляем расписание врачей
INSERT INTO doctor_schedule (doctor_id, day_of_week, start_time, end_time, cabinet) VALUES
-- Зимина О.В.
(1, 1, '08:00', '11:30', '227'), -- Понедельник
(1, 2, '08:00', '11:00', '227'), -- Вторник
(1, 3, '16:00', '19:00', '227'), -- Среда
(1, 4, '08:00', '10:30', '227'), -- Четверг
-- Воробьева Г.Н.
(2, 1, '15:30', '19:00', '228'),
(2, 2, '11:00', '14:00', '228'),
(2, 3, '08:00', '11:30', '228'),
(2, 4, '14:00', '16:30', '228'),
-- Пузырева А.А.
(3, 1, '15:30', '19:00', '202'),
(3, 2, '14:00', '17:00', '202'),
(3, 3, '08:00', '11:30', '202'),
(3, 4, '08:00', '10:30', '202');

-- Добавляем врачей в разные отделения
INSERT INTO doctor (department_id_dep, full_name, passport_data, address, birth, specialization, employment) VALUES
-- Терапия
(1, 'Терапевт Петр Михайлович', '2345-678901', 'ул. Лесная, д.5', '1978-03-15', 'Терапевт', '2015-02-01'),
(1, 'Кардиолог Анна Сергеевна', '3456-789012', 'ул. Садовая, д.10', '1982-07-20', 'Кардиолог', '2016-03-15'),

-- Хирургия
(2, 'Хирург Иван Петрович', '4567-890123', 'ул. Центральная, д.15', '1975-11-30', 'Хирург', '2010-06-01'),
(2, 'Травматолог Сергей Иванович', '5678-901234', 'ул. Парковая, д.7', '1980-04-25', 'Травматолог', '2012-09-01'),

-- Диагностический центр
(3, 'Рентгенолог Мария Александровна', '6789-012345', 'ул. Солнечная, д.3', '1983-08-10', 'Рентгенолог', '2014-07-01'),
(3, 'УЗИ-специалист Елена Владимировна', '7890-123456', 'ул. Цветочная, д.12', '1979-12-05', 'УЗИ-специалист', '2013-04-15');

-- Добавляем расписание для новых врачей
INSERT INTO doctor_schedule (doctor_id, day_of_week, start_time, end_time, cabinet) VALUES
-- Терапевт
((SELECT id_doc FROM doctor WHERE full_name = 'Терапевт Петр Михайлович'), 1, '09:00', '15:00', '301'),
((SELECT id_doc FROM doctor WHERE full_name = 'Терапевт Петр Михайлович'), 3, '09:00', '15:00', '301'),
((SELECT id_doc FROM doctor WHERE full_name = 'Терапевт Петр Михайлович'), 5, '09:00', '15:00', '301'),

-- Кардиолог
((SELECT id_doc FROM doctor WHERE full_name = 'Кардиолог Анна Сергеевна'), 2, '10:00', '16:00', '302'),
((SELECT id_doc FROM doctor WHERE full_name = 'Кардиолог Анна Сергеевна'), 4, '10:00', '16:00', '302'),

-- Хирург
((SELECT id_doc FROM doctor WHERE full_name = 'Хирург Иван Петрович'), 1, '08:00', '14:00', '401'),
((SELECT id_doc FROM doctor WHERE full_name = 'Хирург Иван Петрович'), 2, '08:00', '14:00', '401'),
((SELECT id_doc FROM doctor WHERE full_name = 'Хирург Иван Петрович'), 4, '08:00', '14:00', '401'),

-- Травматолог
((SELECT id_doc FROM doctor WHERE full_name = 'Травматолог Сергей Иванович'), 1, '14:00', '20:00', '402'),
((SELECT id_doc FROM doctor WHERE full_name = 'Травматолог Сергей Иванович'), 3, '14:00', '20:00', '402'),
((SELECT id_doc FROM doctor WHERE full_name = 'Травматолог Сергей Иванович'), 5, '14:00', '20:00', '402'),

-- Рентгенолог
((SELECT id_doc FROM doctor WHERE full_name = 'Рентгенолог Мария Александровна'), 1, '09:00', '15:00', '501'),
((SELECT id_doc FROM doctor WHERE full_name = 'Рентгенолог Мария Александровна'), 3, '09:00', '15:00', '501'),
((SELECT id_doc FROM doctor WHERE full_name = 'Рентгенолог Мария Александровна'), 5, '09:00', '15:00', '501'),

-- УЗИ-специалист
((SELECT id_doc FROM doctor WHERE full_name = 'УЗИ-специалист Елена Владимировна'), 2, '10:00', '16:00', '502'),
((SELECT id_doc FROM doctor WHERE full_name = 'УЗИ-специалист Елена Владимировна'), 4, '10:00', '16:00', '502');
