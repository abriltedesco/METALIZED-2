<?php 
    session_start();
    $servername = "127.0.0.1";
    $database = "Metalized";
    $username = "alumno";
    $password = "alumnoipm";

    $conexion = mysqli_connect($servername, $username, $password, $database);
    if (!$conexion) {
        die("Conexion fallida: " . mysqli_connect_error());
    }
    else{        
        $queryPopular = /* consulta correcta */
        "SELECT Artista.nombre, Artista.imagen,count(*) FROM Usuario_escucha_Cancion
        JOIN Cancion ON idCancion = Cancion.id
        JOIN Album ON idAlbum = Album.id
        JOIN Artista ON idArtista = Artista.id 
        GROUP BY idCancion, Artista.id ORDER BY count(*) DESC LIMIT 15;";

        $queryMasEsc = 
        "SELECT Artista.imagen, Artista.nombre FROM Artista 
        JOIN Album ON idArtista = Artista.id
        JOIN Cancion ON idAlbum = Album.id
        JOIN Usuario_escucha_Cancion ON Cancion.id = Usuario_escucha_Cancion.idCancion  
        WHERE Usuario_escucha_Cancion.idUsuario = 1
        GROUP BY Cancion.id ORDER BY count(*) DESC;" ;

        $queryMTSE =
        "SELECT Artista.imagen, Artista.nombre, MIN(plays) 
        AS ultEscucha FROM Usuario_escucha_Cancion
        JOIN Cancion ON idCancion = Cancion.id
        JOIN Album ON idAlbum = Album.id
        JOIN Artista ON idArtista = Artista.id 
        WHERE idUsuario = 1
        GROUP BY Cancion.id, idUsuario ORDER BY ultEscucha ASC LIMIT 15;"; 
        
        $resultadoP = mysqli_query($conexion, $queryPopular);
        $resultadoME = mysqli_query($conexion, $queryMasEsc);
        $resultadoMTSE = mysqli_query($conexion, $queryMTSE);
    }
?>

<!DOCTYPE html>
<html lang="en">
    
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap');
    </style>
    <link rel="icon" type="image/png" href="calavera.png">
    <link rel="stylesheet" href="artistas.css" type="text/css"/>
    <title>Metalized</title>
</head>

<body>
    <header>
        <section id="contenedor1">
            <div class="nyl">
                <h2>Metalized</h2>
                <img src="calavera.png">
            </div>

            <div class="menu">
                <ul>
                    <li id="inicio"><a href="metalized.php">Inicio</a></li>
                    <li id="descubre"><a href="descubre.php">Descubre</a></li>
                    <li id="mi_libreria"><p>Mi libreria</p>
                        <ul class="milibreria">
                            <li id="uno"><a href="canciones.php">Canciones</a></li>
                            <li id="dos"><a href="artistas.php">Artistas</a></li>
                            <li id="tres"><a href="albumes.php">Albumes</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </section>
    </header>

    <main>
            <div class="barra_horizontal">
                <div class="solapa">
                    <h1>Artistas</h1>
                </div>

                <div class="seccionUsuario">
                    <img src="ftPerfil.jpg" >
                    <h2>Username</h2>
                </div>

                <div class="barraBusq">
                    <h3>Buscar</h3>
                    <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAAAXNSR0IArs4c6QAAAXBJREFUSEu1lH1VA0EMxGcUgAUUAAoAB1QBVAGgAKqAooCigFZBWwdFAeCgVRDe8LK8Pbp7TT8u/93b2/1lkkmIjoMdv48iwMyOAdwBuAZw5kksAIwBvJBcRhNbA5jZLYBnAIKUQo8/kBxFIA2AP/7qFycAhiRn+jazSwBPAC78vEdSilrjD+Bl+fTM+7UMzUyQRwBScrKpXDkgXZyQVO2rYWZSJSUDkrpXjRygJp4CuEplqd3yck0BLEieRwGmH0mGrGtmof9zBaELKVsHrEjW3Pb7664lUo/eAcxJyl2hHqQmj0n2gk3WPAyjAEn9AnAkv5MclC5mNv3WlIdt6sOUpOtTVhRong2a/J9KstGijR5kzdOqkGwpKcXKzwWTtTXtb7UytS27e192mg3Fhy87Pbg0szQ3OhuR7JcgIc9XeiGlaW9VITsDvC/aqDdZAmtK9gJEIHsDCpDGJj4IIIPM/q/5gwG2smnb6G971rmCH/JPnxkOXXf0AAAAAElFTkSuQmCC" 
                    id="lupa" />
                </div>
            </div>
        
        <div id="artistas">
            <section id="populares">
                    <h2>Popular</h2>
                <div class="carousel">
                    <div class="seccionBoton">
                        <button class="prev" onclick="changeSlide(-1)">&#10094;</button>
                    </div>
                    <div class="slides">
                        <div class=".slide-container">
                            <?php while($fila = mysqli_fetch_assoc($resultadoP)) {?>
                                <div class="contenedorArtista">
                                    <img src="<?php echo $fila['imagen']; ?>">
                                    <p class="artista"><?php echo $fila['nombre']; ?></p>
                                </div>
                            <?php } ?>
                        </div>
                    </div>
                    <div class="seccionBoton">
                    <button class="next" onclick="changeSlide(1)">&#10095;</button>
                    </div>
                </div>
            </section>

            <section id="masEscuchados">
                    <h2>Mas Escuchados</h2>
                <div class="carousel">
                    <div class="seccionBoton">
                        <button class="prev" onclick="changeSlide(0, -1)">&#10094;</button>
                    </div>
                    <div class="slides">
                        <?php while($fila = mysqli_fetch_assoc($resultadoP)) {?>
                            <div class="contenedorArtista">
                                <img src="<?php echo $fila['imagen']; ?>">
                                <p class="artista"><?php echo $fila['nombre']; ?></p>
                            </div>
                        <?php } ?>
                    </div>
                    <div class="seccionBoton">
                    <button class="next" onclick="changeSlide(0, 1)">&#10095;</button>
                    </div>
                </div>
            </section>

            <section id="masTiempoSinEscuchar">
                    <h2>Volver a Escuchar</h2>
                <div class="carousel">
                    <div class="seccionBoton">
                        <button class="prev" onclick="changeSlide(0, -1)">&#10094;</button>
                    </div>
                    <div class="slides">
                        <?php while($fila = mysqli_fetch_assoc($resultadoP)) {?>
                            <div class="contenedorAlbum">
                                <img src="<?php echo $fila['imagen']; ?>">
                                <p class="artista"><?php echo $fila['nombre']; ?></p>
                            </div>
                        <?php } ?>
                    </div>
                    <div class="seccionBoton">
                    <button class="next" onclick="changeSlide(0, 1)">&#10095;</button>
                    </div>
                </div>
            </section>
            </div>
    </main>

    <footer>
        <div id="barraProgreso-responsive">
            <div class="progress-responsive">
                <div class="progress-bar-responsive" style="width:75%;"></div>
            </div> 
        </div>
        <div id="imagenCancion">
            <?php 
            while($fila = mysqli_fetch_assoc($cancionActual)){ ?> 
                <img src="<?php echo $fila['imagen']?>">
                <div id="infoCancion">
                    <h2> <?php echo $fila['titulo']?> </h2>
                    <h3>  <?php echo $fila['nombre']?>  </h3>
                </div>
                <?php } ?>  
        </div>
        <section id="barraReproduccion">
            <div id="barraReproductora-iconos">
                <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAAAXNSR0IArs4c6QAAAK9JREFUSEvtle0NgzAMRB+TQTcpm3UU2KDdpJ2g1VWACB+ynQoVCfw3yT37LpCCjavYWJ/dAG7ANWda7wRv4A5cgGcEFAFIV+KCCOaqMaABStcpqAHZptJ005KWGklCXtq4xrMAg/Z4gh6wZFu/9gIqw6JEJwJ4dOJWyFmAyDXNAjizT0L/uuO16ATMvYt4Mtn7/5B/aD45OrtFkX+R1UTbfZT7eXCsjlfXve/BgQEfPOsqGYVSOv8AAAAASUVORK5CYII=" id="repetir"/>
                <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAAAXNSR0IArs4c6QAAALNJREFUSEvtlMERwjAMBDcVJB2EDkIJKYF0AJVAB6ED6ABKZMTAjElysj5+YX9P1snrsxsKr6Zwf6pBlvB/IeqAGzBtcJFaFNH4ab6DVfI8LRTTC3BOpk6H8rT3Fu8ENu0D2C+Q2B5P+ylXBkdgBoztcp0cbdXPM7gCrTBQWtjA+hqGJzAIREoLIUqLil1yamJRvAO9iKnSQjH9GtmFW6ODeGibWvShZT81VVANsugqoiyiFyspFBnP0GyFAAAAAElFTkSuQmCC" id="para-atras"/>
                <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAAAXNSR0IArs4c6QAAAIFJREFUSEvtlUEOgCAQA8vDTfQ9+iB/o2kiN6XLmkYPcAV26CyBAvMo5voYAGn4c0UrgAnALo/6sEAlOK59M4AlA4kCWJspmGbrAfUAal0CwtoygAoKaXsDCGn7NYC3ipqaI5PA1mTrNQ3puHOlFNmfCtVDOa8SyAJqwQAoQ/5P/wRI2x4ZwEPsdgAAAABJRU5ErkJggg==" id="play-boton"/>
                <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAAAXNSR0IArs4c6QAAALBJREFUSEvtlNENhCAQRJ8dagdnB5bgdXId3JWgHViCduBV4GUTScieC0jCj5HfmeWFGaCi8KoK788NiCZ83YheQAesBxmEtD+7FdEGzEADTGoqpJ0COHMPPL1JAVhaFkCGBqDdT+UDtJYNkEHpQyDvg16c9tFaqAPt/QIPA+C0bMC4by7F64h8LSsiKViKdssHaO0UYAFq45paWjKg+EOLfmKphut+dqkJRH13RNGIfg4wMhkmyB+fAAAAAElFTkSuQmCC" id="para-adelante"/>
                <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAAAXNSR0IArs4c6QAAAU1JREFUSEvVlNtRAkEQRQ8RSAaaAZoBRIBGgEaAZIIZYASYgYYgEYAZaARal+reasad2Vlr+bB/Z/eeftzuEWeO0Zn1+TeADXDf1o2hKvgG3oEZ8BlBQwKkewDuDHbkRICy8GjNJryPgVfguqUtqmAFqG1ZgN5ykJK48wRYpwB/lIDELy2LhyTLF2AOfFgFytir/wJugTf/JzcDla6PLhKIyl4AEpqGXguwM3HNoYnSkCPkCXg0mDKM4hL7s00lpGEq1CoJXZlbqo5AjU29LRFSJZ4bcvxZ7dgmalqmZohdpK4ZqD1ylWagWNqmCiKnefSegQbs4s/hzni7ZM0I6XUqlPHeMo/inq3vgex4YxX5HqTg4ibL13LRyfEysGYwKfTfHZcF5MTjtpcgrYAuQ5Te46k4WcKaPagB+6n41dKhAL1tWpN11TdDVZCF/QB4WlQZfSD04wAAAABJRU5ErkJggg==" id="aleatorio"/>
            </div>
            <div id="barraProgreso">
                <div class="progress">
                    <div class="progress-bar" style="width:75%;"></div>
                </div> 
            </div>
        </section>
    </footer>
    
    <script>
    const totalArtistas = <?php echo count($artistas); ?>; 
    const slidesContainers = document.querySelectorAll('.slides');
    let currentSlides = [0, 0, 0]; 

    /*function changeSlide(carouselIndex, direction) {
        currentSlides[carouselIndex] += direction;

        if (currentSlides[carouselIndex] < 0) {
            currentSlides[carouselIndex] = 0;
        } else if (currentSlides[carouselIndex] > totalAlbums - 5) {
            currentSlides[carouselIndex] = totalAlbums - 5;
        }

        slidesContainers[carouselIndex].innerHTML = '';
        for (let i = currentSlides[carouselIndex]; i < currentSlides[carouselIndex] + 5 && i < totalArtistas; i++) {
            const album = <?php echo json_encode($artistas); ?>[i];
            slidesContainers[carouselIndex].innerHTML += `
                <div class="contenedorArtista">
                <img src="${Artista.imagen}">
                <p class="artista">${Artista.nombre}</p>
                </div>`;
        }
    }*/

    let currentIndex = 0;
    const slideContainer = document.querySelector('.slide-container');
    const totalSlides = document.querySelectorAll('.contenedorArtista').length;

    function changeSlide(direction) {
    currentIndex += direction;

    // Asegúrate de que currentIndex esté dentro del rango
    if (currentIndex < 0) {
        currentIndex = 0;
    } else if (currentIndex > totalSlides - 5) { // Solo para mostrar 5 elementos
        currentIndex = totalSlides - 5;
    }

    // Cambia la posición del contenedor
    const offset = -currentIndex * (100 / 5); // Ajusta según el ancho
    slideContainer.style.transform = `translateX(${offset}%)`;
    }

        /*let currentSlide = 0;
        const slides = document.querySelectorAll('.contenedorArtista');
        currentSlide += direction;

        // Ciclo a través de los slides
        if (currentSlide < 0) {
            currentSlide = slides.length - 1; // Si es menor que 0, vuelve al último slide
        } else if (currentSlide >= slides.length) {
            currentSlide = 0; // Si es mayor o igual al número de slides, vuelve al primero
        }

        // Desplazar las slides
        const offset = -currentSlide * 100; // Ajuste el desplazamiento
        document.querySelector('.slides').style.transform = `translateX(${offset}%)`;
    }*/

    </script>
</body>
</html> 