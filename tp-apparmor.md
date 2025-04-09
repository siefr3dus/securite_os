# 3

## 3.2
### 1
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
```

### 2

```
$ sudo ufw status
Status: active

To                         Action      From
--                         ------      ----
7372/tcp                   ALLOW       Anywhere                  
7372/tcp (v6)              ALLOW       Anywhere (v6)             
```


## 3.3

### 1
```
sudo apt install apache2 -y
sudo systemctl enable --now apache2
```

### 2
```
$ sudo aa-status 
apparmor module is loaded.
39 profiles are loaded.
39 profiles are in enforce mode.
...
0 profiles are in complain mode.
0 profiles are in kill mode.
0 profiles are in unconfined mode.
0 processes have profiles defined.
0 processes are in enforce mode.
0 processes are in complain mode.
0 processes are unconfined but have a profile defined.
0 processes are in mixed mode.
0 processes are in kill mode.
```

### 3

- Complain: actif, n'empêche rien, enregistre les violations
- Enforce: fait appliquer strictement les règles
- Unconfined: n’est pas du tout restreint
### 4

Si un profil AppArmor en mode enforce ne convient pas au binaire, le programme sera bloqué dans ses actions interdites.


## 3.4