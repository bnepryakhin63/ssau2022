import socket
import cv2
import numpy as np
import os

# Создание промежуточного сервера:
staging_server = socket.socket(
    socket.AF_INET,
    socket.SOCK_STREAM,
)

staging_server.bind(

    ('localhost', 9090) #localhost
)

staging_server.listen(1) #может принимать некоторое количество сообщений
print("Server is listening")


#quit = False
while True:
    try:
        client_socket, client_address = staging_server.accept()

        data1 = client_socket.recv(1024)
        sizeOfImage1 = int(data1.decode('utf-16'))
        print("Size of input image:", sizeOfImage1)

        #Принимаю картинку
        file = open('D:/Dev/ssau2022/Designing_Distributed_Applications/Lab1/images/server_img.png', mode="wb")  #открыть для записи принимаемой картинки файл
        data1  = client_socket.recv(1024)

        while data1 :
            file.write(data1 )
            data1  = client_socket.recv(1024)

        file.close()

        #Внесение шума. 
        image = cv2.imread('D:/Dev/ssau2022/Designing_Distributed_Applications/Lab1/images/server_img.png')

        row, col, ch = image.shape
        mean = 0
        var = 100
        sigma = var ** 0.5
        gauss = np.random.normal(mean, sigma, (row, col, ch))
        print('Максимальная величина вносимого шума: ', np.max(gauss))
        #gauss = gauss.reshape(row, col, ch)
        noisy = image + gauss

        # Сохраняем изображение без шума
        cv2.imwrite('D:/Dev/ssau2022/Designing_Distributed_Applications/Lab1/images/img_output.png', noisy)

        # считывает и отправляет картинку
        file = open('D:/Dev/ssau2022/Designing_Distributed_Applications/Lab1/images/img_output.png', mode="rb") #считываем картинку

        imageSize = os.path.getsize('D:/Dev/ssau2022/Designing_Distributed_Applications/Lab1/images/img_output.png')
        print("Size of output image:", imageSize)
        staging_server.send(f"{imageSize}".encode('utf-16'))

        data = file.read(1024)

        while imageSize > 0:
            data = file.read(1024)
            staging_server.send(data)
            if (imageSize >= 1024):
                imageSize = imageSize - 1024
            else:
                imageSize = imageSize - imageSize

        file.close()
        print("Картинка была отправлена", '\n')
    except:
        print('\n[Сервер остановлен]')
        #quit = True
        break

staging_server.close()