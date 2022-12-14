FROM ubuntu:22.04

RUN apt-get update
RUN apt install -y nano cron openssh-server ncat
RUN adduser --disabled-password --gecos "" dave
# SSH 
RUN groupadd sshgroup && usermod -aG sshgroup dave
RUN mkdir /var/run/sshd
RUN echo 'root:DavelazyDev77' | chpasswd
RUN echo 'dave:1234' | chpasswd
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd
RUN mkdir /home/dave/.ssh
RUN service ssh start
EXPOSE 22

# Подготовка таска
# Cron tip
RUN echo "# First of all I wanted to mount special volume on machine startup. " >> /var/spool/cron/crontabs/dave 
RUN chmod -R 777 /var/spool/cron
RUN chmod +t /var/spool/cron/crontabs
RUN chmod -R 744 /var/spool/cron/crontabs/dave
# Fstab tip
RUN echo "# I didn't write down what I did next. But it must be stored somwhere. My key is: MySecretKey" >> /etc/fstab
RUN chmod 744 /etc/fstab
RUN chmod +t /etc/fstab
# History tip
RUN touch /home/dave/.bash_history && echo "whoami\ncd 192.168.56.115\stole\ndocker\n apt install rustup\napt-get install rustup\ncurl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh\nrustup install 1.58.0\nrustup\ncurl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh 'nrustup update \nreboot\ncd /\nsudo su\ncargo run\nls\ncargo run\nrustc --version\nls\nsu\nsudo su\nls\ncd Downloads/\nls\nsudo apt install clang++\nLD=lld AS=llvm-as AR=llvm-ar RANLIB=llvm-ranlib CC=clang CXX=clang++ CFLAGS=-fsanitize=address\nmake -j(nproc)\nLD=lld  CXXFLAGS=-fsanitize=address LDFLAGS=-ldl -fsanitize=address ./configure --with-features=huge --enable-gui=none\nvim\ncd /lib/x86_64-linux-gnu/\necho yalj{p0N_M_dX0a_JulMb}\n ls | grep libthread_db.so.1\nclear\npython3 get-timetable.py \necho Vigenère cipher cool\nreboot\nls\ncd Downloads/\npython3 get-timetable.py \nls\nclear\nvim get-timetable.py\npython3 get-timetable.py\npwq\npwd\nwhoami\nwhoami\nls\nrm -f gconv-modules GCONV_PATH\=./ \nrm -rf gconv-modules GCONV_PATH\=./" >> /home/dave/.bash_history
RUN chown root /home/dave/.bash_history && chmod 444 /home/dave/.bash_history
RUN chmod u-s $(which passwd)

CMD ["/usr/sbin/sshd","-D"]

