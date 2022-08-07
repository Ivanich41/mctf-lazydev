FROM ubuntu:22.04

CMD ["/bin/bash"] 
# Баш
RUN apt-get update
RUN apt install nano cron
# Пакеты 
RUN adduser dave -p Dave00769 --gecos
# Пользак без sudo# Dave : Dave00769. Флаги не забудь

# Добавить подсказку в cron
RUN echo "# First of all I wanted to mount special volume on machine startup. " >> /var/spool/cron/crontabs/dave 
# Добавить подсказку в fstab
RUN echo "# I didn't write down what I did next. But it must be stored somwhere. " >> /etc/fstab
#!!!Возможно не вариант !!! Добавить подсказку в bash_history
RUN echo "echo  " >> .bash_history 


# возможно сделать имитацию жизнедеятельности 
RUN su dave 
# Залогинить игрока в хоум пользака . Вроде отдельная команда




