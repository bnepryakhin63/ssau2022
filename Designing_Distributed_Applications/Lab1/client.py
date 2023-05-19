import os
import socket
# Создание клиента:
client = socket.socket(
    socket.AF_INET,
    socket.SOCK_STREAM,
)

client.connect(
    ('localhost', 9090)
)

# считывает и отправляет картинку
file = open('D:/Dev/ssau2022/Designing_Distributed_Applications/Lab1/images/img.png', mode="rb") #считываем картинку

imageSize = os.path.getsize('D:/Dev/ssau2022/Designing_Distributed_Applications/Lab1/images/img.png')
print("Size of image:", imageSize)
client.send(str(imageSize).encode('utf-16'))

data = file.read(1024)

while data:
    client.send(data)
    data = file.read(1024)

file.close()
client.close()