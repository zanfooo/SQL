

CREATE TABLE produttori (
    id_produttore SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    paese VARCHAR(50),
    anno_fondazione INT
);


CREATE TABLE standard_wifi (
    id_standard SERIAL PRIMARY KEY,
    nome_standard VARCHAR(50) NOT NULL,
    ieee VARCHAR(20),
    banda_supportata VARCHAR(100),
    velocita_massima_mbps INT,
    anno_introduzione INT,
    obsoleto BOOLEAN
);


CREATE TABLE access_point (
    id_access_point SERIAL PRIMARY KEY,
    modello VARCHAR(100) NOT NULL,
    id_produttore INT NOT NULL,
    id_standard INT NOT NULL,
    porte_ethernet INT,
    supporto_poe BOOLEAN,
    prezzo_euro DECIMAL(8,2),
    anno_produzione INT,
    FOREIGN KEY (id_produttore) REFERENCES produttori(id_produttore),
    FOREIGN KEY (id_standard) REFERENCES standard_wifi(id_standard)
);


INSERT INTO produttori (nome, paese, anno_fondazione) VALUES
('Cisco', 'USA', 1984),
('TP-Link', 'Cina', 1996),
('Netgear', 'USA', 1996),
('Ubiquiti', 'USA', 2005),
('D-Link', 'Taiwan', 1986),
('Asus', 'Taiwan', 1989),
('Linksys', 'USA', 1988),
('Huawei', 'Cina', 1987);


INSERT INTO standard_wifi
(nome_standard, ieee, banda_supportata, velocita_massima_mbps, anno_introduzione, obsoleto)
VALUES
('Wi-Fi 1', '802.11', '2.4 GHz', 2, 1997, TRUE),
('Wi-Fi 2', '802.11b', '2.4 GHz', 11, 1999, TRUE),
('Wi-Fi 3', '802.11a', '5 GHz', 54, 1999, TRUE),
('Wi-Fi 4', '802.11g', '2.4 GHz', 54, 2003, TRUE),
('Wi-Fi 4', '802.11n', '2.4 / 5 GHz', 600, 2009, FALSE),
('Wi-Fi 5', '802.11ac', '5 GHz', 3466, 2014, FALSE),
('Wi-Fi 6', '802.11ax', '2.4 / 5 GHz', 9608, 2019, FALSE),
('Wi-Fi 6E', '802.11ax', '2.4 / 5 / 6 GHz', 9608, 2021, FALSE);



INSERT INTO access_point
(modello, id_produttore, id_standard, porte_ethernet, supporto_poe, prezzo_euro, anno_produzione)
VALUES
('Aironet 1200', 1, 4, 1, TRUE, 180.00, 2004),
('Aironet 2800', 1, 7, 2, TRUE, 720.00, 2020),
('TP-Link TL-WA501G', 2, 4, 1, FALSE, 45.00, 2006),
('TP-Link EAP225', 2, 6, 1, TRUE, 85.00, 2018),
('TP-Link EAP660 HD', 2, 7, 1, TRUE, 210.00, 2021),
('Netgear WN604', 3, 5, 1, FALSE, 70.00, 2010),
('Netgear WAX610', 3, 7, 1, TRUE, 190.00, 2022),
('Ubiquiti UniFi AP', 4, 5, 1, TRUE, 95.00, 2014),
('Ubiquiti UniFi 6 LR', 4, 7, 1, TRUE, 199.00, 2021),
('D-Link DWL-900AP', 5, 2, 1, FALSE, 35.00, 2001),
('D-Link DAP-2680', 5, 6, 2, TRUE, 160.00, 2019),
('Asus WL-330g', 6, 4, 1, FALSE, 55.00, 2005),
('Asus RT-AX86U (AP Mode)', 6, 7, 4, TRUE, 310.00, 2022),
('Linksys WAP11', 7, 2, 1, FALSE, 60.00, 2000),
('Linksys LAPAC1750', 7, 6, 2, TRUE, 230.00, 2017),
('Huawei AP6050DN', 8, 6, 2, TRUE, 260.00, 2018),
('Huawei AirEngine 6760-X1', 8, 8, 2, TRUE, 580.00, 2022);
