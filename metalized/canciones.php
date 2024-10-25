<?php 
    $servername = "127.0.0.1";
    $database = "Metalized";
    $username = "alumno";
    $password = "alumnoipm";

    $conexion = mysqli_connect($servername, $username, $password, $database);
    if (!$conexion) {
        die("Conexion fallida: " . mysqli_connect_error());
    }
    else{
        $queryPopular = /* CONSULTA CORRECTA !!! */
        "SELECT Album.imagen, Cancion.titulo, Artista.nombre FROM Usuario
        JOIN Usuario_escucha_Cancion ON idUsuario = Usuario.id
        JOIN Cancion ON idCancion = Cancion.id
        JOIN Album ON idAlbum = Album.id
        JOIN Artista ON idArtista = Artista.id 
        GROUP BY idCancion ORDER BY count(*) DESC LIMIT 15;";
        
    
        $queryMasEsc = 
        "SELECT Album.imagen, Cancion.titulo, Artista.nombre FROM Usuario
        JOIN Usuario_escucha_Cancion ON idUsuario = Usuario.id
        JOIN Cancion ON idCancion = Cancion.id
        JOIN Album ON idAlbum = Album.id
        JOIN Artista ON idArtista = Artista.id 
        GROUP BY idCancion, idUsuario ORDER BY count(*) DESC LIMIT 15;" ; 
        
        $queryMTSE =
        "SELECT Album.imagen, Cancion.titulo, Artista.nombre, plays FROM Usuario
        JOIN Usuario_escucha_Cancion ON idUsuario = Usuario.id
        JOIN Cancion ON idCancion = Cancion.id
        JOIN Album ON idAlbum = Album.id
        JOIN Artista ON idArtista = Artista.id 
        ORDER BY plays ASC LIMIT 15;";
        
        
        $queryCanAct =
        "SELECT Cancion.titulo, Album.imagen, Artista.nombre FROM Cancion 
        JOIN Album ON idAlbum = Album.id 
        JOIN Artista ON idArtista = Artista.id
        WHERE Cancion.id =
                            (SELECT idCancion FROM Usuario_escucha_Cancion 
                            WHERE plays = current_date() AND plays = current_time()
                            );";

        $resultadoP = mysqli_query($conexion, $queryPopular);
        $resultadoME = mysqli_query($conexion, $queryMasEsc);
        $resultadoVAE = mysqli_query($conexion, $queryMTSE);
        $cancionActual = mysqli_query($conexion, $queryCanAct);
    }
?>

<!DOCTYPE html>
<html lang="en">
    
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>@import url('https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap');</style>
    <link rel="icon" type="image/png" href="calavera.png">
    <link rel="stylesheet" href="canciones.css" type="text/css"/>
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
                    <li><a href="metalized.php">Inicio</a></li>
                    <li><a href="descubre.php">Descubre</a></li>
                    <li>Mi libreria
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
                    <h2><?php echo $_SESSION['usuario'] ?></h2>
                </div>

                <div class="barraBusq">
                    <h3>Buscar</h3>
                    <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAAAXNSR0IArs4c6QAAAXBJREFUSEu1lH1VA0EMxGcUgAUUAAoAB1QBVAGgAKqAooCigFZBWwdFAeCgVRDe8LK8Pbp7TT8u/93b2/1lkkmIjoMdv48iwMyOAdwBuAZw5kksAIwBvJBcRhNbA5jZLYBnAIKUQo8/kBxFIA2AP/7qFycAhiRn+jazSwBPAC78vEdSilrjD+Bl+fTM+7UMzUyQRwBScrKpXDkgXZyQVO2rYWZSJSUDkrpXjRygJp4CuEplqd3yck0BLEieRwGmH0mGrGtmof9zBaELKVsHrEjW3Pb7664lUo/eAcxJyl2hHqQmj0n2gk3WPAyjAEn9AnAkv5MclC5mNv3WlIdt6sOUpOtTVhRong2a/J9KstGijR5kzdOqkGwpKcXKzwWTtTXtb7UytS27e192mg3Fhy87Pbg0szQ3OhuR7JcgIc9XeiGlaW9VITsDvC/aqDdZAmtK9gJEIHsDCpDGJj4IIIPM/q/5gwG2smnb6G971rmCH/JPnxkOXXf0AAAAAElFTkSuQmCC" 
                    id="lupa" />
                </div>
            </div>

        
            <div id="canciones">
                    <section id="populares">
                        <div class="descripcion">
                            <h2>Popular</h2>
                            <h3>Mostrar todo</h3>
                        </div>
                        <div class="carousel">
                    <div class="seccionBoton">
                    <button class="prevMTSE" onclick="changeSlide(2, -1)">&#10094;</button>
                    </div>
                    <div class="slides">
                        <?php for ($i = 0; $i < min(5, count($canciones)); $i++): ?>
                            <div class="contenedorCancion">
                                <img src="<?php echo $canciones[$i]['imagen']; ?>" alt="Album">
                                <p class="titulo"><?php echo $canciones[$i]['titulo']; ?></p>
                                <p class="artista"><?php echo $canciones[$i]['nombre']; ?></p>
                            </div>
                        <?php endfor; ?>
                    </div>
                    <div class="seccionBoton">
                    <button class="nextMTSE" onclick="changeSlide(2, 1)">&#10095;</button>
                    </div>
                        </div>
                    </section>


                    <section id="masEscuchados">
                        <div class="descripcion">
                            <h2>Username's mas escuchadas</h2>
                            <h3>Mostrar todo</h3>
                        </div>
                        <div class="carousel">
                    <div class="seccionBoton">
                    <button class="prevMTSE" onclick="changeSlide(2, -1)">&#10094;</button>
                    </div>
                    <div class="slides">
                        <?php for ($i = 0; $i < min(5, count($canciones)); $i++): ?>
                            <div class="contenedorCancion">
                                <img src="<?php echo $canciones[$i]['imagen']; ?>" alt="Album">
                                <p class="titulo"><?php echo $canciones[$i]['titulo']; ?></p>
                                <p class="artista"><?php echo $canciones[$i]['nombre']; ?></p>
                            </div>
                        <?php endfor; ?>
                    </div>
                    <div class="seccionBoton">
                    <button class="nextMTSE" onclick="changeSlide(2, 1)">&#10095;</button>
                    </div>
                        </div>
                    </section>

                
                    <section id="masTiempoSinEscuchar">
                        <div class="descripcion">
                            <h2>Volver a escuchar</h2>
                            <h3>Mostrar todo</h3>
                        </div>
                        <div class="carousel">
                    <div class="seccionBoton">
                    <button class="prevMTSE" onclick="changeSlide(2, -1)">&#10094;</button>
                    </div>
                    <div class="slides">
                        <?php for ($i = 0; $i < min(5, count($canciones)); $i++): ?>
                            <div class="contenedorCancion">
                                <img src="<?php echo $canciones[$i]['imagen']; ?>" alt="Album">
                                <p class="titulo"><?php echo $canciones[$i]['titulo']; ?></p>
                                <p class="artista"><?php echo $canciones[$i]['nombre']; ?></p>
                            </div>
                        <?php endfor; ?>
                    </div>
                    <div class="seccionBoton">
                    <button class="nextMTSE" onclick="changeSlide(2, 1)">&#10095;</button>
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
    const totalSongs = <?php echo count($canciones); ?>; 
    const slidesContainers = document.querySelectorAll('.slides');
    let currentSlides = [0, 0, 0]; 

    function changeSlide(carouselIndex, direction) {
        currentSlides[carouselIndex] += direction;
        if (currentSlides[carouselIndex] < 0) {
            currentSlides[carouselIndex] = 0;
        } else if (currentSlides[carouselIndex] > totalSongs - 5) {
            currentSlides[carouselIndex] = totalSongs - 5;
        }

        slidesContainers[carouselIndex].innerHTML = '';
        for (let i = currentSlides[carouselIndex]; i < currentSlides[carouselIndex] + 5 && i < totalSongs; i++) {
            const album = <?php echo json_encode($canciones); ?>[i];
            slidesContainers[carouselIndex].innerHTML += `
                <div class="contenedorCancion">
                <img src="${Album.imagen}" alt="Cover del Album">
                <p class="titulo">${Cancion.titulo}</p>
                <p class="artista">${Artista.nombre}</p>
                </div>`;
        }
    }
    </script>
</body>
</html> 
