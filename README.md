# LazyDev
Forensics task for [M*CTF](https://mctf.mtuci.ru)

Build:
```
cd mctf-lazydev
sudo docker-compose up --build -d
```
Дейв очень ленивый и не любит повторять свои действия, он забыл о разработке таска и ушел, найдите заготовленный флаг.

Start:
```
ssh dave@<ip> -p 2022 
Password: 1234
```
## Writeup:
После подключения по ssh возвращаемся к подсказке в описании задания: Дейв очень ленивый и не любит повторять свои действия, он забыл о разработке таска и ушел, найдите заготовленный флаг. За автоматизацию действий в Linux отвечает [Cron](https://en.wikipedia.org/wiki/Cron). 
Читаем содержимое по пути */var/spool/cron/crontab/dave*
```
dave@1d0bc56327c9:~$ cat /var/spool/cron/crontabs/dave 
# First of all I wanted to mount special volume on machine startup. 
```
Дальше Дейв вспоминает про монтирование чего-то при запуске. В Linux этим занимается [Fstab](https://en.wikipedia.org/wiki/Fstab). 
Снова прочтём его с помощью cat
```
dave@1d0bc56327c9:~$ cat /etc/fstab 
# UNCONFIGURED FSTAB FOR BASE SYSTEM
# I didn't write down what I did next. But it must be stored somwhere. My key is: MySecretKey
```
Журнал уже выполненных дествий можно открыть командой history.
```
dave@1d0bc56327c9:~$ history 
  ...
   29  echo yalj{p0N_M_dX0a_JulMb}
  ...
   33  echo Vigenère cipher cool
  ...
``` 
Нас интересуют две строки с echo ( для удобства их можно отфильтровать через grep).

Видим странную комбинацию символов и упоминание шифра Вижнера. Расшифруем его по раннее полученному ключу

![image](https://user-images.githubusercontent.com/77790965/184700745-6ba6a3a5-10f6-4ea7-92db-56198ca6e84f.png)

## Flag
```
mctf{n0W_I_kN0w_LinUx}
```
## Заметки, что исправить
1. ~~Сделать chown root  .bash_history && chmod 444 .bash_history~~ 
2. ~~Запретить смену пароля для учётки dave~~
