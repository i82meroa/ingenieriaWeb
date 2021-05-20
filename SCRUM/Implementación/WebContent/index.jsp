<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean  id="customerBean" scope="session" class="bean.CustomerBean"></jsp:useBean>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel = "preconnect" href = "https://fonts.gstatic.com">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans+Condensed:wght@300&display=swap" rel="stylesheet">
    <title>JaaMusic!</title>
    <link rel="shortcut icon" href="/IW/imgs/logoBlanco.PNG">
    <link rel="stylesheet" href="/IW/css/normalize.css">
    <link rel="stylesheet" href="/IW/css/style.css">
</head>

<body>
    <header class="encabezado">
        <img src="/IW/imgs/logoBlanco.PNG" >
        <h1>JaaMusic! <span>Tu Biblioteca de obras clásicas</span></h1>
           
    </header>

    <div class="navPrincipalBg">
        <nav class="menuPrincipal contenido">
        <% 
        if (null == customerBean || customerBean.getNombreUsuario().equals("")) {
        %>
        	<a href="/IW/MVC/Controlador/iniciarSesionControlador.jsp">Iniciar Sesion</a>
            <a href="/IW/MVC/Controlador/registrarUsuarioControlador.jsp">Regístrate</a>
            <% }else{ %>
            <a href="/IW/indexLogueado.jsp"><%=customerBean.getNombreUsuario() %></a>
            <a href="/IW/MVC/Controlador/desconectarControlador.jsp">Desconectar</a>
            <% }%>
        </nav>    
    </div>
    
    <section>
        <div class="introduccion">
            <h2>TU PARTITURA EN CUALQUIER LUGAR</h2>
            <img src="/IW/imgs/partitura.png">
            <p>
                ¡Este es el momento de darte a conocer!
                Si compones tus propias obras y nunca te has atrevido a 
                publicarlas a ninguna plataforma, este es tu sitio Web. 
                Aquí podrás subir tu propio contenido y sacarle partido a ella.
                Pero si no eres creador de contenido y lo único que buscas es encontrar obras clásicas a tu  gusto, en JaaMusic! encontrarás eso que estas buscando.
            </p>
        </div>  
    </section>
   
    <main class="contenedor sombra">
        <h2>Nuestros Servicios</h2>
        <div class="servicios">
            <section class="servicio">
                <h3>Encuentra tu obra</h3>
                <div class="icono">
                    <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-playlist" width="60" height="60" viewBox="0 0 24 24" stroke-width="2" stroke="#000000" fill="none" stroke-linecap="round" stroke-linejoin="round">
                        <path stroke="none" d="M0 0h24v24H0z" fill="none"/>
                        <circle cx="14" cy="17" r="3" />
                        <path d="M17 17v-13h4" />
                        <path d="M13 5h-10" />
                        <line x1="3" y1="9" x2="13" y2="9" />
                        <path d="M9 13h-6" />
                      </svg>
                </div>
                
                <p>Tenemos un gran almacén de obras clásicas pertenecientes a autores muy conocidos internacionalmente como a creadores
                    de contenido que no han podido darse a conocer aún.
                </p>
            </section>

            <section class="servicio">
                <h3>Crea tu propio contenido</h3>
                <div class="icono">
                    <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-square-plus" width="60" height="60" viewBox="0 0 24 24" stroke-width="2" stroke="#000000" fill="none" stroke-linecap="round" stroke-linejoin="round">
                        <path stroke="none" d="M0 0h24v24H0z" fill="none"/>
                        <rect x="4" y="4" width="16" height="16" rx="2" />
                        <line x1="9" y1="12" x2="15" y2="12" />
                        <line x1="12" y1="9" x2="12" y2="15" />
                    </svg>
                </div>
                
                <p>Cualquier usuario podrá crear contenido único.
                    Gracias a ello, el usuario podrá darse a conocer a través de la subida de sus obras 
                    y, además, podrá sacarse unos ahorros con las descarga de sus obras.
                </p>
            </section>

            <section class="servicio">
                <h3>Descarga las partituras que desee</h3>
                <div class="icono">
                    <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-file-music" width="60" height="60" viewBox="0 0 24 24" stroke-width="2" stroke="#000000" fill="none" stroke-linecap="round" stroke-linejoin="round">
                        <path stroke="none" d="M0 0h24v24H0z" fill="none"/>
                        <path d="M14 3v4a1 1 0 0 0 1 1h4" />
                        <path d="M17 21h-10a2 2 0 0 1 -2 -2v-14a2 2 0 0 1 2 -2h7l5 5v11a2 2 0 0 1 -2 2z" />
                        <circle cx="11" cy="16" r="1" />
                        <polyline points="12 16 12 11 14 12" />
                      </svg>
                </div>
               
                <p> JaaMusic! te permite la descarga de partituras que el usuario haya añadido a su obra.
                    Esto resulta muy útil ya que podrás descargar la partitura en función de los instrumentos que te interesen.
                </p>
            </section>
        </div>

        <section>
            <h2>Contacto</h2>
            <form class="formulario">
                <fieldset>
                    <legend>Contactanos rellenando todos los campos:</legend>
                   
                    <div class="contenedor-campos">
                        <div class="campo">
                            <label>Nombre</label>
                            <input class= "input-text" type="text" placeholder="Tu nombre" >
                        </div>
                        
                        <div class="campo">
                            <label>Telefono</label>
                            <input class= "input-text" type="tel" placeholder="Tu telefono" >
                        </div>
                        
                        <div class="campo">
                            <label>Correo</label>
                            <input class= "input-text" type="email" placeholder="Tu email">
                        </div>
                    
                        <div class="campo">
                            <label>Mensaje</label>
                            <textarea class="input-text"></textarea>
                        </div>
                    </div>
    
                    <div class="enviar">
                        <input class= "boton" type="submit" value="Enviar">
                    </div>
                    
                </fieldset>
            </form>
    
        </section>
    </main>

    
   
    <footer class="footer">
        <p>Todos los derechos reservados.</p>
    </footer>
    
    
</body>
</html>