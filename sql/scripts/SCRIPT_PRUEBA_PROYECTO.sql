CREATE DATABASE pruebas_proyecto;
USE pruebas_proyecto;

-- ------ --
-- TABLAS --
-- ------ --
CREATE TABLE consolas (
	id_consola VARCHAR(15) NOT NULL PRIMARY KEY,
    nombre VARCHAR(45) NOT NULL,
    fabricante VARCHAR(50) NOT NULL,
    logo_consola VARCHAR(45) NOT NULL
);

CREATE TABLE modelos_consolas (
	id_modelo_consola VARCHAR(20) NOT NULL PRIMARY KEY,
    nombre VARCHAR(45) NOT NULL,
    descripcion VARCHAR(3000) NOT NULL,
    precio DECIMAL(9,2) NOT NULL,
    fecha_lanzamiento DATE NOT NULL,
    tamano VARCHAR(50) NOT NULL,
    peso VARCHAR(20) NOT NULL,
    memoria_consola VARCHAR(20) NOT NULL,
	imagen_cuadrada VARCHAR(100),
    imagen_rectangular VARCHAR(100),
    imagen_1 VARCHAR(100),
    imagen_2 VARCHAR(100),
    imagen_3 VARCHAR(100),
    id_consola VARCHAR(15) NOT NULL,
    FOREIGN KEY(id_consola) REFERENCES consolas(id_consola)
);

CREATE TABLE generos (
	id_genero INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    nombre VARCHAR(45) NOT NULL
);

CREATE TABLE videojuegos (
	id_videojuego INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    titulo VARCHAR(70) NOT NULL,
    fecha_lanzamiento DATE NOT NULL,
    descripcion VARCHAR(3000) NOT NULL,
    clasificacion_edad VARCHAR(20) NOT NULL,
    numero_jugadores VARCHAR(10) NOT NULL,
    estudio VARCHAR(100) NOT NULL,
    novedad CHAR(1) NOT NULL,
    stock INT NOT NULL,
    puntuacion INT NOT NULL,
    imagen_cuadrada VARCHAR(100),
    imagen_rectangular VARCHAR(100),
    imagen_1 VARCHAR(100),
    imagen_2 VARCHAR(100),
    imagen_3 VARCHAR(100),
    imagen_4 VARCHAR(100),
    imagen_5 VARCHAR(100),
    imagen_pegi VARCHAR(100)
);

CREATE TABLE videojuego_en_consola (
	id_vec INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    id_videojuego INT NOT NULL,
    id_consola VARCHAR(15) NOT NULL,
    imagen_caja VARCHAR(100),
    precio DECIMAL(9,2),
    FOREIGN KEY(id_videojuego) REFERENCES videojuegos(id_videojuego),
    FOREIGN KEY(id_consola) REFERENCES consolas(id_consola)
);

CREATE TABLE videojuego_y_genero (
	id_vyg INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    id_videojuego INT NOT NULL,
    id_genero INT NOT NULL,
    FOREIGN KEY(id_videojuego) REFERENCES videojuegos(id_videojuego),
    FOREIGN KEY(id_genero) REFERENCES generos(id_genero)
);

CREATE TABLE accesorios (
	id_accesorio INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    nombre VARCHAR(70) NOT NULL,
    fecha_lanzamiento DATE NOT NULL,
    descripcion VARCHAR(3000) NOT NULL,
    precio DECIMAL(9,2) NOT NULL,
    tamano VARCHAR(50) NOT NULL,
    peso VARCHAR(15) NOT NULL,
    conectividad VARCHAR(50) NOT NULL,
	imagen_cuadrada VARCHAR(200),
    imagen_rectangular VARCHAR(200),
    imagen_1 VARCHAR(200),
    imagen_2 VARCHAR(200),
    imagen_3 VARCHAR(200),
    id_consola VARCHAR(15) NOT NULL,
    FOREIGN KEY(id_consola) REFERENCES consolas(id_consola)
);

CREATE TABLE perfiles (
	id_perfil INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    nombre VARCHAR(15)
);

CREATE TABLE usuarios (
	username VARCHAR(20) NOT NULL PRIMARY KEY,
    password VARCHAR(200) NOT NULL,
    enabled INT NOT NULL,
    nombre VARCHAR(45) NOT NULL,
    apellidos VARCHAR(45) NOT NULL,
    direccion VARCHAR(70) NOT NULL,
    email VARCHAR(70) NOT NULL,
    fecha_registro DATE NOT NULL,
    avatar_usuario VARCHAR(200),
    genero VARCHAR(6) NOT NULL,
    newsletter VARCHAR(2),
    id_perfil INT NOT NULL,
    FOREIGN KEY(id_perfil) REFERENCES perfiles(id_perfil)
);

CREATE TABLE pedidos (
	id_pedido INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    direccion_entrega VARCHAR(70) NOT NULL,
    estado VARCHAR(30) NOT NULL,
    fecha_alta DATE,
    username VARCHAR(20),
    FOREIGN KEY(username) REFERENCES usuarios(username)
);

CREATE TABLE productos (
    id_producto INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    tipo_producto VARCHAR(20) NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    precio DECIMAL(9,2) NOT NULL,
    imagen_producto VARCHAR(200) NOT NULL
);

CREATE TABLE producto_en_pedido (
	num_orden INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    id_pedido INT NOT NULL,
	nombre_producto VARCHAR(100) NOT NULL,
	tipo_producto VARCHAR(20) NOT NULL,
    precio DECIMAL(9,2) NOT NULL,
    fecha_alta DATE NOT NULL,
    cantidad INT NOT NULL,
    FOREIGN KEY(id_pedido) REFERENCES pedidos(id_pedido)
);


-- ------- --
-- INSERTS --
-- ------- --
INSERT INTO consolas
VALUES('ps5', 'PlayStation 5',  'Sony', 'ps/playstation_logo.png'),
      ('switch', 'Nintendo Switch', 'Nintendo', 'switch/switch_logo.png'),
      ('xbox_s_xs', 'Xbox Series X|S', 'Microsoft', 'xbox/xbox_logo.png');
    
INSERT INTO generos(nombre)
VALUES('Acci??n'),
	  ('Aventura'),
      ('RPG'),
      ('Plataformas'),
      ('Shooter'),
      ('Estrategia'),
      ('Lucha'),
      ('Simulaci??n'),
      ('Fiesta'),
      ('Arcade'),
      ('M??sica'),
      ('Puzzle'),
      ('Conducci??n'),
      ('Deportes'),
      ('Casual'),
      ('Familia'),
      ('Indie'),
      ('Horror'),
      ('MMORPG'),
      ('MOBA'),
      ('Otros');

-- Videojuegos Nintendo Switch      
INSERT INTO videojuegos
VALUES(1, 
	   'The Legend of Zelda: Breath of the Wild', 
       '2017-03-03', 
       'Olvida todo lo que sabes sobre los juegos de The Legend of Zelda. Entra en un mundo de descubrimientos, exploraci??n y aventura en The Legend of Zelda: Breath of the Wild, un nuevo juego de la aclamada serie que rompe con las convenciones.<br><br>
		Tras un sue??o de 100 a??os, Link despierta en un mundo que no es capaz de recordar. Nuestro h??roe legendario deber?? explorar un mundo vasto y peligroso, y recuperar su memoria antes de que Hyrule desaparezca para siempre. Link emprende un viaje para encontrar respuestas en el que solo dispondr?? de aquello que encuentre por el camino.',
        'PEGI 12',
        '1',
        'Nintendo',
        'n',
        30,
        97,
        'zelda-botw_switch/zelda_botw_cuadrada.jpg',
        'zelda-botw_switch/zelda_botw_rectangular.jpg',
        'zelda-botw_switch/zelda_botw_1.jpg',
        'zelda-botw_switch/zelda_botw_2.jpg',
        'zelda-botw_switch/zelda_botw_3.jpg',
        'zelda-botw_switch/zelda_botw_4.jpg',
        'zelda-botw_switch/zelda_botw_5.jpg',
        'pegi-12.png'
),	
(	   2, 
	   "Luigi's Mansion 3", 
       '2019-10-31', 
       "??nete a Luigi, un h??roe de lo m??s cobardica, en una aventura fantasmag??rica (y un pel??n viscosa, todo hay que decirlo) para salvar a Mario y compa????a en Luigi's Mansion 3 para Nintendo Switch. Puedes recorrer los sobrenaturales pisos de un hotel encantado en compa????a de un amigo en el modo cooperativo, plantarles cara a fantasmas revoltosos y resolver puzles paranormales.<br><br>
        ??Qui??n puede rechazar una invitaci??n a un hotel de lujo para pasar unas vacaciones de miedo con Mario y compa????a? ??Luigi no, desde luego! Sin embargo, el sue??o pronto se convierte en pesadilla cuando los fantasmas empiezan a poner todo patas arriba y su macabra majestad, el Rey Boo, encierra a Mario y a sus amigos dentro de unos cuadros.
		Con la ayuda del inefable profesor Fesor y sus ??ltimas invenciones, Luigi deber?? armarse otra vez de valor para desbaratar los malvados planes del Rey Boo y salvar a todo el mundo.",
	   'PEGI 7',
	   '1-8',
	   'Next Level Games',
	   'n',
	   17,
	   86,
       'luigis-mansion-3_switch/luigis_mansion_3_cuadrada.jpg',
       'luigis-mansion-3_switch/luigis_mansion_3_rectangular.jpg',
       'luigis-mansion-3_switch/luigis_mansion_3_1.jpg',
       'luigis-mansion-3_switch/luigis_mansion_3_2.jpg',
       'luigis-mansion-3_switch/luigis_mansion_3_3.jpg',
       'luigis-mansion-3_switch/luigis_mansion_3_4.jpg',
       'luigis-mansion-3_switch/luigis_mansion_3_5.jpg',
       'pegi-7.png'
),
(	   3,
	   "Animal Crossing: New Horizons",
       "2020-03-20",
       "??Archipi??lago Para??so te necesita! ??nete al equipo de desarrollo inmobiliario de Nuria, y ??chale una mano para construir casas de vacaciones de ensue??o.<br>
		??M??s all?? del horizonte te aguarda una nueva vida la mar de relajada! Desciende del avi??n y pon pie en tu propia isla desierta donde har??s nuevos amigos y descubrimientos, y podr??s disfrutar de mil oportunidades. ??Crea un para??so a tu medida en Animal Crossing: New Horizons para Nintendo Switch!",
        "PEGI 3",
        "1",
        "Nintendo",
        'n',
        20,
        90,
        "animal-crossing-nh_switch/animal_crossing_nh_cuadrada.jpg",
        "animal-crossing-nh_switch/animal_crossing_nh_rectangular.jpg",
        "animal-crossing-nh_switch/animal_crossing_nh_1.jpg",
        "animal-crossing-nh_switch/animal_crossing_nh_2.jpg",
        "animal-crossing-nh_switch/animal_crossing_nh_3.jpg",
        "animal-crossing-nh_switch/animal_crossing_nh_4.jpg",
        "animal-crossing-nh_switch/animal_crossing_nh_5.jpg",
        "pegi-3.png"
),
(		4, 
		"Kirby y la tierra olvidada",
        "2022-03-25",
        "Un buen d??a, un extra??o v??rtice aparece en el cielo del planeta Pop y absorbe todo lo que pilla... ??Kirby incluido! M??s tarde, nuestro h??roe de color rosa recobra el conocimiento en un mundo en ruinas, en el que civilizaci??n y naturaleza comparten entorno.<br>
        Ahora le toca a Kirby rescatar a los Waddle Dees, que han sido raptados por un temible grupo llamado 'la jaur??a'. ??En compa????a de su nuevo amigo Elfilin, Kirby emprende una gran aventura para rescatar a los Waddle Dees y regresar a casa!",
        "PEGI 7",
        "1-2",
        "HAL Laboratory",
        's',
        25,
        85,
        "kirby-tierra-olvidada_switch/kirby_to_cuadrada.jpg",
        "kirby-tierra-olvidada_switch/kirby_to_rectangular.jpg",
        "kirby-tierra-olvidada_switch/kirby_to_1.jpg",
        "kirby-tierra-olvidada_switch/kirby_to_2.jpg",
        "kirby-tierra-olvidada_switch/kirby_to_3.jpg",
        "kirby-tierra-olvidada_switch/kirby_to_4.jpg",
        "kirby-tierra-olvidada_switch/kirby_to_5.jpg",
        "pegi-7.png"
),
(		5,
        "Mario Golf: Super Rush",
        "2021-06-25",
        "??nete a tus personajes favoritos del Reino Champi????n y juega partidas de golf a toda velocidad en Mario Golf: Super Rush, solo para Nintendo Switch.
         Saca ventaja a los rivales en el modo 'Golf r??pido', en el que todos los jugadores lanzan al mismo tiempo y luego salen corriendo hasta el hoyo???",
        "PEGI 3",
        "1-4",
        "Camelot Software Planning",
        'n',
        22,
        70,
        "mario-golf-super-rush_switch/mario_golf_sr_cuadrada.jpg",
        "mario-golf-super-rush_switch/mario_golf_sr_rectangular.jpg",
        "mario-golf-super-rush_switch/mario_golf_sr_1.jpg",
        "mario-golf-super-rush_switch/mario_golf_sr_2.jpg",
        "mario-golf-super-rush_switch/mario_golf_sr_3.jpg",
        "mario-golf-super-rush_switch/mario_golf_sr_4.jpg",
        "mario-golf-super-rush_switch/mario_golf_sr_5.jpg",
        "pegi-3.png"
),
(		6,
		"Mario Kart 8 Deluxe",
        "2017-04-28",
        "Mario, Luigi, Peach y otros personajes populares de la serie Super Mario est??n ahora acompa??ados por pilotos nuevos y veteranos, como Rey Boo, Bowsitos o Bowsy. ??Incluso los inkling de Splatoon se unen a la carrera!<br>
		 Una vez que hayas escogido un piloto, elige un veh??culo y personal??zalo con diferentes ruedas, carrocer??as y alerones antes de sacarlo al asfalto.
		 Compite por tierra, mar y aire, e incluso por techos y paredes, en 48 niveles. Todos los circuitos (??y personajes!) de Mario Kart 8 para Wii U vuelven en Mario Kart 8 Deluxe, incluido circuitos descargables anteriores inspirados en Animal Crossing, Excitebike, The Legend of Zelda y muchos m??s.",
        "PEGI 3",
        "1-12",
        "Nintendo",
        'n',
        30,
        92,
        "mario-kart-8-deluxe_switch/mario_kart_8_cuadrada.jpg",
        "mario-kart-8-deluxe_switch/mario_kart_8_rectangular.jpg",
        "mario-kart-8-deluxe_switch/mario_kart_8_1.jpg",
        "mario-kart-8-deluxe_switch/mario_kart_8_2.jpg",
        "mario-kart-8-deluxe_switch/mario_kart_8_3.jpg",
        "mario-kart-8-deluxe_switch/mario_kart_8_4.jpg",
        "mario-kart-8-deluxe_switch/mario_kart_8_5.jpg",
        "pegi-3.png"
),
(		7,
		"Mario Party Superstars",
        "2021-10-29",
        "??Llamando a todas las superestrellas! Preparaos para pasarlo a lo grande con cinco tableros cl??sicos de la era de Nintendo 64 y 100 minijuegos de la serie en Mario Party Superstars para Nintendo Switch.
         Riega plantas, compite en carreras de coches, estira caras y m??s en una colecci??n superestelar de 100 disparatados minijuegos de la serie Mario Party.",
		"PEGI 3",
        "1-4",
        "NDcube",
        'n',
        25,
        80,
        "mario-party-superstars_switch/mario_party_ss_cuadrada.jpg",
        "mario-party-superstars_switch/mario_party_ss_rectangular.jpg",
        "mario-party-superstars_switch/mario_party_ss_1.jpg",
        "mario-party-superstars_switch/mario_party_ss_2.jpg",
        "mario-party-superstars_switch/mario_party_ss_3.jpg",
        "mario-party-superstars_switch/mario_party_ss_4.jpg",
        "mario-party-superstars_switch/mario_party_ss_5.jpg",
		"pegi-3.png"
),
(		8,
		"Pok??mon Diamante Brillante",
        "2021-11-19",
        "??Vive una nost??lgica aventura que vuelve a cobrar vida en Pok??mon Diamante Brillante para Nintendo Switch! Emprende un viaje repleto de misterios a lo largo de la regi??n de Sinnoh, atrapa Pok??mon, enfr??ntate a los Entrenadores Pok??mon m??s fuertes de la regi??n y desbarata los p??rfidos planes del Equipo Galaxia.<br><br>
         Tu aventura comienza cuando un famoso profesor que investiga las evoluciones de los Pok??mon te recluta para que viajes a lo largo y ancho de la regi??n con el fin de completar una enciclopedia Pok??mon conocida como Pok??dex.",
		"PEGI 7",
        "1-2",
        "ILCA",
        's',
        20,
        73,
        "pokemon-dia-bri_switch/pokemon_db_cuadrada.jpg",
        "pokemon-dia-bri_switch/pokemon_db_rectangular.jpg",
		"pokemon-dia-bri_switch/pokemon_db_1.jpg",
        "pokemon-dia-bri_switch/pokemon_db_2.jpg",
        "pokemon-dia-bri_switch/pokemon_db_3.jpg",
        "pokemon-dia-bri_switch/pokemon_db_4.jpg",
        "pokemon-dia-bri_switch/pokemon_db_5.jpg",
        "pegi-7.png"
),
(		9,
        "Pok??mon Perla Reluciente",
        "2021-11-19",
        "??Vive una nost??lgica aventura que vuelve a cobrar vida en Pok??mon Perla Reluciente para Nintendo Switch! Emprende un viaje repleto de misterios a lo largo de la regi??n de Sinnoh, atrapa Pok??mon, enfr??ntate a los Entrenadores Pok??mon m??s fuertes de la regi??n y desbarata los p??rfidos planes del Equipo Galaxia.<br><br>
         Tu aventura comienza cuando un famoso profesor que investiga las evoluciones de los Pok??mon te recluta para que viajes a lo largo y ancho de la regi??n con el fin de completar una enciclopedia Pok??mon conocida como Pok??dex.",
      	"PEGI 7",
        "1-2",
        "ILCA",
        's',
        20,
        73,
        "pokemon-per-rel_switch/pokemon_pr_cuadrada.jpg",
        "pokemon-per-rel_switch/pokemon_pr_rectangular.jpg",
        "pokemon-per-rel_switch/pokemon_pr_1.jpg",
        "pokemon-per-rel_switch/pokemon_pr_2.jpg",
        "pokemon-per-rel_switch/pokemon_pr_3.jpg",
        "pokemon-per-rel_switch/pokemon_pr_4.jpg",
        "pokemon-per-rel_switch/pokemon_pr_5.jpg",
        "pegi-7.png"
),
(		10,
        "Pok??mon Legends: Arceus",
        "2022-01-28",
        "Explora parajes salvajes inmensos donde te aguardan un sinf??n de descubrimientos en Leyendas Pok??mon: Arceus para Nintendo Switch. Observa, atrapa e investiga a los Pok??mon salvajes en este juego de acci??n y rol que se desarrolla en el pasado, cuando no era habitual que los humanos y los Pok??mon convivieran en armon??a.",
        "PEGI 7",
        "1-2",
        "Game Freak",
        's',
        30,
        83,
        "pokemon-legends-arceus_switch/pokemon_cuadrada.jpg",
        "pokemon-legends-arceus_switch/pokemon_rectangular.jpg",
        "pokemon-legends-arceus_switch/pokemon_1.jpg",
        "pokemon-legends-arceus_switch/pokemon_2.jpg",
        "pokemon-legends-arceus_switch/pokemon_3.jpg",
        "pokemon-legends-arceus_switch/pokemon_4.jpg",
        "pokemon-legends-arceus_switch/pokemon_5.jpg",
        "pegi-7.png"
),
(		11,
        "Super Mario Odyssey",
        "2017-10-27",
        "Bowser ha vuelto a secuestrar a la princesa Peach, pero esta vez, con 'buenas intenciones': ??est?? preparando una boda por todo lo alto! El autoproclamado novio ha emprendido un viaje por el mundo para preparar el gran acontecimiento, y Mario tendr?? que alcanzarlo para aguarle la fiesta, ??pero los molestos Broodals no se lo van a poner f??cil!",
        "PEGI 7",
        "1-2",
        "Nintendo",
        'n',
        20,
        97,
        "super-mario-odyssey_switch/super_mo_cuadrada.jpg",
        "super-mario-odyssey_switch/super_mo_rectangular.jpg",
        "super-mario-odyssey_switch/super_mo_1.jpg",
        "super-mario-odyssey_switch/super_mo_2.jpg",
        "super-mario-odyssey_switch/super_mo_3.jpg",
        "super-mario-odyssey_switch/super_mo_4.jpg",
        "super-mario-odyssey_switch/super_mo_5.jpg",
        "pegi-7.png"
),
(		12,
        "Super Smash Bros. Ultimate",
        "2018-12-07",
        "Luchadores y mundos de juego m??ticos colisionan en el enfrentamiento definitivo: ??Super Smash Bros. Ultimate para Nintendo Switch! Nuevos luchadores, como los inkling de la serie Splatoon, Ridley de la serie Metroid, Simon Belmont de Castlevania y Canela de Animal Crossing, hacen su debut en Super Smash Bros. junto a todos los personajes de las entregas anteriores. ??Todos!",
        "PEGI 12",
        "1-8",
        "Nintendo",
        'n',
        25,
        93,
        "super-smash-bros-ult_switch/super_smash_bros_cuadrada.jpg",
        "super-smash-bros-ult_switch/super_smash_bros_rectangular.jpg",
        "super-smash-bros-ult_switch/super_smash_bros_1.jpg",
        "super-smash-bros-ult_switch/super_smash_bros_2.jpg",
        "super-smash-bros-ult_switch/super_smash_bros_3.jpg",
        "super-smash-bros-ult_switch/super_smash_bros_4.jpg",
        "super-smash-bros-ult_switch/super_smash_bros_5.jpg",
        "pegi-12.png"
),
(		13,
        "The Witcher 3: Wild Hunt",
        "2021-01-28",
        "Galardonado con m??s de 250 premios al juego del a??o, The Witcher 3: Wild Hunt es una aventura de mundo abierto basada en la narrativa y ambientada en un oscuro universo de fantas??a.<br><br>
		 Eres Geralt de Rivia, cazador de monstruos a sueldo. Tienes a tu disposici??n todas las herramientas de tu oficio: espadas afiladas, brebajes letales, ballestas sigilosas y una poderosa magia de combate. Ante ti se extiende un continente devastado por la guerra e infestado de monstruos que puedes explorar a tu antojo. ??Cu??l es tu contrato actual? Encontrar a la ni??a de la profec??a, un arma viviente que puede alterar el mundo tal y como lo conocemos.",
        "PEGI 18",
        "1",
        "CD Projekt Red",
        'n',
        20,
        93,
        "the-witcher-3_switch/the_witcher_3_cuadrada.jpg",
        "the-witcher-3_switch/the_witcher_3_rectangular.jpg",
        "the-witcher-3_switch/the_witcher_3_1.jpg",
        "the-witcher-3_switch/the_witcher_3_2.jpg",
        "the-witcher-3_switch/the_witcher_3_3.jpg",
        "the-witcher-3_switch/the_witcher_3_4.jpg",
        "the-witcher-3_switch/the_witcher_3_5.jpg",
        "pegi-18.png"
),
(		14,
        "The Legend of Zelda: Skyward Sword HD",
        "2021-07-16",
        "El primer relato de la l??nea temporal de The Legend of Zelda lo protagoniza un joven caballero que deber?? atravesar el cielo sin fin y la tierra m??tica bajo este para encontrar a su amiga de la infancia, Zelda. A medida que el destino de ambos se va forjando, un misterioso se??or de los demonios pone en marcha un p??rfido plan para resucitar a un mal at??vico...",
        "PEGI 12",
        "1",
        "Nintendo",
        'n',
        25,
        81,
        "zelda-skyward-sword_switch/zelda_ss_cuadrada.jpg",
        "zelda-skyward-sword_switch/zelda_ss_rectangular.jpg",
        "zelda-skyward-sword_switch/zelda_ss_1.jpg",
        "zelda-skyward-sword_switch/zelda_ss_2.jpg",
        "zelda-skyward-sword_switch/zelda_ss_3.jpg",
        "zelda-skyward-sword_switch/zelda_ss_4.jpg",
        "zelda-skyward-sword_switch/zelda_ss_5.jpg",
        "pegi-12.png"
),

-- Videojuegos Xbox

(       15, 
	   'Flight Simulator', 
       '2020-08-18', 
       'La edici??n Game of the Year (GOTY) Est??ndar de Microsoft Flight Simulator hace honor 
        a todos los comentarios positivos, las cr??ticas y los premios obtenidos, pero tambi??n es un "Gracias" 
        a nuestros seguidores (tanto a los m??s recientes como a los m??s veteranos) que han hecho que este t??tulo 
        se convierta en un fen??meno. La edici??n Game of the Year Est??ndar de Microsoft Flight Simulator incluye 
        25 aeronaves de gran detalle con modelos de vuelo exclusivos y 38 aeropuertos creados a mano.

        Esta edici??n mejorada ofrece a los usuarios cinco aeronaves totalmente nuevas, 
        ocho nuevos aeropuertos creados a mano, seis nuevos vuelos introductorios, nuevos tutoriales 
        y actualizaciones del sistema meteorol??gico.',
        'PEGI 3',
        '1',
        'Microsoft Game Studios',
        'n',
        30,
        90,
        'Flight_simulator_Xbox/Flight_simulator_cuadrada.jpg',
        'Flight_simulator_Xbox/Flight_simulator_rectangular.jpg',
        'Flight_simulator_Xbox/Flight_simulator_1.jpg',
        'Flight_simulator_Xbox/Flight_simulator_2.jpg',
        'Flight_simulator_Xbox/Flight_simulator_3.jpg',
        'Flight_simulator_Xbox/Flight_simulator_4.jpg',
        'Flight_simulator_Xbox/Flight_simulator_5.jpg',
        'pegi-3.png'
),	
(       16, 
	   'Forza Horizon 5', 
       '2021-11-21', 
       '??Tu aventura definitiva en Horizon te espera! Explora paisajes din??micos y en 
        constante evoluci??n del mundo abierto de M??xico con una acci??n de conducci??n ilimitada y 
        divertida en cientos de los mejores coches del mundo.',
        'PEGI 3',
        '1-2',
        'Microsoft Game Studios',
        'n',
        20,
        92,
        'forza-horizon-5_Xbox/forza_horizon5_cuadrada.jpeg',
        'forza-horizon-5_Xbox/forza_horizon5_rectangular.jpeg',
        'forza-horizon-5_Xbox/forza_horizon5_1.jpeg',
        'forza-horizon-5_Xbox/forza_horizon5_2.jpeg',
        'forza-horizon-5_Xbox/forza_horizon5_3.jpeg',
        'forza-horizon-5_Xbox/forza_horizon5_4.jpeg',
        'forza-horizon-5_Xbox/forza_horizon5_5.jpeg',
        'pegi-3.png'
),	
(       17, 
	   'Gears 5', 
       '2019-09-10', 
       'De una de las sagas m??s aclamadas de la historia de los videojuegos, 
        la c??lebre campa??a de Gears 5 y el renovado modo multijugador est??n totalmente 
        optimizados para Xbox Series X y Series S.

        Campa??a: con una guerra sin cuartel inminente, Kait Diaz se separa para descubrir 
        su conexi??n con el enemigo y descubre el verdadero peligro para Sera: ella misma. 
        A partir del 10 de noviembre, lleva los aspectos de tu personaje y de tus armas a nuevas partidas 
        y disfruta de dificultades y modificadores adicionales.

        Jugador contra jugador: ??que gane el mejor equipo! Con nuevos modos y contenidos desde el lanzamiento, 
        el modo Enfrentamiento recompensa todos los estilos competitivos, desde el casual hasta el profesional.

        Jugador contra la m??quina: lucha en modo cooperativo para sobrevivir. Re??ne a tu escuadr??n y vence 
        a los enemigos de Horda o ??brete paso en Escape.',
        'PEGI 18',
        '1',
        'Microsoft Game Studios',
        'n',
        30,
        84,
        'Gears_of_war5_Xbox/Gears5_cuadrada.jpg',
        'Gears_of_war5_Xbox/Gears5_rectangular.jpg',
        'Gears_of_war5_Xbox/Gears5_1.jpg',
        'Gears_of_war5_Xbox/Gears5_2.jpg',
        'Gears_of_war5_Xbox/Gears5_3.jpg',
        'Gears_of_war5_Xbox/Gears5_4.jpg',
        'Gears_of_war5_Xbox/Gears5_5.jpg',
        'pegi-18.png'
),	
(       18, 
	   'Grounded', 
       '2020-11-10', 
       'El mundo es un lugar inmenso, precioso y peligroso 
        (sobre todo cuando te han encogido al tama??o de una hormiga). 
        Explora, construye y sobrevive en esta aventura cooperativa de supervivencia. 
        ??Podr??s prosperar junto a las hordas de insectos gigantes, luchando por sobrevivir 
        a los peligros del patio trasero? ??nere a nuestra comunidad y ayuda a conformar 
        el futuro de Grounded en Xbox Game Preview.',
        'PEGI 12',
        '1',
        'Xbox Game Studios',
        'n',
        25,
        00,
        'Grounded_Xbox/Grounded_cuadrada.jpg',
        'Grounded_Xbox/Grounded_rectangular.jpg',
        'Grounded_Xbox/Grounded_1.jpg',
        'Grounded_Xbox/Grounded_2.jpg',
        'Grounded_Xbox/Grounded_3.jpg',
        'Grounded_Xbox/Grounded_4.jpg',
        'Grounded_Xbox/Grounded_5.jpg',
        'pegi-12.png'
),	
(       19, 
	   'Halo Infinite', 
       '2020-12-08', 
       'Campa??a:
        Cuando no hay esperanza y el futuro de la humanidad pende de un hilo, el Jefe Maestro 
        est?? preparado para luchar contra los enemigos m??s despiadados a los que se ha enfrentado. 
        Enf??ndate la armadura del mayor h??roe de la humanidad para disfrutar de una aventura ??pica y 
        explora a fondo el anillo de Halo. Compra Halo Infinite (campa??a) para jugar a la campa??a.

        Multijugador:
        El legendario modo multijugador, ahora gratis:
        ??Vuelve el aclamado modo multijugador con un giro de tuerca y gratuito! Las actualizaciones 
        estacionales mejoran la experiencia a largo plazo con eventos ??nicos, mapas y modos nuevos, 
        adem??s de contenido centrado en la comunidad.',
        'PEGI 16',
        '1',
        'Xbox Game Studios',
        'n',
        20,
        87,
        'halo-infinite_Xbox/halo_infinite_cuadrada.jpeg',
        'halo-infinite_Xbox/halo_infinite_rectangular.png',
        'halo-infinite_Xbox/halo_infinite_1.jpeg',
        'halo-infinite_Xbox/halo_infinite_2.jpeg',
        'halo-infinite_Xbox/halo_infinite_3.jpeg',
        'halo-infinite_Xbox/halo_infinite_4.jpeg',
        'halo-infinite_Xbox/halo_infinite_5.jpeg',
        'pegi-16.png'
),	
(       20, 
	   'Sable', 
       '2021-09-23', 
       'Emb??rcate en un viaje ??nico e inolvidable en el que acompa??ar??s 
        a Sable durante su planeo, un rito de iniciaci??n que la llevar?? a recorrer vastos desiertos 
        y parajes impresionantes repletos de maravillas de otros tiempos y de restos de naves espaciales.

        Explora las dunas a lomos de tu aeromoto, escala unas ruinas monumentales y conoce a otros 
        n??madas mientras desvelas misterios olvidados y descubres qui??n se esconde en realidad detr??s de esa m??scara.

        El estilo art??stico ??nico y la original banda sonora de Japanese Breakfast te ayudar??n a 
        sumergirte en el mundo de Sable y a explorarlo a tu propio ritmo. Hay muchas cosas en este mundo 
        esperando a ser descubiertas. No tengas miedo y da el salto.',
        'PEGI 3',
        '1',
        'Raw Fury',
        'n',
        35,
        71,
        'Sable_Xbox/Sable_cuadrada.jpg',
        'Sable_Xbox/Sable_rectangular.jpg',
        'Sable_Xbox/Sable_1.jpg',
        'Sable_Xbox/Sable_2.jpg',
        'Sable_Xbox/Sable_3.jpg',
        'Sable_Xbox/Sable_4.jpg',
        'Sable_Xbox/Sable_5.jpg',
        'pegi-3.png'
),
(       21, 
	   'Sea of Thieves', 
       '2018-03-20', 
       'Sea of Thieves te ofrece la verdadera vida pirata: te permite navegar, 
        luchar, explorar y saquear a mansalva; todo lo necesario para convertirte en un verdadero 
        pirata legendario. No hay roles marcados, por lo que eres libre de afrontar el mundo y 
        a los jugadores como plazcas.',
        'PEGI 16',
        '1',
        'Microsoft Game Studios',
        'n',
        30,
        69,
        'Sea_of_thieves_Xbox/Sea_of_thieves_cuadrada.jpg',
        'Sea_of_thieves_Xbox/Sea_of_thieves_rectangular.jpg',
        'Sea_of_thieves_Xbox/Sea_of_thieves_1.jpg',
        'Sea_of_thieves_Xbox/Sea_of_thieves_2.jpg',
        'Sea_of_thieves_Xbox/Sea_of_thieves_3.jpg',
        'Sea_of_thieves_Xbox/Sea_of_thieves_4.jpg',
        'Sea_of_thieves_Xbox/Sea_of_thieves_5.jpg',
        'pegi-16.png'
),
(       22, 
	   'Tunic', 
       '2022-03-16', 
       'Explora un reino plagado de leyendas olvidadas, poderes ancestrales y 
        feroces monstruos en TUNIC, un juego de acci??n isom??trico sobre un peque??o zorro 
        que emprende una gran aventura. Abandonado en una playa misteriosa y armado solo 
        con tu propia curiosidad, deber??s enfrentarte a bestias colosales, reunir extra??os 
        y poderosos objetos y desvelar secretos perdidos en el tiempo.',
        'PEGI 7',
        '1',
        'Finji',
        's',
        20,
        85,
        'Tunic_Xbox/Tunic_cuadrada.jpg',
        'Tunic_Xbox/Tunic_rectangular.jpg',
        'Tunic_Xbox/Tunic_1.jpg',
        'Tunic_Xbox/Tunic_2.jpg',
        'Tunic_Xbox/Tunic_3.jpg',
        'Tunic_Xbox/Tunic_4.jpg',
        'Tunic_Xbox/Tunic_5.jpg',
        'pegi-7.png'
),
-- Videojuegos ps5
(       23, 
	    'Death Stranding', 
        '2021-09-24', 
        "Hideo Kojima, el legendario creador de videojuegos, nos ofrece una experiencia que desaf??a a todos los g??neros, ahora ampliada y remasterizada para PS5 en el DIRECTOR'S CUT.<br><br>
         En el futuro, un evento misterioso conocido como el Death Stranding ha abierto una puerta entre los vivos y los muertos y ha permitido que grotescas criaturas del otro mundo deambulen por un planeta en ruinas habitado por una sociedad desolada.<br><br>
	     En la piel de Sam Bridges, tu misi??n es llevar la esperanza a la humanidad, para lo que deber??s conectar a los ??ltimos supervivientes de unos Estados Unidos arrasados.
	     ??Podr??s volver a unir un mundo fragmentado, paso a paso?",
        'PEGI 18',
        '1',
        'Kojima production',
        'n',
        40,
        85,
        "death-stranding-director's-cut_ps5/death_stranding_cuadrada.jpg",
        "death-stranding-director's-cut_ps5/Death_Stranding_rectangular.jpg",
        "death-stranding-director's-cut_ps5/death_stranding_1.jpg",
        "death-stranding-director's-cut_ps5/death_stranding_2.jpg",
        "death-stranding-director's-cut_ps5/death_stranding_3.jpg",
        "death-stranding-director's-cut_ps5/death_stranding_4.jpg",
        "death-stranding-director's-cut_ps5/death_stranding_5.jpg",
        "pegi-18.png"
),
(       24, 
	   'Deathloop', 
       '2021-09-14', 
       "Participa en la eterna pugna entre dos asesinos extraordinarios. Ponte en la piel de Colt y busca la manera de intentar romper el bucle en el que est??s atrapado en Blackreef al mismo tiempo que los habitantes de la isla te dan caza.<br><br>
        Utiliza armas y habilidades poderosas para eliminar a ocho objetivos principales localizados en la impresionante y ca??tica isla antes de que el d??a comience de nuevo.<br><br>
		En las sombras, te acechar?? Juliana, tu rival asesina, que tiene la ??nica misi??n de abatir a Colt y mantener el bucle en funcionamiento. Aprende de cada ciclo y prueba caminos y estrategias nuevas para romper el bucle definitivamente.",
        'PEGI 18',
        '1-2',
        'Bethesda',
        's',
        18,
        88,
        "deathloop_ps5/deathloop_cuadrada.jpg",
        "deathloop_ps5/deathloop_rectangular.jpg",
        "deathloop_ps5/deathloop_1.jpg",
        "deathloop_ps5/deathloop_2.jpg",
        "deathloop_ps5/deathloop_3.jpg",
        "deathloop_ps5/deathloop_4.jpg",
        "deathloop_ps5/deathloop_5.jpg",
        "pegi-18.png"
),
(       25, 
	    "Demon's Souls", 
        '2021-09-14', 
	    "Este remake redise??ado por completo, te invita a vivir la inquietante historia y el despiadado combate de Demon???s Souls.??PlayStation Studios y Bluepoint Games presentan un remake del cl??sico de PlayStation, Demon's Souls. Este remake, redise??ado por completo y optimizado de forma magistral, presenta los horrores de una oscura y neblinosa tierra de fantas??a a una nueva generaci??n de jugadores.<br><br>
        Aquellos que ya se hayan enfrentado a sus dificultades y adversidades pueden volver a desafiar a la oscuridad con una calidad visual sin igual y un rendimiento incre??ble.<br><br>
        En la b??squeda por aumentar su poder, el rey Allant XII, monarca de Boletaria, canaliz?? las antiguas artes del alma y despert?? a un demonio tan antiguo como el tiempo: el Anciano. Esta acci??n provoc?? que una niebla incolora se extendiera por toda la regi??n, liberando a terror??ficas criaturas hambrientas de almas humanas. Aquellos cuyas almas les fueron arrebatadas perdieron la cordura y solo les qued?? el deseo de atacar a quien a??n la conserve.<br><br>
        Ahora, Boletaria est?? aislada del mundo exterior, y los caballeros que se atreven a penetrar la densa niebla para liberar la regi??n desaparecen para siempre. Encarna a un guerrero solitario y ad??ntrate en la peligrosa niebla, donde deber??s enfrentarte a los desaf??os m??s dif??ciles para ganarte el t??tulo de 'matademonios' y devolver al Anciano a su letargo",
        'PEGI 18',
        '1-6',
        'Bluepoint Games',
        'n',
        10,
        92,
        "demons-souls_ps5/demons_souls_cuadrada.jpg",
        "demons-souls_ps5/demons_souls_rectangular.jpg",
        "demons-souls_ps5/demons_souls_1.jpeg",
        "demons-souls_ps5/demons_souls_2.jpeg",
        "demons-souls_ps5/demons_souls_3.jpeg",
        "demons-souls_ps5/demons_souls_4.jpeg",
        "demons-souls_ps5/demons_souls_5.jpeg",
        "pegi-18.png"
),
(       26, 
	    "Ghost of Tsushima Director's Cut", 
        '2020-08-20', 
        "Se avecina una tormenta.Descubre la experiencia ampliada de Ghost  of Tsushima con Director??s Cut. Descubre las maravillas ocultas de Tsushima en esta aventura de acci??n de mundo abierto creada por Sucker Punch Productions y PlayStation Studios, disponible para PS5 y PS4.<br><br>
        Forja un nuevo camino y libra una guerra poco convencional por la libertad de Tsushima. Reta a los oponentes con tu katana, domina el arco para eliminar amenazas a distancia, desarrolla t??cticas de sigilo para tender emboscadas a los enemigos y explora una nueva historia en la isla de Iki.",
        'PEGI 18',
        '1-4',
        'Sucker Punch Productions',
        'n',
        23,
        87,
        "ghost-of-tsushima_ps5/ghost-of-tsushima_cuadrada.jpg",
        "ghost-of-tsushima_ps5/ghost_of_tsushima_rectangular.jpg",
        "ghost-of-tsushima_ps5/ghost-of-tsushima_1.jpg",
        "ghost-of-tsushima_ps5/ghost-of-tsushima_2.jpg",
        "ghost-of-tsushima_ps5/ghost-of-tsushima_3.jpg",
        "ghost-of-tsushima_ps5/ghost-of-tsushima_4.jpg",
        "ghost-of-tsushima_ps5/ghost-of-tsushima_5.jpg",
        "pegi-18.png"
),
(       27, 
	    "Ratchet & Clank: Una Dimensi??n Aparte", 
        '2021-06-11', 
        "L??nzate a una aventura interdimensional. Viaja entre dimensiones con Ratchet y Clank en su lucha contra un malvado emperador de otra realidad. Salta entre mundos cargados de acci??n y m??s all?? a velocidades de v??rtigo, 
        con unos gr??ficos espectaculares y un arsenal demencial en el estreno de estos aventureros intergal??cticos en la consola PS5???",
        'PEGI 7',
        '1',
        'Insomniac Games',
        'n',
        19,
        88,
        "ratchet-&-clank_ps5/ratchet_cuadrado.jpg",
        "ratchet-&-clank_ps5/ratchet_rectangular.jpg",
        "ratchet-&-clank_ps5/ratchet_1.jpg",
        "ratchet-&-clank_ps5/ratchet_2.jpg",
        "ratchet-&-clank_ps5/ratchet_3.jpg",
        "ratchet-&-clank_ps5/ratchet_4.jpg",
        "ratchet-&-clank_ps5/ratchet_5.jpg",
        "pegi-7.png"
),
(       28, 
	    "Returnal", 
        '2021-04-30', 
        "Rompe el ciclo del caos en un planeta alien??gena que no deja de cambiar. Tras el aterrizaje forzoso en este mundo cambiante, Selene debe buscar en el desolado paisaje una antigua civilizaci??n para poder escapar. Sola y aislada, se ve abocada a luchar con u??as y dientes para sobrevivir.<br><br>
        Cae derrotada una y otra vez, lo que la obliga a reiniciar su viaje cada vez que muere .A trav??s de un sistema de juego roguelike implacable, descubrir??s que conforme el planeta cambia en cada ciclo, tambi??n lo hacen los objetos a tu disposici??n.<br><br> 
        Cada repetici??n ofrece nuevas combinaciones, por lo que tendr??s que esforzarte al l??mite y utilizar una estrategia de combate distinta cada vez.",
        'PEGI 16',
        '1',
        'Housemarque',
        'n',
        11,
        86,
        "returnal_ps5/returnal_cuadrada.jpg",
        "returnal_ps5/returnal_rectangular.jpg",
        "returnal_ps5/returnal_1.jpg",
        "returnal_ps5/returnal_2.jpg",
        "returnal_ps5/returnal_3.jpg",
        "returnal_ps5/returnal_4.jpg",
        "returnal_ps5/returnal_5.jpg",
        "pegi-16.png"
),
(       29, 
	    "Sack Boy", 
        '2020-11-12', 
        "Emb??rcate en una aventura en solitario o forma equipo con valientes amigos mientras os lo pas??is en grande en monta??as nevadas, selvas frondosas, reinos subacu??ticos empapados y... colonias del espacio espacial.<br><br>
	     Acaba con Vex. Salva a los sack. Evita la cat??strofe. Ha llegado el momento de cumplir con tu destino, Sackboy.??Amable y achuchable ni??o a h??roe de arpillera... ??lzate, como un Caballero de la Puntada.",
        'PEGI 7',
        '1-4',
        'Sumo Digital',
        'n',
        11,
        79,
        "sack-boy_ps5/sackboy_cuadrada.jpg",
        "sack-boy_ps5/sackboy_rectangular.jpg",
        "sack-boy_ps5/sackboy_1.jpg",
        "sack-boy_ps5/sackboy_2.jpg",
        "sack-boy_ps5/sackboy_3.jpg",
        "sack-boy_ps5/sackboy_4.jpg",
        "sack-boy_ps5/sackboy_5.jpg",
        "pegi-7.png"
),
(       30, 
	    "Marvel's Spider-man Miles Morales", 
        '2020-11-12', 
        "Tu grandeza es ser t?? mismo. Vive la transformaci??n de Miles Morales en un incre??ble superh??roe con poderes explosivos que lo convertir??n en un nuevo Spiderman. En la ??ltima aventura del universo de Spider-Man de Marvel, el adolescente Miles Morales se adapta a su nuevo barrio al tiempo que sigue los pasos de Peter Parker, su mentor, y se convierte en un nuevo Spider-Man.<br><br>
        Pero cuando una feroz lucha de poderes amenaza con destruir su nuevo hogar, el aspirante a h??roe se da cuenta de que un gran poder debe conllevar una gran responsabilidad. Para salvar la Nueva York de Marvel, Miles debe tomar el relevo de Spider-Man y estar a la altura.",
        'PEGI 16',
        '1',
        'Insomniac Games',
        's',
        25,
        85,
        "spiderman-miles-morales_ps5/spiderman_cuadrado.jpg",
        "spiderman-miles-morales_ps5/spiderman_rectangular.jpg",
        "spiderman-miles-morales_ps5/spiderman_1.jpg",
        "spiderman-miles-morales_ps5/spiderman_2.jpg",
        "spiderman-miles-morales_ps5/spiderman_3.jpg",
        "spiderman-miles-morales_ps5/spiderman_4.jpg",
        "spiderman-miles-morales_ps5/spiderman_5.jpg",
        "pegi-16.png"
),
(       31, 
	    "Uncharted Col. Legado de los Ladrones", 
        '2022-01-28', 
        "Est??s en disposici??n de buscar fortuna? Busca tu legado y deja huella en el mundo con UNCHARTED: Colecci??n Legado de los Ladrones. Disfruta de la incre??ble narrativa cinematogr??fica y de las mayores secuencias de acci??n de la emblem??tica franquicia de Naughty Dog.<br><br>
        UNCHARTED:??Colecci??n Legado de los Ladrones incluye las laureadas aventuras para un jugador que ofrecen UNCHARTED 4: El Desenlace del Ladr??n y UNCHARTED: El Legado Perdido, remasterizadas con gr??ficos mejorados, mayor velocidad de fotogramas y un incre??ble nivel de detalle para la consola PS5???.",
        'PEGI 16',
        '1',
        'Naughty dog',
        's',
        14,
        87,
        "uncharted-col-legado_ps5/uncharted_cuadrada.jpg",
        "uncharted-col-legado_ps5/uncharted_rectangular.jpg",
        "uncharted-col-legado_ps5/uncharted_1.jpg",
        "uncharted-col-legado_ps5/uncharted_2.jpg",
        "uncharted-col-legado_ps5/uncharted_3.jpg",
        "uncharted-col-legado_ps5/uncharted_4.jpg",
        "uncharted-col-legado_ps5/uncharted_5.jpg",
        "pegi-16.png"
),
-- Videojuegos multi
(       32, 
	    "Crash Bandicoot 4", 
        '2020-10-02', 
        "??Ya era hora de que llegara un juego nuevo de Crash Bandicoot???! Crash se lanza de lleno con tus marsupiales favoritos a una aventura temporal que se cae a pedazos.Neo Cortex y N. Tropy han vuelto a las andadas y esta vez no planean darle la tabarra al universo.<br><br>
        ??su objetivo es el multiverso entero! Crash y Coco tendr??n que reunir cuatro m??scaras cu??nticas y trastocar las leyes de la realidad para salvar el mundo. ??Habilidades nuevas? Evidentemente. ??M??s personajes jugables? Sep. ??Dimensiones alternativas? Faltar??a m??s. ??Jefes alocad??simos? Por supuesto. ??Ca??ita de la buena? Por los 'jorts' que lleva que s??. ??C??mo? ??Entonces se llaman 'jorts' de verdad? ??En este universo no!",
        'PEGI 12',
        '1-4',
        'Activision Blizzard',
        's',
        26,
        85,
        "crash-bandicoot-4_multi/crash_bandicoot_4_cuadrada.jpg",
        "crash-bandicoot-4_multi/crash_bandicoot_4_rectangular.jpg",
        "crash-bandicoot-4_multi/crash_bandicoot_4_1.jpg",
        "crash-bandicoot-4_multi/crash_bandicoot_4_2.jpg",
        "crash-bandicoot-4_multi/crash_bandicoot_4_3.jpg",
        "crash-bandicoot-4_multi/crash_bandicoot_4_4.jpg",
        "crash-bandicoot-4_multi/crash_bandicoot_4_5.jpg",
        "pegi-12.png"
),
(       33, 
	    "Dying Light 2", 
        '2022-02-04', 
        "Hace m??s de veinte a??os, nos enfrentamos al virus en Harran... Y perdimos. Y ahora se avecina una nueva derrota. La Ciudad, uno de los ??ltimos grandes asentamientos de la humanidad, est?? siendo destruida por las luchas internas. La civilizaci??n ha vuelto a la Edad Oscura. Pero queda esperanza.<br><br>
        Eres un vagabundo con el poder de cambiar el futuro de la Ciudad. Pero tus excepcionales habilidades tienen un alto coste. Te atormentan recuerdos que no puedes descifrar, por lo que partes en busca de la verdad... y acabas en medio de una zona de combate.<br><br> 
        Practica tus habilidades porque para derrotar a tus enemigos y hacer amigos necesitar??s tanto ma??a como fuerza. Descubre los oscuros secretos de quienes tienen poder, elige tu bando y decide tu destino. Y, hagas lo que hagas, no pierdas tu humanidad.",
        'PEGI 18',
        '1-4',
        'Techland',
        's',
        40,
        76,
        "dying-light-2_multi/dying_light_2_cuadrada.jpg",
        "dying-light-2_multi/dying_light_2_rectangular.jpg",
        "dying-light-2_multi/dying_light_2_1.jpg",
        "dying-light-2_multi/dying_light_2_2.jpg",
        "dying-light-2_multi/dying_light_2_3.jpg",
        "dying-light-2_multi/dying_light_2_4.jpg",
        "dying-light-2_multi/dying_light_2_5.jpg",
        "pegi-18.png"
),
(       34, 
	    "Lego Star Wars - The Skywalker Saga", 
        '2022-04-05', 
        "La galaxia ser?? tuya con LEGO?? Star Wars???: La Saga De Skywalker. Revive los momentos emblem??ticos y la acci??n constante de las nueve pel??culas de la saga de Skywalker, reinterpretadas con el humor caracter??stico de LEGO. La edici??n digital tambi??n incluye el exclusivo personaje jugable Obi-Wan Kenobi cl??sico.",
        'PEGI 7',
        '1-2',
        'Warner Bros Interactive Entertainment',
        's',
        23,
        81,
        "lego-star-wars-tss_multi/lego_star_wars_cuadrada.jpg",
        "lego-star-wars-tss_multi/lego_star_wars_rectangular.jpg",
        "lego-star-wars-tss_multi/lego_star_wars_1.jpg",
        "lego-star-wars-tss_multi/lego_star_wars_2.jpg",
        "lego-star-wars-tss_multi/lego_star_wars_3.jpg",
        "lego-star-wars-tss_multi/lego_star_wars_4.jpg",
        "lego-star-wars-tss_multi/lego_star_wars_5.jpg",
        "pegi-7.png"
),
(       35, 
	    "Minecraft", 
        '2018-11-18', 
        "Explora mundos generados aleatoriamente y construye cosas maravillosas, desde una simple casa hasta un fastuoso castillo. Juega en modo creativo con recursos ilimitados o explota a lo grande el mundo con el modo supervivencia, fabricando armas y armaduras para deshacerte de peligrosas criaturas.<br><br>
        Esta versi??n te permitir?? jugar con diferentes dispositivos, acceder a m??ltiples contenidos a trav??s de la tienda del juego y obtener todas las futuras actualizaciones.",
        'PEGI 7',
        '1-4',
        'Mojang AB',
        'n',
        10,
        88,
        "minecraft_multi/minecraft_cuadrada.jpg",
        "minecraft_multi/minecraft_rectangular.jpg",
        "minecraft_multi/minecraft_1.jpg",
        "minecraft_multi/minecraft_2.jpg",
        "minecraft_multi/minecraft_3.jpg",
        "minecraft_multi/minecraft_4.jpg",
        "minecraft_multi/minecraft_5.jpg",
        "pegi-7.png"
),
(       36, 
	    "NBA 2K22", 
        '2021-09-10', 
        "NBA 2K22 pone un universo de baloncesto al alcance de tus manos. JUEGA YA en entornos realistas de la NBA y WNBA contra aut??nticos equipos y jugadores. Forma tu equipo de ensue??o en MyTEAM con las estrellas de la actualidad y leyendas del pasado. Vive tu propio ascenso al estrellato profesional de la NBA en Mi CARRERA. Demuestra tus capacidades como un importante director en Mi GM y Mi LIGA.<br><br>
        Seas quien seas, est??s donde est??s, puedes formar parte de NBA 2K22. Nuevas t??cticas ofensivas se enfrentan a una defensa actualizada para una experiencia de juego m??s competitiva e inmersiva en NBA 2K22. Suma las habilidades de dribblings, tiro, mates y alley-opps a tu gama de movimientos, y contraataca con nuevos bloqueos y punteos implacables al otro lado de la cancha. ",
        'PEGI 3',
        '1-4',
        '2k',
        'n',
        17,
        76,
        "nba2k-22_multi/nba2k22_cuadrada.jpg",
        "nba2k-22_multi/nba2k22_rectangular.jpg",
        "nba2k-22_multi/nba2k22_1.jpg",
        "nba2k-22_multi/nba2k22_2.jpg",
        "nba2k-22_multi/nba2k22_3.jpg",
        "nba2k-22_multi/nba2k22_4.jpg",
        "nba2k-22_multi/nba2k22_5.jpg",
        "pegi-3.png"
),
(       37, 
	    "FIFA 22", 
        '2021-10-01', 
        "En EA SPORTS??? FIFA 22, cada momento en el campo se potencia gracias a HyperMotion, una tecnolog??a de juego dise??ada para aprovechar la potencia de PlayStation 5.<br><br> 
        Al integrar la tecnolog??a de captura de movimiento avanzada en partidos 11 contra 11 y el aprendizaje autom??tico, HyperMotion aporta a FIFA 22 los datos de movimiento en tiempo real de los jugadores profesionales en partidos de alta intensidad para conseguir la experiencia de juego m??s realista, fluida y con mayor capacidad de respuesta de la historia de FIFA.<br><br> 
        Vuelven los modos de juego cl??sicos con una nueva temporada de innovaci??n: Crea tu propio club en el modo Carrera, sum??rgete en la nostalgia con el nuevo FIFA Ultimate Team Heroes y consigue recompensas por tu habilidad en las calles con un juego remodelado en VOLTA FOOTBALL",
        'PEGI 3',
        '1-4',
        'Electronic Arts',
        'n',
        7,
        78,
        "fifa-22_multi/fifa_22_cuadrada.jpg",
        "fifa-22_multi/fifa_22_rectangular.jpg",
        "fifa-22_multi/fifa_22_1.jpg",
        "fifa-22_multi/fifa_22_2.jpg",
        "fifa-22_multi/fifa_22_3.jpg",
        "fifa-22_multi/fifa_22_4.jpg",
        "fifa-22_multi/fifa_22_5.jpg",
        "pegi-3.png"
);
    
-- Caratulas Switch

INSERT INTO videojuego_en_consola(id_videojuego, id_consola, imagen_caja, precio)
VALUES(1, 'switch', 'zelda-botw_switch/zelda_botw_caja.jpg', 69.99),
	  (2, 'switch', 'luigis-mansion-3_switch/luigis_mansion_3_caja.jpg', 59.99),
	  (3, 'switch', 'animal-crossing-nh_switch/animal_crossing_nh_caja.jpg', 59.99),
      (4, 'switch', 'kirby-tierra-olvidada_switch/kirby_to_caja.jpg', 59.99),
      (5, 'switch', 'mario-golf-super-rush_switch/mario_golf_sr_caja.jpg', 59.99),
      (6, 'switch', 'mario-kart-8-deluxe_switch/mario_kart_8_caja.jpg', 59.99),
      (7, 'switch', 'mario-party-superstars_switch/mario_party_ss_caja.jpg', 59.99),
      (8, 'switch', 'pokemon-dia-bri_switch/pokemon_db_caja.jpg', 59.99),
      (9, 'switch', 'pokemon-per-rel_switch/pokemon_pr_caja.jpg', 59.99),
      (10, 'switch', 'pokemon-legends-arceus_switch/pokemon_caja.jpg', 59.99),
      (11, 'switch', 'super-mario-odyssey_switch/super_mo_caja.jpg', 59.99),
      (12, 'switch', 'super-smash-bros-ult_switch/super_smash_bros_caja.jpg', 69.99),
      (13, 'switch', 'the-witcher-3_switch/the_witcher_3_caja_switch.jpg', 39.99),
      (14, 'switch', 'zelda-skyward-sword_switch/zelda_ss_caja.jpg', 59.99),
      (32, 'switch', 'crash-bandicoot-4_multi/crash_bandicoot_4_caja_switch.jpg', 49.99),
      (33, 'switch', 'dying-light-2_multi/dying_light_2_caja_switch.jpg', 59.95),
      (34, 'switch', 'lego-star-wars-tss_multi/lego_star_wars_caja_switch.jpg', 59.95),
      (35, 'switch', 'minecraft_multi/minecraft_caja_switch.jpg', 59.95),
      (36, 'switch', 'nba2k-22_multi/nba2k22_caja_switch.jpg', 59.95),
      (37, 'switch', 'fifa-22_multi/fifa_22_caja_switch.jpg', 59.95),
-- Caratulas Xbox
      (15, 'xbox_s_xs', 'Flight_simulator_Xbox/Flight_simulator_caratula.jpg', 55.99),
      (16, 'xbox_s_xs', 'forza-horizon-5_Xbox/forza_horizon5_caratula.jpeg', 69.99),
      (17, 'xbox_s_xs', 'Gears_of_war5_Xbox/Gears5_caratula.jpg', 27.99),
      (18, 'xbox_s_xs', 'Grounded_Xbox/Grounded_caratula.jpg', 29.99),
      (19, 'xbox_s_xs', 'halo-infinite_Xbox/halo_caratula.jpeg', 69.99),
      (20, 'xbox_s_xs', 'Sable_Xbox/Sable_caratula.jpg', 24.99),
      (21, 'xbox_s_xs', 'Sea_of_thieves_Xbox/Sea_of_thieves_caratula.jpg', 19.99),
      (22, 'xbox_s_xs', 'Tunic_Xbox/Tunic_caratula.jpg', 29.99),
      (32, 'xbox_s_xs', 'crash-bandicoot-4_multi/crash_bandicoot_4_caja_xbox.jpg', 49.99),
      (33, 'xbox_s_xs', 'dying-light-2_multi/dying_light_2_caja_xbox.jpg', 59.95),
      (34, 'xbox_s_xs', 'lego-star-wars-tss_multi/lego_star_wars_caja_xbox.jpg', 59.95),
      (35, 'xbox_s_xs', 'minecraft_multi/minecraft_caja_xbox.jpg', 59.95),
      (36, 'xbox_s_xs', 'nba2k-22_multi/nba2k22_caja_xbox.jpg', 59.95),
      (37, 'xbox_s_xs', 'fifa-22_multi/fifa_22_caja_xbox', 59.95),
-- Caratulas ps5
	  (23, 'ps5', "death-stranding-director's-cut_ps5/death_stranding_caratula.jpg", 49.99),
      (24, 'ps5', "deathloop_ps5/deathloop_caja.jpg", 69.99),
      (25, 'ps5', "demons-souls_ps5/demons_souls_caja.jpg", 79.99),
      (26, 'ps5', "ghost-of-tsushima_ps5/ghost_of_tsushima_caratula.jpg", 79.99),
      (27, 'ps5', "ratchet-&-clank_ps5/ratchet_caja.jpg", 79.99),
      (28, 'ps5', "returnal_ps5/returnal_caja.jpg", 79.99),
      (29, 'ps5', "sack-boy_ps5/sackboy_caratula.jpg", 69.99),
      (30, 'ps5', "spiderman-miles-morales_ps5/spiderman_caratula.jpg", 59.99),
      (31, 'ps5', "uncharted-col-legado_ps5/uncharted_caratula.jpg", 49.99),
      (32, 'ps5', 'crash-bandicoot-4_multi/crash_bandicoot_4_caja_ps5.jpg', 59.95),
      (33, 'ps5', 'dying-light-2_multi/dying_light_2_caja_ps5.jpg', 59.95),
      (34, 'ps5', 'lego-star-wars-tss_multi/lego_star_wars_caja_ps5.jpg', 59.95),
      (35, 'ps5', 'minecraft_multi/minecraft_caja_ps5.jpg', 59.95),
      (36, 'ps5', 'nba2k-22_multi/nba2k22_caja_ps5.jpg', 59.95),
      (37, 'ps5', 'fifa-22_multi/fifa_22_caja_ps5.jpg', 59.95);
      
INSERT INTO videojuego_y_genero(id_videojuego, id_genero)
VALUES(1, 1),
	  (1, 2),
      (2, 1),
      (2, 2),
	  (3, 8),
      (4, 2),
      (4, 4),
      (5, 2),
      (5, 9),
      (5, 14),
      (6, 13),
      (6, 9),
      (7, 9),
      (8, 2),
      (8, 3),
      (9, 2),
      (9, 3),
      (10, 1),
      (10, 2),
      (10, 3),
      (11, 1),
      (11, 2),
      (11, 4),
      (12, 1),
      (12, 7),
      (13, 1),
      (13, 2),
      (13, 3),
      (14, 1),
      (14, 2),
	  (15, 8),
	  (16, 8),
	  (16, 13),
	  (17, 1),
	  (17, 2),
	  (17, 5),
	  (18, 1),
	  (18, 2),
	  (19, 1),
	  (19, 5),
	  (19, 10),
	  (20, 1),
	  (20, 2),
	  (21, 1),
	  (21, 2),
	  (22, 1),
	  (22, 3),
	  (23, 1),
      (24, 1),
      (25, 1),
      (26, 3),
      (27, 1),
      (28, 5),
      (29, 1),
      (30, 1),
      (31, 1),
	  (32, 1),
	  (33, 1),
	  (34, 1),
	  (35, 2),
	  (36, 14),
	  (37, 14);
	
    
-- Consolas Switch
INSERT INTO modelos_consolas
VALUES('nsoled',
	   'Nintendo Switch OLED',
       "Nintendo Switch ??? Modelo OLED incluye una pantalla de 7 pulgadas con un marco m??s fino. Los colores intensos y el alto contraste de la pantalla proporcionan una experiencia de juego port??til y de sobremesa enriquecedora, 
        y aportan mucha vida a los juegos, tanto si compites a gran velocidad sobre el asfalto como si te ves las caras con enemigos temibles.
        Abre el soporte y p??sale un mando a otro jugador para compartir la pantalla y disfrutar del multijugador competitivo y cooperativo, donde y cuando quieras.
		El soporte ancho ajustable de Nintendo Switch ??? Modelo OLED puede colocarse en el ??ngulo que prefieras para disfrutar del modo sobremesa c??modamente.
        La base incluida con Nintendo Switch ??? Modelo OLED cuenta con dos puertos USB, un puerto HDMI para conectarse al televisor y un nuevo puerto LAN por cable, que permite disfrutar del juego en l??nea de manera m??s estable en el modo televisor.
        Nintendo Switch ??? Modelo OLED cuenta con 64 GB de almacenamiento interno. Puedes ampliar el espacio disponible con una tarjeta microSD compatible (a la venta por separado). Descarga tus juegos favoritos para disfrutar de ellos donde y cuando quieras.",
        349.95,
        '2021-10-08',
        '102 mm x 242 mm x 13.9 mm',
        '320g',
        '64 GB',
        'nin_switch/ns_oled_blanca/ns_oled_blanca_cuadrada.jpg',
        'nin_switch/ns_oled_blanca/ns_oled_blanca_rectangular.jpg',
        'nin_switch/ns_oled_blanca/ns_oled_blanca_1.jpg',
        'nin_switch/ns_oled_blanca/ns_oled_blanca_2.jpg',
        'nin_switch/ns_oled_blanca/ns_oled_blanca_3.jpg',
        'switch'
        ),
        ('nsazulroja',
         'Nintendo Switch Azul Ne??n Rojo Ne??n',
         "Disfruta de una experiencia de consola dom??stica incluso sin televisor. Nintendo Switch se transforma para adaptarse a tu situaci??n y te permite jugar a los t??tulos que quieras aunque no tengas mucho tiempo.
		  Es una nueva era en la que no tienes que adaptar tu vida a los videojuegos: ahora es la consola la que se adapta a tu vida.
		  ??Disfruta de tus juegos cuando quieras, donde quieras y como quieras!
          Nintendo Switch tiene dos mandos, uno a cada lado de la consola, que funcionan juntos: los Joy-Con.
		  Si acoplas los dos Joy-Con al soporte para mandos Joy-Con, funcionar??n como un mando convencional, mientras que por separado funcionar??n como dos mandos individuales plenamente funcionales.",
          299.95,
		  '2017-03-03',
		  '102 mm x 239 mm x 13.9 mm',
          '297g',
          '32 GB',
          'nin_switch/ns_azul_roja/ns_azul_roja_cuadrada.jpg',
          'nin_switch/ns_azul_roja/ns_azul_roja_rectangular.jpg',
          'nin_switch/ns_azul_roja/ns_azul_roja_1.jpg',
          'nin_switch/ns_azul_roja/ns_azul_roja_2.jpg',
          'nin_switch/ns_azul_roja/ns_azul_roja_3.jpg',
          'switch'
          ),
          (
			'nsgris',
            'Nintendo Switch Gris',
			"Disfruta de una experiencia de consola dom??stica incluso sin televisor. Nintendo Switch se transforma para adaptarse a tu situaci??n y te permite jugar a los t??tulos que quieras aunque no tengas mucho tiempo.
			 Es una nueva era en la que no tienes que adaptar tu vida a los videojuegos: ahora es la consola la que se adapta a tu vida.
			 ??Disfruta de tus juegos cuando quieras, donde quieras y como quieras!
			 Nintendo Switch tiene dos mandos, uno a cada lado de la consola, que funcionan juntos: los Joy-Con.
			 Si acoplas los dos Joy-Con al soporte para mandos Joy-Con, funcionar??n como un mando convencional, mientras que por separado funcionar??n como dos mandos individuales plenamente funcionales.",
             299.95,
		     '2017-03-03',
		     '102 mm x 239 mm x 13.9 mm',
             '297g',
             '32 GB',
             'nin_switch/ns_gris/ns_gris_cuadrada.jpg',
             'nin_switch/ns_gris/ns_gris_rectangular.jpg',
             'nin_switch/ns_gris/ns_gris_1.jpg',
             'nin_switch/ns_gris/ns_gris_2.jpg',
             'nin_switch/ns_gris/ns_gris_3.jpg',
             'switch'
          ),
          (
			'nsliteama',
            'Nintendo Switch Lite Amarilla',
			"Una consola enfocada al juego port??til. Ideal para los jugadores que no se est??n quietos.
			 Nintendo Switch Lite, la nueva incorporaci??n a la familia Nintendo Switch, es una consola compacta, ligera y f??cil de transportar, que cuenta con controles integrados.
			 Con Nintendo Switch Lite se puede jugar a todos los programas de Nintendo Switch que son compatibles con el modo port??til. Es ideal para los usuarios que prefieran jugar fuera o para aquellos que quieran jugar en l??nea o de manera local en el modo multijugador con familiares o amigos que tengan una consola Nintendo Switch insignia.
			 Como se trata de una consola enfocada al juego port??til, Nintendo Switch Lite no puede conectarse al televisor.",
             219.95,
             '2019-09-20',
             '91.1 mm x 208 mm x 13.9 mm',
             '275g',
             '32 GB',
             'nin_switch/ns_lite_amarilla/ns_lite_amarilla_cuadrada.jpg',
             'nin_switch/ns_lite_amarilla/ns_lite_amarilla_rectangular.jpg',
             'nin_switch/ns_lite_amarilla/ns_lite_amarilla_1.jpg',
             'nin_switch/ns_lite_amarilla/ns_lite_amarilla_2.jpg',
             'nin_switch/ns_lite_amarilla/ns_lite_amarilla_3.jpg',
             'switch'
          ),
          (
			'nsliteazul',
            'Nintendo Switch Lite Azul',
			"Una consola enfocada al juego port??til. Ideal para los jugadores que no se est??n quietos.
			 Nintendo Switch Lite, la nueva incorporaci??n a la familia Nintendo Switch, es una consola compacta, ligera y f??cil de transportar, que cuenta con controles integrados.
			 Con Nintendo Switch Lite se puede jugar a todos los programas de Nintendo Switch que son compatibles con el modo port??til. Es ideal para los usuarios que prefieran jugar fuera o para aquellos que quieran jugar en l??nea o de manera local en el modo multijugador con familiares o amigos que tengan una consola Nintendo Switch insignia.
			 Como se trata de una consola enfocada al juego port??til, Nintendo Switch Lite no puede conectarse al televisor.",
             219.95,
             '2019-09-20',
             '91.1 mm x 208 mm x 13.9 mm',
             '275g',
             '32 GB',
             'nin_switch/ns_lite_azul/ns_lite_azul_cuadrada.jpg',
             'nin_switch/ns_lite_azul/ns_lite_azul_rectangular.jpg',
             'nin_switch/ns_lite_azul/ns_lite_azul_1.jpg',
             'nin_switch/ns_lite_azul/ns_lite_azul_2.jpg',
             'nin_switch/ns_lite_azul/ns_lite_azul_3.jpg',
             'switch'
          ),
          (
			'nslitecoral',
            'Nintendo Switch Lite Coral',
			"Una consola enfocada al juego port??til. Ideal para los jugadores que no se est??n quietos.
			 Nintendo Switch Lite, la nueva incorporaci??n a la familia Nintendo Switch, es una consola compacta, ligera y f??cil de transportar, que cuenta con controles integrados.
			 Con Nintendo Switch Lite se puede jugar a todos los programas de Nintendo Switch que son compatibles con el modo port??til. Es ideal para los usuarios que prefieran jugar fuera o para aquellos que quieran jugar en l??nea o de manera local en el modo multijugador con familiares o amigos que tengan una consola Nintendo Switch insignia.
			 Como se trata de una consola enfocada al juego port??til, Nintendo Switch Lite no puede conectarse al televisor.",
             219.95,
             '2019-09-20',
             '91.1 mm x 208 mm x 13.9 mm',
             '275g',
             '32 GB',
             'nin_switch/ns_lite_coral/ns_lite_coral_cuadrada.jpg',
             'nin_switch/ns_lite_coral/ns_lite_coral_rectangular.jpg',
             'nin_switch/ns_lite_coral/ns_lite_coral_1.jpg',
             'nin_switch/ns_lite_coral/ns_lite_coral_2.jpg',
             'nin_switch/ns_lite_coral/ns_lite_coral_3.jpg',
             'switch'
          ),
          (
			'nslitegris',
            'Nintendo Switch Lite Gris',
			"Una consola enfocada al juego port??til. Ideal para los jugadores que no se est??n quietos.
			 Nintendo Switch Lite, la nueva incorporaci??n a la familia Nintendo Switch, es una consola compacta, ligera y f??cil de transportar, que cuenta con controles integrados.
			 Con Nintendo Switch Lite se puede jugar a todos los programas de Nintendo Switch que son compatibles con el modo port??til. Es ideal para los usuarios que prefieran jugar fuera o para aquellos que quieran jugar en l??nea o de manera local en el modo multijugador con familiares o amigos que tengan una consola Nintendo Switch insignia.
			 Como se trata de una consola enfocada al juego port??til, Nintendo Switch Lite no puede conectarse al televisor.",
             219.95,
             '2019-09-20',
             '91.1 mm x 208 mm x 13.9 mm',
             '275g',
             '32 GB',
             'nin_switch/ns_lite_gris/ns_lite_gris_cuadrada.jpg',
             'nin_switch/ns_lite_gris/ns_lite_gris_rectangular.jpg',
             'nin_switch/ns_lite_gris/ns_lite_gris_1.jpg',
             'nin_switch/ns_lite_gris/ns_lite_gris_2.jpg',
             'nin_switch/ns_lite_gris/ns_lite_gris_3.jpg',
             'switch'
          ),
          (
			'nsliteturq',
            'Nintendo Switch Lite Turquesa',
			"Una consola enfocada al juego port??til. Ideal para los jugadores que no se est??n quietos.
			 Nintendo Switch Lite, la nueva incorporaci??n a la familia Nintendo Switch, es una consola compacta, ligera y f??cil de transportar, que cuenta con controles integrados.
			 Con Nintendo Switch Lite se puede jugar a todos los programas de Nintendo Switch que son compatibles con el modo port??til. Es ideal para los usuarios que prefieran jugar fuera o para aquellos que quieran jugar en l??nea o de manera local en el modo multijugador con familiares o amigos que tengan una consola Nintendo Switch insignia.
			 Como se trata de una consola enfocada al juego port??til, Nintendo Switch Lite no puede conectarse al televisor.",
             219.95,
             '2019-09-20',
             '91.1 mm x 208 mm x 13.9 mm',
             '275g',
             '32 GB',
             'nin_switch/ns_lite_turquesa/ns_lite_turquesa_cuadrada.jpg',
             'nin_switch/ns_lite_turquesa/ns_lite_turquesa_rectangular.jpg',
             'nin_switch/ns_lite_turquesa/ns_lite_turquesa_1.jpg',
             'nin_switch/ns_lite_turquesa/ns_lite_turquesa_2.jpg',
             'nin_switch/ns_lite_turquesa/ns_lite_turquesa_3.jpg',
             'switch'
          ),
-- Consolas Xbox
          (
			'XSerieS',
            'Xbox series S',
			"Solo digital, todo de nueva generacion
			P??sate a lo digital con la Xbox Series S y crea una biblioteca de juegos digitales. Tus juegos, partidas guardadas 
			y copias de seguridad est??n a salvo en la nube. Adem??s, disfruta de la capacidad de reservar y preinstalar 
			los juegos disponibles pr??ximamente para que puedas jugar a ellos en el momento de su lanzamiento.
			Velocidad redefinida
			Xbox Velocity Architecture, impulsada por un SSD personalizado, funciona junto con la innovadora tecnolog??a de 
			sistema en un chip (SOC) para ofrecer una jugabilidad de hasta 120 FPS en nuestra consola m??s peque??a.
			Tiempos de carga m??s r??pidos. Ultrarr??pido. Los juegos se cargan significativamente m??s r??pido con el SSD 
			personalizado en la Xbox Series S.
			M??s tiempo jugando, menos tiempo esperando. Con Reanudaci??n r??pida, puedes cambiar sin problemas entre varios 
			t??tulos diferentes y reanudar instant??neamente desde donde lo dejaste.
			Mejor aspecto. Mejor juego.
			Equipado con las arquitecturas Zen 2 y RDNA 2 de AMD, DirectX Raytracing ofrece iluminaci??n realista, sombras 
			y reflejos precisos para crear mundos din??micos y vivos.
			Escucha... estas rodeado.
			El sonido espacial 3D es la siguiente evoluci??n de la tecnolog??a de audio, que utiliza algoritmos avanzados 
			para crear mundos envolventes realistas que te sit??an en el centro de la experiencia.
			Las Xbox Series X|S son las primeras videoconsolas compatibles con Dolby Vision y Dolby Atmos, que mejoran 
			el juego con im??genes de espectro completo y audio envolvente.",
             299.99,
             '2020-11-10',
             '6,5 cm x 15,1 cm y 27,5 cm',
             '1.92kg',
             '512 GB',
             'Xbox/XseriesS/Xbox_seriesS_cuadrada.jpg',
             'Xbox/XseriesS/Xbox_seriesS_rectangular.jpg',
             'Xbox/XseriesS/Xbox_seriesS_1.jpg',
             'Xbox/XseriesS/Xbox_seriesS_2.jpg',
             'Xbox/XseriesS/Xbox_seriesS_3.jpg',
             'xbox_s_xs'
          ),
		  (
			'XSerieX',
            'Xbox series X',
			"La XBOX mas rapida y ma potente de la historia
			12 teraflops de potencia
			Los 12 teraflops de potencia de procesamiento alojados en el sistema en un chip (SOC) 
			funcionan con las arquitecturas Zen 2 y RDNA 2 de AMD para dar como resultado mundos que 
			exigen una mirada m??s cercana.
			Mejor aspecto. Mejor juego.
			Equipado con las arquitecturas Zen 2 y RDNA 2 de AMD, DirectX Raytracing ofrece iluminaci??n realista, 
			sombras y reflejos precisos para crear mundos din??micos y vivos.
			Escucha...estas rodeado
			El sonido espacial 3D es la siguiente evoluci??n de la tecnolog??a de audio, que utiliza algoritmos avanzados 
			para crear mundos envolventes realistas que te sit??an en el centro de la experiencia.
			Las Xbox Series X|S son las primeras videoconsolas compatibles con Dolby Vision y Dolby Atmos, que mejoran el 
			juego con im??genes de espectro completo y audio envolvente.
			Juegos en autentico 4K
			La Xbox Series X ofrece velocidades de cuadro sensacionalmente suaves de hasta 120 FPS con la explosi??n 
			visual que ofrece HDR. Sum??rgete con personajes m??s n??tidos, mundos m??s brillantes y detalles 
			imposibles con aut??ntico 4K.
			Dise??ado para la velocidad
			En conjunto, el nuevo sistema en un chip (SOC) y la soluci??n Xbox Velocity Architecture ponen la velocidad 
			al alcance de la mano, y el SSD personalizado de 1TB y la CPU ponen el volante en las manos, para que 
			puedas ir de 0 a 60 en hasta 120 FPS.
			",
             499,
             '2020-11-10',
             '15.1cm x 15.1cm x 30.1cm',
             '4.45kg',
             '1 TB',
             'Xbox/XseriesX/Xbox_seriesX_cuadrada.jpg',
             'Xbox/XseriesX/Xbox_seriesX_rectangular.jpg',
             'Xbox/XseriesX/Xbox_seriesX_1.jpg',
             'Xbox/XseriesX/Xbox_seriesX_2.jpg',
             'Xbox/XseriesX/Xbox_seriesX_3.jpg',
             'xbox_s_xs'
          ),
-- Consolas Ps5
          (
			'Ps5digital',
            'PlayStation 5 Digital Edition',
			"La consola PS5 hace posibles otras formas de juego que jam??s hab??as imaginado.
            Experimenta cargas r??pidas gracias a una unidad de estado s??lido (SSD) de alta velocidad, una inmersi??n m??s profunda con retroalimentaci??n h??ptica, gatillos adaptables y audio 3D, adem??s de una nueva generaci??n de juegos de PlayStation
            Descubre una experiencia de juego m??s intensa mediante tecnolog??a h??ptica, gatillos adaptables y audio 3D y una inmersi??n que te dejar?? sin aliento.
            D??jate sorprender por unos gr??ficos adecuados y experimenta nuevas funciones de PS5.",
             399.95,
             '2020-11-19',
             '47.7 cm x 18.2 cm x 43.3 cm',
             '5.79Kg',
             '500 GB',
             'consolas-ps5/ps5-digital/ps5-digital-cuadrada.jpg',
             'consolas-ps5/ps5-digital/ps5-digital-rectangular.jpg',
             'consolas-ps5/ps5-digital/ps5-digital.jpg',
             'consolas-ps5/ps5-digital/ps5-digital2.jpg',
             'consolas-ps5/ps5-digital/ps5-digital3.jpg',
             'ps5'
          ),
          (
			'Ps5disco',
            'PlayStation 5 Standard Edition',
			"La consola PS5 hace posibles otras formas de juego que jam??s hab??as imaginado.
            Experimenta cargas r??pidas gracias a una unidad de estado s??lido (SSD) de alta velocidad, una inmersi??n m??s profunda con retroalimentaci??n h??ptica, gatillos adaptables y audio 3D, adem??s de una nueva generaci??n de juegos de PlayStation
            Descubre una experiencia de juego m??s intensa mediante tecnolog??a h??ptica, gatillos adaptables y audio 3D y una inmersi??n que te dejar?? sin aliento.
            D??jate sorprender por unos gr??ficos adecuados y experimenta nuevas funciones de PS5.",
             499.95,
             '2020-11-19',
             '47.7 cm x 42.2 cm x 43.3 cm',
             '6.72Kg',
             '500 GB',
             'consolas-ps5/ps5-disco/ps5-disco-cuadrada.jpg',
             'consolas-ps5/ps5-disco/ps5-disco-rectangular.jpg',
             'consolas-ps5/ps5-disco/ps5-disco.jpg',
             'consolas-ps5/ps5-disco/ps5-disco2.jpg',
             'consolas-ps5/ps5-disco/ps5-disco3.jpg',
             'ps5'
          );


-- Accesorios Switch
INSERT INTO accesorios
VALUES(1,
	   'Nintendo Switch Pro Controller',
       '2017-03-03',
       'Juega en los ambientes m??s competitivos o supera las situaciones m??s dif??ciles con el mando Nintendo Switch ProController, el mando para la nueva generaci??n de Nintendo con el que conseguir??s el control m??s profesional. El Nintendo Switch Pro Controller incluye cable USB de carga y cuenta con la nueva tecnolog??a de vibraci??n HD, punto NFC para compatibilidad con figuras amiibo y sensores de movimiento.',
        69.95,
       '106 ?? 152 ?? 60 mm',
       '246 g',
       'Bluetooth 3.0, NFC',
       'nin_switch/ns_pro_controller/ns_pro_controller_cuadrada.jpg',
       'nin_switch/ns_pro_controller/ns_pro_controller_rectangular.jpg',
       'nin_switch/ns_pro_controller/ns_pro_controller_1.jpg',
       'nin_switch/ns_pro_controller/ns_pro_controller_2.jpg',
       'nin_switch/ns_pro_controller/ns_pro_controller_3.jpg',
       'switch'
       ),
       (2,
	   'Adventure Pack Pokemon Legends: Arceus',
       '2021-11-10',
       'Dise??ada para guardar todos los accesorios y Pok?? Balls que necesitas para llevar tu experiencia de Nintendo a cualquier parte. El cargador, la base, transformador y otros accesorios encajar??n de forma normal e ir??n perfectamente protegidas y seguras en esta mochila de transporte.
		Con ilustraciones de Pok??mon. Con licencia oficial de Nintendo y The Pok??mon Company International.',
        26.99,
       '10 x 20 x 2.5 cm',
       '226 g',
       'N/A',
       'nin_switch/adventure_pack_arceus/adventure_pack_arceus_cuadrada.jpg',
       'nin_switch/adventure_pack_arceus/adventure_pack_arceus_rectangular.jpg',
       'nin_switch/adventure_pack_arceus/adventure_pack_arceus_1.jpg',
       'nin_switch/adventure_pack_arceus/adventure_pack_arceus_2.jpg',
       'nin_switch/adventure_pack_arceus/adventure_pack_arceus_3.jpg',
       'switch'
       ),
	   (3,
	   'Funda Switch Animal Crossing',
       '2021-09-08',
       'Almacena y protege tu Nintendo Switch o Nintendo Switch Lite en la elegante funda de viaje de Animal Crossing Tom Nook Slim Deluxe. Mant??n tu consola en su lugar de forma segura hasta que la necesites, a continuaci??n, utiliza la correa de elevaci??n de la consola para una f??cil extracci??n con una sola mano. Haz que tu funda de viaje Slim Deluxe sea compatible con la bandeja incluida que almacena c??modamente tu Nintendo Switch Lite o se puede quitar para almacenar tu Nintendo Switch. Con un soporte integrado, puedes apoyar tu consola para jugar c??modamente sobre la marcha durante horas. Para los jugadores a los que les gusta el minimalismo, te encantar?? el dise??o elegante y elegante de la funda de viaje Slim Deluxe de Animal Crossing Tom Nook. Lleva esta funda con licencia oficial contigo dondequiera que vayas para las mejores sesiones de juego.',
        19.99,
       '1.02 x 0.24 x 0.59 pulgadas',
       '249 g',
       'N/A',
       'nin_switch/case_animal_crossing/case_animal_crossing_cuadrada.jpg',
       'nin_switch/case_animal_crossing/case_animal_crossing_rectangular.jpg',
       'nin_switch/case_animal_crossing/case_animal_crossing_1.jpg',
       'nin_switch/case_animal_crossing/case_animal_crossing_2.jpg',
       'nin_switch/case_animal_crossing/case_animal_crossing_3.jpg',
       'switch'
       ),
	   (4,
	   'Funda Switch Pok??mon Arceus',
       '2021-12-10',
       'Fabricada con materiales premium, esta robusta funda para los aut??nticos entrenadores Pok??mon resguardar?? tu consola en todas las situaciones. Adem??s, cuenta con dise??o exclusivo Leyendas Pok??mon: Arceus. El interior afelpado se adapta perfectamente a la consola y la protege de ara??azos y roces, al tiempo que ofrece espacio para guardar cartuchos de juego y peque??os accesorios.',
        24.99,
       '14 x 33 x 4.8 cm',
       '181 g',
       'N/A',
       'nin_switch/case_arceus/case_arceus_cuadrada.jpg',
       'nin_switch/case_arceus/case_arceus_rectangular.jpg',
       'nin_switch/case_arceus/case_arceus_1.jpg',
       'nin_switch/case_arceus/case_arceus_2.jpg',
       'nin_switch/case_arceus/case_arceus_3.jpg',
       'switch'
       ),
	   (5,
	   'Funda Switch Pok??mon Pikachu',
       '2021-12-10',
       'Lleva tus juegos all?? a donde vayas con esta exclusiva funda para consola redonda dise??ada especialmente para Nintendo Switch o Nintendo Switch Lite con licencia oficial de The Pok??mon Company International. El interior de esta funda para Nintendo Switch est?? hecho con un forro suave, tiene una etiqueta Pikachu 025, una solapa protectora de pantalla con almacenamiento para seis tarjetas de juego, as?? como bolsillos de rejilla para tus joy-con. Esta funda para juegos port??til con Pikachu 025 te da la libertad de divertirte en cualquier lado con tu Nintendo Switch. Donde quieras. Cuando quieras.',
        29.99,
       '26,3 x 12,7 x 5 cm ',
       '190 g',
       'N/A',
       'nin_switch/case_pikachu/case_pikachu_cuadrada.jpg',
       'nin_switch/case_pikachu/case_pikachu_rectangular.jpg',
       'nin_switch/case_pikachu/case_pikachu_1.jpg',
       'nin_switch/case_pikachu/case_pikachu_2.jpg',
       'nin_switch/case_pikachu/case_pikachu_3.jpg',
       'switch'
       ),
	   (6,
	   'Mando HORIPAD Mini Super Mario',
       '2020-09-16',
       '??HORI acerca la diversi??n a toda la familia! El HORIPAD Mini es ligero y compacto. Dise??ado con los jugadores m??s alevines en mente, su dise??o y ergonom??a lo hacen ideal tambi??n para aquellos con manos peque??as y los fans m??s devotos de Mario.
		Equipado con todos los botones esenciales y funci??n Turbo de propina, el HORIPAD Mini no requiere instalaci??n de ning??n tipo. Simplemente con??ctalo a la consola y ??listo! Para que te centres solo en lo que realmente importa: ??hacer correr a Mario!',
        24.99,
       '130 x 70 x 30 mm',
       '160 g',
       'Cable',
       'nin_switch/horipad_mini_mario/horipad_mini_mario_cuadrada.jpg',
       'nin_switch/horipad_mini_mario/horipad_mini_mario_rectangular.jpg',
       'nin_switch/horipad_mini_mario/horipad_mini_mario_1.jpg',
       'nin_switch/horipad_mini_mario/horipad_mini_mario_2.jpg',
       'nin_switch/horipad_mini_mario/horipad_mini_mario_3.jpg',
       'switch'
       ),
	   (7,
	   'Mario Kart Live Home Circuit',
       '2020-10-16',
       '??Disputa carreras en tu propia casa! Descubre tu sal??n, dormitorio, cocina y dem??s habitaciones desde una nueva perspectiva con carreras de Mario Kart que transcurren en tu hogar... ??y en la pantalla!
        Usa la consola Nintendo Switch para controlar el kart y mira c??mo reproduce las acciones del juego mientras aceleras y derrapas para hacerte con la victoria. La c??mara integrada del kart transmite a la pantalla de Nintendo Switch o del televisor las im??genes desde detr??s del asiento del piloto.',
        99.99,
       'N/A',
       'N/A',
       'N/A',
       'nin_switch/mklive_home_circuit/mklive_home_circuit_cuadrada.jpg',
       'nin_switch/mklive_home_circuit/mklive_home_circuit_rectangular.jpg',
       'nin_switch/mklive_home_circuit/mklive_home_circuit_1.jpg',
       'nin_switch/mklive_home_circuit/mklive_home_circuit_2.jpg',
       'nin_switch/mklive_home_circuit/mklive_home_circuit_3.jpg',
       'switch'
       ),
	   (8,
	   'Mando Switch Super Mario',
       '2018-11-08',
       'Juega tus juegos favoritos de Nintendo Switch como un profesional con este controlador inal??mbrico mejorado PowerA con licencia oficial. Dise??ado para mayor comodidad durante las sesiones de juego prolongadas, este controlador inal??mbrico Bluetooth cuenta con controles de movimiento, botones avanzados para juegos mapeables y dise??o ergon??mico est??ndar. Disfruta de hasta 30 horas de juego con nuevas bater??as alcalinas o a??ade tus propias bater??as recargables. ',
        34.99,
       '3.94 x 3.94 x 1.18 pulgadas',
       '267 g',
       'Bluetooth 5.0',
       'nin_switch/ns_ew_mario/ns_ew_mario_cuadrada.jpg',
       'nin_switch/ns_ew_mario/ns_ew_mario_rectangular.jpg',
       'nin_switch/ns_ew_mario/ns_ew_mario_1.jpg',
       'nin_switch/ns_ew_mario/ns_ew_mario_2.jpg',
       'nin_switch/ns_ew_mario/ns_ew_mario_3.jpg',
       'switch'
       ),
	   (9,
	   'Mando Switch Pok??mon Pikachu',
       '2018-11-08',
       'Juega tus juegos favoritos de Nintendo Switch como un profesional con este controlador inal??mbrico mejorado PowerA con licencia oficial. Dise??ado para mayor comodidad durante las sesiones de juego prolongadas, este controlador inal??mbrico Bluetooth cuenta con controles de movimiento, botones avanzados para juegos mapeables y dise??o ergon??mico est??ndar. Disfruta de hasta 30 horas de juego con nuevas bater??as alcalinas o a??ade tus propias bater??as recargables. ',
        34.99,
       '3.94 x 3.94 x 1.18 pulgadas',
       '267 g',
       'Bluetooth 5.0',
       'nin_switch/ns_ew_pik/ns_ew_pik_cuadrada.jpg',
       'nin_switch/ns_ew_pik/ns_ew_pik_rectangular.jpg',
       'nin_switch/ns_ew_pik/ns_ew_pik_1.jpg',
       'nin_switch/ns_ew_pik/ns_ew_pik_2.jpg',
       'nin_switch/ns_ew_pik/ns_ew_pik_3.jpg',
       'switch'
       ),
-- Accesorios PS5
	   (10,
	   'Ps5 Controller Dualsense Cosmic Red',
       '2021-06-18',
       'Compra el nuevo mando de Playstation 5 DualSense Cosmic Red, el nuevo dise??o del mando que multiplicar?? tus sensaciones ofreciendote un nuevo concepto de inmersi??n. Haz que los mundos de juego cobren vida y empieza a crear nuevos y ??picos recuerdos.',
        74.95,
       '160 ?? 66 ?? 106 mm',
       '280 g',
       'Communication Wireless: Bluetooth?? Ver5.1',
       'accesorios-ps5/dualsense-cosmic/dualsense-cosmic-cuadrada.jpeg',
       'accesorios-ps5/dualsense-cosmic/dualsense-cosmic-rectangular.jpg',
       'accesorios-ps5/dualsense-cosmic/dualsense-cosmic.jpg',
       'accesorios-ps5/dualsense-cosmic/dualsense-cosmic2.jpg',
       'accesorios-ps5/dualsense-cosmic/dualsense-cosmic3.jpg',
       'ps5'
       ),
       (11,
	   'Ps5 Controller Dualsense Galactic Purple',
       '2021-06-18',
       'Compra el nuevo mando inal??mbrico de Playstation 5 DualSense Galactic Purple que multiplicar?? tus sensaciones ofreciendote un nuevo concepto de inmersi??n. Haz que los mundos de juego cobren vida y empieza a crear nuevos y ??picos recuerdos.',
        74.95,
       '160 ?? 66 ?? 106 mm',
       '280 g',
       'Communication Wireless: Bluetooth?? Ver5.1',
       'accesorios-ps5/dualsense-galacticPurple/dualsense-galacticPurple-cuadrada.png',
       'accesorios-ps5/dualsense-galacticPurple/dualsense-galacticPurple-rectangular.jpeg',
       'accesorios-ps5/dualsense-galacticPurple/dualsense-galacticPurple.jpg',
       'accesorios-ps5/dualsense-galacticPurple/dualsense-galacticPurple2.jpg',
       'accesorios-ps5/dualsense-galacticPurple/dualsense-galacticPurple3.jpg',
       'ps5'
       ),
       (12,
	   'Ps5 Controller Dualsense Midnight Black',
       '2021-06-18',
       'Compra el nuevo mando inal??mbrico de Playstation 5 DualSense Midnight Black que multiplicar?? tus sensaciones ofreciendote un nuevo concepto de inmersi??n. Haz que los mundos de juego cobren vida y empieza a crear nuevos y ??picos recuerdos.',
        69.95,
       '160 ?? 66 ?? 106 mm',
       '280 g',
       'Communication Wireless: Bluetooth?? Ver5.1',
       'accesorios-ps5/dualsense-midnight/dualsense-midnight-cuadrada.jpg',
       'accesorios-ps5/dualsense-midnight/dualsense-midnight-rectangular.jpg',
       'accesorios-ps5/dualsense-midnight/dualsense-midnightBlack.jpg',
       'accesorios-ps5/dualsense-midnight/dualsense-midnightBlack2.jpg',
       'accesorios-ps5/dualsense-midnight/dualsense-midnightBlack3.jpg',
       'ps5'
       ),
       (13,
	   'Ps5 Controller Dualsense Nova Pink',
       '2021-06-18',
       'Compra el nuevo mando inal??mbrico de Playstation 5 DualSense Nova Pink que multiplicar?? tus sensaciones ofreciendote un nuevo concepto de inmersi??n. Haz que los mundos de juego cobren vida y empieza a crear nuevos y ??picos recuerdos.',
        74.95,
       '160 ?? 66 ?? 106 mm',
       '280 g',
       'Communication Wireless: Bluetooth?? Ver5.1',
       'accesorios-ps5/dualsense-novaPink/dualsense-novaPink-cuadrada.jpg',
       'accesorios-ps5/dualsense-novaPink/dualsense-novaPink-rectangular.jpeg',
       'accesorios-ps5/dualsense-novaPink/dualsense-novaPink.jpg',
       'accesorios-ps5/dualsense-novaPink/dualsense-novaPink2.jpg',
       'accesorios-ps5/dualsense-novaPink/dualsense-novaPink3.jpg',
       'ps5'
       ),
       (14,
	   'Ps5 Controller Dualsense Starlight Blue',
       '2021-06-18',
       'Compra el nuevo mando inal??mbrico de Playstation 5 DualSense Starlight Blue que multiplicar?? tus sensaciones ofreciendote un nuevo concepto de inmersi??n. Haz que los mundos de juego cobren vida y empieza a crear nuevos y ??picos recuerdos.',
        74.95,
       '160 ?? 66 ?? 106 mm',
       '280 g',
       'Communication Wireless: Bluetooth?? Ver5.1',
       'accesorios-ps5/dualsense-starlight/dualsense-starlight-cuadrada.jpeg',
       'accesorios-ps5/dualsense-starlight/dualsense-starlight-rectangular.jpeg',
       'accesorios-ps5/dualsense-starlight/dualsense-starlightBlue.jpg',
       'accesorios-ps5/dualsense-starlight/dualsense-starlightBlue2.jpg',
       'accesorios-ps5/dualsense-starlight/dualsense-starlightBlue3.jpg',
       'ps5'
       ),
       (15,
	   'Ps5 Controller Dualsense Blanco',
       '2021-06-18',
       'Compra el nuevo mando inal??mbrico de Playstation 5 DualSense que multiplicar?? tus sensaciones ofreciendote un nuevo concepto de inmersi??n. Haz que los mundos de juego cobren vida y empieza a crear nuevos y ??picos recuerdos.',
        69.95,
       '160 ?? 66 ?? 106 mm',
       '280 g',
       'Communication Wireless: Bluetooth?? Ver5.1',
       'accesorios-ps5/dualsense-white/dualsense-white-cuadrado.jpg',
       'accesorios-ps5/dualsense-white/dualsense-white-rectangular.jpg',
       'accesorios-ps5/dualsense-white/dualsense-white.jpg',
       'accesorios-ps5/dualsense-white/dualsense-white2.jpg',
       'accesorios-ps5/dualsense-white/dualsense-white3.jpg',
       'ps5'
       ),
       (16,
	   'Auriculares Inal??mbricos Blancos Pulse 3d Ps5',
       '2020-09-20',
       'Auriculares inal??mbricos PULSE 3D Los auriculares inal??mbricos PULSE 3D para PS5 ofrecen una nueva generaci??n de sonido para juegos. Los juegos suenan Disfruta de audio 3D en consolas PS5 con un auricular especialmente optimizado. Los auriculares inal??mbricos Pulse 3D cuentan con un dise??o mejorado con dos micr??fonos con cancelaci??n de ruido, un puerto USB Type-C para cargar y una serie de controles de f??cil acceso',
        99.95,
       '22 x 13 x 22.5 cm',
       '500 g',
       'Interfaz de receptor inal??mbrico: USB',
       'accesorios-ps5/auriculares-pulse3d-blancos/auriculares-pulse3d-blancos-cuadrada2.jpeg',
       'accesorios-ps5/auriculares-pulse3d-blancos/auriculares-pulse3d-blancos-rectangular.jpg',
       'accesorios-ps5/auriculares-pulse3d-blancos/auriculares-pulse3d-blancos.jpg',
       'accesorios-ps5/auriculares-pulse3d-blancos/auriculares-pulse3d-blancos2.jpg',
       'accesorios-ps5/auriculares-pulse3d-blancos/auriculares-pulse3d-blancos3.jpg',
       'ps5'
       ),
       (17,
	   'Auriculares Inal??mbricos Negros Pulse 3d Ps5',
       '2020-09-20',
       'Auriculares inal??mbricos PULSE 3D Los auriculares inal??mbricos PULSE 3D para PS5 ofrecen una nueva generaci??n de sonido para juegos. Los juegos suenan Disfruta de audio 3D en consolas PS5 con un auricular especialmente optimizado. Los auriculares inal??mbricos Pulse 3D cuentan con un dise??o mejorado con dos micr??fonos con cancelaci??n de ruido, un puerto USB Type-C para cargar y una serie de controles de f??cil acceso',
        99.95,
       '22 x 13 x 22.5 cm',
       '500 g',
       'Interfaz de receptor inal??mbrico: USB',
       'accesorios-ps5/auriculares-pulse3d-negros/auriculares-pulse3d-negros-cuadrada.jpg',
       'accesorios-ps5/auriculares-pulse3d-negros/auriculares-pulse3d-negros-rectangular.jpg',
       'accesorios-ps5/auriculares-pulse3d-negros/auriculares-pulse3d-negros.jpg',
       'accesorios-ps5/auriculares-pulse3d-negros/auriculares-pulse3d-negros2.jpg',
       'accesorios-ps5/auriculares-pulse3d-negros/auriculares-pulse3d-negros3.jpg',
       'ps5'
       ),

-- Accesorios Xbox
       (18,
	   'Auriculares edici??n 20 aniversario',
       '2021-10-07',
       'Ergonom??a c??moda | Ajuste universal | Ligero y flexible
        Juega alto y claro con los auriculares est??reo Xbox ??? 20th Anniversary Special Edition en negro 
        cl??sico con toques verdes que se remontan al principio, y mucho m??s. Viaja a trav??s del tiempo 
        con el micr??fono de pluma verde, las marcas verdes "L" y "R" dentro de los auriculares y los diales 
        de oreja negro transl??cido que honran la consola Xbox verde transl??cida original.',
        64.99,
       'N/A',
       'N/A',
       'jack 3.5mm',
       'xbox_series_xs/Cascos_Xbox/Auriculares20aniversario_Xbox/Auriculares20aniversario_cuadrada.jpg',
       'xbox_series_xs/Cascos_Xbox/Auriculares20aniversario_Xbox/Auriculares20aniversario_rectangular.jpg',
       'xbox_series_xs/Cascos_Xbox/Auriculares20aniversario_Xbox/Auriculares20aniversario_1.jpg',
       'xbox_series_xs/Cascos_Xbox/Auriculares20aniversario_Xbox/Auriculares20aniversario_2.jpg',
       'xbox_series_xs/Cascos_Xbox/Auriculares20aniversario_Xbox/Auriculares20aniversario_3.jpg',
       'xbox_s_xs'
       ),
        (19,
	   'Cascos est??reo de Xbox',
       '2021-09-21',
       'Ergonom??a c??moda | Ajuste universal | Ligeros y flexibles
        Sum??rgete en el juego
        Juega alto y claro con los Cascos est??reo Xbox, que ofrecen un chat ultran??tido y son compatibles 
        con el sonido espacial de alta fidelidad de Windows Sonic. Gracias a su dise??o flexible y ligero, 
        ofrecen una experiencia c??moda durante sesiones de juego prolongadas.',
        45,
       'N/A',
       'N/A',
       'jack 3.5mm',
       'xbox_series_xs/Cascos_Xbox/AuricularesEstereo_Xbox/Cascos_estereo_Xbox_cuadrada.jpg',
       'xbox_series_xs/Cascos_Xbox/AuricularesEstereo_Xbox/Cascos_estereo_Xbox_rectangular.jpg',
       'xbox_series_xs/Cascos_Xbox/AuricularesEstereo_Xbox/Cascos_estereo1_Xbox.jpg',
       'xbox_series_xs/Cascos_Xbox/AuricularesEstereo_Xbox/Cascos_estereo2_Xbox.jpg',
       'xbox_series_xs/Cascos_Xbox/AuricularesEstereo_Xbox/Cascos_estereo3_Xbox.jpg',
       'xbox_s_xs'
       ),
        (20,
	   'Cascos inal??mbricos de Xbox',
       '2021-03-16',
       'Emparejamiento directo con la consola | Sonido excepcional | Ligeros y flexibles

        El mejor rendimiento de audio de su clase
        Disfruta de un audio de alta calidad con baja latencia y una conexi??n totalmente inal??mbrica a tu consola Xbox, 
        sin la necesidad de una llave o estaci??n base. Admite tecnolog??as de sonido espacial como Windows Sonic, Dolby Atmos 
        y DTS Headphone:X para ofrecer un realismo y precisi??n de audio que te envuelven por completo.

        Dise??o c??mo e intuitivo
        Juega c??modamente durante horas con los auriculares ultrasuaves de dise??o ligero y ajuste personalizable. Los diales en los auriculares 
        de los Cascos inal??mbricos Xbox giran de un lado a otro, lo que demuestra el m??todo intuitivo de cambiar el volumen y lograr un equilibrio 
        entre el juego y el chat de voz. Aj??stalos r??pidamente y vuelve al juego. Los micr??fonos completamente ajustables se pliegan cuando no est??n en uso.

        Chat ultran??tido
        El aislamiento de voz centra el micr??fono en tu voz para reducir el ruido de fondo. Cuando no est??s hablando, la caracter??stica de 
        silenciamiento autom??tico se activa para despejar los canales de comunicaci??n, mientras que el bot??n de silenciamiento manual te da una opci??n 
        de privacidad cuando la necesites.

        Adaptados para ti
        Usa la app Accesorios para Xbox y ajusta los controles de audio, como la configuraci??n del ecualizador, aumento de graves, sensibilidad al 
        silenciamiento autom??tico y niveles de supervisi??n del micr??fono. Empar??jalos directamente con tu consola a trav??s de la conexi??n inal??mbrica 
        de Xbox sin necesidad de conectar una llave, cable o estaci??n base y con??ctalos a tu dispositivo m??vil con Bluetooth?? para escuchar m??sica 
        o chatear, est??s donde est??s.',
        99.99,
       'N/A',
       'N/A',
       'Bluetooth / Cable de carga USB-C',
       'xbox_series_xs/Cascos_Xbox/AuricularesInalambricos_Xbox/Auriculares_Inalambricos_Xbox_cuadrada.jpg',
       'xbox_series_xs/Cascos_Xbox/AuricularesInalambricos_Xbox/Auriculares_Inalambricos_Xbox_rectangular.jpg',
       'xbox_series_xs/Cascos_Xbox/AuricularesInalambricos_Xbox/Auriculares_Inalambricos1_Xbox.jpg',
       'xbox_series_xs/Cascos_Xbox/AuricularesInalambricos_Xbox/Auriculares_Inalambricos2_Xbox.jpg',
       'xbox_series_xs/Cascos_Xbox/AuricularesInalambricos_Xbox/Auriculares_Inalambricos3_Xbox.jpg',
       'xbox_s_xs'
       ),
        (21,
	   'Aqua Shift Special Edition',
       '2021-11-09',
       'Gatillos y bumpers texturizados | Cruceta h??brida | Asignaci??n de botones | Tecnolog??a Bluetooth
        Eleva tu juego
        Ponte surrealista con el mando inal??mbrico Xbox ??? Aqua Shift Special Edition, con un brillo azul que cambia de color 
        y agarres giratorios. Mant??ngase en el objetivo con un D-pad h??brido y un agarre texturizado en los gatillos, 
        los parachoques y la carcasa trasera. Capture y comparta contenido sin problemas con un bot??n Compartir dedicado. 
        Empareja r??pidamente, juega y cambia entre dispositivos, incluidos Xbox Series X|S, Xbox One, Pc con Windows 10 
        y dispositivos m??viles.',
        69.99,
       '17.8 cm x 7.3 cm x 17.7 cm',
       '480 g',
       'inalambrico / pilas AA',
       'xbox_series_xs/Mandos_Xbox/Mando_aquaShiftEspecialEdition_Xbox/xbox_xs_controller_aquaShift_cuadrada.jpg',
       'xbox_series_xs/Mandos_Xbox/Mando_aquaShiftEspecialEdition_Xbox/xbox_xs_controller_aquaShift_rectangular.jpg',
       'xbox_series_xs/Mandos_Xbox/Mando_aquaShiftEspecialEdition_Xbox/xbox_xs_controller_aquaShift1.jpg',
       'xbox_series_xs/Mandos_Xbox/Mando_aquaShiftEspecialEdition_Xbox/xbox_xs_controller_aquaShift2.jpg',
       'xbox_series_xs/Mandos_Xbox/Mando_aquaShiftEspecialEdition_Xbox/xbox_xs_controller_aquaShift3.jpg',
       'xbox_s_xs'
       ),
        (22,
	   'Daystrike Camo Special Edition',
       '2021-05-04',
       'Gatillos y bumpers texturizados | Cruceta h??brida | Asignaci??n de botones | Tecnolog??a Bluetooth
        Juega a otro nivel
        Disfruta del Mando Inal??mbrico Xbox: Daystrike Camo Special Edition, con un llamativo patr??n de camuflaje en rojo, 
        gris y negro. Toma el control con la nueva cruceta h??brida, agarre texturizado en los gatillos, botones 
        y parte trasera. Captura y comparte contenido sin problemas con el bot??n dedicado Compartir. 
        Empareja r??pidamente, juega y cambia entre dispositivos como Xbox Series X|S, Xbox One, PC Windows, Android e iOS.',
        64.99,
       '17.8 cm x 7.3 cm x 17.7 cm',
       '480 g',
       'inalambrico / pilas AA',
       'xbox_series_xs/Mandos_Xbox/Mando_Daystrike_camoSpecialEdition_Xbox/xbox_xs_controller_daystrikeCamoSpecial_cuadrada.jpg',
       'xbox_series_xs/Mandos_Xbox/Mando_Daystrike_camoSpecialEdition_Xbox/xbox_xs_controller_daystrikeCamoSpecial_rectangular.jpg',
       'xbox_series_xs/Mandos_Xbox/Mando_Daystrike_camoSpecialEdition_Xbox/xbox_xs_controller_daystrikeCamoSpecial1.jpg',
       'xbox_series_xs/Mandos_Xbox/Mando_Daystrike_camoSpecialEdition_Xbox/xbox_xs_controller_daystrikeCamoSpecial2.jpg',
       'xbox_series_xs/Mandos_Xbox/Mando_Daystrike_camoSpecialEdition_Xbox/xbox_xs_controller_daystrikeCamoSpecial3.jpg',
       'xbox_s_xs'
       ),
        (23,
	   'Edici??n especial del 20?? aniversario',
       '2021-11-15',
       'Gatillos y botones texturizados | Cruceta h??brida | Asignaci??n de botones | Tecnolog??a Bluetooth
        Celebremos juntos 20 a??os de Xbox.
        Celebra 20 a??os de Xbox con el Mando inal??mbrico Xbox: Edici??n especial del 20?? aniversario en color negro 
        cl??sico con toques verdes que vuelven a los inicios y mucho m??s. Viaja por el tiempo con los colores verdes 
        y negros transl??cidos de este mando hasta el momento del lanzamiento de la consola Xbox original en verde transl??cido. 
        Mira a trav??s de la parte superior en negro transl??cido para ver los detalles plateados en el interior que 
        representan 20 a??os de tecnolog??a de Xbox transportada hasta nuestros d??as.',
        69.99,
       '17.8 cm x 7.3 cm x 17.7 cm',
       '480 g',
       'inalambrico / pilas AA',
       'xbox_series_xs/Mandos_Xbox/Mando_edicionEspecial20aniversario_Xbox/xbox_xs_controller_edicion20aniversario_cuadrada.jpg',
       'xbox_series_xs/Mandos_Xbox/Mando_edicionEspecial20aniversario_Xbox/xbox_xs_controller_edicion20aniversario_rectangular.jpg',
       'xbox_series_xs/Mandos_Xbox/Mando_edicionEspecial20aniversario_Xbox/xbox_xs_controller_edicion20aniversario1.jpg',
       'xbox_series_xs/Mandos_Xbox/Mando_edicionEspecial20aniversario_Xbox/xbox_xs_controller_edicion20aniversario2.jpg',
       'xbox_series_xs/Mandos_Xbox/Mando_edicionEspecial20aniversario_Xbox/xbox_xs_controller_edicion20aniversario3.jpg',
       'xbox_s_xs'
       ),
        (24,
	   'Forza Horizon 5 Edici??n limitada',
       '2021-09-11',
       'Gatillos y bumpers texturizados | Cruceta h??brida | Asignaci??n de botones | Tecnolog??a Bluetooth
        Conduce con estilo
        Usa el Mando inal??mbrico Xbox ??? Forza Horizon 5 Edici??n limitada para disfrutar de la aventura Horizon definitiva, 
        con agarres personalizados inspirados en las carreras y un innovador acabado amarillo transparente. Domina cualquier 
        terreno con los gatillos texturizados, parte trasera personalizada y agarre con patrones inspirados en los volantes 
        de coches de alto rendimiento. Incluye contenido exclusivo: coche de edici??n Forza y art??culo cosm??tico
        (el contenido descargable requiere el juego Forza Horizon 5, que se vende por separado).',
        69.99,
       '17.8 cm x 7.3 cm x 17.7 cm',
       '480 g',
       'inalambrico / pilas AA',
       'xbox_series_xs/Mandos_Xbox/Mando_ForzaHorizon5Edici??nLimitada_Xbox/xbox_xs_controller_forzaHorizon5-cuadrada.jpg',
       'xbox_series_xs/Mandos_Xbox/Mando_ForzaHorizon5Edici??nLimitada_Xbox/xbox_xs_controller_forzaHorizon5-rectangular.jpg',
       'xbox_series_xs/Mandos_Xbox/Mando_ForzaHorizon5Edici??nLimitada_Xbox/xbox_xs_controller_forzaHorizon5-1.jpg',
       'xbox_series_xs/Mandos_Xbox/Mando_ForzaHorizon5Edici??nLimitada_Xbox/xbox_xs_controller_forzaHorizon5-2.jpg',
       'xbox_series_xs/Mandos_Xbox/Mando_ForzaHorizon5Edici??nLimitada_Xbox/xbox_xs_controller_forzaHorizon5-3.jpg',
       'xbox_s_xs'
       ),
        (25,
	   'Elite Series 2 ??? Halo Infinite Edici??n limitada',
       '2021-11-15',
       'Palancas de mando de tensi??n ajustable | Gatillos de alta sensibilidad con bloqueo m??s corto | Agarre texturizado envolvente | Componentes redise??ados
        FORMA PARTE DE LA ELITE
        Ponte en la armadura del mayor h??roe de la humanidad con el Mando inal??mbrico Xbox Elite Series 2 ??? Halo Infinite Edici??n limitada 
        y descubre m??s de 30 nuevas maneras de jugar como un profesional. Dispara a velocidad Spartan con los gatillos de alta sensibilidad 
        con bloqueo m??s corto y tres configuraciones exclusivas. Mejora tu punter??a con las nuevas palancas de mando ajustables y mant??n el 
        objetivo con un agarre envolvente en forma de diamante.
        Optimizado para ti
        Adapta el mando a tu estilo de juego preferido con nuevas formas intercambiables para las palancas de mando y la cruceta. Guarda hasta tres 
        perfiles personalizados y un perfil predeterminado en el mando y cambia entre ellos cuando quieras con el bot??n Perfil. Usa Xbox Wireless, 
        Bluetooth o el cable USB-C personalizado de color verde y naranja para jugar en tu consola Xbox One y dispositivos Windows 10.
        M??s formas de personalizar
        Disfruta de una personalizaci??n ilimitada con la app Accesorios de Xbox. Utiliza opciones de configuraci??n exclusivas, 
        como la asignaci??n de botones a comandos de voz como "grabar eso" o "hacer una captura de pantalla". Asigna un bot??n para que 
        act??e como la tecla May??s para habilitar entradas alternativas de cada uno de los otros botones.
        Dise??ado para sesiones de juego prolongadas
        Juega durante m??s tiempo con hasta 40 horas de bater??a recargable y componentes perfeccionados dise??ados para durar. Carga el mando 
        dentro o fuera de la funda de transporte personalizada de color verde oscuro con la insignia de la UNSC, la base de acoplamiento de 
        color negro y gris con detalles grabados y el cable USB-C personalizado de color verde y naranja.
        ??Qu?? se incluye en la caja?
            - Mando inal??mbrico Xbox Elite Series 2 ??? Halo Infinite Edici??n limitada
            - Funda de transporte
            - Juego de 6 palancas de mando: est??ndares (2), cl??sicas (2), alta (1), en c??pula (1)
            - Juego de 4 palancas: medianas (2), mini (2)
            - Juego de 2 crucetas: est??ndar, circular
            - Herramienta de ajuste de palanca de mando
            - Base de carga
            - Cable USB-C
            - S??mbolo de armas del Mando Xbox Elite',
        199.99,
       '17.5 cm x 7.3 cm x 17.7 cm',
       '500 g',
       'inalambrico / cableUSB',
       'xbox_series_xs/Mandos_Xbox/Mando_HaloInfiniteEdici??nLimitada_Xbox/xbox_xs_controller_haloEdicionLimitada_cuadrada.jpg',
       'xbox_series_xs/Mandos_Xbox/Mando_HaloInfiniteEdici??nLimitada_Xbox/xbox_xs_controller_haloEdicionLimitada_rectangular.jpg',
       'xbox_series_xs/Mandos_Xbox/Mando_HaloInfiniteEdici??nLimitada_Xbox/xbox_xs_controller_haloEdicionLimitada1.jpg',
       'xbox_series_xs/Mandos_Xbox/Mando_HaloInfiniteEdici??nLimitada_Xbox/xbox_xs_controller_haloEdicionLimitada2.jpg',
       'xbox_series_xs/Mandos_Xbox/Mando_HaloInfiniteEdici??nLimitada_Xbox/xbox_xs_controller_haloEdicionLimitada3.jpg',
       'xbox_s_xs'
       ),
        (26,
	   'Mando inal??mbrico Xbox Azul',
       '2020-11-10',
       'Gatillos y botones texturizados | Cruceta h??brida | Asignaci??n de botones | Tecnolog??a bluetooth
        Juega a otro nivel
        Disfruta del dise??o modernizado del mando inal??mbrico Xbox, con superficies esculpidas y una geometr??a refinada 
        para una mayor comodidad durante el juego. Toma el control con el agarre texturizado y la cruceta h??brida. 
        Captura y comparte contenido sin problemas con el bot??n dedicado Compartir. Empareja r??pidamente, juega y 
        cambia entre dispositivos como Xbox Series X|S, Xbox One, PC Windows 10, Android e iOS.',
        59.99,
       '7 cm x 17 cm x 18 cm',
       '480 g',
       'inalambrico / pilas AA',
       'xbox_series_xs/Mandos_Xbox/Mandos_Basic_Xbox/Mando_azul_Xbox/xbox_xs_controller_azul_cuadrada.jpg',
       'xbox_series_xs/Mandos_Xbox/Mandos_Basic_Xbox/Mando_azul_Xbox/xbox_xs_controller_azul_rectangular.jpg',
       'xbox_series_xs/Mandos_Xbox/Mandos_Basic_Xbox/Mando_azul_Xbox/xbox_xs_controller_azul1.jpg',
       'xbox_series_xs/Mandos_Xbox/Mandos_Basic_Xbox/Mando_azul_Xbox/xbox_xs_controller_azul2.jpg',
       'xbox_series_xs/Mandos_Xbox/Mandos_Basic_Xbox/Mando_azul_Xbox/xbox_xs_controller_azul3.jpg',
       'xbox_s_xs'
       ),
        (27,
	   'Mando inal??mbrico Xbox Blanco',
       '2020-11-10',
       'Gatillos y botones texturizados | Cruceta h??brida | Asignaci??n de botones | Tecnolog??a bluetooth
        Juega a otro nivel
        Disfruta del dise??o modernizado del mando inal??mbrico Xbox, con superficies esculpidas y una geometr??a refinada 
        para una mayor comodidad durante el juego. Toma el control con el agarre texturizado y la cruceta h??brida. 
        Captura y comparte contenido sin problemas con el bot??n dedicado Compartir. Empareja r??pidamente, juega y 
        cambia entre dispositivos como Xbox Series X|S, Xbox One, PC Windows 10, Android e iOS.',
        59.99,
       '7 cm x 17 cm x 18 cm',
       '480 g',
       'inalambrico / pilas AA',
       'xbox_series_xs/Mandos_Xbox/Mandos_Basic_Xbox/Mando_blanco_Xbox/xbox_xs_controller_blanco_cuadrada.jpg',
       'xbox_series_xs/Mandos_Xbox/Mandos_Basic_Xbox/Mando_blanco_Xbox/xbox_xs_controller_blanco_rectangular.jpg',
       'xbox_series_xs/Mandos_Xbox/Mandos_Basic_Xbox/Mando_blanco_Xbox/xbox_xs_controller_blanco1.jpg',
       'xbox_series_xs/Mandos_Xbox/Mandos_Basic_Xbox/Mando_blanco_Xbox/xbox_xs_controller_blanco2.jpg',
       'xbox_series_xs/Mandos_Xbox/Mandos_Basic_Xbox/Mando_blanco_Xbox/xbox_xs_controller_blanco3.jpg',
       'xbox_s_xs'
       ),
        (28,
	   'Mando inal??mbrico Xbox Negro',
       '2020-11-10',
       'Gatillos y botones texturizados | Cruceta h??brida | Asignaci??n de botones | Tecnolog??a bluetooth
        Juega a otro nivel
        Disfruta del dise??o modernizado del mando inal??mbrico Xbox, con superficies esculpidas y una geometr??a refinada 
        para una mayor comodidad durante el juego. Toma el control con el agarre texturizado y la cruceta h??brida. 
        Captura y comparte contenido sin problemas con el bot??n dedicado Compartir. Empareja r??pidamente, juega y 
        cambia entre dispositivos como Xbox Series X|S, Xbox One, PC Windows 10, Android e iOS.',
        59.99,
       '7 cm x 17 cm x 18 cm',
       '480 g',
       'inalambrico / pilas AA',
       'xbox_series_xs/Mandos_Xbox/Mandos_Basic_Xbox/Mando_negro_Xbox/xbox_xs_controller_negro_cuadrada.jpg',
       'xbox_series_xs/Mandos_Xbox/Mandos_Basic_Xbox/Mando_negro_Xbox/xbox_xs_controller_negro_rectangular.jpg',
       'xbox_series_xs/Mandos_Xbox/Mandos_Basic_Xbox/Mando_negro_Xbox/xbox_xs_controller_negro1.jpg',
       'xbox_series_xs/Mandos_Xbox/Mandos_Basic_Xbox/Mando_negro_Xbox/xbox_xs_controller_negro2.jpg',
       'xbox_series_xs/Mandos_Xbox/Mandos_Basic_Xbox/Mando_negro_Xbox/xbox_xs_controller_negro3.jpg',
       'xbox_s_xs'
       ),
        (29,
	   'Mando inal??mbrico Xbox Rojo',
       '2020-11-10',
       'Gatillos y botones texturizados | Cruceta h??brida | Asignaci??n de botones | Tecnolog??a bluetooth
        Juega a otro nivel
        Disfruta del dise??o modernizado del mando inal??mbrico Xbox, con superficies esculpidas y una geometr??a refinada 
        para una mayor comodidad durante el juego. Toma el control con el agarre texturizado y la cruceta h??brida. 
        Captura y comparte contenido sin problemas con el bot??n dedicado Compartir. Empareja r??pidamente, juega y 
        cambia entre dispositivos como Xbox Series X|S, Xbox One, PC Windows 10, Android e iOS.',
        59.99,
       '7 cm x 17 cm x 18 cm',
       '480 g',
       'inalambrico / pilas AA',
       'xbox_series_xs/Mandos_Xbox/Mandos_Basic_Xbox/Mando_rojo_Xbox/xbox_xs_controller_rojo_cuadrada.jpg',
       'xbox_series_xs/Mandos_Xbox/Mandos_Basic_Xbox/Mando_rojo_Xbox/xbox_xs_controller_rojo_rectangular.jpg',
       'xbox_series_xs/Mandos_Xbox/Mandos_Basic_Xbox/Mando_rojo_Xbox/xbox_xs_controller_rojo1.jpg',
       'xbox_series_xs/Mandos_Xbox/Mandos_Basic_Xbox/Mando_rojo_Xbox/xbox_xs_controller_rojo2.jpg',
       'xbox_series_xs/Mandos_Xbox/Mandos_Basic_Xbox/Mando_rojo_Xbox/xbox_xs_controller_rojo3.jpg',
       'xbox_s_xs'
       ),
        (30,
	   'Mando inal??mbrico Xbox Voltaje',
       '2020-11-10',
       'Gatillos y botones texturizados | Cruceta h??brida | Asignaci??n de botones | Tecnolog??a bluetooth
        Juega a otro nivel
        Disfruta del dise??o modernizado del mando inal??mbrico Xbox, con superficies esculpidas y una geometr??a refinada 
        para una mayor comodidad durante el juego. Toma el control con el agarre texturizado y la cruceta h??brida. 
        Captura y comparte contenido sin problemas con el bot??n dedicado Compartir. Empareja r??pidamente, juega y 
        cambia entre dispositivos como Xbox Series X|S, Xbox One, PC Windows 10, Android e iOS.',
        59.99,
       '7 cm x 17 cm x 18 cm',
       '480 g',
       'inalambrico / pilas AA',
       'xbox_series_xs/Mandos_Xbox/Mandos_Basic_Xbox/Mando_voltaje_Xbox/xbox_xs_controller_voltaje_cuadrada.jpg',
       'xbox_series_xs/Mandos_Xbox/Mandos_Basic_Xbox/Mando_voltaje_Xbox/xbox_xs_controller_voltaje_rectangular.jpg',
       'xbox_series_xs/Mandos_Xbox/Mandos_Basic_Xbox/Mando_voltaje_Xbox/xbox_xs_controller_voltaje1.jpg',
       'xbox_series_xs/Mandos_Xbox/Mandos_Basic_Xbox/Mando_voltaje_Xbox/xbox_xs_controller_voltaje2.jpg',
       'xbox_series_xs/Mandos_Xbox/Mandos_Basic_Xbox/Mando_voltaje_Xbox/xbox_xs_controller_voltaje3.jpg',
       'xbox_s_xs'
       ),
        (31,
	   'Edicion primavera: azul algodon',
       '2022-03-20',
       'Botones avanzados para videojuegos
        Consigue una ventaja sobre la competencia con dos botones avanzados para videojuegos asignables 
        que puedes programar en cualquier momento, incluso en medio de un juego.
        Ultracomodidad
        El dise??o ergon??mico, la distribuci??n intuitiva de botones y suaves anillos antifricci??n alrededor 
        de cada palanca de mando te permiten jugar con comodidad durante m??s tiempo que nunca.
        Videojuegos envolventes
        Tus juegos favoritos cobran vida cuando conectas tus auriculares al conector de auriculares de 3,5 mm y 
        sientes los dos motores de vibraci??n hiperrealistas en cada mano. Tanto si se trata de un ritmo palpitante 
        como de un sutil temblor, cada vez que juegues tendr??s la sensaci??n de haber entrado en un mundo completamente nuevo.
        Caracter??sticas esenciales de Xbox
        Un mando no queda completo sin el intuitivo bot??n Compartir f??cil de alcanzar, dial en los auriculares y 
        desactivaci??n del micr??fono de acceso f??cil. El mando Enhanced Wired Controller for Xbox Series X|S ofrece todo eso 
        y m??s.
        Cableado, pero no atado
        Un cable desmontable de alta calidad de 3 metros le da la libertad de jugar desde tu lugar favorito en la habitaci??n,
        luego puedes envolverlo con la correa de gancho conectada para guardarlo hasta la pr??xima vez que juegues.',
        41.99,
       '7 cm x 17 cm x 18 cm',
       '480 g',
       'USB cableado',
       'xbox_series_xs/Mandos_Xbox/Mandos_edicionPrimavera_Xbox/Mando_azul_algodon_Xbox/xbox_xs_controller_azulAlgodon_cuadrada.jpg',
       'xbox_series_xs/Mandos_Xbox/Mandos_edicionPrimavera_Xbox/Mando_azul_algodon_Xbox/xbox_xs_controller_azulAlgodon_rectangular.jpg',
       'xbox_series_xs/Mandos_Xbox/Mandos_edicionPrimavera_Xbox/Mando_azul_algodon_Xbox/xbox_xs_controller_azulAlgodon1.jpg',
       'xbox_series_xs/Mandos_Xbox/Mandos_edicionPrimavera_Xbox/Mando_azul_algodon_Xbox/xbox_xs_controller_azulAlgodon2.jpg',
       'xbox_series_xs/Mandos_Xbox/Mandos_edicionPrimavera_Xbox/Mando_azul_algodon_Xbox/xbox_xs_controller_azulAlgodon3.jpg',
       'xbox_s_xs'
       ),
        (32,
	   'Edicion primavera: remolinos purpura',
       '2022-03-20',
       'Botones avanzados para videojuegos
        Consigue una ventaja sobre la competencia con dos botones avanzados para videojuegos asignables 
        que puedes programar en cualquier momento, incluso en medio de un juego.
        Ultracomodidad
        El dise??o ergon??mico, la distribuci??n intuitiva de botones y suaves anillos antifricci??n alrededor 
        de cada palanca de mando te permiten jugar con comodidad durante m??s tiempo que nunca.
        Videojuegos envolventes
        Tus juegos favoritos cobran vida cuando conectas tus auriculares al conector de auriculares de 3,5 mm y 
        sientes los dos motores de vibraci??n hiperrealistas en cada mano. Tanto si se trata de un ritmo palpitante 
        como de un sutil temblor, cada vez que juegues tendr??s la sensaci??n de haber entrado en un mundo completamente nuevo.
        Caracter??sticas esenciales de Xbox
        Un mando no queda completo sin el intuitivo bot??n Compartir f??cil de alcanzar, dial en los auriculares y 
        desactivaci??n del micr??fono de acceso f??cil. El mando Enhanced Wired Controller for Xbox Series X|S ofrece todo eso 
        y m??s.
        Cableado, pero no atado
        Un cable desmontable de alta calidad de 3 metros le da la libertad de jugar desde tu lugar favorito en la habitaci??n,
        luego puedes envolverlo con la correa de gancho conectada para guardarlo hasta la pr??xima vez que juegues.',
        41.99,
       '7 cm x 17 cm x 18 cm',
       '480 g',
       'USB cableado',
       'xbox_series_xs/Mandos_Xbox/Mandos_edicionPrimavera_Xbox/Mando_remolinos_purpura_Xbox/xbox_xs_controller_remolinosPurpura_cuadrada.jpg',
       'xbox_series_xs/Mandos_Xbox/Mandos_edicionPrimavera_Xbox/Mando_remolinos_purpura_Xbox/xbox_xs_controller_remolinosPurpura_rectangular.jpg',
       'xbox_series_xs/Mandos_Xbox/Mandos_edicionPrimavera_Xbox/Mando_remolinos_purpura_Xbox/xbox_xs_controller_remolinosPurpura1.jpg',
       'xbox_series_xs/Mandos_Xbox/Mandos_edicionPrimavera_Xbox/Mando_remolinos_purpura_Xbox/xbox_xs_controller_remolinosPurpura2.jpg',
       'xbox_series_xs/Mandos_Xbox/Mandos_edicionPrimavera_Xbox/Mando_remolinos_purpura_Xbox/xbox_xs_controller_remolinosPurpura3.jpg',
       'xbox_s_xs'
       ),
        (33,
	   'Edicion primavera: rosa limonada',
       '2022-03-20',
       'Botones avanzados para videojuegos
        Consigue una ventaja sobre la competencia con dos botones avanzados para videojuegos asignables 
        que puedes programar en cualquier momento, incluso en medio de un juego.
        Ultracomodidad
        El dise??o ergon??mico, la distribuci??n intuitiva de botones y suaves anillos antifricci??n alrededor 
        de cada palanca de mando te permiten jugar con comodidad durante m??s tiempo que nunca.
        Videojuegos envolventes
        Tus juegos favoritos cobran vida cuando conectas tus auriculares al conector de auriculares de 3,5 mm y 
        sientes los dos motores de vibraci??n hiperrealistas en cada mano. Tanto si se trata de un ritmo palpitante 
        como de un sutil temblor, cada vez que juegues tendr??s la sensaci??n de haber entrado en un mundo completamente nuevo.
        Caracter??sticas esenciales de Xbox
        Un mando no queda completo sin el intuitivo bot??n Compartir f??cil de alcanzar, dial en los auriculares y 
        desactivaci??n del micr??fono de acceso f??cil. El mando Enhanced Wired Controller for Xbox Series X|S ofrece todo eso 
        y m??s.
        Cableado, pero no atado
        Un cable desmontable de alta calidad de 3 metros le da la libertad de jugar desde tu lugar favorito en la habitaci??n,
        luego puedes envolverlo con la correa de gancho conectada para guardarlo hasta la pr??xima vez que juegues.',
        41.99,
       '7 cm x 17 cm x 18 cm',
       '480 g',
       'USB cableado',
       'xbox_series_xs/Mandos_Xbox/Mandos_edicionPrimavera_Xbox/Mando_rosa_limonada_Xbox/xbox_xs_controller_rosaLimonada_cuadrada.jpg',
       'xbox_series_xs/Mandos_Xbox/Mandos_edicionPrimavera_Xbox/Mando_rosa_limonada_Xbox/xbox_xs_controller_rosaLimonada_rectangular.jpg',
       'xbox_series_xs/Mandos_Xbox/Mandos_edicionPrimavera_Xbox/Mando_rosa_limonada_Xbox/xbox_xs_controller_rosaLimonada1.jpg',
       'xbox_series_xs/Mandos_Xbox/Mandos_edicionPrimavera_Xbox/Mando_rosa_limonada_Xbox/xbox_xs_controller_rosaLimonada2.jpg',
       'xbox_series_xs/Mandos_Xbox/Mandos_edicionPrimavera_Xbox/Mando_rosa_limonada_Xbox/xbox_xs_controller_rosaLimonada3.jpg',
       'xbox_s_xs'
       ),
        (34,
	   'Bater??a recargable Xbox + cable USB-C',
       '2020-11-10',
       'Cargas mientras juegas | Carga completa en 4 horas.
        Di adi??s a los AAs
        Mant??n la acci??n con la bater??a recargable Xbox + cable USB-C. Recarga mientras juegas o despu??s, 
        incluso cuando tu Xbox est?? en espera. La bater??a recargable de larga duraci??n se carga completamente 
        en menos de 4 horas. Di adi??s a las bater??as desechables y al juego interrumpido.',
        24.99,
       'N/A',
       'N/A',
       'inalambrico / USB cableado',
       'xbox_series_xs/otros/Bateria_Recargable_Xbox/Bateria_Recargable_Xbox_cuadrada.jpg',
       'xbox_series_xs/otros/Bateria_Recargable_Xbox/Bateria_Recargable_Xbox_rectangular.jpg',
       'xbox_series_xs/otros/Bateria_Recargable_Xbox/Bateria_Recargable_Xbox1.jpg',
       'xbox_series_xs/otros/Bateria_Recargable_Xbox/Bateria_Recargable_Xbox2.jpg',
       'xbox_series_xs/otros/Bateria_Recargable_Xbox/Bateria_Recargable_Xbox3.jpg',
       'xbox_s_xs'
       );

INSERT INTO perfiles(nombre)
VALUES('admin'),
      ('cliente');

INSERT INTO usuarios
VALUES('alvaroqp', '$2a$10$884DrdQOroRJMKiuN1ulAu8thnVHWfLWKITKokb3ictiKimOTFTb.', 1, '??lvaro', 'Quiles Pomares', 'C/ Pok??mon 10', 'alvquipom@gmail.com', '2022-05-09', '/images/avatares/avatar-mg.png', 'hombre', 'si', 1),
	  ('sergiog', '$2a$10$884DrdQOroRJMKiuN1ulAu8thnVHWfLWKITKokb3ictiKimOTFTb.', 1, 'Sergio', 'Gomez', 'C/ Halo 14', 'sgom87@gmail.com', '2022-05-10', '/images/avatares/avatar-link.png', 'hombre', 'si', 1),
      ('jorgeg', '$2a$10$884DrdQOroRJMKiuN1ulAu8thnVHWfLWKITKokb3ictiKimOTFTb.', 1, 'Jorge', 'Garc??a', 'C/ Warzone 17', 'warzone@gmail.com', '2022-05-10', '/images/avatares/avatar-joel.png', 'hombre', 'si', 1),
	  ('marina', '$2a$10$BQ5U/nxe139LsefcT6uzfefacO9hZCD9oXo8RYAFOvd7uWldcbkG2', 1, 'Marina', 'Blanco', 'C/ Gran V??a 10', 'marina@mail.com', '2022-05-15', '/images/avatares/avatar-lara.png', 'mujer', 'si', 2),
	  ('noelia', '$2a$10$I7q7M3hZ0kLFF.iveawFsu5RgXf1jgkyXCMB1SVGUE6VSa6XTYBHC', 1, 'Noelia', 'L??pez', 'C/ Gran V??a 20', 'noelia@mail.com', '2022-05-15', '/images/avatares/avatar-zelda.png', 'mujer', 'no', 2),
      ('carlos', '$2a$10$cc/FdSDfrFnf9dOSQaSyr.wq4i1kc3Z63rGnZK0xT03rYhywrDM0q', 1, 'Carlos', 'Mart??nez', 'C/ Gran V??a 30', 'carlos@mail.com', '2022-05-15', '/images/avatares/avatar-kratos.png', 'hombre', 'si', 2);
      
-- --------------------- --
-- USUARIO Y PRIVILEGIOS --
-- --------------------- --
CREATE USER 'adminvideojuegos'@'localhost' IDENTIFIED BY 'adminvideojuegos';   
GRANT ALL PRIVILEGES ON pruebas_proyecto.* TO 'adminvideojuegos'@'localhost';


-- DROP DATABASE pruebas_proyecto;