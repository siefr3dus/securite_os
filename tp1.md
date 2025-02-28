# 1


```
[lucas@localhost ~]$ sudo firewall-cmd --list-all
drop (active)
  target: DROP
  icmp-block-inversion: no
  interfaces: enp0s3 enp0s8
  sources: 10.1.1.0/24
  services: 
  ports: 22/tcp
  protocols: 
  forward: yes
  masquerade: no
  forward-ports: 
  source-ports: 
  icmp-blocks: 
  rich rules: 
```

# 2
```
[lucas@localhost ~]$ cat /etc/security/pwquality.conf
minlen = 14
dcredit = -1
ucredit = -1
lcredit = -1
ocredit = -1
```

# 3

```
Include /etc/ssh/sshd_config.d/*.conf

Port 7372
AddressFamily any
ListenAddress 0.0.0.0
ListenAddress ::

HostKey /etc/ssh/ssh_host_ed25519_key

RekeyLimit default none

SyslogFacility AUTH
LogLevel INFO

LoginGraceTime 2m
PermitRootLogin no
StrictModes yes
MaxAuthTries 3
MaxSessions 2

PubkeyAuthentication yes
AuthorizedKeysFile /home/%u/.ssh/authorized_keys

HostbasedAuthentication no
IgnoreUserKnownHosts no
IgnoreRhosts yes

PasswordAuthentication no
PermitEmptyPasswords no

KbdInteractiveAuthentication no

KerberosAuthentication no
KerberosOrLocalPasswd no
KerberosTicketCleanup no
KerberosGetAFSToken no

GSSAPIAuthentication no
GSSAPICleanupCredentials yes
GSSAPIStrictAcceptorCheck yes
GSSAPIKeyExchange no

UsePAM yes

AllowAgentForwarding no
AllowTcpForwarding no
GatewayPorts no
X11Forwarding no
PermitTTY yes
PrintMotd no
PrintLastLog yes
TCPKeepAlive yes
PermitUserEnvironment no
Compression delayed
ClientAliveInterval 300
ClientAliveCountMax 0
UseDNS no
PidFile /run/sshd.pid
MaxStartups 2
PermitTunnel no
ChrootDirectory none
VersionAddendum none

Banner none

AcceptEnv LANG LC_*

Subsystem sftp /usr/lib/openssh/sftp-server

Match User lucas
    AuthorizedKeysFile /home/lucas/.ssh/authorized_keys
    AllowTcpForwarding no
    X11Forwarding no
    PermitTTY yes
    AllowAgentForwarding no


Match user it4
    ChrootDirectory /var/chroot
    AuthorizedKeysFile /var/chroot/home/it4/.ssh/authorized_keys
    


lucas@thinkpad:~$ cat .ssh/authorized_keys 
ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILx3fqeQSeFfcJFsQx1E8BC8aCi/fWoK6M+fuKB/lOZ0 m4ul@thinkpad

```

J'ai suivi ce [guide](https://linuxconfig.org/jail-ssh-user-to-home-directory-on-linux) sympa pour te jail xd.

# 4
### 1
Gestion d'utilisateurs : [Setup script](gestion_users.sh)

### 2  
```
[root@localhost data]# ls -al
total 0
dr--r--r--   4 root root  34 Feb 27 13:14 .
dr-xr-xr-x. 19 root root 267 Feb 27 12:57 ..
dr--r-----+  2 root root  23 Feb 27 13:14 conf
dr--rw-r--+  6 root root  89 Feb 27 13:14 projects
```
```
[root@localhost data]# getfacl conf/
# file: conf/
# owner: root
# group: root
user::r--
user:daniel:r--
user:rose:r--
group::---
group:admins:r--
group:sysadmins:r--
mask::r--
other::---
```
```
[root@localhost data]# getfacl projects/
# file: projects/
# owner: root
# group: root
user::r--
group::r--
group:managers:rw-
mask::rw-
other::r--
```
```
[root@localhost data]# ls -al conf/
total 0
dr--r-----+ 2 root root 23 Feb 27 13:14 .
dr--r--r--  4 root root 34 Feb 27 13:14 ..
-r--r-----+ 1 root root  0 Feb 27 13:14 test.conf
```
```
[root@localhost data]# getfacl conf/test.conf 
# file: conf/test.conf
# owner: root
# group: root
user::r--
user:daniel:r--
user:rose:r--
group::---
group:admins:r--
group:sysadmins:r--
mask::r--
other::---
```
```
[root@localhost data]# ls -al projects/
total 0
dr--rw-r--+ 6 root root 89 Feb 27 13:14 .
dr--r--r--  4 root root 34 Feb 27 13:14 ..
dr--r-----+ 4 root root 36 Feb 27 13:14 client_data
-r--r--r--  1 root root  0 Feb 27 13:14 README.docx
dr--rw----+ 2 root root 24 Feb 27 13:14 the_zoo
dr--rw----+ 2 root root 24 Feb 27 13:14 website
dr--r-----+ 2 root root 21 Feb 27 13:14 zoo_app
```
```
[root@localhost data]# ls -al projects/client_data/client1/
total 0
drwxr-xr-x  2 root root 23 Feb 27 13:14 .
dr--r-----+ 4 root root 36 Feb 27 13:14 ..
-r--rw----+ 1 root root  0 Feb 27 13:14 data.docx
```
```
[root@localhost data]# ls -al projects/client_data/client2/
total 0
dr--rw----+ 2 root root 23 Feb 27 13:14 .
dr--r-----+ 4 root root 36 Feb 27 13:14 ..
-r--rw----+ 1 root root  0 Feb 27 13:14 data.docx
```
```
[root@localhost data]# getfacl projects/client_data/client2/data.docx 
# file: projects/client_data/client2/data.docx
# owner: root
# group: root
user::r--
user:lucia:rw-
user:grace:rw-
group::---
group:rh:r--
group:managers:r--
mask::rw-
other::---
```
```
[root@localhost data]# getfacl projects/client_data/client1/data.docx 
# file: projects/client_data/client1/data.docx
# owner: root
# group: root
user::r--
user:lucia:rw-
user:grace:rw-
group::---
group:rh:r--
group:managers:r--
mask::rw-
other::---
```
```
[root@localhost data]# ls -al projects/zoo_app/
total 0
dr--r-----+ 2 root  root 21 Feb 27 13:14 .
dr--rw-r--+ 6 root  root 89 Feb 27 13:14 ..
-rwxr-----+ 1 sadia root  0 Feb 27 13:14 zoo_app
```
```
[root@localhost data]# getfacl projects/zoo_app/
# file: projects/zoo_app/
# owner: root
# group: root
user::r--
user:sadia:r--
user:suha:r--
user:jakub:r--
group::---
mask::r--
other::---
```
### 3

```
[root@localhost data]# cat /etc/sudoers.d/custom 
%sysadmins ALL=(root) NOPASSWD: ALL

%artists ALL=(sadia) NOPASSWD: /bin/ls /data/*, /bin/cat /data/*, /usr/bin/vi /data/*, /usr/bin/file /data/*

alysha ALL=(suha) NOPASSWD: /bin/cat /data/projects/the_zoo/ideas.docx

%devs ALL=(root) NOPASSWD: /usr/bin/dnf install *

jakub ALL=(liam) NOPASSWD: /usr/bin/python

%admins ALL=(daniel) NOPASSWD: /usr/bin/free, /usr/bin/top, /usr/bin/df, /usr/bin/du, /usr/bin/ps, /sbin/ip

lev ALL=(daniel) NOPASSWD: /usr/bin/openssl *, /usr/bin/dig, /usr/bin/ping, /usr/bin/curl


alysha priv esc:
[alysha@localhost ~]$ sudo -u sadia vi /data/projects 
:set shell=/bin/sh
:shell

sh-5.1$ whoami
sadia

Sur notre machine:
TF=$(mktemp -d)
echo 'whoami > /tmp/iamroot.txt' > $TF/x.sh
fpm -n x -s dir -t rpm -a all --before-install $TF/x.sh $TF

On le transfert vers le serveur avec scp

Sur le serveur:

[sadia@localhost ~]$ sudo -u root dnf install x-1.0-1.noarch.rpm 

[sadia@localhost ~]$ cat /tmp/iamroot.txt
root


liam:
Pas réussi à le faire fonctionner mais privesc via ip into daniel et puis shell root voila.


jakub:
Privesc python into liam et puis ^



lev:
Meme chose que sadia: dnf install ...

```


Meilleure conf:

En vrai juste supprimer le nopasswd c'est deja bien




