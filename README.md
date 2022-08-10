# LazyDev
Forensics task for [M*CTF](https://mctf.online)

## Чек лист
1. Формулировка идеи ГОТОВО
2. Dockerfile
 - Сменить шифрование конечного флага с base64 на AES, чтобы не получить его раньше времени
 - Сменить флаг на mctf
3. Docker-compose
 - Healthсheck 
 - Log stdin
4. Деплой и финальное тестирование всех функций
5. Тесты от других разработчиков

Сборка:
```
cd mctf-lazydev
sudo docker build - < Dockerfile -t lazydev 
sudo docker-compose up --build -d
```
