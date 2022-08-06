FROM ubuntu:22.04

CMD ["/bin/bash"] 
# Баш
RUN apt-get update
RUN apt install nano cron
# Пакеты 
RUN adduser dave -p Dave00769 --gecos
# Пользак без sudo# Dave : Dave00769. Флаги не забудь

# Добавить подсказку в cron

# Добавить bash history и сделать в нём ссылку на крон 

# возможно сделать имитацию жизнедеятельности 
RUN su dave 
# Залогинить игрока в хоум пользака . Вроде отдельная команда




