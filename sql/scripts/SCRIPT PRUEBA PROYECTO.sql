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
    nombre VARCHAR(45) NOT NULL,
    descripcion VARCHAR(100),
    precio DECIMAL(9,2),
	imagen_cuadrada VARCHAR(100),
    imagen_rectangular VARCHAR(100),
    imagen_1 VARCHAR(100),
    imagen_2 VARCHAR(100),
    imagen_3 VARCHAR(100),
    imagen_4 VARCHAR(100),
    imagen_5 VARCHAR(100),
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
    imagen_usuario VARCHAR(100),
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

CREATE TABLE lineas_pedido (
	num_orden INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    id_pedido INT NOT NULL,
    id_videojuego INT,
    id_accesorio INT,
    id_modelo_consola VARCHAR(20),
    cantidad INT NOT NULL,
    precio_venta DECIMAL(9,2) NOT NULL,
    fecha_alta DATE NOT NULL,
    FOREIGN KEY(id_pedido) REFERENCES pedidos(id_pedido),
    FOREIGN KEY(id_videojuego) REFERENCES videojuegos(id_videojuego),
    FOREIGN KEY(id_accesorio) REFERENCES accesorios(id_accesorio),
    FOREIGN KEY(id_modelo_consola) REFERENCES modelos_consolas(id_modelo_consola)
);


-- ------- --
-- INSERTS --
-- ------- --
INSERT INTO consolas
VALUES('ps5', 'PlayStation 5',  'Sony', 'ps/playstation_logo.png'),
      ('switch', 'Nintendo Switch', 'Nintendo', 'switch/switch_logo.png'),
      ('xbox_s_xs', 'Xbox Series X|S', 'Microsoft', 'xbox/xbox_logo.png');
    
INSERT INTO generos(nombre)
VALUES('Acción'),
	  ('Aventura'),
      ('RPG'),
      ('Plataformas'),
      ('Shooter'),
      ('Estrategia'),
      ('Lucha'),
      ('Simulación'),
      ('Fiesta'),
      ('Arcade'),
      ('Música'),
      ('Puzzle'),
      ('Conducción'),
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
       'Olvida todo lo que sabes sobre los juegos de The Legend of Zelda. Entra en un mundo de descubrimientos, exploración y aventura en The Legend of Zelda: Breath of the Wild, un nuevo juego de la aclamada serie que rompe con las convenciones.<br><br>
		Tras un sueño de 100 años, Link despierta en un mundo que no es capaz de recordar. Nuestro héroe legendario deberá explorar un mundo vasto y peligroso, y recuperar su memoria antes de que Hyrule desaparezca para siempre. Link emprende un viaje para encontrar respuestas en el que solo dispondrá de aquello que encuentre por el camino.',
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
       "Únete a Luigi, un héroe de lo más cobardica, en una aventura fantasmagórica (y un pelín viscosa, todo hay que decirlo) para salvar a Mario y compañía en Luigi's Mansion 3 para Nintendo Switch.
		Puedes recorrer los sobrenaturales pisos de un hotel encantado en compañía de un amigo en el modo cooperativo, plantarles cara a fantasmas revoltosos y resolver puzles paranormales.
        ¿Quién puede rechazar una invitación a un hotel de lujo para pasar unas vacaciones de miedo con Mario y compañía? ¡Luigi no, desde luego! Sin embargo, el sueño pronto se convierte en pesadilla cuando los fantasmas empiezan a poner todo patas arriba y su macabra majestad, el Rey Boo, encierra a Mario y a sus amigos dentro de unos cuadros.
		Con la ayuda del inefable profesor Fesor y sus últimas invenciones, Luigi deberá armarse otra vez de valor para desbaratar los malvados planes del Rey Boo y salvar a todo el mundo.",
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
       "¡Archipiélago Paraíso te necesita! Únete al equipo de desarrollo inmobiliario de Nuria, y échale una mano para construir casas de vacaciones de ensueño.
		¡Más allá del horizonte te aguarda una nueva vida la mar de relajada! Desciende del avión y pon pie en tu propia isla desierta donde harás nuevos amigos y descubrimientos, y podrás disfrutar de mil oportunidades. ¡Crea un paraíso a tu medida en Animal Crossing: New Horizons para Nintendo Switch!",
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
        "Un buen día, un extraño vórtice aparece en el cielo del planeta Pop y absorbe todo lo que pilla... ¡Kirby incluido! Más tarde, nuestro héroe de color rosa recobra el conocimiento en un mundo en ruinas, en el que civilización y naturaleza comparten entorno. Ahora le toca a Kirby rescatar a los Waddle Dees, que han sido raptados por un temible grupo llamado 'la jauría'.
		 ¡En compañía de su nuevo amigo Elfilin, Kirby emprende una gran aventura para rescatar a los Waddle Dees y regresar a casa!",
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
        "Únete a tus personajes favoritos del Reino Champiñón y juega partidas de golf a toda velocidad en Mario Golf: Super Rush, solo para Nintendo Switch.
         Saca ventaja a los rivales en el modo 'Golf rápido', en el que todos los jugadores lanzan al mismo tiempo y luego salen corriendo hasta el hoyo…",
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
        "Mario, Luigi, Peach y otros personajes populares de la serie Super Mario están ahora acompañados por pilotos nuevos y veteranos, como Rey Boo, Bowsitos o Bowsy. ¡Incluso los inkling de Splatoon se unen a la carrera!
		 Una vez que hayas escogido un piloto, elige un vehículo y personalízalo con diferentes ruedas, carrocerías y alerones antes de sacarlo al asfalto.
		 Compite por tierra, mar y aire, e incluso por techos y paredes, en 48 niveles. Todos los circuitos (¡y personajes!) de Mario Kart 8 para Wii U vuelven en Mario Kart 8 Deluxe, incluido circuitos descargables anteriores inspirados en Animal Crossing, Excitebike, The Legend of Zelda y muchos más.",
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
        "¡Llamando a todas las superestrellas! Preparaos para pasarlo a lo grande con cinco tableros clásicos de la era de Nintendo 64 y 100 minijuegos de la serie en Mario Party Superstars para Nintendo Switch.
         Riega plantas, compite en carreras de coches, estira caras y más en una colección superestelar de 100 disparatados minijuegos de la serie Mario Party.",
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
		"Pokémon Diamante Brillante",
        "2021-11-19",
        "¡Vive una nostálgica aventura que vuelve a cobrar vida en Pokémon Diamante Brillante para Nintendo Switch! Emprende un viaje repleto de misterios a lo largo de la región de Sinnoh, atrapa Pokémon, enfréntate a los Entrenadores Pokémon más fuertes de la región y desbarata los pérfidos planes del Equipo Galaxia.
         Tu aventura comienza cuando un famoso profesor que investiga las evoluciones de los Pokémon te recluta para que viajes a lo largo y ancho de la región con el fin de completar una enciclopedia Pokémon conocida como Pokédex.",
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
        "Pokémon Perla Reluciente",
        "2021-11-19",
        "¡Vive una nostálgica aventura que vuelve a cobrar vida en Pokémon Perla Reluciente para Nintendo Switch! Emprende un viaje repleto de misterios a lo largo de la región de Sinnoh, atrapa Pokémon, enfréntate a los Entrenadores Pokémon más fuertes de la región y desbarata los pérfidos planes del Equipo Galaxia.
         Tu aventura comienza cuando un famoso profesor que investiga las evoluciones de los Pokémon te recluta para que viajes a lo largo y ancho de la región con el fin de completar una enciclopedia Pokémon conocida como Pokédex.",
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
        "Pokémon Legends: Arceus",
        "2022-01-28",
        "Explora parajes salvajes inmensos donde te aguardan un sinfín de descubrimientos en Leyendas Pokémon: Arceus para Nintendo Switch. Observa, atrapa e investiga a los Pokémon salvajes en este juego de acción y rol que se desarrolla en el pasado, cuando no era habitual que los humanos y los Pokémon convivieran en armonía.",
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
        "Bowser ha vuelto a secuestrar a la princesa Peach, pero esta vez, con 'buenas intenciones': ¡está preparando una boda por todo lo alto! El autoproclamado novio ha emprendido un viaje por el mundo para preparar el gran acontecimiento, y Mario tendrá que alcanzarlo para aguarle la fiesta, ¡pero los molestos Broodals no se lo van a poner fácil!",
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
        "Luchadores y mundos de juego míticos colisionan en el enfrentamiento definitivo: ¡Super Smash Bros. Ultimate para Nintendo Switch! Nuevos luchadores, como los inkling de la serie Splatoon, Ridley de la serie Metroid, Simon Belmont de Castlevania y Canela de Animal Crossing, hacen su debut en Super Smash Bros. junto a todos los personajes de las entregas anteriores. ¡Todos!",
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
        "Galardonado con más de 250 premios al juego del año, The Witcher 3: Wild Hunt es una aventura de mundo abierto basada en la narrativa y ambientada en un oscuro universo de fantasía.
		 Eres Geralt de Rivia, cazador de monstruos a sueldo. Tienes a tu disposición todas las herramientas de tu oficio: espadas afiladas, brebajes letales, ballestas sigilosas y una poderosa magia de combate. Ante ti se extiende un continente devastado por la guerra e infestado de monstruos que puedes explorar a tu antojo. ¿Cuál es tu contrato actual? Encontrar a la niña de la profecía, un arma viviente que puede alterar el mundo tal y como lo conocemos.",
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
        "El primer relato de la línea temporal de The Legend of Zelda lo protagoniza un joven caballero que deberá atravesar el cielo sin fin y la tierra mítica bajo este para encontrar a su amiga de la infancia, Zelda. A medida que el destino de ambos se va forjando, un misterioso señor de los demonios pone en marcha un pérfido plan para resucitar a un mal atávico...",
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
       'La edición Game of the Year (GOTY) Estándar de Microsoft Flight Simulator hace honor 
        a todos los comentarios positivos, las críticas y los premios obtenidos, pero también es un "Gracias" 
        a nuestros seguidores (tanto a los más recientes como a los más veteranos) que han hecho que este título 
        se convierta en un fenómeno. La edición Game of the Year Estándar de Microsoft Flight Simulator incluye 
        25 aeronaves de gran detalle con modelos de vuelo exclusivos y 38 aeropuertos creados a mano.

        Esta edición mejorada ofrece a los usuarios cinco aeronaves totalmente nuevas, 
        ocho nuevos aeropuertos creados a mano, seis nuevos vuelos introductorios, nuevos tutoriales 
        y actualizaciones del sistema meteorológico.',
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
       '¡Tu aventura definitiva en Horizon te espera! Explora paisajes dinámicos y en 
        constante evolución del mundo abierto de México con una acción de conducción ilimitada y 
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
       'De una de las sagas más aclamadas de la historia de los videojuegos, 
        la célebre campaña de Gears 5 y el renovado modo multijugador están totalmente 
        optimizados para Xbox Series X y Series S.

        Campaña: con una guerra sin cuartel inminente, Kait Diaz se separa para descubrir 
        su conexión con el enemigo y descubre el verdadero peligro para Sera: ella misma. 
        A partir del 10 de noviembre, lleva los aspectos de tu personaje y de tus armas a nuevas partidas 
        y disfruta de dificultades y modificadores adicionales.

        Jugador contra jugador: ¡que gane el mejor equipo! Con nuevos modos y contenidos desde el lanzamiento, 
        el modo Enfrentamiento recompensa todos los estilos competitivos, desde el casual hasta el profesional.

        Jugador contra la máquina: lucha en modo cooperativo para sobrevivir. Reúne a tu escuadrón y vence 
        a los enemigos de Horda o ábrete paso en Escape.',
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
        (sobre todo cuando te han encogido al tamaño de una hormiga). 
        Explora, construye y sobrevive en esta aventura cooperativa de supervivencia. 
        ¿Podrás prosperar junto a las hordas de insectos gigantes, luchando por sobrevivir 
        a los peligros del patio trasero? Únere a nuestra comunidad y ayuda a conformar 
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
       'Campaña:
        Cuando no hay esperanza y el futuro de la humanidad pende de un hilo, el Jefe Maestro 
        está preparado para luchar contra los enemigos más despiadados a los que se ha enfrentado. 
        Enfúndate la armadura del mayor héroe de la humanidad para disfrutar de una aventura épica y 
        explora a fondo el anillo de Halo. Compra Halo Infinite (campaña) para jugar a la campaña.

        Multijugador:
        El legendario modo multijugador, ahora gratis:
        ¡Vuelve el aclamado modo multijugador con un giro de tuerca y gratuito! Las actualizaciones 
        estacionales mejoran la experiencia a largo plazo con eventos únicos, mapas y modos nuevos, 
        además de contenido centrado en la comunidad.',
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
       'Embárcate en un viaje único e inolvidable en el que acompañarás 
        a Sable durante su planeo, un rito de iniciación que la llevará a recorrer vastos desiertos 
        y parajes impresionantes repletos de maravillas de otros tiempos y de restos de naves espaciales.

        Explora las dunas a lomos de tu aeromoto, escala unas ruinas monumentales y conoce a otros 
        nómadas mientras desvelas misterios olvidados y descubres quién se esconde en realidad detrás de esa máscara.

        El estilo artístico único y la original banda sonora de Japanese Breakfast te ayudarán a 
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
        feroces monstruos en TUNIC, un juego de acción isométrico sobre un pequeño zorro 
        que emprende una gran aventura. Abandonado en una playa misteriosa y armado solo 
        con tu propia curiosidad, deberás enfrentarte a bestias colosales, reunir extraños 
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
        "Hideo Kojima, el legendario creador de videojuegos, nos ofrece una experiencia que desafía a todos los géneros, ahora ampliada y remasterizada para PS5 en el DIRECTOR'S CUT.
         En el futuro, un evento misterioso conocido como el Death Stranding ha abierto una puerta entre los vivos y los muertos y ha permitido que grotescas criaturas del otro mundo deambulen por un planeta en ruinas habitado por una sociedad desolada.
	   En la piel de Sam Bridges, tu misión es llevar la esperanza a la humanidad, para lo que deberás conectar a los últimos supervivientes de unos Estados Unidos arrasados.
	   ¿Podrás volver a unir un mundo fragmentado, paso a paso?",
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
       "Participa en la eterna pugna entre dos asesinos extraordinarios. Ponte en la piel de Colt y busca la manera de intentar romper el bucle en el que estás atrapado en Blackreef al mismo tiempo que los habitantes de la isla te dan caza.
        Utiliza armas y habilidades poderosas para eliminar a ocho objetivos principales localizados en la impresionante y caótica isla antes de que el día comience de nuevo.
		En las sombras, te acechará Juliana, tu rival asesina, que tiene la única misión de abatir a Colt y mantener el bucle en funcionamiento. Aprende de cada ciclo y prueba caminos y estrategias nuevas para romper el bucle definitivamente.",
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
	  "Este remake rediseñado por completo, te invita a vivir la inquietante historia y el despiadado combate de Demon’s Souls. PlayStation Studios y Bluepoint Games presentan un remake del clásico de PlayStation, Demon's Souls. Este remake, rediseñado por completo y optimizado de forma magistral, presenta los horrores de una oscura y neblinosa tierra de fantasía a una nueva generación de jugadores. Aquellos que ya
        se hayan enfrentado a sus dificultades y adversidades pueden volver a desafiar a la oscuridad con una calidad visual sin igual y un rendimiento increíble.
        En la búsqueda por aumentar su poder, el rey Allant XII, monarca de Boletaria, canalizó las antiguas artes del alma y despertó a un demonio tan antiguo como el tiempo: el Anciano. Esta acción provocó que una niebla incolora se extendiera por toda la región, liberando a terroríficas criaturas hambrientas de almas humanas. Aquellos cuyas almas les fueron arrebatadas perdieron la cordura y solo les quedó el deseo de atacar a quien aún la conserve.
        Ahora, Boletaria está aislada del mundo exterior, y los caballeros que se atreven a penetrar la densa niebla para liberar la región desaparecen para siempre. Encarna a un guerrero solitario y adéntrate en la peligrosa niebla, donde deberás enfrentarte a los desafíos más difíciles para ganarte el título de 'matademonios' y devolver al Anciano a su letargo",
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
        "Se avecina una tormenta.Descubre la experiencia ampliada de Ghost  of Tsushima con Director´s Cut. Descubre las maravillas ocultas de Tsushima en esta aventura de acción de mundo abierto creada por Sucker Punch Productions y PlayStation Studios, disponible para PS5 y PS4.
        Forja un nuevo camino y libra una guerra poco convencional por la libertad de Tsushima. Reta a los oponentes con tu katana, domina el arco para eliminar amenazas a distancia, desarrolla tácticas de sigilo para tender emboscadas a los enemigos y explora una nueva historia en la isla de Iki.",
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
        "ghost-of-tsushima_ps5/ghost-of-tsushima_1.jpg",
        "pegi-18.png"
),
(       27, 
	  "Ratchet & Clank: Una Dimensión Aparte", 
        '2021-06-11', 
        "Lánzate a una aventura interdimensional. Viaja entre dimensiones con Ratchet y Clank en su lucha contra un malvado emperador de otra realidad. Salta entre mundos cargados de acción y más allá a velocidades de vértigo, 
        con unos gráficos espectaculares y un arsenal demencial en el estreno de estos aventureros intergalácticos en la consola PS5™",
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
        "Rompe el ciclo del caos en un planeta alienígena que no deja de cambiar. Tras el aterrizaje forzoso en este mundo cambiante, Selene debe buscar en el desolado paisaje una antigua civilización para poder escapar. Sola y aislada, se ve abocada a luchar con uñas y dientes para sobrevivir. Cae derrotada una y otra vez, lo que la obliga a reiniciar su viaje cada vez que muere
        .A través de un sistema de juego roguelike implacable, descubrirás que conforme el planeta cambia en cada ciclo, también lo hacen los objetos a tu disposición. Cada repetición ofrece nuevas combinaciones, por lo que tendrás que esforzarte al límite y utilizar una estrategia de combate distinta cada vez.",
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
        "Embárcate en una aventura en solitario o forma equipo con valientes amigos mientras os lo pasáis en grande en montañas nevadas, selvas frondosas, reinos subacuáticos empapados y... colonias del espacio espacial.
	   Acaba con Vex. Salva a los sack. Evita la catástrofe. Ha llegado el momento de cumplir con tu destino, Sackboy. Amable y achuchable niño a héroe de arpillera... Álzate, como un Caballero de la Puntada.",
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
        "Tu grandeza es ser tú mismo. Vive la transformación de Miles Morales en un increíble superhéroe con poderes explosivos que lo convertirán en un nuevo Spiderman. En la última aventura del universo de Spider-Man de Marvel, el adolescente Miles Morales se adapta a su nuevo barrio al tiempo que sigue los pasos de Peter Parker, su mentor, y se convierte en un nuevo Spider-Man.
        Pero cuando una feroz lucha de poderes amenaza con destruir su nuevo hogar, el aspirante a héroe se da cuenta de que un gran poder debe conllevar una gran responsabilidad. Para salvar la Nueva York de Marvel, Miles debe tomar el relevo de Spider-Man y estar a la altura.",
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
	  "Uncharted Colección Legado de los Ladrones", 
        '2022-01-28', 
        "Estás en disposición de buscar fortuna? Busca tu legado y deja huella en el mundo con UNCHARTED: Colección Legado de los Ladrones. Disfruta de la increíble narrativa cinematográfica y de las mayores secuencias de acción de la emblemática franquicia de Naughty Dog.
        UNCHARTED: Colección Legado de los Ladrones incluye las laureadas aventuras para un jugador que ofrecen UNCHARTED 4: El Desenlace del Ladrón y UNCHARTED: El Legado Perdido, remasterizadas con gráficos mejorados, mayor velocidad de fotogramas y un increíble nivel de detalle para la consola PS5™.",
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
      
-- Caratulas Xbox

      (15, 'xbox_s_xs', 'Flight_simulator_Xbox/Flight_simulator_caratula.jpg', 55.99),
      (16, 'xbox_s_xs', 'forza-horizon-5_Xbox/forza_horizon5_caratula.jpeg', 69.99),
      (17, 'xbox_s_xs', 'Gears_of_war5_Xbox/Gears5_caratula.jpg', 27.99),
      (18, 'xbox_s_xs', 'Grounded_Xbox/Grounded_caratula.jpg', 29.99),
      (19, 'xbox_s_xs', 'halo-infinite_Xbox/halo_caratula.jpeg', 69.99),
      (20, 'xbox_s_xs', 'Sable_Xbox/Sable_caratula.jpg', 24.99),
      (21, 'xbox_s_xs', 'Sea_of_thieves_Xbox/Sea_of_thieves_caratula.jpg', 19.99),
      (22, 'xbox_s_xs', 'Tunic_Xbox/Tunic_caratula.jpg', 29.99),

-- Caratulas ps5

	(23, 'ps5', "death-stranding-director's-cut_ps5/death_stranding_caratula.jpg", 49.99),
      (24, 'ps5', "deathloop_ps5/deathloop_caja.jpg", 69.99),
      (25, 'ps5', "demons-souls_ps5/demons_souls_caja.jpg", 79.99),
      (26, 'ps5', "ghost-of-tsushima_ps5/ghost_of_tsushima_caratula.jpg", 79.99),
      (27, 'ps5', "ratchet-&-clank_ps5/ratchet_caja.jpg", 79.99),
      (28, 'ps5', "returnal_ps5/returnal_caja.jpg", 79.99),
      (29, 'ps5', "sack-boy_ps5/sackboy_caratula.jpg", 69.99),
      (30, 'ps5', "spiderman-miles-morales_ps5/spiderman_caratula.jpg", 59.99),
      (31, 'ps5', "uncharted-col-legado_ps5/uncharted_caratula.jpg", 49.99);


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
      (31, 2);
	
    
-- Consolas Switch
INSERT INTO modelos_consolas
VALUES('nsoled',
	   'Nintendo Switch OLED',
       "Nintendo Switch – Modelo OLED incluye una pantalla de 7 pulgadas con un marco más fino. Los colores intensos y el alto contraste de la pantalla proporcionan una experiencia de juego portátil y de sobremesa enriquecedora, 
        y aportan mucha vida a los juegos, tanto si compites a gran velocidad sobre el asfalto como si te ves las caras con enemigos temibles.
        Abre el soporte y pásale un mando a otro jugador para compartir la pantalla y disfrutar del multijugador competitivo y cooperativo, donde y cuando quieras.
		El soporte ancho ajustable de Nintendo Switch – Modelo OLED puede colocarse en el ángulo que prefieras para disfrutar del modo sobremesa cómodamente.
        La base incluida con Nintendo Switch – Modelo OLED cuenta con dos puertos USB, un puerto HDMI para conectarse al televisor y un nuevo puerto LAN por cable, que permite disfrutar del juego en línea de manera más estable en el modo televisor.
        Nintendo Switch – Modelo OLED cuenta con 64 GB de almacenamiento interno. Puedes ampliar el espacio disponible con una tarjeta microSD compatible (a la venta por separado). Descarga tus juegos favoritos para disfrutar de ellos donde y cuando quieras.",
        349.95,
        '2021-10-08',
        '102 mm x 242 mm x 13.9 mm',
        '320g',
        '64 GB',
        '/nin_switch/ns_oled_blanca/ns_oled_blanca_cuadrada.jpg',
        '/nin_switch/ns_oled_blanca/ns_oled_blanca_rectangular.jpg',
        '/nin_switch/ns_oled_blanca/ns_oled_blanca_1.jpg',
        '/nin_switch/ns_oled_blanca/ns_oled_blanca_2.jpg',
        '/nin_switch/ns_oled_blanca/ns_oled_blanca_3.jpg',
        'switch'
        ),
        ('nsazulroja',
         'Nintendo Switch Azul Neón Rojo Neón',
         "Disfruta de una experiencia de consola doméstica incluso sin televisor. Nintendo Switch se transforma para adaptarse a tu situación y te permite jugar a los títulos que quieras aunque no tengas mucho tiempo.
		  Es una nueva era en la que no tienes que adaptar tu vida a los videojuegos: ahora es la consola la que se adapta a tu vida.
		  ¡Disfruta de tus juegos cuando quieras, donde quieras y como quieras!
          Nintendo Switch tiene dos mandos, uno a cada lado de la consola, que funcionan juntos: los Joy-Con.
		  Si acoplas los dos Joy-Con al soporte para mandos Joy-Con, funcionarán como un mando convencional, mientras que por separado funcionarán como dos mandos individuales plenamente funcionales.",
          299.95,
		  '2017-03-03',
		  '102 mm x 239 mm x 13.9 mm',
          '297g',
          '32 GB',
          '/nin_switch/ns_azul_roja/ns_azul_roja_cuadrada.jpg',
          '/nin_switch/ns_azul_roja/ns_azul_roja_rectangular.jpg',
          '/nin_switch/ns_azul_roja/ns_azul_roja_1.jpg',
          '/nin_switch/ns_azul_roja/ns_azul_roja_2.jpg',
          '/nin_switch/ns_azul_roja/ns_azul_roja_3.jpg',
          'switch'
          ),
          (
			'nsgris',
            'Nintendo Switch Gris',
			"Disfruta de una experiencia de consola doméstica incluso sin televisor. Nintendo Switch se transforma para adaptarse a tu situación y te permite jugar a los títulos que quieras aunque no tengas mucho tiempo.
			 Es una nueva era en la que no tienes que adaptar tu vida a los videojuegos: ahora es la consola la que se adapta a tu vida.
			 ¡Disfruta de tus juegos cuando quieras, donde quieras y como quieras!
			 Nintendo Switch tiene dos mandos, uno a cada lado de la consola, que funcionan juntos: los Joy-Con.
			 Si acoplas los dos Joy-Con al soporte para mandos Joy-Con, funcionarán como un mando convencional, mientras que por separado funcionarán como dos mandos individuales plenamente funcionales.",
             299.95,
		     '2017-03-03',
		     '102 mm x 239 mm x 13.9 mm',
             '297g',
             '32 GB',
             '/nin_switch/ns_gris/ns_gris_cuadrada.jpg',
             '/nin_switch/ns_gris/ns_gris_rectangular.jpg',
             '/nin_switch/ns_gris/ns_gris_1.jpg',
             '/nin_switch/ns_gris/ns_gris_2.jpg',
             '/nin_switch/ns_gris/ns_gris_3.jpg',
             'switch'
          ),
          (
			'nsliteama',
            'Nintendo Switch Lite Amarilla',
			"Una consola enfocada al juego portátil. Ideal para los jugadores que no se están quietos.
			 Nintendo Switch Lite, la nueva incorporación a la familia Nintendo Switch, es una consola compacta, ligera y fácil de transportar, que cuenta con controles integrados.
			 Con Nintendo Switch Lite se puede jugar a todos los programas de Nintendo Switch que son compatibles con el modo portátil. Es ideal para los usuarios que prefieran jugar fuera o para aquellos que quieran jugar en línea o de manera local en el modo multijugador con familiares o amigos que tengan una consola Nintendo Switch insignia.
			 Como se trata de una consola enfocada al juego portátil, Nintendo Switch Lite no puede conectarse al televisor.",
             219.95,
             '2019-09-20',
             '91.1 mm x 208 mm x 13.9 mm',
             '275g',
             '32 GB',
             '/nin_switch/ns_lite_amarilla/ns_lite_amarilla_cuadrada.jpg',
             '/nin_switch/ns_lite_amarilla/ns_lite_amarilla_rectangular.jpg',
             '/nin_switch/ns_lite_amarilla/ns_lite_amarilla_1.jpg',
             '/nin_switch/ns_lite_amarilla/ns_lite_amarilla_2.jpg',
             '/nin_switch/ns_lite_amarilla/ns_lite_amarilla_3.jpg',
             'switch'
          );


INSERT INTO perfiles(nombre)
VALUES('admin'),
      ('cliente');


-- --------------------- --
-- USUARIO Y PRIVILEGIOS --
-- --------------------- --
CREATE USER 'adminvideojuegos'@'localhost' IDENTIFIED BY 'adminvideojuegos';   
GRANT ALL PRIVILEGES ON pruebas_proyecto.* TO 'adminvideojuegos'@'localhost';

-- ----------------- --
-- QUERIES DE PRUEBA --
-- ----------------- --
SELECT videojuegos.titulo, vyg.id_genero, generos.nombre
FROM videojuegos
INNER JOIN videojuego_y_genero vyg ON videojuegos.id_videojuego = vyg.id_videojuego
INNER JOIN generos ON generos.id_genero = vyg.id_genero;

SELECT videojuegos.titulo, vec.id_consola, consolas.nombre
FROM videojuegos
INNER JOIN videojuego_en_consola vec ON videojuegos.id_videojuego = vec.id_videojuego
INNER JOIN consolas ON consolas.id_consola = vec.id_consola;

-- DROP DATABASE pruebas_proyecto;