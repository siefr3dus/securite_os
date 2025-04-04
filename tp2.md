# I. Learn

## 1. Anatomy of a program

### A. file

```
$ file /usr/bin/ls
/usr/bin/ls: ELF 64-bit LSB pie executable, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, BuildID[sha1]=15dfff3239aa7c3b16a71e6b2e3b6e4009dab998, for GNU/Linux 3.2.0, stripped

$ file /usr/bin/ip
/usr/bin/ip: ELF 64-bit LSB pie executable, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, BuildID[sha1]=d93c2d4976d45950591ef53ddc236c4667f554de, for GNU/Linux 3.2.0, stripped

$ file eee-animeshnik.mp3 
eee-animeshnik.mp3: Audio file with ID3 version 2.4.0, contains: MPEG ADTS, layer III, v1, 64 kbps, 44.1 kHz, Stereo
```

### B. readelf

```
$ readelf -h /usr/bin/ls
ELF Header:
  Magic:   7f 45 4c 46 02 01 01 00 00 00 00 00 00 00 00 00 
  Class:                             ELF64
  Data:                              2's complement, little endian
  Version:                           1 (current)
  OS/ABI:                            UNIX - System V
  ABI Version:                       0
  Type:                              DYN (Position-Independent Executable file)
  Machine:                           Advanced Micro Devices X86-64
  Version:                           0x1
  Entry point address:               0x61d0
  Start of program headers:          64 (bytes into file)
  Start of section headers:          149360 (bytes into file)
  Flags:                             0x0
  Size of this header:               64 (bytes)
  Size of program headers:           56 (bytes)
  Number of program headers:         13
  Size of section headers:           64 (bytes)
  Number of section headers:         31
  Section header string table index: 30
```

```
$ readelf -S /usr/bin/ls
There are 31 section headers, starting at offset 0x24770:

Section Headers:
  [Nr] Name              Type             Address           Offset
       Size              EntSize          Flags  Link  Info  Align
  [ 0]                   NULL             0000000000000000  00000000
       0000000000000000  0000000000000000           0     0     0
  [ 1] .interp           PROGBITS         0000000000000318  00000318
       000000000000001c  0000000000000000   A       0     0     1
  [ 2] .note.gnu.pr[...] NOTE             0000000000000338  00000338
       0000000000000020  0000000000000000   A       0     0     8
  [ 3] .note.gnu.bu[...] NOTE             0000000000000358  00000358
       0000000000000024  0000000000000000   A       0     0     4
  [ 4] .note.ABI-tag     NOTE             000000000000037c  0000037c
       0000000000000020  0000000000000000   A       0     0     4
  [ 5] .gnu.hash         GNU_HASH         00000000000003a0  000003a0
       00000000000000b8  0000000000000000   A       6     0     8
  [ 6] .dynsym           DYNSYM           0000000000000458  00000458
       0000000000000be8  0000000000000018   A       7     1     8
  [ 7] .dynstr           STRTAB           0000000000001040  00001040
       00000000000005d9  0000000000000000   A       0     0     1
  [ 8] .gnu.version      VERSYM           000000000000161a  0000161a
       00000000000000fe  0000000000000002   A       6     0     2
  [ 9] .gnu.version_r    VERNEED          0000000000001718  00001718
       00000000000000d0  0000000000000000   A       7     2     8
  [10] .rela.dyn         RELA             00000000000017e8  000017e8
       0000000000001560  0000000000000018   A       6     0     8
  [11] .rela.plt         RELA             0000000000002d48  00002d48
       0000000000000978  0000000000000018  AI       6    25     8
  [12] .init             PROGBITS         0000000000004000  00004000
       0000000000000017  0000000000000000  AX       0     0     4
  [13] .plt              PROGBITS         0000000000004020  00004020
       0000000000000660  0000000000000010  AX       0     0     16
  [14] .plt.got          PROGBITS         0000000000004680  00004680
       0000000000000030  0000000000000008  AX       0     0     8
  [15] .text             PROGBITS         00000000000046b0  000046b0
       000000000001509e  0000000000000000  AX       0     0     16
  [16] .fini             PROGBITS         0000000000019750  00019750
       0000000000000009  0000000000000000  AX       0     0     4
  [17] .rodata           PROGBITS         000000000001a000  0001a000
       0000000000004f7a  0000000000000000   A       0     0     32
  [18] .eh_frame_hdr     PROGBITS         000000000001ef7c  0001ef7c
       00000000000009fc  0000000000000000   A       0     0     4
  [19] .eh_frame         PROGBITS         000000000001f978  0001f978
       0000000000003558  0000000000000000   A       0     0     8
  [20] .init_array       INIT_ARRAY       00000000000232b0  000232b0
       0000000000000008  0000000000000008  WA       0     0     8
  [21] .fini_array       FINI_ARRAY       00000000000232b8  000232b8
       0000000000000008  0000000000000008  WA       0     0     8
  [22] .data.rel.ro      PROGBITS         00000000000232c0  000232c0
       0000000000000ad8  0000000000000000  WA       0     0     32
  [23] .dynamic          DYNAMIC          0000000000023d98  00023d98
       00000000000001f0  0000000000000010  WA       7     0     8
  [24] .got              PROGBITS         0000000000023f88  00023f88
       0000000000000050  0000000000000008  WA       0     0     8
  [25] .got.plt          PROGBITS         0000000000023fe8  00023fe8
       0000000000000340  0000000000000008  WA       0     0     8
  [26] .data             PROGBITS         0000000000024340  00024340
       0000000000000280  0000000000000000  WA       0     0     32
  [27] .bss              NOBITS           00000000000245c0  000245c0
       00000000000012e8  0000000000000000  WA       0     0     32
  [28] .gnu_debugaltlink PROGBITS         0000000000000000  000245c0
       0000000000000049  0000000000000000           0     0     1
  [29] .gnu_debuglink    PROGBITS         0000000000000000  0002460c
       0000000000000034  0000000000000000           0     0     4
  [30] .shstrtab         STRTAB           0000000000000000  00024640
       000000000000012f  0000000000000000           0     0     1
```
Adresse du début du code:
```
00000000000046b0
```

### C. ldd


```
$ ldd /usr/bin/ls
	linux-vdso.so.1 (0x00007ffd42af4000)
	libselinux.so.1 => /lib/x86_64-linux-gnu/libselinux.so.1 (0x00007fbadea9a000)
	libc.so.6 => /lib/x86_64-linux-gnu/libc.so.6 (0x00007fbade8b9000)
	libpcre2-8.so.0 => /lib/x86_64-linux-gnu/libpcre2-8.so.0 (0x00007fbade81f000)
	/lib64/ld-linux-x86-64.so.2 (0x00007fbadeb04000)
```
glibc:
```
	libc.so.6 => /lib/x86_64-linux-gnu/libc.so.6 (0x00007fbade8b9000)
```

## 2. Syscalls basics

### A. 

Lire: read, 0

Ecrire: write, 1

Lancer un process: execve, 59

### B. 
ls:
[Objdump on ls](objdump_ls.txt)

call instruction:
`$ objdump -d --section=.text /usr/bin/ls | grep -B 5 call`
`   195e9:	e8 c2 ac fe ff       	call   42b0 <lseek@plt>`

syscall instruction: 
ahh bah `$ objdump -d --section=.text /usr/bin/ls | grep -B 5 syscall`


glibc:
```
$ objdump -d --section=.text /lib/x86_64-linux-gnu/libc.so.6 | grep syscall

  151a5d:	0f 05                	syscall

```

close:
```
objdump -d --section=.text /lib/x86_64-linux-gnu/libc.so.6 | grep -B 5 syscall | grep -B 5 -A 5 '$0x3,%eax'

  1220b2:	b8 03 00 00 00       	mov    $0x3,%eax
  1220b7:	0f 05                	syscall

```

# II. Observe

## 1. strace

ls:
```
$ strace /usr/bin/ls /tmp 2>&1 | grep write
write(1, "hsperfdata_m4ul\ni4j_log_BurpSuit"..., 1027hsperfdata_m4ul
```

cat:
```
$ strace /usr/bin/ls /tmp 2>&1 | grep write
read(3, "root:x:0:0:root:/root:/bin/bash\n"..., 131072) = 2229

$ strace /usr/bin/cat /etc/passwd 2>&1 | grep open
openat(AT_FDCWD, "/etc/passwd", O_RDONLY) = 3
```


curl:
```
$ strace -c curl google.com
<HTML><HEAD><meta http-equiv="content-type" content="text/html;charset=utf-8">
<TITLE>301 Moved</TITLE></HEAD><BODY>
<H1>301 Moved</H1>
The document has moved
<A HREF="http://www.google.com/">here</A>.
</BODY></HTML>
% time     seconds  usecs/call     calls    errors syscall
------ ----------- ----------- --------- --------- ----------------
 56.41    0.000044           1        44           close
 34.62    0.000027           0        95           rt_sigaction
  8.97    0.000007           0        17           futex
  0.00    0.000000           0        39           read
  0.00    0.000000           0         6           write
  0.00    0.000000           0        29           poll
  0.00    0.000000           0         1           lseek
  0.00    0.000000           0       141           mmap
  0.00    0.000000           0        35           mprotect
  0.00    0.000000           0         1           munmap
  0.00    0.000000           0         8           brk
  0.00    0.000000           0         3           rt_sigprocmask
  0.00    0.000000           0         2           ioctl
  0.00    0.000000           0         2           pread64
  0.00    0.000000           0         1         1 access
  0.00    0.000000           0         4           socket
  0.00    0.000000           0         3         3 connect
  0.00    0.000000           0         1           sendto
  0.00    0.000000           0         1           recvfrom
  0.00    0.000000           0         3           getsockname
  0.00    0.000000           0         2           getpeername
  0.00    0.000000           0         2           socketpair
  0.00    0.000000           0         4           setsockopt
  0.00    0.000000           0         1           getsockopt
  0.00    0.000000           0         1           execve
  0.00    0.000000           0         9           fcntl
  0.00    0.000000           0         1           sysinfo
  0.00    0.000000           0         1           geteuid
  0.00    0.000000           0         1           arch_prctl
  0.00    0.000000           0         1           set_tid_address
  0.00    0.000000           0        39         3 openat
  0.00    0.000000           0        41         1 newfstatat
  0.00    0.000000           0         1           set_robust_list
  0.00    0.000000           0         1           prlimit64
  0.00    0.000000           0         2           getrandom
  0.00    0.000000           0         1           rseq
  0.00    0.000000           0         1           clone3
------ ----------- ----------- --------- --------- ----------------
100.00    0.000078           0       545         8 total
```

## 2. sysdig

ls:
```
$ sudo sysdig proc.name=ls and syscall.type=write
1673 10:15:13.673713676 0 ls (13165.13165) > write fd=1(<f>/dev/pts/1) size=50
1674 10:15:13.673718522 0 ls (13165.13165) < write res=50 data=.[0m.[01;31msysdig-0.39.0-x86_64.rpm.[0m  test.sh.
```

cat:
```
$ sudo sysdig proc.name=cat and syscall.type=read
2288 10:17:10.984572996 0 cat (13181.13181) > read fd=3(<f>/lib64/libc.so.6) size=832
2289 10:17:10.984575356 0 cat (13181.13181) < read res=832 data=.ELF..............>.............@.........&.........@.8...@.F.E.........@.......
2346 10:17:10.984975208 0 cat (13181.13181) > read fd=3(<f>/usr/share/locale/locale.alias) size=4096
2347 10:17:10.984977630 0 cat (13181.13181) < read res=2998 data=# Locale name alias data base..# Copyright (C) 1996-2021 Free Software Foundatio
2348 10:17:10.984996395 0 cat (13181.13181) > read fd=3(<f>/usr/share/locale/locale.alias) size=4096
2349 10:17:10.984997299 0 cat (13181.13181) < read res=0 data=NULL
2498 10:17:10.985454702 0 cat (13181.13181) > read fd=3(<f>/etc/passwd) size=131072
2499 10:17:10.985458844 0 cat (13181.13181) < read res=938 data=root:x:0:0:root:/root:/bin/bash.bin:x:1:1:bin:/bin:/sbin/nologin.daemon:x:2:2:da
2502 10:17:10.985479300 0 cat (13181.13181) > read fd=3(<f>/etc/passwd) size=131072
2503 10:17:10.985480164 0 cat (13181.13181) < read res=0 data=NULL


$ sudo sysdig proc.name=cat and syscall.type=write
1104 10:17:32.278474852 0 cat (13186.13186) > write fd=1(<f>/dev/pts/1) size=938
1926 10:17:32.281367503 0 cat (13186.13186) < write res=938 data=root:x:0:0:root:/root:/bin/bash.bin:x:1:1:bin:/bin:/sbin/nologin.daemon:x:2:2:da
```


notre user:
```
$ sudo sysdig user.name=lucas
```


[curl.scap](curl.scap)


# III. Service Hardening

## 2. NGINX Tracing

Syscalls utilisés par nginx
-    epoll_wait
-    accept4
-    epoll_ctl
-    recvfrom 
-    newfstatat
-    openat
-    fstat
-    setsockopt
-    writev
-    sendfile
-    write
-    close

## 3. NGINX Hardening

```
$ sudo systemctl cat nginx
<span style="color:#12488B"><b># </b></span><span style="color:#12488B"><b>/usr/lib/systemd/system/nginx.service</b></span>
[Unit]
Description=The nginx HTTP and reverse proxy server
After=network-online.target remote-fs.target nss-lookup.target
Wants=network-online.target

[Service]
Type=forking
PIDFile=/run/nginx.pid
# Nginx will fail to start if /run/nginx.pid already exists but has the wrong
# SELinux context. This might happen when running `nginx -t` from the cmdline.
# https://bugzilla.redhat.com/show_bug.cgi?id=1268621
ExecStartPre=/usr/bin/rm -f /run/nginx.pid
ExecStartPre=/usr/sbin/nginx -t
ExecStart=/usr/sbin/nginx
ExecReload=/usr/sbin/nginx -s reload
KillSignal=SIGQUIT
TimeoutStopSec=5
KillMode=mixed
PrivateTmp=true
SystemCallFilter=@system-service
[Install]
WantedBy=multi-user.target
```

# IV. My shitty app

ouais