CREATE SCHEMA IF NOT EXISTS public;

-- CREATE DATABASE IF NOT EXISTS firma;

\c firma;

CREATE TABLE Zeme_puvodu (
    id SERIAL PRIMARY KEY,
    nazev VARCHAR(50) NOT NULL UNIQUE
);
INSERT INTO Zeme_puvodu (nazev) VALUES 
('Vietnam'),
('Čína'),
('Thajsko'),
('Indie'),
('Kambodža'),
('Turecko'),
('Brazílie'),
('Itálie'),
('Španělsko'),
('Portugalsko'),
('Polsko'),
('Německo');

-- Vytvoření tabulky pro značky výrobců
CREATE TABLE Znacky_vyrobce (
    id SERIAL PRIMARY KEY,
    nazev VARCHAR(50) NOT NULL UNIQUE
);
INSERT INTO Znacky_vyrobce (nazev) VALUES 
('Test Znacka'),
('Abibas'),
('Naik'),
('Fuma'),
('The Huge Mountain'),
('Dolce&Banana');

-- Vytvoření tabulky pro kategorie
CREATE TABLE Kategorie (
    id SERIAL PRIMARY KEY,
    nazev VARCHAR(50) NOT NULL UNIQUE
);

INSERT INTO Kategorie (nazev) VALUES 
('Trička'),
('Kalhoty'),
('Legíny'),
('Mikiny'),
('Bundy'),
('Sukně'),
('Šaty'),
('Doplňky'),
('Obuv'),
('Spodní prádlo');


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
('Euro', 'EUR', '€'),
('Americký dolar', 'USD', '$'),
('Britská libra', 'GBP', '£'),
('Japonský jen', 'JPY', '¥'),
('Švýcarský frank', 'CHF', 'Fr.'),
('Kanadský dolar', 'CAD', '$'),
('Australský dolar', 'AUD', '$'),
('Novozélandský dolar', 'NZD', '$');

CREATE TABLE Kurzy_Meny (
    id SERIAL PRIMARY KEY,
    mena_z_id INT NOT NULL,     -- Např. EUR
    mena_do_id INT NOT NULL,    -- Např. CZK
    kurz DECIMAL(10, 4) NOT NULL, -- Např. 1 CZK = 0.0417 EUR
    datum_kurzu DATE NOT NULL DEFAULT CURRENT_DATE,
    FOREIGN KEY (mena_z_id) REFERENCES Meny(id),
    FOREIGN KEY (mena_do_id) REFERENCES Meny(id)
);

INSERT INTO Kurzy_Meny (mena_z_id, mena_do_id, kurz, datum_kurzu)
VALUES 
    ((SELECT id FROM Meny WHERE ISO_kod_meny = 'EUR'), 
     (SELECT id FROM Meny WHERE ISO_kod_meny = 'CZK'), 
     25.035, '2025-03-18');

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

CREATE TABLE Zasoby_Produktu ( 
    id SERIAL PRIMARY KEY,              
    produkt_id INT NOT NULL,             
    sklad_id INT NOT NULL,               
    pocet_kusu_v_baleni INT NOT NULL,    
	cena_za_kus FLOAT NOT NULL,          
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

DO $$
DECLARE
    i INT := 0;
    novy_produkt_id INT;
BEGIN
    WHILE i < 10000 LOOP
        -- Vložení produktu
        INSERT INTO Produkty (
            nazev, kod_produktu, kategorie_id, zeme_puvodu_id, znacka_vyrobce_id
        )
        VALUES (
            'PROD-TEST' || i,
            'PROD-TEST' || i,
            1,  
            1, 
            1  
        )
        RETURNING id INTO novy_produkt_id;

        -- Vložení pohybu zásob
        INSERT INTO Pohyby_Zasob (
            produkt_id,
            cilovy_sklad_id,
            datum_pohybu,
            typ_pohybu,
            pocet_kusu_v_baleni,
            cena_za_kus,
            mena_id,
            pocet_baliku_v_pohybu
        )
        VALUES (
            novy_produkt_id,
            1,
            CURRENT_DATE,  -- nebo NOW() pokud je sloupec typu TIMESTAMP
            1,             -- nebo 'PRIJEM' podle typu sloupce
            10,
            9.99,
            1,
            10
        );

        i := i + 1;
    END LOOP;
END $$;

CREATE INDEX idx_produkt_sklad ON Pohyby_Zasob(produkt_id, odchozi_sklad_id, cilovy_sklad_id);
CREATE INDEX idx_pohyby_datum ON Pohyby_Zasob(datum_pohybu);
CREATE INDEX idx_pohyby_typ ON Pohyby_Zasob(typ_pohybu);

CREATE INDEX idx_zasoby_produkt_sklad ON Zasoby_Produktu(produkt_id, sklad_id);

CREATE INDEX idx_produkty_kod ON Produkty(kod_produktu);
CREATE INDEX idx_produkty_znacka ON Produkty(znacka_vyrobce_id);
CREATE INDEX idx_produkty_zeme_puvodu ON Produkty(zeme_puvodu_id);

