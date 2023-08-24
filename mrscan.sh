#!/bin/bash

# Install necessary packages
packages=("nmap" "wget" "dirb" "figlet" "pv" "lolcat")
for package in "${packages[@]}"; do
    dpkg -s "$package" &> /dev/null || apt install "$package" -y &> /dev/null
done

# Set up working directory
working_dir=~/MrScan

if [ ! -d "$working_dir" ]; then
   echo "Creating working directory"
   mkdir -p "$working_dir"
   git clone https://github.com/urbanadventurer/WhatWeb.git "$working_dir/WhatWeb" &> /dev/null
fi

wordlist_file="$working_dir/dc.txt"

if [ ! -f "$wordlist_file" ]; then
   wget https://raw.githubusercontent.com/00xBAD/kali-wordlists/master/dirbuster/directory-list-2.3-medium.txt -O "$working_dir/dc.txt" &> /dev/null
fi

# Display header
echo -e "\e[1;32m"
figlet -f slant MrScan | pv -qL 100 | lolcat
echo -e "Escaner Avansado V1.02"
echo -e "\e[0m"

# Main menu loop
while true; do
    # Display menu options
    echo ""
    echo "1. Escaneo Basico"
    echo "2. Escaneo Vuln"
    echo "3. Escaneo Vuln Avansado"
    echo "4. Descubrimiento de host"
    echo "5. IP Publica y local"
    echo "6. Trasa ICMP"
    echo "7. Dirb"
    echo "8. WhatWeb"
    echo "9. Salir"
    echo ""

    # Read user option
    read -p "Escoger opcion: " opcion

    case $opcion in
        1)
        echo "Escaneo Basico"
        cd $home;cd MrScan
        mkdir EscaneoBasico &> /dev/null
        cd EscaneoBasico
        echo -n "Inglesa la IP a Auditar: "
        read ip
        nmap -sT -n -Pn --open -p- --min-rate 5000 -vvv -oG allPort $ip
        clear
        echo -e "\n${yellowColor}[*] Extrallendo informacion....${endColor}\n"
        ip_address=$(cat allPort | grep -oP '\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}' | sort -u)
        open_ports=$(cat allPort | grep -oP '\d{1,5}/open' | awk '{print $1}' FS="/" | xargs | tr ' ' ',')
        echo -e "\t${blueColour}[*] IP Address: ${endColour}${grayColour}$ip_address${endColour}"
        echo -e "\t${blueColour}[*] Port Open: ${endColour}${grayColour}$open_ports${endColour}\n"
        echo -e "${yellowColour}[*] Puertos encontrados!${endColour}\n"
        echo -n "Preciona Enter Para Continuar "
        read foo
        ;;
        2)
        echo "Escaneo Vuln"
        cd $home;cd MrScan
        mkdir EscaneoVuln &> /dev/null
        cd EscaneoVuln
        echo -n "Inglesa la IP a Auditar: "
        read ip
        echo "ingresa los puertos "
        read puertos
        nmap -vvv -sCV -p $puertos $ip -oN targeter
        clear
        cat targeter
        echo ""
        echo -n "Preciona Enter Para Continuar "
        read foo
        ;;
        3)
        echo "Escaneo Avansado"
        cd $home;cd MrScan
        mkdir EscaneoVnAvansado &> /dev/null
        cd EscaneoVnAvansado
        echo -n "Inglesa la IP a Auditar: "
        read ip
        echo "ingresa los puertos "
        read puertos
        nmap -A -sC -sV $puertos $ip --script=safe,exploit,vuln -vvv -Pn -oN targeter2
        clear
        cat targeter2
        echo ""
        echo -n "Preciona Enter Para Continuar "
        read foo
        ;;
        4)
        echo "Descubrimiento de host"
        cd $home;cd MrScan                                            
        mkdir EscaneoVuln &> /dev/null                                
        cd EscaneoVuln
        echo -n "Inglesa la IP del Router: "
        read ip
        nmap -sP $ip/24
        echo ""
        echo -n "Preciona Enter Para Continuar "
        read foo
        ;;
        5)
        echo "IP Local y Publica"
        cd $home;cd MrScan                                            
        mkdir EscaneoVuln &> /dev/null                                
        cd EscaneoVuln
        ip -4 addr show wlan0 | grep -oP '(?<=inet\s)\d+(\.\d+){3}'
        curl ifconfig.me
        echo ""
        echo -n "Preciona Enter Para Continuar "
        read foo
        ;;
        6)
        echo "Lansar trasa icmp"
        echo "Ingrese la IP del sitio web "
        read ip
        echo "Cantidad de bit (recomendable 1)"
        read cantidad
        ping -c $cantidad $ip
        echo ""
        echo -n "Preciona Enter Opciones "
        read foo
        ;;
        7)
        echo "Buscador de directorios web"
        echo "Ingrese la IP del sitio web "
        read ip
        dirb http://$ip/ ~/MrScan/common.txt -X .txt,.html,.php
        echo -n "Preciona Enter Opciones "
        read foo
        ;;
        8)
        echo "Whatweb"
        cd $home;cd MrScan
        cd WhatWeb
        echo "Ingrese la IP del sitio web "
        read ip
        ./whatweb $ip
        echo ""
        echo -n "Preciona Enter Opciones "
        read foo
        ;;
        9)
            exit 0;;
        *)
            echo "Opcion invalida..."
            sleep 1
            ;;
    esac
done
