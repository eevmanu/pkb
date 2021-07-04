# Shell

## Useful commands

- List only directories in a path

    ```bash
    $ l -d */
    $ ls -CF -d */

    # listing only directories on shell
    $ ls -d */

    # h for human readable
    $ ls -lah

    # list only folders which start name with dot '.'
    $ ls -d .*

    # sorted by date
    $ ls -t
    ```

- `Shutdown`

    ```bash
    # in 200 minutes
    $ sudo shutdown -h +200

    # now
    $ shutdown -h now
    ```

- `Trim` lines from command output

    ```bash
    # get first N lines
    $ {{ command }} | head -n {{ N }}

    # get last N lines
    $ {{ command }} | tail -n {{ N }}
    ```

- Find `pattern` in command output

    ```bash
    $ {{ command }} | grep {{ pattern }}
    ```

- Extract `tar.gz` file
    - [How to Extract (Unzip) Tar Gz File](https://linuxize.com/post/how-to-extract-unzip-tar-gz-file/)

    ```bash
    $ tar \
        -xzv \
        -f /path/to/{{ filename }}.tar.gz
    -x  --extract
    -z  --gzip
    -v  --verbose
    -f  --file
    ```

- Extract `tar.xz` file

    ```
    $ tar -xf {{ path to file }}
    ```


- Extract `gz` file

    ```bash
    $ gunzip file.gz
    ```

- Extract `zip` file

    ```bash
    $ unzip file.zip
    ```

- Copy files and folders

    ```bash
    $ cp -avr \
        {{ /path/to/source/folder/or/file }} \
        {{ /path/to/destination/folder/or/file }}
    ```

- `MySQL` backup

    ```bash
    $ mysqldump \
        --host {{ host }} \
        -u {{ user }} \
        -B {{ db name }} \
        -p \
            > {{ filename }}.sql
    ```

- List all `init` services

    ```bash
    $ service --status-all
    ```

- Remove `init` services from autostart

    ```bash
    $ update-rc.d -f {{ service name }} remove

    # e.g.
    $ update-rc.d -f nginx remove
    ```

- Info about folder and file `sizes`

    ```bash
    # file space on whole system
    $ df -h

    # file space on specific path
    $ du -shc *
    # e.g.
    $ du -sh $HOME/Downloads/

    # max depth of analysis
    $ du --max-depth=1 -h -BM

    # folder space usage of disk
    $ du -sh

    # Sorting files according to size recursively
    $ du -ah . | grep -v "/$" | sort -rh
    ```

- `ssh`

    ```bash
    # show active connections
    $ who -a
    ```

- `ip`: new version of `ifconfig`

    ```bash
    $ ip a
    ```

- `ss`: new version of `$ sudo netstat -tupln` or `$ sudo netstat -peanut`

    ```bash
    $ ss

    # check if a local `port` is being used
    # e.g.: check port 80
    $ sudo ss -tulpn | grep :80
    ```

- `ssh-keygen`

    ```bash
    # add ip to `know_hosts`
    $ ssh-keygen \
        -R {{ any ip }} \
        -f $HOME/.ssh/known_hosts

    # generate a SSH key
    $ ssh-keygen \
        -t rsa \
        -b 2048 \
        -f $HOME/.ssh/{{ name you want }}
    ```

- List `Ubuntu packages`

    ```bash
    # new version
    $ apt list --installed

    # old version
    $ dpkg --get-selections | grep -v deinstall

    # list installed packages related to `postgres`
    $ dpkg --get-selections | grep postgres

    # list installed packages at a specific time
    # and save it on a file which name contains timestamp
    $ dpkg --get-selections | \
        grep -v deinstall > \
        ~/Packages/"$(date +%F_%T)".packages

    # TODO
    # after each `sudo apt-get upgrade`
    $ dpkg --get-selections | \
        grep -v deinstall > \
        ~/Packages/"$(date +%F_%T)".packages
    $ diff \
        $(ls -1 | tail -n 1) \ # first last
        $(ls -1 | tail -n 2 | head -n 1) \ # second last
            > ~/Packages/"$(date +%F_%T)".packagesdiff
    ```

- Delete / Remove `package`

    ```bash
    $ sudo apt remove {{ package }}

    $ sudo apt purge {{ package }}
    ```

- list `apt` package archives (repositories)

    ```bash
    # added by OS
    $ cat /etc/apt/sources.list

    # added by user
    $ ls -la /etc/apt/sources.list.d/
    ```

- Create `soft` / `symbolic` link

    ```bash
    $ ln -s {{ target filename }} {{ symbolic filename }}
    ```

- `User management`

    ```bash
    # show actual user
    $ echo $USER

    # list groups of actual user
    $ groups
    $ groups $(echo $USER)

    # list groups of specific user
    $ groups {{ user }}

    # list all groups in system
    $ cat /etc/group

    # list users from group {{ group name }}
    $ grep -i --color '{{ group name }}' /etc/group

    # list all users
    $ cat /etc/passwd

    # add actual user to group {{ group name }}
    $ groupadd {{ group name }}

    # delete actual user from group {{ group name }}
    $ groupdel {{ group name }}

    # add user to a group
    $ usermod -aG {{ group name }} {{ user name }}

    # delete user
    $ userdel {{ user name }}
    ```

- Change file `ownership`

    ```bash
    # change owner and group of a folder, this is recusively
    $ sudo chown -R {{ owner }}:{{ group }} /path/to/folder/

    # change group of a folder, this is recursively
    $ sudo chown -R :{{ group }} /path/to/folder/

    # change owner of a folder, this is recursively
    $ sudo chown -R {{ owner }}: /path/to/folder/
    ```

- `find`

    ```bash
    # search files and folders which match pattern in local working directory
    $ find /path/to/start/search \
        -maxdepth 1 \
        -name "{{ pattern in regex }}"
    # e.g.
    $ find . -maxdepth 1 -name "*bin*"

    # search only folders
    $ find /path/to/start/search \
        -type d \
        -name "{{ pattern in regex }}"
    # e.g.
    $ find . -type d -name "*.pdf"

    # delete recursively all files which match pattern
    $ find /path/to/start/search \
        -name "{{ pattern in regex }}" \
        -delete
    # e.g.
    $ find . -name '*.pyc' -delete

    # search files and folders
    $ find . -name "{{ pattern in regex }}"
    ```

- join `jpg` files into `pdf`

    ```bash
    # if policy is not allowing to execute operation
    $ sudo mv /etc/ImageMagick-6/policy.xml /etc/ImageMagick-6/policy.xml.off
    $ sudo mv /etc/ImageMagick-6/policy.xml.off /etc/ImageMagick-6/policy.xml


    # need to install imagemagick
    $ convert *.jpg pictures.pdf
    ```

    - [ImageMagick not authorized to convert PDF to an image](https://stackoverflow.com/questions/52861946/imagemagick-not-authorized-to-convert-pdf-to-an-image)

- convert `pdf` into single image file
    - [How to convert PDF to Image?](https://askubuntu.com/questions/50170/how-to-convert-pdf-to-image)

    ```bash
    $ pdftoppm input.pdf {{ outputname }} -png
    # e.g.
    $ pdftoppm input.pdf output -png
    $ pdftoppm input.pdf {{ outputname }} -png -f {{ page number }} -singlefile

    ```

- join `pdfs` into `pdf`

    ```bash
    $ pdfunit {{ file 1 }}.pdf {{ file 2 }}.pdf ... out.pdf
    ```

- get `time` and `timezone` from server

    ```bash
    $ date
    ```

- [rsync](https://linux.die.net/man/1/rsync)

    ```bash
    -a # --archive archive mode; equals -rlptgoD (no -H,-A,-X)
    -r # --dry-run recurse into directories
    -n # --partial perform a trial run with no changes made
    -P # --progress same as --partial --progress
    -z # compress file data during the transfer (only in slow connections)
    -v # --verbose increase verbosity
    --delete # delete extraneous files from dest dirs

    $ rsync -anPv SRC ... [DEST]

    # e.g.
    $ rsync -aPv --delete $HOME/Documents/ /media/$USER/manu/Documents/
    $ rsync -aPv /media/$USER/manu/Documents/ $HOME/Documents/
    $ rsync -ah --progress {{ SOURCE }} {{ DESTINATION }}
    ```
    - Resources:
        - [How To Use Rsync to Sync Local and Remote Directories on a VPS](https://www.digitalocean.com/community/tutorials/how-to-use-rsync-to-sync-local-and-remote-directories-on-a-vps)

- `wget`

    ```bash
    # downaload full content of url
    $ wget \
        --recursive \
        --no-clobber \
        --page-requisites \
        --html-extension \
        --convert-links \
        --restrict-file-names=windows \
        --domains {{ domain }} \
        --no-parent \
            {{ exactly url }}

    # download a file an assign a name
    $ wget -O {{ filename }} {{ url }}
    ```

- `tree`

    ```bash
    # show output recursively until a specific level of depth
    $ tree -L {{ depth level }}
    ```

- `history`

    ```bash
    # show last executed commands
    $ history
    ```

- `ngrok`

    ```bash
    # redirect what I have on port 5000 to a specific subdomain
    $ ngrok http -subdomain={{ any name }} 5000
    # e.g.
    $ ngrok http -subdomain=randomdomain 5000
    ```

- `SSH` tunneling for internet
    - [Setting up an SSH Tunnel with Your Linode for Safe Browsing](https://www.linode.com/docs/networking/ssh/setting-up-an-ssh-tunnel-with-your-linode-for-safe-browsing)

    ```bash
    $ ssh -D 12345 {{ user }}@{{ ip or domain }}
    ```

- `scp`: moving files between servers

    ```bash
    # move files from local to virtual machine
    # (instance AWS or droplet DO)
    $ scp \
        /path/of/file/or/folder/to/copy \
        {{ user }}@{{ ip or hostname }}:/path/of/VM/where/to/paste
    # if key file is needed
    $ scp \
        -i /path/to/key.pem \
        /path/of/file/or/folder/to/copy \
        {{ user }}@{{ ip or hostname }}:/path/of/VM/where/to/paste

    # move files from virtual machine to local
    # (instance AWS or droplet DO)
    $ scp \
        {{ user }}@{{ ip or hostname }}:/path/of/file/or/folder/to/copy \
        /path/of/local/machine/where/to/paste
    # if key file is needed
    $ scp \
        -i /path/to/key.pem \
        {{ user }}@{{ ip or hostname }}:/path/of/file/or/folder/to/copy \
        /path/of/local/machine/where/to/paste
    ```

- `curl`

    ```bash
    $ curl \
        -X POST \
        --request POST \
        --data @{{ filename }} \
        --verbose \
        --header "Content-Type: application/json" \
            {{ url }}
    ```

    - download a file

        ```bash
        $ curl http://some.url --output some.file
        ```

- cut part of a `video`

    ```bash
    # ss -> since
    # t -> how much
    $ ffmpeg \
        -i {{ input video }} \
        -ss 00:00:00 \
        -t 00:00:30 \
        -c copy \
            {{ output video }}
    ```

- allowed format video for `twitter` upload

    ```bash
    $ ffmpeg \
        -r 10 \
        -i {{ input video }} \
        -vcodec libx264 \
        -pix_fmt yuv420p \
        -acodec aac \
        -strict -2 \
            {{ output video }}
    ```

- remove `audio` from `video`

    ```bash
    $ ffmpeg \
        -i {{ input video }} \
        -c copy \
        -an \
            {{ output video }}
    ```

- Convert `wav` to `mp3`

    ```bash
    # first install lima package
    # $ sudo apt install lime

    $ lame \
        -b 320 \
        -h {{ input filename }}.wav \
        {{ output filename }}.mp3
    ```

- `sort` lines from file and count `uniques`

    ```bash
    $ sort {{ file }} | \
        uniq -c | \
        wc -l
    ```

- counting with `wc`

    ```bash
    # count lines
    $ {{incoming input }} | wc -l

    # count characters
    $ {{incoming input }} | wc -m
    ```

- create file with `timestamp` as part of filename

    ```bash
    $ touch $(timestamp)filename
    ```

- install `iso` in a `usb` (check `fdisk` section if needed)

    ```bash
    # IMPORTANT!!!
    # dont forget to umount USD previously before burning iso
    # assuming /dev/sda1 is partition inside USB (/dev/sda)
    $ sudo umount /dev/sda1

    # should not appear as mounted drive
    $ ls -la /media/$USER

    # check what is it mounted and from where
    $ cat /proc/mounts
    ...
    /dev/sda3 /media/$USER/writable ext4 rw,nosuid,nodev,relatime 0 0

    $ dd \
        bs=1M \
        status=progress \
        if=/path/to/file.iso \
        of=/dev/sda

    # e.g.:
    $ sudo dd \
        bs=1M \
        status=progress \
        if=/path/to/ubuntu-18.04.3-desktop-amd64.iso \
        of=/dev/sda

    # format USB
    sudo dd bs=1M status=progress if=/dev/zero of=/dev/sda
    ```

    - [How to Create a Bootable Windows 10 USB in Linux](https://itsfoss.com/bootable-windows-usb-linux/)
    - [How to Format a USB Disk as exFAT on Linux](https://itsfoss.com/format-exfat-linux/)
        - [Why is it that I am unable to format my pendrive in exfat using gparted?](https://askubuntu.com/questions/771668/why-is-it-that-i-am-unable-to-format-my-pendrive-in-exfat-using-gparted)

- create file and intermediate folders if don't exist whole path

    ```bash
    $ mkdir -p /path/to/folder/which/contains/file/not/exist/
    $ touch /path/to/folder/which/contains/file/not/exist/file.txt
    ```

- [View CSV Data as table from the Command Line](https://chrisjean.com/view-csv-data-from-the-command-line/)

    ```bash
    $ cat file.csv | \
        sed -e 's/,,/, ,/g' | \
        column -s, -t | \
        less -#5 -N -S
    ```

- search `pattern` in all files (recursively) from working directory

    ```bash
    $ grep -rn '{{ pattern }}'
    ```

- `awk`

    ```bash
    # print columns 2 and 4 of previous output
    $ {{ command }} | awk '{{ print $2 $4 }}'

    # e.g.
    $ cat filename.txt | awk '{{ print $2 $4 }}'
    $ awk '{{ print $2 $4 }}' filename.txt
    ```

- validate `json` files (with `python`)

    ```bash
    $ python -m json.tool {{ file.json }} > /dev/null
    $ cat {{ file.json }} | python -m json.tool > /dev/null
    $ echo "{{ json string }}" | python -m json.tool > /dev/null
    # when fail
    Expecting value: line 1 column 1 (char 0)
    ```

- `nc`

    ```bash
    # test connection to an ip and port
    $ nc -zv {{ ip }} {{ port }}
    # e.g.: check if port 80 is open on router
    # router's ip is 192.168.0.1 on local network
    $ nc -zv 192.168.0.1 80

    # test connection to an ip and a group of ports
    $ nc -zv {{ ip }} {{ port number start }}-{{ port number end }}
    # e.g.: check open ports from range on router
    # router's ip is 192.168.0.1 on local network
    $ nc -zv 192.168.0.1 1-500
    ```

- `clear` file content (create new file and if exists, clean it)

    ```bash
    $ > {{ /path/to/file }}
    # e.g.: clear logs
    $ > /etc/router/errors.log
    ```

- check if you have network issues
    - [How To Use Traceroute and MTR to Diagnose Network Issues](https://www.digitalocean.com/community/tutorials/how-to-use-traceroute-and-mtr-to-diagnose-network-issues)
    - [mtr @ Github](https://github.com/traviscross/mtr)
    - [nethogs @ Github](https://github.com/raboof/nethogs)

    ```bash
    # -------------------- traceroute --------------------
    $ traceroute -n {{ domain or ip }}

    # -------------------- mtr --------------------
    # install mtr
    $ git clone https://github.com/traviscross/mtr
    # and follow https://github.com/traviscross/mtr#installing

    $ mtr --curses {{ domaing or ip }}

    # -------------------- nethogs --------------------
    # install nethogs
    $ git clone https://github.com/raboof/nethogs
    $ cd nethogs
    $ make
    $ sudo ./src/nethogs
    $ cp ./src/nethogs $HOME/bin

    $ nethogs
    ```

- check `memory` usage

    ```bash
    $ free

    $ free -m

    $ free -htw

    $ /proc/meminfo

    $ vmstat

    $ top / htop

    $ dmidecode
    ```

- `ps`

    ```bash
    # a = lift only yourself restriction
    # x = lift must have tty restriction
    # u = display user oriented format
    # Z = add a column of security data
    # e = show env vars after command
    # ww = wide output

    # e.g.
    $ ps faux
    $ ps faxuZeww
    $ ps axuZeww
    $ ps xww

    # check process as tree
    $ ps --forest

    # see threads from process by its id
    $ ps -T -p {{ process id }}
    ```

- `top`

    ```bash
    # see process threads by process id
    $ top -H -p {{ process id }}
    ```

- `htop`
    - htop -> setup -> display options -> activate tree view + show custom thread names

- Change `DNS` permanently in your laptop or server (locally)

    - Check your DNS nameservers in use:

        ```bash
        $ systemd-resolve --status
        $ resolvectl status
        Global
        ...
        Link ... (...)
        ...
        Link ... (xxxx)
            Current Scopes: DNS
        ...
        Current DNS Server: 192.168.1.1
               DNS Servers: 192.168.1.1
        ...
        # when it's done
        ...
        Current DNS Server: 1.1.1.1
               DNS Servers: 1.1.1.1
                            8.8.8.8
                            192.168.1.1
        $ resolvectl dns enp1s0f1
        Link 2 (enp1s0f1): 192.168.1.1

        # Other usefule commands
        $ sudo resolvconf --enable-updates
        $ systemctl status resolvconf.service
        $ service resolvconf status
        ```

    - New way, using **netplan**

        - Create yaml file in netplan path: `/etc/netplan`

            ```bash
            # /etc/netplan/test.yaml
            network:
              version: 2
              ethernets:
                enp1s0f1:
                  dhcp4: true
                  nameservers:
                    addresses: ["1.1.1.1", "8.8.8.8"]
            ```

        - Apply new configuration

            ```bash
            $ sudo netplan --debug apply

            # to test a configuration and revet after 5 seconds
            $ sudo netplan try --debug --timeout 5
            ```

        - Check which DNS name server you're using

            ```bash
            $ resolvectl dns enp1s0f1
            Link 2 (enp1s0f1): 192.168.1.1

            $ nslookup google.com | grep Server
            Server:     127.0.0.53

            # to test which DNS is using
            $ nmcli device show {{ interface name }} | grep DNS
            IP4.DNS[1]:         192.168.1.1

            $ nslookup {{ domain }} {{ dns server ip }}
            $ nslookup google.com 127.0.0.53
            $ nslookup google.com 192.168.1.1
            $ nslookup google.com 1.1.1.1
            $ nslookup google.com 8.8.8.8

            $ dig @{{ dns server ip }} {{ domain }}
            $ dig @127.0.0.53 google.com
            $ dig @192.168.1.1 google.com
            $ dig @1.1.1.1 google.com
            $ dig @8.8.8.8 google.com
            ```

    - Articles / Resources:
        - [DNS Resolvers Performance compared: CloudFlare x Google x Quad9 x OpenDNS](https://medium.com/@nykolas.z/dns-resolvers-performance-compared-cloudflare-x-google-x-quad9-x-opendns-149e803734e5) - [hn](https://news.ycombinator.com/item?id=16732820)
        - [dnsperftest](https://github.com/cleanbrowsing/dnsperftest) - DNS Performance test
        - [Set permanent DNS nameservers on Ubuntu/Debian with resolv.conf](https://www.ricmedia.com/set-permanent-dns-nameservers-ubuntu-debian-resolv-conf/)
        - [Set custom DNS servers on Ubuntu 18.04 or 20.04](https://www.ricmedia.com/set-custom-dns-servers-on-ubuntu-18-or-20/)
        - [No wired connection - Wired unmanaged ubuntu 18.04](https://askubuntu.com/questions/1039233/no-wired-connection-wired-unmanaged-ubuntu-18-04)
            - [add `renderer: NetworkManager` line](https://askubuntu.com/a/1178044/879600), run `sudo netplan apply` and / or run `sudo systemctl restart network-manager`

    - Tools:
        - [Which DNS](https://which.nameserve.rs/)
        - [DNS Leak test](https://www.dnsleaktest.com/)
        - [IP Leak](https://ipleak.net/)
        - [nip.io](https://nip.io/) - [github](https://github.com/exentriquesolutions/nip.io)

- restart `wifi` kernel driver

    ```bash
    # remove it
    $ sudo modprobe -r iwlwifi

    # add again
    $ sudo modprobe iwlwifi

    # restart whole network manager
    $ sudo systemctl restart network-manager
    ```

- restart `shell`

    ```bash
    $ exec "$SHELL"
    ```

- compare `binary` files, (more info [here](https://superuser.com/a/968863/944220))

    ```bash
    $ diff -y <(xxd {{ file 1 }}) <(xxd {{ file 2 }})
    $ colordiff -y <(xxd {{ file 1 }}) <(xxd {{ file 2 }})
    ```

- download `youtube` playlist in `mp4` format (and bypass errors)

    ```bash
    $ youtube-dl \
        -i \
        -f mp4 \
        -o '%(playlist)s/%(playlist_index)s - %(title)s.%(ext)s' \
            {{ youtube playlist url }}

    $ youtube-dl \
        -i \
        --yes-playlist \
            {{ youtube playlist url }}
    ```

- recommendation on partition sizes for a fresh ubuntu install
    - [Dual Boot Windows 10 Alongside Pop!_OS](https://support.system76.com/articles/dual-booting/)
    - [DiskSpace @ Ubuntu](https://help.ubuntu.com/community/DiskSpace)

    ```bash
    # RECOMMENDATION!!
    # /boot   1 GB
    # swap    16 GB
    # /       33 GB
    # /home   the rest

    # to verify it
    $ sudo lsblk -fm
    # e.g.
    NAME FSTYPE LABEL UUID                                 FSAVAIL FSUSE% MOUNTPOINT  SIZE OWNER GROUP MODE
    nvme0n1
    │                                                                                 477G root  disk  brw-rw----
    ├─nvme0n1p1
    │    vfat         850E-5CCC                             392.1M    21% /boot/efi   500M root  disk  brw-rw----
    ├─nvme0n1p2
    │    ext4         ________-____-____-____-____________   39.2G    13% /          48.8G root  disk  brw-rw----
    ├─nvme0n1p3
    │    swap         ________-____-____-____-____________                           15.6G root  disk  brw-rw----
    │ └─cryptswap
    │    swap         ________-____-____-____-____________                [SWAP]     15.6G root  disk  brw-rw----
    └─nvme0n1p4
        ext4         ________-____-____-____-____________    342G    10% /home       412G root  disk  brw-rw----

    ```

- understand `sudo su -` (more info [here](https://askubuntu.com/a/376386/879600))

- `apt search` (more info [here](https://www.debian.org/doc/manuals/aptitude/ch02s02s02.en.html))

    ```bash
    $ apt search {{ any term }}
    # i - the package is installed and all its dependencies are satisfied.
    # c - the package was removed, but its configuration files are still present.
    # p - the package and all its configuration files were removed, or the package was never installed.
    # v - the package is virtual.
    # B - the package has broken dependencies.
    # u - the package has been unpacked but not configured.
    # C - half-configured: the package's configuration was interrupted.
    # H - half-installed: the package's installation was interrupted.
    # W - triggers-awaited: the package awaits trigger processing by another package.
    # T - triggers-pending: The package has had an update triggered due to changes in another package.
    ```

- `kernel` version

    ```bash
    $ uname -r
    ```

- get `ubuntu` release name from `linux mint` installation

    ```bash
    $ cat /etc/upstream-release/lsb-release | \
        grep DISTRIB_CODENAME | \
        cut -d'=' -f2
    xenial

    $ cat /etc/os-release | \
        grep UBUNTU_CODENAME | \
        cut -d"=" -f2
    xenial
    ```

- show `policy` settings from a package (`Ubuntu`)

    ```bash
    apt policy {{ package name }}
    ```

- list all `iptables` rules

    ```bash
    # from `filter` table
    $ sudo iptables -t filter -L -v -n -x --line-numbers

    # from `nat` table
    $ sudo iptables -t nat -L -v -n -x --line-numbers
    ```

- reset `iptables` table packet counts and aggregate size

    ```bash
    # for `filter` table
    $ sudo iptables -t filter -Z

    # for `nat` table
    $ sudo iptables -t nat -Z

    # for `filter` and `nat` table
    $ sudo iptables -t filter -Z && sudo iptables -t nat -Z
    ```

- install `specific` version of package with `apt`

    ```bash
    $ apt install {{ package name }}={{ version number }}
    ```

- track `packets` on an interface

    ```bash
    # icmp
    $ sudo tcpdump \
        -i {{ interface name }} \
        icmp

    # http
    $ sudo tcpdump \
        -A \
        -s 0 \
        -i {{ interface name }} \
        -vv \
            'tcp port 80'
    $ sudo tcpdump \
        -A \
        -s 0 \
        -i {{ interface name }} \
            'src google.com and tcp port 80 and (((ip[2:2] - ((ip[0]&0xf)<<2)) - ((tcp[12]&0xf0)>>2)) != 0)'
    ```

- [How do I measure request and response times at once using cURL?](https://stackoverflow.com/questions/18215389/how-do-i-measure-request-and-response-times-at-once-using-curl)

    Create a new file, `curl-format.txt`, and paste in:
    ```
        time_namelookup:            %{time_namelookup}s     \n
        time_connect:               %{time_connect}s        \n
        time_appconnect:            %{time_appconnect}s     \n
        time_pretransfer:           %{time_pretransfer}s    \n
        time_redirect:              %{time_redirect}s       \n
        time_starttransfer:         %{time_starttransfer}s  \n
                                    ------------------------\n
        time_total:                 %{time_total}s          \n
    ```

    Make a request:
    ```bash
    $ curl -w "@curl-format.txt" -o /dev/null -s "http://wordpress.com/"
    ```

- list `network` interfaces

    ```bash
    $ ip link show

    $ nmcli device status

    $ nmcli connection show

    $ netstat -i

    $ ifconfig -a
    ```

- show `routing` table

    ```bash
    $ route -n
    ```

- `ARP` (Address Resolution Protocol) entries (mostly dynamic)
  - created when an IP address is resolved to a MAC address
  - so computer can effectively communicate with the IP address

    ```bash
    # -v, --verbose
    # -a     Use alternate BSD style output format (with no fixed columns).
    # -e     Use default Linux style output format (with fixed columns).
    # -n, --numeric
    $ arp -v -a -e -n

    # from specific interface
    $ arp -i {{ interface name }}
    ```

- list `DNS` nameservers in my system

    ```bash
    $ ip r

    $ nmcli device show {{ interfacename }} | grep IP4.DNS
    ```

- repeat command each `N` seconds

    ```bash
    $ watch -n {{ N }} {{ any command }}

    # if command needs root permissions, `sudo` at the beginning
    $ sudo watch -n {{ N }} {{ any command }}
    ```

- translate `hostnames` or `domain names` to `IP`

    ```bash
    cat /etc/hosts
    cat /etc/hostname
    ```

- `Filesystem Hierarchy Standard` for `binary` files

    ```
    # Personal comprehension about it
    # not neccesary correct
    # this is how I make it understandable for me

    /bin
    /sbin
    /usr
        /usr/bin
            binaries with $USER execute permission
        /usr/sbin
            binaries with $ROOT execute permission
        /usr/share
            "share": architecture independent files, not related to "lib", "lib32", "lib64"
        /usr/local
            copy of /usr but "locally"
            /usr/local/bin
                binaries with $USER execute permission
            /usr/local/sbin
                binaries with $ROOT execute permission
                not included in $PATH (by default)
            /usr/local/share
                "share": architecture independent files, not related to "lib", "lib32", "lib64"
            /usr/local/{{ your package }}
                /usr/local/{{ your package }}/bin
                /usr/local/{{ your package }}/lib
                /usr/local/{{ your package }}/share
    /snap
        /snap/bin
            symlinks snap apps binaries with $USER execute permission
    /opt

    $HOME
        $HOME/bin
            binaries with $USER execute permission
        $HOME/.local
            $HOME/.local/bin
                binaries with $USER execute permission
            $HOME/.local/share
                "share": architecture independent files, not related to "lib", "lib32", "lib64"

    -------------------------------------------------------------------------

    /
    Primary hierarchy root and root directory of the entire file system hierarchy.
        /usr
        Secondary hierarchy for read-only user data; contains the majority of (multi-)user utilities and applications
        Locally installed software must be placed within /usr/local rather than /usr unless it is being installed to replace or upgrade software in /usr
            /usr/local
            Tertiary hierarchy for local data, specific to this host. Typically has further subdirectories, e.g., bin, lib, share.
            The original idea behind '/usr/local' was to have a separate ('local') '/usr' directory on every machine besides '/usr'
            The /usr/local hierarchy is for use by the system administrator when installing software locally
        /home
        Users' home directories, containing saved files, personal settings, etc.
            /home/$USER
                $HOME/.local
                is a place where a user can install software for their own use
    ```

- `httpie`
    - [http-prompt](https://github.com/eliangcs/http-prompt) - HTTPie + prompt_toolkit = an interactive command-line HTTP client featuring autocomplete and syntax highlighting http://http-prompt.com

    ```bash
    # bypass SSL validation
    $ http --verify=no {{ url }}

    # only response headers
    $ http -h {{ url }}

    # follow redirects
    $ http --follow {{ url }}
    ```

- `nginx`

    ```bash
    # restart nginx updating config
    $ sudo nginx -s reload

    # see compiled modules
    $ sudo nginx -V

    # test nginx conf
    $ sudo nginx -c /etc/nginx/nginx.conf -t

    # avoid auto start when init computer
    $ sudo update-rc.d -f nginx disable
    ```

- `fdisk` - allows to check info about disks connected

    ```bash
    $ sudo fdisk -l
    # e.g. example of portable SSD
    ...
    Disk /dev/sda: 232,9 GiB, 250059350016 bytes, 488397168 sectors
    Units: sectors of 1 * 512 = 512 bytes
    Sector size (logical/physical): 512 bytes / 4096 bytes
    I/O size (minimum/optimal): 4096 bytes / 33553920 bytes
    Disklabel type: gpt
    Disk identifier: 3A5CEFCE-3945-4681-98F1-9189291166D5

    Device     Start       End   Sectors   Size Type
    /dev/sda1   2048 488397134 488395087 232,9G Linux filesystem

    # verify disk is detected
    # verify disk has partitions
    ```

- [smartmontools](https://www.smartmontools.org/) - ontains two utility programs (smartctl and smartd) to control and monitor storage systems using the Self-Monitoring, Analysis and Reporting Technology System (SMART) built into most modern ATA/SATA, SCSI/SAS and NVMe disks.

    ```bash
    # 7.1	2019-12-30 @ (2020-05-17 18:45:51)
    $ apt install -s smartmontools
    ...
    Inst smartmontools (6.4+svn4214-1 Ubuntu:16.04/xenial [amd64])
    ...

    # install it
    $ apt install smartmontools

    # use it
    $ sudo smartctl -d scsi --all /dev/sda
    ```

- `lsscsi` - list all SCSI devices (or hosts) currently on system

    ```bash
    # install it
    $ apt install lsscsi

    $ lsscsi
    [9:0:0:0]    disk    CT250MX5 00SSD1           M3CR  /dev/sda
    ```

- `lsusb`

    ```bash
    $ lsusb
    Bus 002 Device 005: ID 2109:0715 VIA Labs, Inc.
    ...

    $ lsusb -t
    /: Bus 02.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/6p, 5000M
    |__ Port 3: Dev 5, If 0, Class=Mass Storage, Driver=uas, 5000M
    ...

    $ lsusb -v -d 2109:0715 | grep -i interface
    Couldn't open device, some information will be missing
    bDeviceClass 0 (Defined at Interface level)
    bNumInterfaces 1
    Interface Descriptor:
    bInterfaceNumber 0
    bInterfaceClass 8 Mass Storage
    bInterfaceSubClass 6 SCSI
    bInterfaceProtocol 80 Bulk-Only
    iInterface 0
    Interface Descriptor:
    bInterfaceNumber 0
    bInterfaceClass 8 Mass Storage
    bInterfaceSubClass 6 SCSI
    bInterfaceProtocol 98
    iInterface 0
    ```

- `dmesg`

    ```bash
    $ dmesg
    ...
    [24392.072927] usb 2-3: new SuperSpeed USB device number 10 using xhci_hcd
    [24392.096204] usb 2-3: New USB device found, idVendor=2109, idProduct=0715
    [24392.096217] usb 2-3: New USB device strings: Mfr=1, Product=2, SerialNumber=3
    [24392.096225] usb 2-3: Product: VLI Product String
    [24392.096231] usb 2-3: Manufacturer: VLI Manufacture String
    [24392.096237] usb 2-3: SerialNumber: 000000123ADA
    [24392.100232] scsi host9: uas
    [24392.108615] scsi 9:0:0:0: Direct-Access CT250MX5 00SSD1 M3CR PQ: 0 ANSI: 6
    [24392.110751] sd 9:0:0:0: [sda] 488397168 512-byte logical blocks: (250 GB/233 GiB)
    [24392.110769] sd 9:0:0:0: [sda] 4096-byte physical blocks
    [24392.110822] sd 9:0:0:0: Attached scsi generic sg0 type 0
    [24392.111653] sd 9:0:0:0: [sda] Write Protect is off
    [24392.111671] sd 9:0:0:0: [sda] Mode Sense: 2f 00 00 00
    [24392.111965] sd 9:0:0:0: [sda] Write cache: enabled, read cache: enabled, doesn't support DPO or FUA
    [24392.116725] sda:
    [24392.118849] sd 9:0:0:0: [sda] Attached SCSI disk
    ...
    ```

- check if port is being used by pid
    ```bash
    $ sudo netstat -peanut | grep ":{{ $PID }} "
    # e.g.
    $ sudo netstat -peanut | grep ":8000 "
    ```

- `$XDG_DATA_DIRS` environment variable: defines the preference-ordered set of base directories to search for data files like `.desktop` file or icon files

    ```bash
    # my output on 2020-08-03
    $ echo $XDG_DATA_DIRS
    /usr/share/pop:{{ $HOME }}/.local/share/flatpak/exports/share/:/var/lib/flatpak/exports/share/:/usr/local/share/:/usr/share/:/var/lib/snapd/desktop
    ```

- Clipboard in / out

    ```bash
    # ci = clipboard in, co = clipboard out
    # xclip so this works in gui apps too
    alias ci="xclip -selection clipboard"
    alias co="xclip -selection clipboard -o"
    ```


## Crontab

[command manual](https://manpages.ubuntu.com/manpages/focal/en/man1/crontab.1.html) - [file format manual](https://manpages.ubuntu.com/manpages/focal/en/man5/crontab.5.html)

[Where is the cron / crontab log?](https://askubuntu.com/q/56683)

```shell
$ grep CRON /var/log/syslog
$ grep -i CRON /var/log/syslog
```

[How to set up a root cron job properly](https://askubuntu.com/q/419548)

```shell
$ crontab -e

$ sudo crontab -e
```

[What is the correct way to edit a crontab file?](https://askubuntu.com/q/609850)

```shell
$ crontab -l
```

[Why crontab scripts are not working?](https://askubuntu.com/q/23009)

```shell
$ crontab -e

* * * * * env > /tmp/env.output

$ env > tmp.env

# check differences between $PATH and $SHELL
```

[Changing default crontab editor](https://askubuntu.com/q/55022)

[How to run a cron job using the sudo command](https://askubuntu.com/q/173924)

It's a bad idea.

[Verify if crontab works](https://askubuntu.com/q/85558)

```shell
$ service cron status
$ service cron stop
$ service cron start
```

[How do you set the timezone for crontab?](https://askubuntu.com/q/54364)

[How to log cron jobs?](https://stackoverflow.com/q/4811738)

## Resources

- Extra tools
    - [neofetch](https://github.com/dylanaraps/neofetch) - A command-line system information tool written in bash 3.2+
    - [pi-hole](https://github.com/pi-hole/pi-hole) - A black hole for Internet advertisements
    - [logex](https://github.com/kennyparsons/logex) - A bash-based, terminal notes/logging utility
    - [exa](https://github.com/ogham/exa) - A modern version of `ls`
    - [fd](https://github.com/sharkdp/fd) - A simple, fast and user-friendly alternative to 'find'
    - [bat](https://github.com/sharkdp/bat) - A cat(1) clone with wings.
    - [ripgrep](https://github.com/BurntSushi/ripgrep) - ripgrep recursively searches directories for a regex pattern
    - [fzf](https://github.com/junegunn/fzf) - A command-line fuzzy finder
    - [xsv](https://github.com/BurntSushi/xsv) - A fast CSV command line toolkit written in Rust.
    - [coreutils](https://github.com/uutils/coreutils) - Cross-platform Rust rewrite of the GNU coreutils
    - [hyperfine](https://github.com/sharkdp/hyperfine) - A command-line benchmarking tool
    - [monolith](https://github.com/Y2Z/monolith) - CLI tool for saving complete web pages as a single HTML file
    - [sd](https://github.com/chmln/sd) - Intuitive find & replace CLI (sed alternative)
    - [flamegraph](https://github.com/flamegraph-rs/flamegraph) - Easy flamegraphs for Rust projects and everything else, without Perl or pipes <3
    - [dbohdan/structured-text-tools](https://github.com/dbohdan/structured-text-tools) - A list of command line tools for manipulating structured text data

- Learn more commands
    - [pure-bash-bible](https://github.com/dylanaraps/pure-bash-bible) - A collection of pure bash alternatives to external processes.
    - [Command-line-text-processing](https://github.com/learnbyexample/Command-line-text-processing) -  From finding text to search and replace, from sorting to beautifying text and more
    - [terminals-are-sexy](https://github.com/k4m4/terminals-are-sexy) - A curated list of Terminal frameworks, plugins & resources for CLI lovers.
    - [the-art-of-command-line](https://github.com/jlevy/the-art-of-command-line) - Master the command line, in one page
    - [Linux Productivity Tools (2019) [pdf]](https://www.usenix.org/sites/default/files/conference/protected-files/lisa19_maheshwari.pdf)
        - [Hacker news](https://news.ycombinator.com/item?id=23229241)
        - [Github](https://github.com/ketancmaheshwari/lisa19)
    - The Beauty of Unix Pipelines - [Hacker News](https://news.ycombinator.com/item?id=23420786) - [Webpage](https://prithu.xyz/posts/unix-pipeline/)

- Zsh
    - [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting) - Fish shell like syntax highlighting for Zsh
    - [spaceship-prompt](https://github.com/denysdovhan/spaceship-prompt) - A Zsh prompt for Astronauts

- Performance tools
    - [perf-tools](https://github.com/brendangregg/perf-tools) - Performance analysis tools based on Linux perf_events (aka perf) and ftrace

Final Articles / Posts:
- [Command-line pro tips. Lots more in "The Art Of Command Line"](https://twitter.com/addyosmani/status/1264854298799665152)
- [Tip: Use curly braces in the command-line to quickly create multiple related files with less typing](https://twitter.com/addyosmani/status/1265693572033961984)
    - [Yeah, it is also useful for renaming, create file backup, etc...](https://twitter.com/PrestanceDesign/status/1265709922341326853)
- [How to know what program is listening on a given port?](https://askubuntu.com/questions/278448/how-to-know-what-program-is-listening-on-a-given-port)
- [Understanding Shell Script's idiom: 2>&1](https://www.brianstorti.com/understanding-shell-script-idiom-redirect/)
    - `1>` equal to `>` and `1>>` equal to `>>`
- [bash cheat sheet: what (), {}, $(()), $(), ${}, [], [[]] mean](https://twitter.com/b0rk/status/1312573876640063488)
    - [brackets cheatsheet](https://wizardzines.com/comics/brackets-cheatsheet/)
- [Julia Evans @bork - parameter expansion](https://wizardzines.com/comics/parameter-expansion/)
