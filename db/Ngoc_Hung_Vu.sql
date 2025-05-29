CREATE TABLE Zeme_puvodu (
    id SERIAL PRIMARY KEY,
    nazev VARCHAR(50) NOT NULL UNIQUE
);

INSERT INTO Zeme_puvodu (nazev) VALUES 
('Čína'),
('Polsko');

-- Vytvoření tabulky pro značky výrobců
CREATE TABLE Znacky_vyrobce (
    id SERIAL PRIMARY KEY,
    nazev VARCHAR(50) NOT NULL UNIQUE
);

INSERT INTO Znacky_vyrobce (nazev) VALUES 
('Anuo'),
('Greenice'),
('Pesail'),
('Smiling'),
('Wasilewaskiarek'),
('Yalisi');

-- Vytvoření tabulky pro kategorie
CREATE TABLE Kategorie (
    id SERIAL PRIMARY KEY,
    nazev VARCHAR(50) NOT NULL UNIQUE
);

INSERT INTO Kategorie (nazev) VALUES 
('Kalhoty'),
('Legíny'),
('Pyžama'),
('Ponožky'),
('Podprsenky'),
('Sportovní podprsenky'),
('Plavky'),
('Tanga');


CREATE TABLE Produkty (
    id SERIAL PRIMARY KEY,
    kod_produktu VARCHAR(50),
	nazev VARCHAR (50),
    kategorie_id INT,
    znacka_vyrobce_id INT,
    zeme_puvodu_id INT,
    FOREIGN KEY (kategorie_id) REFERENCES Kategorie(id),
    FOREIGN KEY (znacka_vyrobce_id) REFERENCES Znacky_vyrobce(id),
    FOREIGN KEY (zeme_puvodu_id) REFERENCES Zeme_puvodu(id)
);

INSERT INTO Produkty (kod_produktu, kategorie_id, znacka_vyrobce_id, zeme_puvodu_id) VALUES 
('1331E', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'),(SELECT id FROM Znacky_vyrobce WHERE nazev = 'Anuo'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('8923E', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Anuo'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('YP5801D', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Anuo'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('P30206', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Anuo'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('YP5800C', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Anuo'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('YP5799B', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Anuo'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('244A', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Anuo'),  (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('9089D', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Anuo'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('P3026', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Anuo'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('BALAN', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Anuo'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('2281C', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Anuo'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('2982C', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Anuo'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('1244A', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Anuo'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('1024D', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Anuo'),(SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('5799B', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Anuo'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('5801D', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Anuo'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('5768D', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Anuo'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('8018D', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Anuo'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('SUSA', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Anuo'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('C', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Anuo'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('1128B', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Anuo'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('12580', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Anuo'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('2281', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Anuo'),(SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('E10', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Anuo'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('5645', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Anuo'),(SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('715', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Anuo'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('M34', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Anuo'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('1311E', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Anuo'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('0516C', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Anuo'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('YP3641B', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Anuo'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('YP5800E', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Anuo'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('D15', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Anuo'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('2982A', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Anuo'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('1303C', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Anuo'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('12580C', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Anuo'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('5018D', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Anuo'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('P31810', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Anuo'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('12580B', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Anuo'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('LBDA715', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Anuo'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('9481', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Anuo'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('BAGIA', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Anuo'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('2040', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Greenice'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('2306', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Greenice'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('2363', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Greenice'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('2377', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Greenice'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('2386', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Greenice'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('2431', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Greenice'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('2713', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Greenice'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('2737', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Greenice'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('2752', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Greenice'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('2753', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Greenice'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('2914', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Greenice'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('2981', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Greenice'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('3020', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Greenice'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('3036', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Greenice'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('3063', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Greenice'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('3281', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Greenice'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('3315', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Greenice'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('3372', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Greenice'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('3433', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Greenice'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('3459', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Greenice'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('3486',(SELECT id FROM Kategorie WHERE nazev = 'Legíny'),  (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Greenice'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('3532', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Greenice'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('3577', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Greenice'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('3652', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Greenice'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('3658', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Greenice'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('3736', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Greenice'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('3737', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Greenice'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('3775', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Greenice'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('3818', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Greenice'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('3821', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Greenice'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('3822', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Greenice'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('3846', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Greenice'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('3872', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Greenice'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('3912', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Greenice'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('3944', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Greenice'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('3945', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Greenice'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('3953', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Greenice'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('3991', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Greenice'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('4200', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Greenice'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('4436', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Greenice'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('4497', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Greenice'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('4539', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Greenice'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('4550', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Greenice'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('4567', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Greenice'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('4568', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Greenice'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('4570', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Greenice'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('4578', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Greenice'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('4579', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Greenice'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('4599', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Greenice'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('4619', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Greenice'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('4642', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Greenice'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('4644', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Greenice'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('4663', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Greenice'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('4682', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Greenice'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('4700', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Greenice'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('4724', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Greenice'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('4737', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Greenice'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('4751', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Greenice'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('4752', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Greenice'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('4753', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Greenice'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('4789', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Greenice'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('4807', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Greenice'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('4813', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Greenice'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('4817', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Greenice'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('4818', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Greenice'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('4850', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Greenice'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('4863', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Greenice'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('4874', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Greenice'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('4876', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Greenice'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('4902', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Greenice'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('4919', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Greenice'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('4921', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Greenice'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('4934', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Greenice'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('4935', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Greenice'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('4936', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Greenice'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('6011', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Greenice'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('6015', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Greenice'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('6036', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Greenice'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('6037', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Greenice'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('6062', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Greenice'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('6066', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Greenice'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('6067', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Greenice'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('6068', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Greenice'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('6079', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Greenice'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('6135', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Greenice'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('6136', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Greenice'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('6156',(SELECT id FROM Kategorie WHERE nazev = 'Legíny'),  (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Greenice'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('6157', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Greenice'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('6178', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Greenice'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('6179', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Greenice'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('6208', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Greenice'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('6266', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Greenice'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('6280', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Greenice'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('6296', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Greenice'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('6311', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Greenice'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('6312', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Greenice'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('6321', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Greenice'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('6345', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Greenice'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('6361', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Greenice'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('6371', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Greenice'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('6377', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Greenice'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('6379', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Greenice'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('6393', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Greenice'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('6400', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Greenice'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('6457', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Greenice'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('6464', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Greenice'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('6470', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Greenice'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('6476', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Greenice'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('6477', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Greenice'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('6482', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Greenice'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('6484', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Greenice'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('6485', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Greenice'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('6505', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Greenice'),(SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('6506', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Greenice'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('6516', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Greenice'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('6519', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Greenice'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('6520', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Greenice'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('6536', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Greenice'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('6553', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Greenice'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('6555', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Greenice'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('6562', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Greenice'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('6563', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Greenice'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('6583', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Greenice'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('6585', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Greenice'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('6588', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Greenice'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('6590', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Greenice'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('6600', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Greenice'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('6610', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Greenice'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('6614', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Greenice'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('6624', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Greenice'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('6635', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Greenice'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('6658', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Greenice'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('6670', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Greenice'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('6686', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Greenice'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('6718', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Greenice'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('6723', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Greenice'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('6724', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Greenice'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('6737', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Greenice'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('6744', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'),  (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Greenice'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('6745', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Greenice'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('6746', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Greenice'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('6747', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Greenice'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('6750', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Greenice'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('6751', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Greenice'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('6761', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Greenice'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('6765', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Greenice'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('6767', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Greenice'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('6772', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Greenice'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('6779', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Greenice'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('6805', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Greenice'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('6813', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Greenice'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('6816', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Greenice'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('6915', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Greenice'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('6993', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Greenice'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('7022', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Greenice'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('7041', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Greenice'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('7075', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Greenice'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('7170', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Greenice'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('7664', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Greenice'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('9515', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Greenice'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('2377A',(SELECT id FROM Kategorie WHERE nazev = 'Legíny'),  (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Greenice'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('2377B', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Greenice'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('4002Z', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Greenice'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('9503Z', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Greenice'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('9515Z', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Greenice'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('CZ9500', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Greenice'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('CZ9522Z', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Greenice'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('JMK005B', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Greenice'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('3205', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Pesail'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('64093', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Pesail'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('CZ8032', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Pesail'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('G50012', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Pesail'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('G5160', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Pesail'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('G55201', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Pesail'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('G55370', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Pesail'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('G55470', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Pesail'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('G55490', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Pesail'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('G592', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Pesail'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('GK002', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Pesail'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('GM5001', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Pesail'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('GM5001H', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Pesail'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('M027', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Pesail'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('M8004', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Pesail'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('T0240', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Pesail'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('T0255', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Pesail'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('T0259', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Pesail'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('T335', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Pesail'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('T341', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Pesail'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('T6003', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Pesail'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('U1004', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Pesail'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('U1063', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Pesail'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('U1109', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Pesail'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('U1112', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Pesail'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('XQ2635', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Pesail'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('YW4032', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Pesail'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('YW4112', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Pesail'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('YW4122', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Pesail'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('YW4130', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Pesail'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('HF-021C', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Pesail'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('C8001', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Pesail'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('G55282', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Pesail'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('G55506', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Pesail'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('YW4116', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Pesail'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('YW4135', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Pesail'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('YW4126', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Pesail'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('RM0024', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Pesail'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('T403', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Pesail'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('T4031', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Pesail'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('MT1', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Smiling'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('MT2', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Smiling'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('FT30', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Smiling'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('MZ216', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Smiling'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('MZ210', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Smiling'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('MF315', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Smiling'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('MF331', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Smiling'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('MF323', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Smiling'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('MZ219', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Smiling'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('MZ212', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Smiling'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('MZ18', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Smiling'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('XZ137', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Smiling'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('MZ21', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Smiling'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('MZ200', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Smiling'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('JA115', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Smiling'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('XZ104', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Smiling'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('XZ208', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Smiling'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('MF365', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Smiling'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('XZ214', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Smiling'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('MF357', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Smiling'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('XZ231', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Smiling'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('XZ230', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Smiling'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('MF386', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Smiling'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('XZ222', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Smiling'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('MF371', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Smiling'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('XI21', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Smiling'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('MF359', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Smiling'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('MF360', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Smiling'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('MF361', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Smiling'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('XZ212', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Smiling'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('XZ242', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Smiling'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('MZ220', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Smiling'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('FN51', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Smiling'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('FN49', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Smiling'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('MZ225', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Smiling'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('XZ232', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Smiling'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('MB30', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Smiling'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('XB20', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Smiling'),(SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('A4', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Smiling'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('MA78', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Smiling'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('MF10', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Smiling'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('XZ213', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Smiling'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('MF321', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Smiling'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('MF329', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'),  (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Smiling'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('MF380', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Smiling'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('MF381', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'),  (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Smiling'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('MZ226', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Smiling'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('MF314', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Smiling'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('JA116', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Smiling'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('MZ222', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Smiling'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('MF363', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Smiling'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('MF322', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Smiling'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('XZ202', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Smiling'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('XZ203', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Smiling'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('XZ204', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Smiling'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('FM1', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Smiling'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('FN16', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Smiling'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('MF352', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Smiling'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('MF350', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Smiling'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('MT10', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Smiling'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('XT20', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Smiling'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('MF1', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Smiling'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('XZ205', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Smiling'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('JA113', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Smiling'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('JA120', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Smiling'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('MA70', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Smiling'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('MA90', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Smiling'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('TB50', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Smiling'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('MT11', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Smiling'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('MT12', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Smiling'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('XT21', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Smiling'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('XT22', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Smiling'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('MF358', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Smiling'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('XZ248', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Smiling'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('MF366', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Smiling'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('XZ236', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Smiling'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('XZ216', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Smiling'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('XZ210', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Smiling'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('MF320', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Smiling'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('FM51', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Smiling'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('XZ201', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Smiling'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('MF354', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Smiling'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('MF353', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Smiling'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('MF328', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Smiling'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('LM77', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Smiling'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('XZ209', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Smiling'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('FN1', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Smiling'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('XZ105', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Smiling'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('MZ201', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Smiling'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('MT315', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Smiling'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('XZ103', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Smiling'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('MA68', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Smiling'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('MD52', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Smiling'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('D172', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Smiling'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('MT63', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Smiling'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('MZ23', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Smiling'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('MT80', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Smiling'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('XZ1641', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Smiling'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('40-23', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Smiling'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('JA87', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Smiling'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('LK16', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Smiling'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('MF51', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Smiling'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('MF63', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Smiling'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('MF18', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Smiling'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('L5', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Smiling'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('MF53', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Smiling'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('F3', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Smiling'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('40-19', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Smiling'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('40-15', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Smiling'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('MF17', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Smiling'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('XZ163', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Smiling'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('L33', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Smiling'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('XZ171', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Smiling'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('MZ202', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Smiling'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('XZ172', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Smiling'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('MF334', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Smiling'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('MF219', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Smiling'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('MF340', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Smiling'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('XZ177', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Smiling'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('MF339', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Smiling'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('XZ182', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Smiling'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('MF345', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Smiling'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('W4287', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Smiling'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('W4280', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Smiling'),(SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('MZ229', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Smiling'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('MZ6', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Smiling'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('MZ4', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Smiling'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('MM01', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Smiling'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('MZ30', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Smiling'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('MF68', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Smiling'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('MF67', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Smiling'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('MF60', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Smiling'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('MZ25', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Smiling'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('MZ32', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Smiling'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('MZ31', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Smiling'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('40-16', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Smiling'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('MF65', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Smiling'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('N5', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Smiling'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('MF64', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Smiling'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('XZ146',(SELECT id FROM Kategorie WHERE nazev = 'Legíny'),  (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Smiling'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('XZ233', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Smiling'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('XZ238', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Smiling'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('MF326', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Smiling'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('8025', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Wasilewaskiarek'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Polsko')),
('390178', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Wasilewaskiarek'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Polsko')),
('10828', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Wasilewaskiarek'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Polsko')),
('919', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Wasilewaskiarek'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Polsko')),
('10805', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Wasilewaskiarek'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Polsko')),
('10802', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Wasilewaskiarek'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Polsko')),
('10801', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Wasilewaskiarek'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Polsko')),
('10810', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Wasilewaskiarek'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Polsko')),
('10506', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Wasilewaskiarek'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Polsko')),
('10808', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Wasilewaskiarek'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Polsko')),
('6683', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Wasilewaskiarek'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Polsko')),
('720014', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Wasilewaskiarek'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Polsko')),
('10775', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Wasilewaskiarek'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Polsko')),
('7917dm', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Wasilewaskiarek'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Polsko')),
('7917tm', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Wasilewaskiarek'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Polsko')),
('6940', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Wasilewaskiarek'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Polsko')),
('6939', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Wasilewaskiarek'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Polsko')),
('1559', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Wasilewaskiarek'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Polsko')),
('2564-1', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Wasilewaskiarek'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Polsko')),
('2564', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Wasilewaskiarek'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Polsko')),
('10618', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Wasilewaskiarek'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Polsko')),
('30', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Wasilewaskiarek'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Polsko')),
('10622', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Wasilewaskiarek'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Polsko')),
('10336', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Wasilewaskiarek'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Polsko')),
('9097nd', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Wasilewaskiarek'),(SELECT id FROM Zeme_puvodu WHERE nazev = 'Polsko')),
('10803', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Wasilewaskiarek'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Polsko')),
('10800', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Wasilewaskiarek'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Polsko')),
('390227', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Wasilewaskiarek'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Polsko')),
('10807', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Wasilewaskiarek'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Polsko')),
('F', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Yalisi'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('D', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Yalisi'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('E', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'), (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Yalisi'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína')),
('DD', (SELECT id FROM Kategorie WHERE nazev = 'Legíny'),  (SELECT id FROM Znacky_vyrobce WHERE nazev = 'Yalisi'), (SELECT id FROM Zeme_puvodu WHERE nazev = 'Čína'));

-- Sklady

CREATE TABLE Sklady (
    id SERIAL PRIMARY KEY,
    nazev VARCHAR(50) NOT NULL
);

INSERT INTO Sklady(nazev) VALUES 
('Centrální sklad'),
('Expediční sklad'),
('Sklad se sezónními produkty');


CREATE TABLE Meny (
    id SERIAL PRIMARY KEY,
    nazev VARCHAR(50),
    ISO_kod_meny VARCHAR(10),
    symbol_meny VARCHAR(10)
);

INSERT INTO Meny (nazev, ISO_kod_meny, symbol_meny) VALUES
('Česká koruna', 'CZK', 'Kč'),
('Euro', 'EUR', '€');

CREATE TABLE Kurzy_Meny (
    id SERIAL PRIMARY KEY,
    mena_z_id INT NOT NULL,     -- Např. EUR
    mena_do_id INT NOT NULL,    -- Např. CZK
    kurz DECIMAL(10, 4) NOT NULL, -- Např. 1 CZK = 0.0417 EUR
    datum_kurzu DATE NOT NULL DEFAULT CURRENT_DATE,
    FOREIGN KEY (mena_z_id) REFERENCES Meny(id),
    FOREIGN KEY (mena_do_id) REFERENCES Meny(id)
);

-- Insert dữ liệu vào bảng Kurzy_Meny
INSERT INTO Kurzy_Meny (mena_z_id, mena_do_id, kurz, datum_kurzu)
VALUES 
    ((SELECT id FROM Meny WHERE ISO_kod_meny = 'EUR'), 
     (SELECT id FROM Meny WHERE ISO_kod_meny = 'CZK'), 
     25.035, '2025-03-18');

-- Vytvoření tabulky pro pohyby skladu
CREATE TABLE Pohyby_Zasob (
    id SERIAL PRIMARY KEY,
    produkt_id INT NOT NULL,
    odchozi_sklad_id INT,  
    cilovy_sklad_id INT,  
    datum_pohybu DATE NOT NULL,  
    typ_pohybu INT NOT NULL CHECK (typ_pohybu IN (1,2,3)), -- 1 = Příjem, 2 = Výdej, 3 = Přesun
    pocet_kusu_v_baleni INT NOT NULL, 
    cena_za_kus FLOAT NOT NULL,
	mena_id INT NOT NULL,
    pocet_baliku_v_pohybu  INT NOT NULL DEFAULT 0,
    FOREIGN KEY (produkt_id) REFERENCES Produkty(id),
    FOREIGN KEY (odchozi_sklad_id) REFERENCES Sklady(id),
    FOREIGN KEY (cilovy_sklad_id) REFERENCES Sklady(id),
	FOREIGN KEY (mena_id) REFERENCES Meny(id)
);

-- Vytvoření tabulky pro zásoby produktů
CREATE TABLE Zasoby_Produktu ( 
    id SERIAL PRIMARY KEY,               -- Jedinečný identifikátor pro záznam
    produkt_id INT NOT NULL,             -- Odkaz na produkt
    sklad_id INT NOT NULL,               -- Odkaz na sklad
    pocet_kusu_v_baleni INT NOT NULL,    -- Počet kusů v balení
	cena_za_kus FLOAT NOT NULL,          -- Cena za kus
	mena_id INT NOT NULL,
    pocet_baliku_ve_skladu INT NOT NULL DEFAULT 0,  -- Celkový počet zásob pro danou cenu a balení
    FOREIGN KEY (produkt_id) REFERENCES Produkty(id),  
    FOREIGN KEY (sklad_id) REFERENCES Sklady(id),
	FOREIGN KEY (mena_id) REFERENCES Meny(id)
);

CREATE OR REPLACE FUNCTION Aktualizace_Zasob_Produktu() 
RETURNS TRIGGER AS $$
BEGIN
    -- PŘÍJEM ZBOŽÍ (vložit nový záznam nebo aktualizovat existující)
    IF NEW.typ_pohybu = 1 THEN
        -- Update existing product stock if match found
        UPDATE Zasoby_Produktu
        SET pocet_baliku_ve_skladu = pocet_baliku_ve_skladu + NEW.pocet_baliku_v_pohybu
        WHERE produkt_id = NEW.produkt_id
          AND sklad_id = NEW.cilovy_sklad_id
          AND cena_za_kus = NEW.cena_za_kus
          AND mena_id = NEW.mena_id
          AND pocet_kusu_v_baleni = NEW.pocet_kusu_v_baleni;

        -- Insert new stock record if no match found
        INSERT INTO Zasoby_Produktu (produkt_id, sklad_id, cena_za_kus, mena_id, pocet_kusu_v_baleni, pocet_baliku_ve_skladu)
        SELECT NEW.produkt_id, NEW.cilovy_sklad_id, NEW.cena_za_kus, NEW.mena_id, NEW.pocet_kusu_v_baleni, NEW.pocet_baliku_v_pohybu
        WHERE NOT EXISTS (
            SELECT 1 FROM Zasoby_Produktu
            WHERE produkt_id = NEW.produkt_id
              AND sklad_id = NEW.cilovy_sklad_id
              AND cena_za_kus = NEW.cena_za_kus
              AND mena_id = NEW.mena_id
              AND pocet_kusu_v_baleni = NEW.pocet_kusu_v_baleni
        );
    END IF;

    -- VÝDEJ ZBOŽÍ (odečtení ze skladu výstupu)
    IF NEW.typ_pohybu = 2 THEN
        UPDATE Zasoby_Produktu
        SET pocet_baliku_ve_skladu = pocet_baliku_ve_skladu - NEW.pocet_baliku_v_pohybu
        WHERE produkt_id = NEW.produkt_id
          AND sklad_id = NEW.odchozi_sklad_id
          AND cena_za_kus = NEW.cena_za_kus
          AND mena_id = NEW.mena_id
          AND pocet_kusu_v_baleni = NEW.pocet_kusu_v_baleni;
    END IF;

    -- PŘESUN ZBOŽÍ (odečtení ze skladu výstupu)
    IF NEW.typ_pohybu = 3 THEN
        UPDATE Zasoby_Produktu
        SET pocet_baliku_ve_skladu = pocet_baliku_ve_skladu - NEW.pocet_baliku_v_pohybu
        WHERE produkt_id = NEW.produkt_id
          AND sklad_id = NEW.odchozi_sklad_id
          AND cena_za_kus = NEW.cena_za_kus
          AND mena_id = NEW.mena_id
          AND pocet_kusu_v_baleni = NEW.pocet_kusu_v_baleni;
        
        -- PŘESUN ZBOŽÍ (přidání do skladu příjemce)
        INSERT INTO Zasoby_Produktu (produkt_id, sklad_id, cena_za_kus, mena_id, pocet_kusu_v_baleni, pocet_baliku_ve_skladu)
        SELECT NEW.produkt_id, NEW.cilovy_sklad_id, NEW.cena_za_kus, NEW.mena_id, NEW.pocet_kusu_v_baleni, NEW.pocet_baliku_v_pohybu
        WHERE NOT EXISTS (
            SELECT 1 FROM Zasoby_Produktu
            WHERE produkt_id = NEW.produkt_id
              AND sklad_id = NEW.cilovy_sklad_id
              AND cena_za_kus = NEW.cena_za_kus
              AND mena_id = NEW.mena_id
              AND pocet_kusu_v_baleni = NEW.pocet_kusu_v_baleni
        );
    END IF;

    RETURN NULL;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER Aktualizace_Zasob_Produktu
AFTER INSERT ON Pohyby_Zasob
FOR EACH ROW
EXECUTE FUNCTION Aktualizace_Zasob_Produktu();


INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (1, NULL, 1, '2025-03-18', 1, 6, 17, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (2, NULL, 1, '2025-03-18', 1, 6, 18, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (3, NULL, 1, '2025-03-18', 1, 6, 21, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (4, NULL, 1, '2025-03-18', 1, 12, 8, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (5, NULL, 1, '2025-03-18', 1, 6, 19, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (6, NULL, 1, '2025-03-18', 1, 6, 18, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (7, NULL, 1, '2025-03-18', 1, 6, 14, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (8, NULL, 1, '2025-03-18', 1, 6, 19, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (9, NULL, 1, '2025-03-18', 1, 12, 8, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (10, NULL, 1, '2025-03-18', 1, 12, 23, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (11, NULL, 1, '2025-03-18', 1, 6, 17, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (12, NULL, 1, '2025-03-18', 1, 6, 23, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (13, NULL, 1, '2025-03-18', 1, 6, 14, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (14, NULL, 1, '2025-03-18', 1, 6, 20, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (15, NULL, 1, '2025-03-18', 1, 6, 18, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (16, NULL, 1, '2025-03-18', 1, 6, 21, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (17, NULL, 1, '2025-03-18', 1, 6, 21, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (18, NULL, 1, '2025-03-18', 1, 6, 17, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (19, NULL, 1, '2025-03-18', 1, 12, 14, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (20, NULL, 1, '2025-03-18', 1, 6, 14, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (21, NULL, 1, '2025-03-18', 1, 6, 17, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (22, NULL, 1, '2025-03-18', 1, 6, 21, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (23, NULL, 1, '2025-03-18', 1, 6, 17, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (24, NULL, 1, '2025-03-18', 1, 6, 19, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (25, NULL, 1, '2025-03-18', 1, 24, 12, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (26, NULL, 1, '2025-03-18', 1, 12, 20, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (27, NULL, 1, '2025-03-18', 1, 12, 22, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (28, NULL, 1, '2025-03-18', 1, 6, 17, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (29, NULL, 1, '2025-03-18', 1, 6, 17, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (30, NULL, 1, '2025-03-18', 1, 6, 17, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (31, NULL, 1, '2025-03-18', 1, 6, 16, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (32, NULL, 1, '2025-03-18', 1, 6, 17, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (33, NULL, 1, '2025-03-18', 1, 6, 13, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (34, NULL, 1, '2025-03-18', 1, 6, 19, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (35, NULL, 1, '2025-03-18', 1, 6, 19, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (36, NULL, 1, '2025-03-18', 1, 6, 17, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (37, NULL, 1, '2025-03-18', 1, 12, 10, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (38, NULL, 1, '2025-03-18', 1, 6, 19, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (39, NULL, 1, '2025-03-18', 1, 12, 21, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (40, NULL, 1, '2025-03-18', 1, 24, 6, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (41, NULL, 1, '2025-03-18', 1, 6, 9, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (393, NULL, 1, '2025-03-18', 1, 24, 6, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (394, NULL, 1, '2025-03-18', 1, 12, 19, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (395, NULL, 1, '2025-03-18', 1, 12, 30, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (396, NULL, 1, '2025-03-18', 1, 24, 9, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (397, NULL, 1, '2025-03-18', 1, 12, 30, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (398, NULL, 1, '2025-03-18', 1, 12, 33, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (399, NULL, 1, '2025-03-18', 1, 12, 30, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (400, NULL, 1, '2025-03-18', 1, 12, 30, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (401, NULL, 1, '2025-03-18', 1, 12, 30, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (402, NULL, 1, '2025-03-18', 1, 12, 36, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (403, NULL, 1, '2025-03-18', 1, 24, 7, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (404, NULL, 1, '2025-03-18', 1, 24, 7, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (405, NULL, 1, '2025-03-18', 1, 12, 26, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (406, NULL, 1, '2025-03-18', 1, 12, 27, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (407, NULL, 1, '2025-03-18', 1, 12, 27, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (408, NULL, 1, '2025-03-18', 1, 12, 36, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (409, NULL, 1, '2025-03-18', 1, 12, 18, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (410, NULL, 1, '2025-03-18', 1, 12, 12, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (411, NULL, 1, '2025-03-18', 1, 24, 6, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (412, NULL, 1, '2025-03-18', 1, 24, 6, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (413, NULL, 1, '2025-03-18', 1, 12, 27, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (414, NULL, 1, '2025-03-18', 1, 12, 21, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (415, NULL, 1, '2025-03-18', 1, 12, 39, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (416, NULL, 1, '2025-03-18', 1, 12, 24, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (417, NULL, 1, '2025-03-18', 1, 12, 27, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (418, NULL, 1, '2025-03-18', 1, 12, 30, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (419, NULL, 1, '2025-03-18', 1, 12, 30, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (420, NULL, 1, '2025-03-18', 1, 12, 27, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (421, NULL, 1, '2025-03-18', 1, 12, 36, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (422, NULL, 1, '2025-03-18', 1, 6, 18, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (423, NULL, 1, '2025-03-18', 1, 6, 15, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (424, NULL, 1, '2025-03-18', 1, 6, 17, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (425, NULL, 1, '2025-03-18', 1, 6, 16, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (210, NULL, 1, '2025-03-18', 1, 6, 18, 1, 4);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (211, NULL, 1, '2025-03-18', 1, 6, 18, 1, 4);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (212, NULL, 1, '2025-03-18', 1, 36, 7, 1, 4);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (213, NULL, 1, '2025-03-18', 1, 24, 11, 1, 4);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (214, NULL, 1, '2025-03-18', 1, 24, 11, 1, 4);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (215, NULL, 1, '2025-03-18', 1, 24, 11, 1, 4);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (216, NULL, 1, '2025-03-18', 1, 24, 8, 1, 4);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (217, NULL, 1, '2025-03-18', 1, 24, 11, 1, 4);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (218, NULL, 1, '2025-03-18', 1, 24, 11, 1, 4);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (219, NULL, 1, '2025-03-18', 1, 24, 8, 1, 4);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (220, NULL, 1, '2025-03-18', 1, 24, 6, 1, 4);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (221, NULL, 1, '2025-03-18', 1, 24, 6, 1, 4);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (222, NULL, 1, '2025-03-18', 1, 24, 6, 1, 4);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (223, NULL, 1, '2025-03-18', 1, 24, 11, 1, 4);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (224, NULL, 1, '2025-03-18', 1, 24, 8, 1, 4);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (225, NULL, 1, '2025-03-18', 1, 24, 6, 1, 4);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (226, NULL, 1, '2025-03-18', 1, 24, 8, 1, 4);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (227, NULL, 1, '2025-03-18', 1, 24, 8, 1, 4);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (228, NULL, 1, '2025-03-18', 1, 24, 11, 1, 4);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (229, NULL, 1, '2025-03-18', 1, 24, 11, 1, 4);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (230, NULL, 1, '2025-03-18', 1, 24, 9, 1, 4);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (231, NULL, 1, '2025-03-18', 1, 24, 10, 1, 4);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (232, NULL, 1, '2025-03-18', 1, 24, 10, 1, 4);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (233, NULL, 1, '2025-03-18', 1, 24, 8, 1, 4);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (234, NULL, 1, '2025-03-18', 1, 24, 8, 1, 4);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (235, NULL, 1, '2025-03-18', 1, 24, 6, 1, 4);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (236, NULL, 1, '2025-03-18', 1, 24, 7, 1, 4);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (237, NULL, 1, '2025-03-18', 1, 36, 7, 1, 4);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (238, NULL, 1, '2025-03-18', 1, 24, 6, 1, 4);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (239, NULL, 1, '2025-03-18', 1, 36, 6, 1, 4);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (240, NULL, 1, '2025-03-18', 1, 12, 11, 1, 4);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (241, NULL, 1, '2025-03-18', 1, 24, 8, 1, 4);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (242, NULL, 1, '2025-03-18', 1, 24, 11, 1, 4);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (243, NULL, 1, '2025-03-18', 1, 24, 8, 1, 4);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (244, NULL, 1, '2025-03-18', 1, 24, 6, 1, 4);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (245, NULL, 1, '2025-03-18', 1, 36, 6, 1, 4);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (246, NULL, 1, '2025-03-18', 1, 36, 7, 1, 4);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (247, NULL, 1, '2025-03-18', 1, 24, 8, 1, 4);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (248, NULL, 1, '2025-03-18', 1, 24, 8, 1, 4);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (249, NULL, 1, '2025-03-18', 1, 24, 9, 1, 4);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (210, NULL, 2, '2025-03-18', 1, 6, 18, 1, 4);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (211, NULL, 2, '2025-03-18', 1, 6, 18, 1, 4);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (212, NULL, 2, '2025-03-18', 1, 36, 7, 1, 4);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (213, NULL, 2, '2025-03-18', 1, 24, 11, 1, 4);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (214, NULL, 2, '2025-03-18', 1, 24, 11, 1, 4);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (215, NULL, 2, '2025-03-18', 1, 24, 11, 1, 4);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (216, NULL, 2, '2025-03-18', 1, 24, 8, 1, 4);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (217, NULL, 2, '2025-03-18', 1, 24, 11, 1, 4);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (218, NULL, 2, '2025-03-18', 1, 24, 11, 1, 4);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (219, NULL, 2, '2025-03-18', 1, 24, 8, 1, 4);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (220, NULL, 2, '2025-03-18', 1, 24, 6, 1, 4);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (221, NULL, 2, '2025-03-18', 1, 24, 6, 1, 4);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (222, NULL, 2, '2025-03-18', 1, 24, 6, 1, 4);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (223, NULL, 2, '2025-03-18', 1, 24, 11, 1, 4);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (224, NULL, 2, '2025-03-18', 1, 24, 8, 1, 4);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (225, NULL, 2, '2025-03-18', 1, 24, 6, 1, 4);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (226, NULL, 2, '2025-03-18', 1, 24, 8, 1, 4);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (227, NULL, 2, '2025-03-18', 1, 24, 8, 1, 4);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (228, NULL, 2, '2025-03-18', 1, 24, 11, 1, 4);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (229, NULL, 2, '2025-03-18', 1, 24, 11, 1, 4);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (230, NULL, 2, '2025-03-18', 1, 24, 9, 1, 4);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (231, NULL, 2, '2025-03-18', 1, 24, 10, 1, 4);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (232, NULL, 2, '2025-03-18', 1, 24, 10, 1, 4);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (233, NULL, 2, '2025-03-18', 1, 24, 8, 1, 4);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (234, NULL, 2, '2025-03-18', 1, 24, 8, 1, 4);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (235, NULL, 2, '2025-03-18', 1, 24, 6, 1, 4);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (236, NULL, 2, '2025-03-18', 1, 24, 7, 1, 4);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (237, NULL, 2, '2025-03-18', 1, 36, 7, 1, 4);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (238, NULL, 2, '2025-03-18', 1, 24, 6, 1, 4);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (239, NULL, 2, '2025-03-18', 1, 36, 6, 1, 4);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (240, NULL, 2, '2025-03-18', 1, 12, 11, 1, 4);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (241, NULL, 2, '2025-03-18', 1, 24, 8, 1, 4);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (242, NULL, 2, '2025-03-18', 1, 24, 11, 1, 4);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (243, NULL, 2, '2025-03-18', 1, 24, 8, 1, 4);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (244, NULL, 2, '2025-03-18', 1, 24, 6, 1, 4);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (245, NULL, 2, '2025-03-18', 1, 36, 6, 1, 4);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (246, NULL, 2, '2025-03-18', 1, 36, 7, 1, 4);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (247, NULL, 2, '2025-03-18', 1, 24, 8, 1, 4);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (248, NULL, 2, '2025-03-18', 1, 24, 8, 1, 4);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (249, NULL, 2, '2025-03-18', 1, 24, 9, 1, 4);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (250, NULL, 1, '2025-03-18', 1, 12, 21, 1, 3);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (251, NULL, 1, '2025-03-18', 1, 12, 30, 1, 3);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (252, NULL, 1, '2025-03-18', 1, 12, 23, 1, 3);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (253, NULL, 1, '2025-03-18', 1, 12, 33, 1, 3);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (254, NULL, 1, '2025-03-18', 1, 12, 33, 1, 3);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (255, NULL, 1, '2025-03-18', 1, 12, 33, 1, 3);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (256, NULL, 1, '2025-03-18', 1, 12, 33, 1, 3);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (257, NULL, 1, '2025-03-18', 1, 12, 33, 1, 3);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (258, NULL, 1, '2025-03-18', 1, 12, 33, 1, 3);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (259, NULL, 1, '2025-03-18', 1, 12, 33, 1, 3);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (260, NULL, 1, '2025-03-18', 1, 12, 24, 1, 3);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (261, NULL, 1, '2025-03-18', 1, 12, 29, 1, 3);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (262, NULL, 1, '2025-03-18', 1, 12, 24, 1, 3);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (263, NULL, 1, '2025-03-18', 1, 12, 30, 1, 3);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (264, NULL, 1, '2025-03-18', 1, 24, 30, 1, 3);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (265, NULL, 1, '2025-03-18', 1, 12, 32, 1, 3);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (266, NULL, 1, '2025-03-18', 1, 24, 32, 1, 3);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (267, NULL, 1, '2025-03-18', 1, 36, 32, 1, 3);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (268, NULL, 1, '2025-03-18', 1, 12, 32, 1, 3);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (269, NULL, 1, '2025-03-18', 1, 24, 32, 1, 3);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (270, NULL, 1, '2025-03-18', 1, 12, 32, 1, 3);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (271, NULL, 1, '2025-03-18', 1, 24, 32, 1, 3);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (272, NULL, 1, '2025-03-18', 1, 36, 32, 1, 3);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (273, NULL, 1, '2025-03-18', 1, 12, 32, 1, 3);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (274, NULL, 1, '2025-03-18', 1, 12, 32, 1, 3);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (275, NULL, 1, '2025-03-18', 1, 36, 30, 1, 3);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (276, NULL, 1, '2025-03-18', 1, 36, 35, 1, 3);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (277, NULL, 1, '2025-03-18', 1, 36, 35, 1, 3);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (278, NULL, 1, '2025-03-18', 1, 36, 35, 1, 3);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (279, NULL, 1, '2025-03-18', 1, 12, 35, 1, 3);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (280, NULL, 1, '2025-03-18', 1, 24, 32, 1, 3);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (281, NULL, 1, '2025-03-18', 1, 24, 35, 1, 3);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (282, NULL, 1, '2025-03-18', 1, 15, 29, 1, 3);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (283, NULL, 1, '2025-03-18', 1, 15, 29, 1, 3);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (284, NULL, 1, '2025-03-18', 1, 12, 30, 1, 3);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (285, NULL, 1, '2025-03-18', 1, 12, 32, 1, 3);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (286, NULL, 1, '2025-03-18', 1, 24, 33, 1, 3);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (287, NULL, 1, '2025-03-18', 1, 60, 30, 1, 3);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (288, NULL, 1, '2025-03-18', 1, 24, 30, 1, 3);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (289, NULL, 1, '2025-03-18', 1, 24, 23, 1, 3);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (290, NULL, 1, '2025-03-18', 1, 24, 30, 1, 3);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (291, NULL, 1, '2025-03-18', 1, 24, 32, 1, 3);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (292, NULL, 1, '2025-03-18', 1, 12, 35, 1, 3);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (293, NULL, 1, '2025-03-18', 1, 12, 35, 1, 3);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (294, NULL, 1, '2025-03-18', 1, 24, 32, 1, 3);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (295, NULL, 1, '2025-03-18', 1, 12, 32, 1, 3);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (296, NULL, 1, '2025-03-18', 1, 12, 32, 1, 3);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (297, NULL, 1, '2025-03-18', 1, 12, 35, 1, 3);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (298, NULL, 1, '2025-03-18', 1, 24, 30, 1, 3);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (299, NULL, 1, '2025-03-18', 1, 12, 35, 1, 3);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (300, NULL, 1, '2025-03-18', 1, 36, 32, 1, 3);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (301, NULL, 1, '2025-03-18', 1, 24, 32, 1, 3);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (302, NULL, 1, '2025-03-18', 1, 24, 35, 1, 3);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (303, NULL, 1, '2025-03-18', 1, 24, 35, 1, 3);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (304, NULL, 1, '2025-03-18', 1, 24, 35, 1, 3);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (305, NULL, 1, '2025-03-18', 1, 15, 29, 1, 3);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (306, NULL, 1, '2025-03-18', 1, 15, 29, 1, 3);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (307, NULL, 1, '2025-03-18', 1, 24, 35, 1, 3);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (308, NULL, 1, '2025-03-18', 1, 24, 35, 1, 3);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (309, NULL, 1, '2025-03-18', 1, 24, 30, 1, 3);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (310, NULL, 1, '2025-03-18', 1, 24, 30, 1, 3);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (311, NULL, 1, '2025-03-18', 1, 24, 21, 1, 3);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (312, NULL, 1, '2025-03-18', 1, 24, 35, 1, 3);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (313, NULL, 1, '2025-03-18', 1, 36, 30, 1, 3);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (314, NULL, 1, '2025-03-18', 1, 24, 27, 1, 3);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (315, NULL, 1, '2025-03-18', 1, 24, 23, 1, 3);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (316, NULL, 1, '2025-03-18', 1, 24, 23, 1, 3);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (317, NULL, 1, '2025-03-18', 1, 6, 29, 1, 3);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (318, NULL, 1, '2025-03-18', 1, 36, 30, 1, 3);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (319, NULL, 1, '2025-03-18', 1, 36, 30, 1, 3);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (320, NULL, 1, '2025-03-18', 1, 24, 30, 1, 3);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (321, NULL, 1, '2025-03-18', 1, 12, 30, 1, 3);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (322, NULL, 1, '2025-03-18', 1, 36, 32, 1, 3);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (323, NULL, 1, '2025-03-18', 1, 36, 32, 1, 3);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (324, NULL, 1, '2025-03-18', 1, 36, 32, 1, 3);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (325, NULL, 1, '2025-03-18', 1, 24, 32, 1, 3);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (326, NULL, 1, '2025-03-18', 1, 12, 35, 1, 3);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (327, NULL, 1, '2025-03-18', 1, 24, 35, 1, 3);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (328, NULL, 1, '2025-03-18', 1, 24, 35, 1, 3);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (329, NULL, 1, '2025-03-18', 1, 15, 29, 1, 3);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (330, NULL, 1, '2025-03-18', 1, 24, 35, 1, 3);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (331, NULL, 1, '2025-03-18', 1, 24, 35, 1, 3);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (332, NULL, 1, '2025-03-18', 1, 24, 35, 1, 3);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (333, NULL, 1, '2025-03-18', 1, 24, 35, 1, 3);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (334, NULL, 1, '2025-03-18', 1, 24, 30, 1, 3);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (335, NULL, 1, '2025-03-18', 1, 60, 32, 1, 3);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (336, NULL, 1, '2025-03-18', 1, 30, 29, 1, 3);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (337, NULL, 1, '2025-03-18', 1, 12, 30, 1, 3);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (338, NULL, 1, '2025-03-18', 1, 12, 30, 1, 3);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (339, NULL, 1, '2025-03-18', 1, 24, 30, 1, 3);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (340, NULL, 1, '2025-03-18', 1, 24, 32, 1, 3);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (341, NULL, 1, '2025-03-18', 1, 24, 23, 1, 3);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (342, NULL, 1, '2025-03-18', 1, 12, 15, 1, 3);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (343, NULL, 1, '2025-03-18', 1, 12, 14, 1, 3);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (344, NULL, 1, '2025-03-18', 1, 24, 32, 1, 3);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (345, NULL, 1, '2025-03-18', 1, 24, 32, 1, 3);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (346, NULL, 1, '2025-03-18', 1, 12, 30, 1, 3);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (347, NULL, 1, '2025-03-18', 1, 12, 29, 1, 3);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (348, NULL, 1, '2025-03-18', 1, 24, 15, 1, 3);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (349, NULL, 1, '2025-03-18', 1, 12, 23, 1, 3);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (350, NULL, 1, '2025-03-18', 1, 110, 12, 1, 3);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (351, NULL, 1, '2025-03-18', 1, 24, 32, 1, 3);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (352, NULL, 1, '2025-03-18', 1, 24, 32, 1, 3);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (353, NULL, 1, '2025-03-18', 1, 12, 32, 1, 3);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (354, NULL, 1, '2025-03-18', 1, 24, 18, 1, 3);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (355, NULL, 1, '2025-03-18', 1, 12, 32, 1, 3);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (356, NULL, 1, '2025-03-18', 1, 12, 18, 1, 3);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (357, NULL, 1, '2025-03-18', 1, 12, 15, 1, 3);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (358, NULL, 1, '2025-03-18', 1, 12, 15, 1, 3);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (359, NULL, 1, '2025-03-18', 1, 24, 32, 1, 3);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (360, NULL, 1, '2025-03-18', 1, 36, 29, 1, 3);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (361, NULL, 1, '2025-03-18', 1, 24, 20, 1, 3);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (362, NULL, 1, '2025-03-18', 1, 24, 33, 1, 3);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (363, NULL, 1, '2025-03-18', 1, 24, 30, 1, 3);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (364, NULL, 1, '2025-03-18', 1, 24, 33, 1, 3);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (365, NULL, 1, '2025-03-18', 1, 24, 33, 1, 3);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (366, NULL, 1, '2025-03-18', 1, 24, 33, 1, 3);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (367, NULL, 1, '2025-03-18', 1, 24, 32, 1, 3);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (368, NULL, 1, '2025-03-18', 1, 36, 32, 1, 3);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (369, NULL, 1, '2025-03-18', 1, 24, 32, 1, 3);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (370, NULL, 1, '2025-03-18', 1, 24, 32, 1, 3);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (371, NULL, 1, '2025-03-18', 1, 24, 32, 1, 3);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (372, NULL, 1, '2025-03-18', 1, 36, 32, 1, 3);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (373, NULL, 1, '2025-03-18', 1, 36, 32, 1, 3);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (374, NULL, 1, '2025-03-18', 1, 36, 30, 1, 3);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (375, NULL, 1, '2025-03-18', 1, 12, 32, 1, 3);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (376, NULL, 1, '2025-03-18', 1, 12, 32, 1, 3);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (377, NULL, 1, '2025-03-18', 1, 12, 30, 1, 3);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (378, NULL, 1, '2025-03-18', 1, 12, 32, 1, 3);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (379, NULL, 1, '2025-03-18', 1, 12, 32, 1, 3);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (380, NULL, 1, '2025-03-18', 1, 12, 32, 1, 3);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (381, NULL, 1, '2025-03-18', 1, 12, 32, 1, 3);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (382, NULL, 1, '2025-03-18', 1, 12, 32, 1, 3);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (383, NULL, 1, '2025-03-18', 1, 12, 32, 1, 3);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (384, NULL, 1, '2025-03-18', 1, 12, 32, 1, 3);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (385, NULL, 1, '2025-03-18', 1, 36, 15, 1, 3);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (386, NULL, 1, '2025-03-18', 1, 36, 30, 1, 3);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (387, NULL, 1, '2025-03-18', 1, 15, 22, 1, 3);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (388, NULL, 1, '2025-03-18', 1, 24, 30, 1, 3);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (389, NULL, 1, '2025-03-18', 1, 24, 29, 1, 3);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (390, NULL, 1, '2025-03-18', 1, 60, 32, 1, 3);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (391, NULL, 1, '2025-03-18', 1, 24, 32, 1, 3);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (392, NULL, 1, '2025-03-18', 1, 24, 32, 1, 3);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (250, NULL, 2, '2025-03-18', 1, 12, 21, 1, 1);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (251, NULL, 2, '2025-03-18', 1, 12, 30, 1, 1);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (252, NULL, 2, '2025-03-18', 1, 12, 23, 1, 1);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (253, NULL, 2, '2025-03-18', 1, 12, 33, 1, 1);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (254, NULL, 2, '2025-03-18', 1, 12, 33, 1, 1);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (255, NULL, 2, '2025-03-18', 1, 12, 33, 1, 1);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (256, NULL, 2, '2025-03-18', 1, 12, 33, 1, 1);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (257, NULL, 2, '2025-03-18', 1, 12, 33, 1, 1);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (258, NULL, 2, '2025-03-18', 1, 12, 33, 1, 1);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (259, NULL, 2, '2025-03-18', 1, 12, 33, 1, 1);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (260, NULL, 2, '2025-03-18', 1, 12, 24, 1, 1);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (261, NULL, 2, '2025-03-18', 1, 12, 29, 1, 1);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (262, NULL, 2, '2025-03-18', 1, 12, 24, 1, 1);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (263, NULL, 2, '2025-03-18', 1, 12, 30, 1, 1);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (264, NULL, 2, '2025-03-18', 1, 24, 30, 1, 1);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (265, NULL, 2, '2025-03-18', 1, 12, 32, 1, 1);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (266, NULL, 2, '2025-03-18', 1, 24, 32, 1, 1);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (267, NULL, 2, '2025-03-18', 1, 36, 32, 1, 1);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (268, NULL, 2, '2025-03-18', 1, 12, 32, 1, 1);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (269, NULL, 2, '2025-03-18', 1, 24, 32, 1, 1);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (270, NULL, 2, '2025-03-18', 1, 12, 32, 1, 1);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (271, NULL, 2, '2025-03-18', 1, 24, 32, 1, 1);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (272, NULL, 2, '2025-03-18', 1, 36, 32, 1, 1);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (273, NULL, 2, '2025-03-18', 1, 12, 32, 1, 1);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (274, NULL, 2, '2025-03-18', 1, 12, 32, 1, 1);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (275, NULL, 2, '2025-03-18', 1, 36, 30, 1, 1);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (276, NULL, 2, '2025-03-18', 1, 36, 35, 1, 1);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (277, NULL, 2, '2025-03-18', 1, 36, 35, 1, 1);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (278, NULL, 2, '2025-03-18', 1, 36, 35, 1, 1);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (279, NULL, 2, '2025-03-18', 1, 12, 35, 1, 1);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (280, NULL, 2, '2025-03-18', 1, 24, 32, 1, 1);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (281, NULL, 2, '2025-03-18', 1, 24, 35, 1, 1);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (282, NULL, 2, '2025-03-18', 1, 15, 29, 1, 1);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (283, NULL, 2, '2025-03-18', 1, 15, 29, 1, 1);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (284, NULL, 2, '2025-03-18', 1, 12, 30, 1, 1);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (285, NULL, 2, '2025-03-18', 1, 12, 32, 1, 1);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (286, NULL, 2, '2025-03-18', 1, 24, 33, 1, 1);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (287, NULL, 2, '2025-03-18', 1, 60, 30, 1, 1);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (288, NULL, 2, '2025-03-18', 1, 24, 30, 1, 1);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (289, NULL, 2, '2025-03-18', 1, 24, 23, 1, 1);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (290, NULL, 2, '2025-03-18', 1, 24, 30, 1, 1);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (291, NULL, 2, '2025-03-18', 1, 24, 32, 1, 1);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (292, NULL, 2, '2025-03-18', 1, 12, 35, 1, 1);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (293, NULL, 2, '2025-03-18', 1, 12, 35, 1, 1);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (294, NULL, 2, '2025-03-18', 1, 24, 32, 1, 1);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (295, NULL, 2, '2025-03-18', 1, 12, 32, 1, 1);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (296, NULL, 2, '2025-03-18', 1, 12, 32, 1, 1);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (297, NULL, 2, '2025-03-18', 1, 12, 35, 1, 1);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (298, NULL, 2, '2025-03-18', 1, 24, 30, 1, 1);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (299, NULL, 2, '2025-03-18', 1, 12, 35, 1, 1);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (300, NULL, 2, '2025-03-18', 1, 36, 32, 1, 1);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (301, NULL, 2, '2025-03-18', 1, 24, 32, 1, 1);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (302, NULL, 2, '2025-03-18', 1, 24, 35, 1, 1);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (303, NULL, 2, '2025-03-18', 1, 24, 35, 1, 1);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (304, NULL, 2, '2025-03-18', 1, 24, 35, 1, 1);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (305, NULL, 2, '2025-03-18', 1, 15, 29, 1, 1);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (306, NULL, 2, '2025-03-18', 1, 15, 29, 1, 1);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (307, NULL, 2, '2025-03-18', 1, 24, 35, 1, 1);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (308, NULL, 2, '2025-03-18', 1, 24, 35, 1, 1);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (309, NULL, 2, '2025-03-18', 1, 24, 30, 1, 1);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (310, NULL, 2, '2025-03-18', 1, 24, 30, 1, 1);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (311, NULL, 2, '2025-03-18', 1, 24, 21, 1, 1);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (312, NULL, 2, '2025-03-18', 1, 24, 35, 1, 1);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (313, NULL, 2, '2025-03-18', 1, 36, 30, 1, 1);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (314, NULL, 2, '2025-03-18', 1, 24, 27, 1, 1);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (315, NULL, 2, '2025-03-18', 1, 24, 23, 1, 1);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (316, NULL, 2, '2025-03-18', 1, 24, 23, 1, 1);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (317, NULL, 2, '2025-03-18', 1, 6, 29, 1, 1);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (318, NULL, 2, '2025-03-18', 1, 36, 30, 1, 1);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (319, NULL, 2, '2025-03-18', 1, 36, 30, 1, 1);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (320, NULL, 2, '2025-03-18', 1, 24, 30, 1, 1);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (321, NULL, 2, '2025-03-18', 1, 12, 30, 1, 1);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (322, NULL, 2, '2025-03-18', 1, 36, 32, 1, 1);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (323, NULL, 2, '2025-03-18', 1, 36, 32, 1, 1);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (324, NULL, 2, '2025-03-18', 1, 36, 32, 1, 1);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (325, NULL, 2, '2025-03-18', 1, 24, 32, 1, 1);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (326, NULL, 2, '2025-03-18', 1, 12, 35, 1, 1);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (327, NULL, 2, '2025-03-18', 1, 24, 35, 1, 1);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (328, NULL, 2, '2025-03-18', 1, 24, 35, 1, 1);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (329, NULL, 2, '2025-03-18', 1, 15, 29, 1, 1);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (330, NULL, 2, '2025-03-18', 1, 24, 35, 1, 1);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (331, NULL, 2, '2025-03-18', 1, 24, 35, 1, 1);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (332, NULL, 2, '2025-03-18', 1, 24, 35, 1, 1);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (333, NULL, 2, '2025-03-18', 1, 24, 35, 1, 1);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (334, NULL, 2, '2025-03-18', 1, 24, 30, 1, 1);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (335, NULL, 2, '2025-03-18', 1, 60, 32, 1, 1);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (336, NULL, 2, '2025-03-18', 1, 30, 29, 1, 1);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (337, NULL, 2, '2025-03-18', 1, 12, 30, 1, 1);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (338, NULL, 2, '2025-03-18', 1, 12, 30, 1, 1);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (339, NULL, 2, '2025-03-18', 1, 24, 30, 1, 1);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (340, NULL, 2, '2025-03-18', 1, 24, 32, 1, 1);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (341, NULL, 2, '2025-03-18', 1, 24, 23, 1, 1);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (342, NULL, 2, '2025-03-18', 1, 12, 15, 1, 1);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (343, NULL, 2, '2025-03-18', 1, 12, 14, 1, 1);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (344, NULL, 2, '2025-03-18', 1, 24, 32, 1, 1);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (345, NULL, 2, '2025-03-18', 1, 24, 32, 1, 1);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (346, NULL, 2, '2025-03-18', 1, 12, 30, 1, 1);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (347, NULL, 2, '2025-03-18', 1, 12, 29, 1, 1);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (348, NULL, 2, '2025-03-18', 1, 24, 15, 1, 1);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (349, NULL, 2, '2025-03-18', 1, 12, 23, 1, 1);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (350, NULL, 2, '2025-03-18', 1, 110, 12, 1, 1);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (351, NULL, 2, '2025-03-18', 1, 24, 32, 1, 1);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (352, NULL, 2, '2025-03-18', 1, 24, 32, 1, 1);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (353, NULL, 2, '2025-03-18', 1, 12, 32, 1, 1);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (354, NULL, 2, '2025-03-18', 1, 24, 18, 1, 1);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (355, NULL, 2, '2025-03-18', 1, 12, 32, 1, 1);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (356, NULL, 2, '2025-03-18', 1, 12, 18, 1, 1);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (357, NULL, 2, '2025-03-18', 1, 12, 15, 1, 1);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (358, NULL, 2, '2025-03-18', 1, 12, 15, 1, 1);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (359, NULL, 2, '2025-03-18', 1, 24, 32, 1, 1);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (360, NULL, 2, '2025-03-18', 1, 36, 29, 1, 1);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (361, NULL, 2, '2025-03-18', 1, 24, 20, 1, 1);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (362, NULL, 2, '2025-03-18', 1, 24, 33, 1, 1);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (363, NULL, 2, '2025-03-18', 1, 24, 30, 1, 1);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (364, NULL, 2, '2025-03-18', 1, 24, 33, 1, 1);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (365, NULL, 2, '2025-03-18', 1, 24, 33, 1, 1);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (366, NULL, 2, '2025-03-18', 1, 24, 33, 1, 1);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (367, NULL, 2, '2025-03-18', 1, 24, 32, 1, 1);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (368, NULL, 2, '2025-03-18', 1, 36, 32, 1, 1);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (369, NULL, 2, '2025-03-18', 1, 24, 32, 1, 1);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (370, NULL, 2, '2025-03-18', 1, 24, 32, 1, 1);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (371, NULL, 2, '2025-03-18', 1, 24, 32, 1, 1);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (372, NULL, 2, '2025-03-18', 1, 36, 32, 1, 1);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (373, NULL, 2, '2025-03-18', 1, 36, 32, 1, 1);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (374, NULL, 2, '2025-03-18', 1, 36, 30, 1, 1);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (375, NULL, 2, '2025-03-18', 1, 12, 32, 1, 1);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (376, NULL, 2, '2025-03-18', 1, 12, 32, 1, 1);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (377, NULL, 2, '2025-03-18', 1, 12, 30, 1, 1);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (378, NULL, 2, '2025-03-18', 1, 12, 32, 1, 1);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (379, NULL, 2, '2025-03-18', 1, 12, 32, 1, 1);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (380, NULL, 2, '2025-03-18', 1, 12, 32, 1, 1);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (381, NULL, 2, '2025-03-18', 1, 12, 32, 1, 1);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (382, NULL, 2, '2025-03-18', 1, 12, 32, 1, 1);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (383, NULL, 2, '2025-03-18', 1, 12, 32, 1, 1);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (384, NULL, 2, '2025-03-18', 1, 12, 32, 1, 1);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (385, NULL, 2, '2025-03-18', 1, 36, 15, 1, 1);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (386, NULL, 2, '2025-03-18', 1, 36, 30, 1, 1);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (387, NULL, 2, '2025-03-18', 1, 15, 22, 1, 1);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (388, NULL, 2, '2025-03-18', 1, 24, 30, 1, 1);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (389, NULL, 2, '2025-03-18', 1, 24, 29, 1, 1);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (390, NULL, 2, '2025-03-18', 1, 60, 32, 1, 1);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (391, NULL, 2, '2025-03-18', 1, 24, 32, 1, 1);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (392, NULL, 2, '2025-03-18', 1, 24, 32, 1, 1);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (42, NULL, 1, '2025-03-18', 1, 24, 9, 1, 5);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (43, NULL, 1, '2025-03-18', 1, 24, 14, 1, 5);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (44, NULL, 1, '2025-03-18', 1, 36, 12, 1, 5);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (45, NULL, 1, '2025-03-18', 1, 6, 15, 1, 5);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (46, NULL, 1, '2025-03-18', 1, 36, 9, 1, 5);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (47, NULL, 1, '2025-03-18', 1, 12, 11, 1, 5);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (48, NULL, 1, '2025-03-18', 1, 24, 6, 1, 5);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (49, NULL, 1, '2025-03-18', 1, 24, 6, 1, 5);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (50, NULL, 1, '2025-03-18', 1, 24, 8, 1, 5);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (51, NULL, 1, '2025-03-18', 1, 24, 7, 1, 5);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (52, NULL, 1, '2025-03-18', 1, 24, 8, 1, 5);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (53, NULL, 1, '2025-03-18', 1, 24, 6, 1, 5);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (54, NULL, 1, '2025-03-18', 1, 24, 6, 1, 5);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (55, NULL, 1, '2025-03-18', 1, 12, 20, 1, 5);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (56, NULL, 1, '2025-03-18', 1, 12, 15, 1, 5);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (57, NULL, 1, '2025-03-18', 1, 6, 15, 1, 5);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (58, NULL, 1, '2025-03-18', 1, 24, 11, 1, 5);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (59, NULL, 1, '2025-03-18', 1, 24, 8, 1, 5);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (60, NULL, 1, '2025-03-18', 1, 24, 9, 1, 5);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (61, NULL, 1, '2025-03-18', 1, 18, 6, 1, 5);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (62, NULL, 1, '2025-03-18', 1, 24, 11, 1, 5);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (63, NULL, 1, '2025-03-18', 1, 24, 15, 1, 5);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (64, NULL, 1, '2025-03-18', 1, 12, 18, 1, 5);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (65, NULL, 1, '2025-03-18', 1, 24, 18, 1, 5);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (66, NULL, 1, '2025-03-18', 1, 24, 9, 1, 5);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (67, NULL, 1, '2025-03-18', 1, 36, 6, 1, 5);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (68, NULL, 1, '2025-03-18', 1, 36, 6, 1, 5);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (69, NULL, 1, '2025-03-18', 1, 6, 15, 1, 5);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (70, NULL, 1, '2025-03-18', 1, 24, 9, 1, 5);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (71, NULL, 1, '2025-03-18', 1, 24, 9, 1, 5);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (72, NULL, 1, '2025-03-18', 1, 24, 9, 1, 5);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (73, NULL, 1, '2025-03-18', 1, 24, 9, 1, 5);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (74, NULL, 1, '2025-03-18', 1, 12, 14, 1, 5);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (75, NULL, 1, '2025-03-18', 1, 24, 8, 1, 5);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (76, NULL, 1, '2025-03-18', 1, 24, 9, 1, 5);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (77, NULL, 1, '2025-03-18', 1, 24, 11, 1, 5);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (78, NULL, 1, '2025-03-18', 1, 24, 9, 1, 5);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (79, NULL, 1, '2025-03-18', 1, 24, 9, 1, 5);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (80, NULL, 1, '2025-03-18', 1, 24, 9, 1, 5);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (81, NULL, 1, '2025-03-18', 1, 24, 6, 1, 5);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (82, NULL, 1, '2025-03-18', 1, 24, 9, 1, 5);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (83, NULL, 1, '2025-03-18', 1, 24, 9, 1, 5);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (84, NULL, 1, '2025-03-18', 1, 24, 6, 1, 5);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (85, NULL, 1, '2025-03-18', 1, 24, 9, 1, 5);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (86, NULL, 1, '2025-03-18', 1, 24, 9, 1, 5);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (87, NULL, 1, '2025-03-18', 1, 24, 9, 1, 5);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (88, NULL, 1, '2025-03-18', 1, 24, 9, 1, 5);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (89, NULL, 1, '2025-03-18', 1, 24, 6, 1, 5);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (90, NULL, 1, '2025-03-18', 1, 24, 6, 1, 5);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (91, NULL, 1, '2025-03-18', 1, 24, 9, 1, 5);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (92, NULL, 1, '2025-03-18', 1, 24, 9, 1, 5);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (93, NULL, 1, '2025-03-18', 1, 24, 9, 1, 5);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (94, NULL, 1, '2025-03-18', 1, 24, 6, 1, 5);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (95, NULL, 1, '2025-03-18', 1, 24, 9, 1, 5);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (96, NULL, 1, '2025-03-18', 1, 24, 9, 1, 5);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (97, NULL, 1, '2025-03-18', 1, 24, 6, 1, 5);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (98, NULL, 1, '2025-03-18', 1, 24, 9, 1, 5);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (99, NULL, 1, '2025-03-18', 1, 24, 6, 1, 5);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (100, NULL, 1, '2025-03-18', 1, 24, 9, 1, 5);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (101, NULL, 1, '2025-03-18', 1, 24, 9, 1, 5);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (102, NULL, 1, '2025-03-18', 1, 24, 6, 1, 5);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (103, NULL, 1, '2025-03-18', 1, 24, 9, 1, 5);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (104, NULL, 1, '2025-03-18', 1, 24, 9, 1, 5);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (105, NULL, 1, '2025-03-18', 1, 24, 9, 1, 5);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (106, NULL, 1, '2025-03-18', 1, 24, 6, 1, 5);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (107, NULL, 1, '2025-03-18', 1, 24, 6, 1, 5);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (108, NULL, 1, '2025-03-18', 1, 24, 6, 1, 5);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (109, NULL, 1, '2025-03-18', 1, 24, 6, 1, 5);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (110, NULL, 1, '2025-03-18', 1, 24, 9, 1, 5);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (111, NULL, 1, '2025-03-18', 1, 24, 6, 1, 5);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (112, NULL, 1, '2025-03-18', 1, 24, 9, 1, 5);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (113, NULL, 1, '2025-03-18', 1, 24, 6, 1, 5);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (114, NULL, 1, '2025-03-18', 1, 24, 9, 1, 5);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (115, NULL, 1, '2025-03-18', 1, 24, 9, 1, 5);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (116, NULL, 1, '2025-03-18', 1, 24, 9, 1, 5);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (117, NULL, 1, '2025-03-18', 1, 24, 11, 1, 5);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (118, NULL, 1, '2025-03-18', 1, 15, 6, 1, 5);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (119, NULL, 1, '2025-03-18', 1, 24, 13, 1, 5);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (120, NULL, 1, '2025-03-18', 1, 6, 7, 1, 5);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (121, NULL, 1, '2025-03-18', 1, 24, 6, 1, 5);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (122, NULL, 1, '2025-03-18', 1, 24, 9, 1, 5);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (123, NULL, 1, '2025-03-18', 1, 24, 6, 1, 5);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (124, NULL, 1, '2025-03-18', 1, 24, 8, 1, 5);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (125, NULL, 1, '2025-03-18', 1, 24, 9, 1, 5);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (126, NULL, 1, '2025-03-18', 1, 6, 15, 1, 5);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (127, NULL, 1, '2025-03-18', 1, 12, 20, 1, 5);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (128, NULL, 1, '2025-03-18', 1, 24, 6, 1, 5);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (129, NULL, 1, '2025-03-18', 1, 24, 7, 1, 5);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (130, NULL, 1, '2025-03-18', 1, 24, 6, 1, 5);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (131, NULL, 1, '2025-03-18', 1, 24, 6, 1, 5);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (132, NULL, 1, '2025-03-18', 1, 24, 6, 1, 5);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (133, NULL, 1, '2025-03-18', 1, 24, 12, 1, 5);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (134, NULL, 1, '2025-03-18', 1, 24, 6, 1, 5);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (135, NULL, 1, '2025-03-18', 1, 24, 6, 1, 5);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (136, NULL, 1, '2025-03-18', 1, 24, 9, 1, 5);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (137, NULL, 1, '2025-03-18', 1, 24, 9, 1, 5);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (138, NULL, 1, '2025-03-18', 1, 24, 7, 1, 5);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (139, NULL, 1, '2025-03-18', 1, 24, 6, 1, 5);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (140, NULL, 1, '2025-03-18', 1, 24, 6, 1, 5);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (141, NULL, 1, '2025-03-18', 1, 24, 6, 1, 5);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (142, NULL, 1, '2025-03-18', 1, 24, 6, 1, 5);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (143, NULL, 1, '2025-03-18', 1, 24, 6, 1, 5);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (144, NULL, 1, '2025-03-18', 1, 24, 9, 1, 5);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (145, NULL, 1, '2025-03-18', 1, 24, 9, 1, 5);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (146, NULL, 1, '2025-03-18', 1, 24, 9, 1, 5);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (147, NULL, 1, '2025-03-18', 1, 24, 6, 1, 5);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (148, NULL, 1, '2025-03-18', 1, 24, 6, 1, 5);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (149, NULL, 1, '2025-03-18', 1, 24, 6, 1, 5);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (150, NULL, 1, '2025-03-18', 1, 24, 6, 1, 5);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (151, NULL, 1, '2025-03-18', 1, 24, 6, 1, 5);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (152, NULL, 1, '2025-03-18', 1, 24, 9, 1, 5);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (153, NULL, 1, '2025-03-18', 1, 24, 6, 1, 5);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (154, NULL, 1, '2025-03-18', 1, 24, 9, 1, 5);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (155, NULL, 1, '2025-03-18', 1, 24, 9, 1, 5);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (156, NULL, 1, '2025-03-18', 1, 24, 9, 1, 5);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (157, NULL, 1, '2025-03-18', 1, 24, 6, 1, 5);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (158, NULL, 1, '2025-03-18', 1, 24, 7, 1, 5);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (159, NULL, 1, '2025-03-18', 1, 24, 6, 1, 5);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (160, NULL, 1, '2025-03-18', 1, 36, 6, 1, 5);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (161, NULL, 1, '2025-03-18', 1, 36, 6, 1, 5);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (162, NULL, 1, '2025-03-18', 1, 24, 7, 1, 5);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (163, NULL, 1, '2025-03-18', 1, 24, 7, 1, 5);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (164, NULL, 1, '2025-03-18', 1, 24, 9, 1, 5);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (165, NULL, 1, '2025-03-18', 1, 24, 9, 1, 5);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (166, NULL, 1, '2025-03-18', 1, 24, 9, 1, 5);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (167, NULL, 1, '2025-03-18', 1, 24, 11, 1, 5);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (168, NULL, 1, '2025-03-18', 1, 24, 9, 1, 5);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (169, NULL, 1, '2025-03-18', 1, 6, 17, 1, 5);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (170, NULL, 1, '2025-03-18', 1, 24, 9, 1, 5);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (171, NULL, 1, '2025-03-18', 1, 24, 6, 1, 5);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (172, NULL, 1, '2025-03-18', 1, 12, 18, 1, 5);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (173, NULL, 1, '2025-03-18', 1, 24, 9, 1, 5);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (174, NULL, 1, '2025-03-18', 1, 24, 7, 1, 5);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (175, NULL, 1, '2025-03-18', 1, 24, 7, 1, 5);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (176, NULL, 1, '2025-03-18', 1, 24, 10, 1, 5);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (177, NULL, 1, '2025-03-18', 1, 24, 6, 1, 5);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (178, NULL, 1, '2025-03-18', 1, 24, 6, 1, 5);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (179, NULL, 1, '2025-03-18', 1, 24, 9, 1, 5);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (180, NULL, 1, '2025-03-18', 1, 24, 6, 1, 5);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (181, NULL, 1, '2025-03-18', 1, 24, 15, 1, 5);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (182, NULL, 1, '2025-03-18', 1, 24, 7, 1, 5);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (183, NULL, 1, '2025-03-18', 1, 24, 6, 1, 5);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (184, NULL, 1, '2025-03-18', 1, 24, 7, 1, 5);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (185, NULL, 1, '2025-03-18', 1, 24, 9, 1, 5);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (186, NULL, 1, '2025-03-18', 1, 24, 6, 1, 5);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (187, NULL, 1, '2025-03-18', 1, 24, 9, 1, 5);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (188, NULL, 1, '2025-03-18', 1, 24, 9, 1, 5);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (189, NULL, 1, '2025-03-18', 1, 24, 9, 1, 5);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (190, NULL, 1, '2025-03-18', 1, 24, 7, 1, 5);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (191, NULL, 1, '2025-03-18', 1, 24, 7, 1, 5);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (192, NULL, 1, '2025-03-18', 1, 24, 7, 1, 5);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (193, NULL, 1, '2025-03-18', 1, 24, 7, 1, 5);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (194, NULL, 1, '2025-03-18', 1, 20, 14, 1, 5);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (195, NULL, 1, '2025-03-18', 1, 36, 9, 1, 5);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (196, NULL, 1, '2025-03-18', 1, 24, 11, 1, 5);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (197, NULL, 1, '2025-03-18', 1, 24, 7, 1, 5);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (198, NULL, 1, '2025-03-18', 1, 20, 14, 1, 5);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (199, NULL, 1, '2025-03-18', 1, 36, 9, 1, 5);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (200, NULL, 1, '2025-03-18', 1, 24, 6, 1, 5);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (201, NULL, 1, '2025-03-18', 1, 24, 6, 1, 5);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (202, NULL, 1, '2025-03-18', 1, 6, 19, 1, 5);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (203, NULL, 1, '2025-03-18', 1, 6, 15, 1, 5);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (204, NULL, 1, '2025-03-18', 1, 15, 6, 1, 5);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (205, NULL, 1, '2025-03-18', 1, 20, 6, 1, 5);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (206, NULL, 1, '2025-03-18', 1, 24, 6, 1, 5);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (207, NULL, 1, '2025-03-18', 1, 24, 6, 1, 5);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (208, NULL, 1, '2025-03-18', 1, 12, 18, 1, 5);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (209, NULL, 1, '2025-03-18', 1, 12, 12, 1, 5);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (42, NULL, 2, '2025-03-18', 1, 24, 9, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (43, NULL, 2, '2025-03-18', 1, 24, 14, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (44, NULL, 2, '2025-03-18', 1, 36, 12, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (45, NULL, 2, '2025-03-18', 1, 6, 15, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (46, NULL, 2, '2025-03-18', 1, 36, 9, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (47, NULL, 2, '2025-03-18', 1, 12, 11, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (48, NULL, 2, '2025-03-18', 1, 24, 6, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (49, NULL, 2, '2025-03-18', 1, 24, 6, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (50, NULL, 2, '2025-03-18', 1, 24, 8, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (51, NULL, 2, '2025-03-18', 1, 24, 7, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (52, NULL, 2, '2025-03-18', 1, 24, 8, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (53, NULL, 2, '2025-03-18', 1, 24, 6, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (54, NULL, 2, '2025-03-18', 1, 24, 6, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (55, NULL, 2, '2025-03-18', 1, 12, 20, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (56, NULL, 2, '2025-03-18', 1, 12, 15, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (57, NULL, 2, '2025-03-18', 1, 6, 15, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (58, NULL, 2, '2025-03-18', 1, 24, 11, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (59, NULL, 2, '2025-03-18', 1, 24, 8, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (60, NULL, 2, '2025-03-18', 1, 24, 9, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (61, NULL, 2, '2025-03-18', 1, 18, 6, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (62, NULL, 2, '2025-03-18', 1, 24, 11, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (63, NULL, 2, '2025-03-18', 1, 24, 15, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (64, NULL, 2, '2025-03-18', 1, 12, 18, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (65, NULL, 2, '2025-03-18', 1, 24, 18, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (66, NULL, 2, '2025-03-18', 1, 24, 9, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (67, NULL, 2, '2025-03-18', 1, 36, 6, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (68, NULL, 2, '2025-03-18', 1, 36, 6, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (69, NULL, 2, '2025-03-18', 1, 6, 15, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (70, NULL, 2, '2025-03-18', 1, 24, 9, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (71, NULL, 2, '2025-03-18', 1, 24, 9, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (72, NULL, 2, '2025-03-18', 1, 24, 9, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (73, NULL, 2, '2025-03-18', 1, 24, 9, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (74, NULL, 2, '2025-03-18', 1, 12, 14, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (75, NULL, 2, '2025-03-18', 1, 24, 8, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (76, NULL, 2, '2025-03-18', 1, 24, 9, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (77, NULL, 2, '2025-03-18', 1, 24, 11, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (78, NULL, 2, '2025-03-18', 1, 24, 9, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (79, NULL, 2, '2025-03-18', 1, 24, 9, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (80, NULL, 2, '2025-03-18', 1, 24, 9, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (81, NULL, 2, '2025-03-18', 1, 24, 6, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (82, NULL, 2, '2025-03-18', 1, 24, 9, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (83, NULL, 2, '2025-03-18', 1, 24, 9, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (84, NULL, 2, '2025-03-18', 1, 24, 6, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (85, NULL, 2, '2025-03-18', 1, 24, 9, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (86, NULL, 2, '2025-03-18', 1, 24, 9, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (87, NULL, 2, '2025-03-18', 1, 24, 9, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (88, NULL, 2, '2025-03-18', 1, 24, 9, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (89, NULL, 2, '2025-03-18', 1, 24, 6, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (90, NULL, 2, '2025-03-18', 1, 24, 6, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (91, NULL, 2, '2025-03-18', 1, 24, 9, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (92, NULL, 2, '2025-03-18', 1, 24, 9, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (93, NULL, 2, '2025-03-18', 1, 24, 9, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (94, NULL, 2, '2025-03-18', 1, 24, 6, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (95, NULL, 2, '2025-03-18', 1, 24, 9, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (96, NULL, 2, '2025-03-18', 1, 24, 9, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (97, NULL, 2, '2025-03-18', 1, 24, 6, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (98, NULL, 2, '2025-03-18', 1, 24, 9, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (99, NULL, 2, '2025-03-18', 1, 24, 6, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (100, NULL, 2, '2025-03-18', 1, 24, 9, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (101, NULL, 2, '2025-03-18', 1, 24, 9, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (102, NULL, 2, '2025-03-18', 1, 24, 6, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (103, NULL, 2, '2025-03-18', 1, 24, 9, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (104, NULL, 2, '2025-03-18', 1, 24, 9, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (105, NULL, 2, '2025-03-18', 1, 24, 9, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (106, NULL, 2, '2025-03-18', 1, 24, 6, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (107, NULL, 2, '2025-03-18', 1, 24, 6, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (108, NULL, 2, '2025-03-18', 1, 24, 6, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (109, NULL, 2, '2025-03-18', 1, 24, 6, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (110, NULL, 2, '2025-03-18', 1, 24, 9, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (111, NULL, 2, '2025-03-18', 1, 24, 6, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (112, NULL, 2, '2025-03-18', 1, 24, 9, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (113, NULL, 2, '2025-03-18', 1, 24, 6, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (114, NULL, 2, '2025-03-18', 1, 24, 9, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (115, NULL, 2, '2025-03-18', 1, 24, 9, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (116, NULL, 2, '2025-03-18', 1, 24, 9, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (117, NULL, 2, '2025-03-18', 1, 24, 11, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (118, NULL, 2, '2025-03-18', 1, 15, 6, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (119, NULL, 2, '2025-03-18', 1, 24, 13, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (120, NULL, 2, '2025-03-18', 1, 6, 7, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (121, NULL, 2, '2025-03-18', 1, 24, 6, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (122, NULL, 2, '2025-03-18', 1, 24, 9, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (123, NULL, 2, '2025-03-18', 1, 24, 6, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (124, NULL, 2, '2025-03-18', 1, 24, 8, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (125, NULL, 2, '2025-03-18', 1, 24, 9, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (126, NULL, 2, '2025-03-18', 1, 6, 15, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (127, NULL, 2, '2025-03-18', 1, 12, 20, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (128, NULL, 2, '2025-03-18', 1, 24, 6, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (129, NULL, 2, '2025-03-18', 1, 24, 7, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (130, NULL, 2, '2025-03-18', 1, 24, 6, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (131, NULL, 2, '2025-03-18', 1, 24, 6, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (132, NULL, 2, '2025-03-18', 1, 24, 6, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (133, NULL, 2, '2025-03-18', 1, 24, 12, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (134, NULL, 2, '2025-03-18', 1, 24, 6, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (135, NULL, 2, '2025-03-18', 1, 24, 6, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (136, NULL, 2, '2025-03-18', 1, 24, 9, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (137, NULL, 2, '2025-03-18', 1, 24, 9, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (138, NULL, 2, '2025-03-18', 1, 24, 7, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (139, NULL, 2, '2025-03-18', 1, 24, 6, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (140, NULL, 2, '2025-03-18', 1, 24, 6, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (141, NULL, 2, '2025-03-18', 1, 24, 6, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (142, NULL, 2, '2025-03-18', 1, 24, 6, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (143, NULL, 2, '2025-03-18', 1, 24, 6, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (144, NULL, 2, '2025-03-18', 1, 24, 9, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (145, NULL, 2, '2025-03-18', 1, 24, 9, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (146, NULL, 2, '2025-03-18', 1, 24, 9, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (147, NULL, 2, '2025-03-18', 1, 24, 6, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (148, NULL, 2, '2025-03-18', 1, 24, 6, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (149, NULL, 2, '2025-03-18', 1, 24, 6, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (150, NULL, 2, '2025-03-18', 1, 24, 6, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (151, NULL, 2, '2025-03-18', 1, 24, 6, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (152, NULL, 2, '2025-03-18', 1, 24, 9, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (153, NULL, 2, '2025-03-18', 1, 24, 6, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (154, NULL, 2, '2025-03-18', 1, 24, 9, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (155, NULL, 2, '2025-03-18', 1, 24, 9, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (156, NULL, 2, '2025-03-18', 1, 24, 9, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (157, NULL, 2, '2025-03-18', 1, 24, 6, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (158, NULL, 2, '2025-03-18', 1, 24, 7, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (159, NULL, 2, '2025-03-18', 1, 24, 6, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (160, NULL, 2, '2025-03-18', 1, 36, 6, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (161, NULL, 2, '2025-03-18', 1, 36, 6, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (162, NULL, 2, '2025-03-18', 1, 24, 7, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (163, NULL, 2, '2025-03-18', 1, 24, 7, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (164, NULL, 2, '2025-03-18', 1, 24, 9, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (165, NULL, 2, '2025-03-18', 1, 24, 9, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (166, NULL, 2, '2025-03-18', 1, 24, 9, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (167, NULL, 2, '2025-03-18', 1, 24, 11, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (168, NULL, 2, '2025-03-18', 1, 24, 9, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (169, NULL, 2, '2025-03-18', 1, 6, 17, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (170, NULL, 2, '2025-03-18', 1, 24, 9, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (171, NULL, 2, '2025-03-18', 1, 24, 6, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (172, NULL, 2, '2025-03-18', 1, 12, 18, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (173, NULL, 2, '2025-03-18', 1, 24, 9, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (174, NULL, 2, '2025-03-18', 1, 24, 7, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (175, NULL, 2, '2025-03-18', 1, 24, 7, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (176, NULL, 2, '2025-03-18', 1, 24, 10, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (177, NULL, 2, '2025-03-18', 1, 24, 6, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (178, NULL, 2, '2025-03-18', 1, 24, 6, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (179, NULL, 2, '2025-03-18', 1, 24, 9, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (180, NULL, 2, '2025-03-18', 1, 24, 6, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (181, NULL, 2, '2025-03-18', 1, 24, 15, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (182, NULL, 2, '2025-03-18', 1, 24, 7, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (183, NULL, 2, '2025-03-18', 1, 24, 6, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (184, NULL, 2, '2025-03-18', 1, 24, 7, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (185, NULL, 2, '2025-03-18', 1, 24, 9, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (186, NULL, 2, '2025-03-18', 1, 24, 6, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (187, NULL, 2, '2025-03-18', 1, 24, 9, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (188, NULL, 2, '2025-03-18', 1, 24, 9, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (189, NULL, 2, '2025-03-18', 1, 24, 9, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (190, NULL, 2, '2025-03-18', 1, 24, 7, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (191, NULL, 2, '2025-03-18', 1, 24, 7, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (192, NULL, 2, '2025-03-18', 1, 24, 7, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (193, NULL, 2, '2025-03-18', 1, 24, 7, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (194, NULL, 2, '2025-03-18', 1, 20, 14, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (195, NULL, 2, '2025-03-18', 1, 36, 9, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (196, NULL, 2, '2025-03-18', 1, 24, 11, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (197, NULL, 2, '2025-03-18', 1, 24, 7, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (198, NULL, 2, '2025-03-18', 1, 20, 14, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (199, NULL, 2, '2025-03-18', 1, 36, 9, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (200, NULL, 2, '2025-03-18', 1, 24, 6, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (201, NULL, 2, '2025-03-18', 1, 24, 6, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (202, NULL, 2, '2025-03-18', 1, 6, 19, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (203, NULL, 2, '2025-03-18', 1, 6, 15, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (204, NULL, 2, '2025-03-18', 1, 15, 6, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (205, NULL, 2, '2025-03-18', 1, 20, 6, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (206, NULL, 2, '2025-03-18', 1, 24, 6, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (207, NULL, 2, '2025-03-18', 1, 24, 6, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (208, NULL, 2, '2025-03-18', 1, 12, 18, 1, 2);
INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu) VALUES (209, NULL, 2, '2025-03-18', 1, 12, 12, 1, 2);


-- Příjem
-- INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu)
-- VALUES (1, NULL, 1, CURRENT_TIMESTAMP, 1, 10, 100.0, (SELECT id FROM Meny WHERE ISO_kod_meny = 'CZK'), 50);

-- Přesun
-- INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu)
--  VALUES (1, 1, 2, CURRENT_TIMESTAMP, 3, 10, 100.0, (SELECT id FROM Meny WHERE ISO_kod_meny = 'CZK'), 50);

-- Výdej
-- INSERT INTO Pohyby_Zasob (produkt_id, odchozi_sklad_id, cilovy_sklad_id, datum_pohybu, typ_pohybu, pocet_kusu_v_baleni, cena_za_kus, mena_id, pocet_baliku_v_pohybu)
-- VALUES (1, 2, NULL, CURRENT_TIMESTAMP, 2, 10, 100.0, (SELECT id FROM Meny WHERE ISO_kod_meny = 'CZK'), 50);
-- Vytvoření tabulky pro měření


-- Chỉ mục cho bảng Pohyby_Zasob
CREATE INDEX idx_produkt_sklad ON Pohyby_Zasob(produkt_id, odchozi_sklad_id, cilovy_sklad_id);
CREATE INDEX idx_pohyby_datum ON Pohyby_Zasob(datum_pohybu);
CREATE INDEX idx_pohyby_typ ON Pohyby_Zasob(typ_pohybu);

-- Chỉ mục cho bảng Zasoby_Produktu
CREATE INDEX idx_zasoby_produkt_sklad ON Zasoby_Produktu(produkt_id, sklad_id);

-- Chỉ mục cho bảng Produkty
CREATE INDEX idx_produkty_kod ON Produkty(kod_produktu);
CREATE INDEX idx_produkty_znacka ON Produkty(znacka_vyrobce_id);
CREATE INDEX idx_produkty_zeme_puvodu ON Produkty(zeme_puvodu_id);

