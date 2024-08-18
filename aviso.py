import time
import subprocess
import requests
import netifaces
from pythonping import ping  # Asegúrate de instalar pythonping con pip

# Configura tu token de Telegram y el chat_id
TELEGRAM_TOKEN = "7181469834:AAFRhD05I6vYBQ2mQ1jtEpdzFGv8b57E1Hw"
CHAT_ID = "836078789"

def get_ip_address(interface='wlan0'):
    """
    Función para obtener la dirección IP de la interfaz especificada.
    """
    try:
        ip = netifaces.ifaddresses(interface)[netifaces.AF_INET][0]['addr']
        return ip
    except (KeyError, ValueError):
        return None

def send_telegram_message(message):
    """
    Función para enviar un mensaje por Telegram.
    """
    url = f'https://api.telegram.org/bot{TELEGRAM_TOKEN}/sendMessage'
    data = {'chat_id': CHAT_ID, 'text': message}
    requests.post(url, data=data)

def main():
    while True:
        # Espera hasta que la Raspberry Pi esté conectada a la red
        while True:
            if ping('8.8.8.8', count=1):
                break
            time.sleep(10)  # Espera 10 segundos antes de volver a verificar

        # Una vez que la red esté activa, obtén la dirección IP
        ip_address = get_ip_address()
        if ip_address:
            message = f'La dirección IP de la Raspberry Pi es: {ip_address}'
            send_telegram_message(message)
            break  # Sal del bucle una vez enviado el mensaje

if __name__ == "__main__":
    main()
