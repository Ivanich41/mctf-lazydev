FROM ubuntu:22.04

CMD ["/bin/bash"] 
# Баш
RUN apt-get update
RUN apt install nano cron
# Пакеты 
RUN adduser dave -p Dave00769 --gecos
# Пользак без sudo# Dave : Dave00769. Флаги не забудь

# Добавить подсказку в cron
RUN cd /var/spool/cron/crontabs
RUN echo "# First of all I wanted to mount special volume on machine startup. " >> dave 
# Добавить подсказку в fstab
RUN echo "# I didn't write down what I did next. But it must be stored somwhere" >> /etc/fstab
# Добавить подсказку в bash_history
RUN echo "echo YW50aWN0ZntuMFdfSV9rTjB3X0xpblV4fQ== | base 64 -d"

# возможно сделать имитацию жизнедеятельности 
RUN su dave 
# Залогинить игрока в хоум пользака . Вроде отдельная команда




