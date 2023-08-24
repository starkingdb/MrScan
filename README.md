# MrScan
Herramienta enfocada en el escaneo de una direccion IP o Host de una red

# Descripcion de la herramienta:

# Instalación de paquetes necesarios: 
El script comienza instalando varios paquetes (programas) necesarios para realizar las operaciones de escaneo y análisis. Utiliza un bucle for para verificar si cada paquete ya está instalado (dpkg -s) y, si no lo está, lo instala (apt install). Esto asegura que las herramientas necesarias estén disponibles en el sistema.

# Configuración del directorio de trabajo: 
El script establece un directorio de trabajo llamado MrScan en el directorio personal del usuario (~/MrScan). Si el directorio no existe, lo crea utilizando mkdir -p y clona el repositorio "WhatWeb" en ese directorio. Esto asegura que las herramientas y archivos necesarios estén disponibles en el directorio de trabajo.

# Descarga de lista de palabras: 
Si el archivo dc.txt (que contiene una lista de palabras) no existe en el directorio de trabajo, el script descarga una lista de palabras de un repositorio de GitHub y la almacena en ese archivo.

# Mostrar encabezado: 
El script muestra un encabezado en colores utilizando la utilidad figlet para crear el texto grande "MrScan", la herramienta pv para mostrar el texto gradualmente y lolcat para darle un efecto de arcoíris. Luego muestra la versión de la herramienta.

# Bucle del menú principal: 
El script entra en un bucle que muestra un menú con varias opciones numeradas. Luego, solicita al usuario que elija una opción.

# Procesamiento de opciones del menú: 
El script ejecuta diferentes bloques de código según la opción seleccionada por el usuario. Por ejemplo, para "Escaneo Basico", solicita la dirección IP y realiza un escaneo de puertos con nmap. Luego muestra la información extraída de los resultados.

# Finalización del bucle: 
Después de ejecutar el bloque de código correspondiente a la opción seleccionada, el script muestra un mensaje para continuar y espera a que el usuario presione Enter.

# Salida del programa: 
Si el usuario selecciona "9", el script sale del bucle y finaliza.

# Descargo de Responsabilidad:
Esta herramienta, "MrScan", se proporciona con el propósito de facilitar pruebas de seguridad y análisis en redes y sistemas en un entorno controlado y autorizado. El uso de esta herramienta en sistemas o redes que no sean de su propiedad o sin el permiso explícito del propietario puede ser ilegal y está estrictamente prohibido.

El equipo de desarrollo de "MrScan" no se hace responsable de ningún uso indebido o ilegal de esta herramienta. El usuario asume toda la responsabilidad por el uso de "MrScan" y debe cumplir con todas las leyes y regulaciones aplicables.

Se recomienda encarecidamente que todas las pruebas de seguridad se realicen en entornos controlados y autorizados. El usuario debe obtener el permiso adecuado antes de realizar cualquier prueba de seguridad en sistemas o redes.

Al utilizar "MrScan", el usuario acepta estos términos y condiciones. El equipo de desarrollo no se hace responsable de ningún daño, pérdida o consecuencia derivada del uso de esta herramienta.

Recuerde que la seguridad informática es un tema serio y debe abordarse con ética y responsabilidad.`

