# Setup

## Backup & Restore

- Show folder size which want to backup

    ```bash
    $ du -sh $HOME/Documents/
    $ du -sh $HOME/Downloads/
    $ du -sh $HOME/Music/
    $ du -sh $HOME/Pictures/
    $ du -sh $HOME/Projects/
    $ du -sh $HOME/Videos/
    ```

- Backup folders into external drive

    ```bash
    $ sudo rsync -aPv --delete $HOME/Documents/ /media/$USER/manu/Documents/
    $ sudo rsync -aPv --delete $HOME/Downloads/ /media/$USER/manu/Downloads/
    $ sudo rsync -aPv --delete $HOME/Music/ /media/$USER/manu/Music/
    $ sudo rsync -aPv --delete $HOME/Pictures/ /media/$USER/manu/Pictures/
    $ sudo rsync -aPv --delete $HOME/Projects/ /media/$USER/manu/Projects/
    $ sudo rsync -aPv --delete $HOME/Videos/ /media/$USER/manu/Videos/
    ```

- Restore folders from external drive

    ```
    $ sudo rsync -aPv /media/$USER/manu/Documents/ $HOME/Documents/
    $ sudo rsync -aPv /media/$USER/manu/Downloads/ $HOME/Downloads/
    $ sudo rsync -aPv /media/$USER/manu/Music/ $HOME/Music/
    $ sudo rsync -aPv /media/$USER/manu/Pictures/ $HOME/Pictures/
    $ sudo rsync -aPv /media/$USER/manu/Projects/ $HOME/Projects/
    $ sudo rsync -aPv /media/$USER/manu/Videos/ $HOME/Videos/
    ```

## Steps after install PopOS

- Be aware of new shortcuts
    - [Pop!_OS Keyboard Shortcuts](https://support.system76.com/articles/pop-keyboard-shortcuts/)

- Change Region & Language -> Formats -> United States (English)

- Add to Spanish (Latin American) to Input Sources

- Deactivate animations

- Install fonts
    - [Fira Code](https://github.com/tonsky/FiraCode)
    - [Hack](https://github.com/source-foundry/Hack)
    - [Source Code Pro](https://github.com/adobe-fonts/source-code-pro)
    - [Cascadia Code](https://github.com/microsoft/cascadia-code)
    - [Fonts for System76](https://github.com/pop-os/fonts)
    - [Go fonts](https://blog.golang.org/go-fonts)
    - [Inter](https://github.com/rsms/inter)
    - [Best 20 Fonts for Ubuntu](https://linuxhint.com/best_fonts_ubuntu_linux/)

- Default fonts on `PopOS`
    - [List of monospaced typefaces](https://en.wikipedia.org/wiki/List_of_monospaced_typefaces)

    ```
    Standard font -> Source Code Pro
    Serif font -> Serif
    Sans-serif font -> Sans
    Fixed-width font -> Monospace
    ```

- Python extra commands in `PopOS`

    ```bash
    $ py3clean
    $ py3compile
    $ py3versions
    $ pydoc3.8
    ```

## Apps

- `synaptic` - Graphical package manager

    ```bash
    $ apt install synaptic
    ```

- `Gnome` update manager

    ```bash
    # to search if is already installed
    $ apt search update-manager
    ...
    update-manager/focal-updates,focal-updates,now 1:20.04.10 all [installed]
    GNOME application that manages apt updates
    ...

    # to install it
    $ sudo apt install update-manager
    ```

- `Gnome` tweak tool
    - [How do I change fonts and adjust their size?](https://askubuntu.com/questions/19770/how-do-i-change-fonts-and-adjust-their-size)
    - Interface text -> Fira Sans book 10 (default)

    ```bash
    $ sudo apt install gnome-tweak-tool
    ...
    Setting up gir1.2-handy-0.0:amd64 (0.0.13-1) ...
    Setting up gnome-tweaks (3.34.0-2ubuntu1) ...
    Setting up gnome-tweak-tool (3.34.0-2ubuntu1) ...
    ```

- [Flux](https://justgetflux.com/) - Better lighting for your computer
    - [code](https://github.com/xflux-gui/fluxgui)

    ```bash
    # install dependent packages
    # gir1.2-appindicator3-0.1
    # gir1.2-gtk-3.0
    # git
    # libcanberra-gtk-module
    # libxxf86vm1
    # python-appindicator
    # python-gconf
    # python-glade2
    # python-gtk2
    # python-pexpect
    # python-xdg
    # python3-distutils
    # python3-pexpect

    $ sudo add-apt-repository ppa:nathan-renniewaldock/flux
    $ sudo apt update
    $ sudo apt install fluxgui
    ```

- [Redshift](https://github.com/jonls/redshift) - adjusts the color temperature of your screen according to your surroundings.

    This may help your eyes hurt less if you are working in front of the screen at night

- [Chrome](https://www.google.com/chrome/)

    ```bash
    $ wget -O chrome.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
    ```

- [Brave](https://brave.com/) - browser with real privacy

- [Dropbox daemon](https://www.dropbox.com/install-linux)
    - [How to install Dropbox through flatpak on CentOS 8.0](https://vitux.com/how-to-install-dropbox-through-flatpak-on-centos-8-0/)

    ```bash
    $ wget -O dropbox.deb https://www.dropbox.com/download?dl=packages/ubuntu/dropbox_2020.03.04_amd64.deb

    # https://www.dropbox.com/install-linux
    $ cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -

    # install via flatpak
    $ flatpak install flathub com.dropbox.Client
    ```

- [Spotify](https://www.spotify.com/download/linux/)

    ```bash
    # install via Snap
    $ snap install spotify

    # install via flatpak
    $ flatpak install flathub com.spotify.Client

    # install via apt packages
    $ curl -sS https://download.spotify.com/debian/pubkey.gpg | sudo apt-key add -
    $ echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
    $ sudo apt-get update && sudo apt-get install spotify-client

    # to completely remove it
    $ rm -rf $HOME/.config/spotify/*
    $ rm -rf $HOME/.cache/spotify/*
    ```

    Don't forget to change Settings

- [Visual Studio Code](https://code.visualstudio.com/docs/setup/linux)
    - Code Insiders

    ```bash
    # download deb and install

    # install via snap
    $ snap install code
    ```

- [Telegram](https://telegram.org/dl/desktop/linux)
    - [Changelog](https://desktop.telegram.org/changelog)
    - [Wiki of Telegram @ Github](https://github.com/telegramdesktop/tdesktop/wiki)
    - [Keyboard Shortcuts @ Github](https://github.com/telegramdesktop/tdesktop/wiki/Keyboard-Shortcuts)

    ```bash
    # install via flatpak
    $ flatpak install flathub org.telegram.desktop
    ```

- [Slack](https://slack.com/intl/en-pe/downloads/linux)
    - [Release notes for Linux](https://slack.com/intl/en-pe/release-notes/linux)

    ```bash
    # install via deb file
    $ wget https://downloads.slack-edge.com/linux_releases/slack-desktop-4.4.2-amd64.deb

    # install via snap
    $ snap install slack
    # https://snapcraft.io/docs/snap-confinement
    $ snap install slack --classic
    $ snap install --classic slack
    ```

- [VLC](https://github.com/videolan/vlc)

    ```bash
    $ apt install vlc

    # https://www.videolan.org/vlc/download-ubuntu.html
    $ snap install vlc
    ```

- [Foxit reader](https://www.foxitsoftware.com/pdf-reader/) - Industry’s Most Powerful PDF Reader
    - [other options](https://linuxconfig.org/pdf-viewer-list-on-ubuntu-20-04-focal-fossa-linux)

    ```bash
    $ wget http://cdn01.foxitsoftware.com/pub/foxit/reader/desktop/linux/2.x/2.4/en_us/FoxitReader.enu.setup.2.4.4.0911.x64.run.tar.gz
    # uncompress and delete previous file
    $ gzip -d FoxitReader.enu.setup.2.4.4.0911.x64.run.tar.gz
    # untar
    $ tar xzvf FoxitReader.enu.setup.2.4.4.0911.x64.run.tar
    # assign permissions, if needed
    $ chmod a+x FoxitReader*.run
    # run installer
    $ ./FoxitReader.enu.setup.2.4.4.0911\(r057d814\).x64.run
    # select any of the following paths as Installation Folder:
    - $HOME/opt/foxitsoftware/foxitreader
    - $HOME/.opt/foxitsoftware/foxitreader
    - /opt/foxitsoftware/foxitreader
    ```

- [Zoom](https://support.zoom.us/hc/en-us/articles/204206269-Installing-or-updating-Zoom-on-Linux#h_adcc0b66-b2f4-468b-bc7a-12c182f354b7)

    ```bash
    # download deb and install

    # install via snap (https://snapcraft.io/zoom-client)
    $ snap install zoom-client

    # install via flatpak
    $ flatpak install flathub us.zoom.Zoom
    ```

- [Skype](https://www.skype.com/en/get-skype/download-skype-for-desktop/)

    ```bash
    # install via deb file
    $ wget https://repo.skype.com/latest/skypeforlinux-64.deb

    # install via snap
    $ snap install skype
    ```

- [TeamViewer](https://www.teamviewer.com/en/download/linux/)

    ```bash
    $ wget -O teamviewer.deb https://download.teamviewer.com/download/linux/teamviewer_amd64.deb
    ```

- [OBS Studio](https://github.com/obsproject/obs-studio)
    - [Install on Linux](https://obsproject.com/wiki/install-instructions#linux)

    ```bash
    $ sudo add-apt-repository ppa:obsproject/obs-studio
    $ sudo apt update
    $ sudo apt install obs-studio
    ```

- [Kazam](https://github.com/hzbd/kazam) - A screencasting program created with design in mind

- [Cheese](https://gitlab.gnome.org/GNOME/cheese) - Take photos and videos with your webcam, with fun graphical effects
  - [Ubuntu](apt://cheese)

- [Wireshark](https://www.wireshark.org/download.html) - world’s foremost and widely-used network protocol analyzer
    - [Standard package](https://launchpad.net/ubuntu/+source/wireshark)
    - [Latest stable PPA](https://launchpad.net/~wireshark-dev/+archive/ubuntu/stable)
    - [How to Install and Use Wireshark on Ubuntu](https://linuxhint.com/install_wireshark_ubuntu/)
    - [How to install Wireshark](https://askubuntu.com/questions/700712/how-to-install-wireshark)
    - [code](https://github.com/wireshark/wireshark)
    - [termshark](https://github.com/gcla/termshark) - A terminal UI for tshark, inspired by Wireshark
    - [pyshark](https://github.com/KimiNewt/pyshark) - Python wrapper for tshark, allowing python packet parsing using wireshark dissectors
    - [wirefilter](https://github.com/cloudflare/wirefilter) - An execution engine for Wireshark-like filters

    ```bash
    $ sudo add-apt-repository ppa:wireshark-dev/stable
    $ sudo apt update
    $ sudo apt install wireshark
    ```

- [BleachBit](https://github.com/bleachbit/bleachbit) - cleans files to free disk space and to maintain privacy.

    ```bash
    # easy way
    $ apt install bleachbit

    # hard way, using github
    $ cd $HOME
    $ git clone https://github.com/bleachbit/bleachbit
    $ make -C po local
    $ cp bleachbit.py $HOME/bin/bleachbit
    $ cd $HOME
    $ rm -rf bleachbit/
    ```

## Extra Commands & Tools

- [git](https://git-scm.com/)
    - [code](https://github.com/git/git)

    ```bash
    $ apt-add-repository ppa:git-core/ppa
    $ apt update
    $ apt install git

    # extra tool -> gitk
    $ apt install gitk

    # extra tool -> gitg
    $ apt install gitg

    # extra tool -> git cola
    # (2020-05-27 14:37:31)
    # Inst git-cola (3.6-1 Ubuntu:20.04/focal [all])
    $ sudo apt install git-cola
    ```

- git-cola
    - dowload it (if lastest version is not in ubuntu packages:)
        - check latest version [here](https://github.com/git-cola/git-cola/releases/latest)
        - download source code [tar.gz](https://github.com/git-cola/git-cola/archive/v3.6.tar.gz)
    - decompress it
    - install it (follow `README.md`)
        - don't forget to have `bin` folder inside your `$HOME`
        - don't forget to include your `bin` folder in your `$PATH`
    - create new item in menu
        - adding **.desktop** file in */usr/share/applications/*

        ```
        [Desktop Entry]
        Name=Git Cola
        Comment=The highly caffeinated Git GUI
        Comment[zh_TW]=高咖啡因含量的 Git 圖形介面
        TryExec=git-cola
        Exec=$HOME/bin/git-cola --prompt
        Icon=git-cola
        StartupNotify=true
        Terminal=false
        Type=Application
        Categories=Development;RevisionControl;
        X-KDE-SubstituteUID=false
        ```

    - Settings

    ```
    GUI theme -> Flat dark grey
    Icon theme -> Dark theme
    Hide Branches
    Hide Submodules
    Move Status to right
    ```

- [htop](https://github.com/hishamhm/htop) - htop is an interactive text-mode process viewer for Unix systems. It aims to be a better 'top'.

    ```bash
    # easy way
    $ apt install htop

    # Packages needed
    # autoconf automake autopoint autotools-dev debhelper dh-autoreconf
    # dh-strip-nondeterminism dwz gettext intltool-debian libarchive-cpio-perl
    # libarchive-zip-perl libcroco3 libdebhelper-perl libfile-stripnondeterminism-perl
    # libltdl-dev libmail-sendmail-perl libsigsegv2 libsub-override-perl
    # libsys-hostname-long-perl libtool m4 po-debconf
    $ apt search autoreconf

    # Packages needed
    # libncursesw5
    # libncursesw5-dev
    $ apt install libncursesw5 libncursesw5-dev

    # hard way - from source
    # install in $HOME/bin
    $ cd $HOME
    $ git clone https://github.com/hishamhm/htop
    $ cd htop
    $ ./autogen.sh
    $ ./configure
    $ make
    $ cp htop $HOME/bin
    $ cd $HOME
    $ rm -rf htop/
    ```

- [speedtest](https://github.com/sivel/speedtest-cli) - Command line interface for testing internet bandwidth using speedtest.net

    ```bash
    # install in $HOME/bin
    $ wget -O $HOME/bin/speedtest https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py
    $ chmod +x $HOME/bin/speedtest
    ```

- [httpie](https://github.com/jakubroztocil/httpie) - As easy as HTTPie /aitch-tee-tee-pie/ pie Modern command-line HTTP client – user-friendly curl alternative with intuitive UI, JSON support, syntax highlighting, wget-like downloads, extensions, etc

    ```bash
    # install in /usr/bin or /usr/local/bin
    $ sudo pip install -U httpie

    # install in $HOME/.local/bin
    $ pip install --user -U httpie
    # if pip was already installed with --user,
    # don't need `sudo` not `--user`
    $ pip install -U httpie
    ```

- [tmux](https://github.com/tmux/tmux) - tmux is a terminal multiplexer

    ```bash
    # check which version is included in your package repositories (Ubunut)
    $ apt install -s bash
    ...
    tmux is already the newest version (2.1-3build1)
    ...

    # easy way
    $ apt install bash

    # Packages needed
    # libevent-dev

    # hard way, from github
    # install in $HOME/bin
    $ cd $HOME
    $ git clone https://github.com/tmux/tmux
    $ cd tmux/
    $ ./autogen.sh
    $ ./configure
    $ make
    $ cp tmux $HOME/bin
    $ cd $HOME
    $ rm -rf tmux/
    ```

- [tree](https://github.com/nodakai/tree-command) - handy little utility to display a tree view of directories
    - [Linux ‘tree Command’ Usage Examples for Beginners](https://www.tecmint.com/linux-tree-command-examples/)

    ```bash
    # -a All files are listed.
    # -f Print the full path prefix for each file.
    # -d, only folders
    # -L {{ number }}, where {{ number }} is level of depth
    # -p Print the protections for each file.

    $ apt install tree
    ```

- [docker](https://github.com/moby/moby)
    - [install @ ubuntu](https://docs.docker.com/install/linux/docker-ce/ubuntu/)
    - [post setup as non root user](https://docs.docker.com/install/linux/linux-postinstall/#manage-docker-as-a-non-root-user)

- [docker-compose](https://github.com/docker/compose)

    ```bash
    # install via pip (python package manager)
    $ pip install -U docker-compose

    # install via github in /usr/local/bin
    $ curl -L https://github.com/docker/compose/releases/download/1.25.5/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
    $ chmod +x /usr/local/bin/docker-compose
    ```

- [iproute2](https://en.wikipedia.org/wiki/Iproute2) - collection of userspace utilities for controlling and monitoring various aspects of networking in the Linux kernel, including routing, network interfaces, tunnels, traffic control, and network-related device drivers.

    | Legacy utility    | Replacement command           | Note                                  |
    | ------------------|-------------------------------|---------------------------------------|
    | ifconfig          | ip addr, ip link, ip -s       | Address and link configuration        |
    | route             | ip route                      | Routing tables                        |
    | arp               | ip neigh                      | Neighbors                             |
    | iptunnel          | ip tunnel                     | Tunnels                               |
    | nameif            | ifrename, ip link set name    | Rename network interfaces             |
    | ipmaddr           | ip maddr                      | Multicast                             |
    | netstat           | ip -s, ss, ip route           | Show various networking statistics    |
    | brctl             | bridge                        | Handle bridge addresses and devices   |

- `unrar` - Unarchiver for .rar files

    ```bash
    $ apt install unrar
    ```

- [ffmpeg](https://ffmpeg.org/) - A complete, cross-platform solution to record, convert and stream audio and video.
    - [code @ Github](https://github.com/FFmpeg/FFmpeg)

    ```bash
    $ apt install ffmpeg
    ```

- [jq](https://github.com/stedolan/jq) - Command-line JSON processor

- [wrk](https://github.com/wg/wrk)

    ```bash
    # Install
    $ git clone https://github.com/wg/wrk
    $ cd wrk
    $ make
    # hope no errors on output
    # copy `wrk` binary to your local `bin` folder
    $ cp wrk $HOME/bin/wrk

    # How to use it
    -c, --connections: total number of HTTP connections to keep open with
                    each thread handling N = connections/threads
    -d, --duration:    duration of the test, e.g. 2s, 2m, 2h
    -t, --threads:     total number of threads to use
    -s, --script:      LuaJIT script, see SCRIPTING
    -H, --header:      HTTP header to add to request, e.g. "User-Agent: wrk"
        --latency:     print detailed latency statistics
        --timeout:     record a timeout if a response is not received within
                    this amount of time.
    ```

- [wrk2](https://github.com/giltene/wrk2)

    ```bash
    # Install
    $ git clone https://github.com/giltene/wrk2
    $ cd wrk2
    $ make
    # hope no errors on output
    # copy `wrk` binary to your local `bin` folder as `wrk2`
    $ cp wrk $HOME/bin/wrk2

    # How to use it, same as wrk
    ```

- [youtube-dl](https://github.com/ytdl-org/youtube-dl) - Command-line program to download videos from YouTube.com and other video sites

    ```bash
    # install via pip
    $ pip install -U youtube-dl

    # install direct from github
    $ sudo curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl
    $ sudo chmod a+rx /usr/local/bin/youtube-dl
    ```

- [flameshot](https://github.com/lupoDharkael/flameshot) - Powerful yet simple to use screenshot software
    - [Install @ Ubuntu](https://flameshot.js.org/#/getting-start?id=debianubuntu)

    ```bash
    # add `Super + Print` as keyboard shortcut
    # add `Print` as keyboard shortcut but
    # don't forget to check where `Take a screenshot` default shortcut is
    # -d, delay time in miliseconds
    # -p, path where capture will be saved
    /usr/local/bin/flameshot gui -d 500 -p {{ $HOME }}/Pictures
    /usr/bin/flameshot gui -d 500 -p {{ $HOME }}/Pictures

    # easy way
    $ apt install flameshot

    # when installed in clean pop os 20.04 v6
    $ apt install qtchooser

    # when installed in clean pop os 20.04 v6
    # installed packages
    # libclang1-10 libdouble-conversion3 libegl-dev libgl-dev libglu1-mesa-dev
    # libglx-dev libllvm10 libpthread-stubs0-dev libqt5concurrent5 libqt5core5a
    # libqt5dbus5 libqt5designer5 libqt5designercomponents5 libqt5gui5 libqt5help5
    # libqt5network5 libqt5opengl5 libqt5opengl5-dev libqt5positioning5
    # libqt5printsupport5 libqt5qml5 libqt5quick5 libqt5quickwidgets5
    # libqt5sensors5 libqt5sql5 libqt5sql5-sqlite libqt5svg5 libqt5test5
    # libqt5webchannel5 libqt5webkit5 libqt5widgets5 libqt5xml5 libvulkan-dev
    # libx11-dev libxau-dev libxcb-xinerama0 libxcb-xinput0 libxcb1-dev
    # libxdmcp-dev libxext-dev qdoc-qt5 qhelpgenerator-qt5 qt5-assistant
    # qt5-default qt5-gtk-platformtheme qt5-qmake qt5-qmake-bin
    # qtattributionsscanner-qt5 qtbase5-dev qtbase5-dev-tools qttools5-dev-tools
    # qttranslations5-l10n x11proto-core-dev x11proto-dev x11proto-xext-dev
    # xorg-sgml-doctools xtrans-dev
    $ sudo apt install \
        libqt5svg5 \
        libqt5svg5-dev

    # when installed in clean pop os 20.04 v6
    # installed packages
    # appmenu-gtk3-module libappmenu-gtk3-parser0
    $ sudo apt install \
        appmenu-gtk3-module

    # Packages needed
    # Compile-time
    $ apt install \
        g++ \
        build-essential \
        qt5-default \
        qt5-qmake \
        qttools5-dev-tools

    # Run-time
    $ apt install libqt5dbus5 \
        libqt5network5 \
        libqt5core5a \
        libqt5widgets5 \
        libqt5gui5 \
        libqt5svg5-dev

    # Optional
    $ apt install git \
        openssl \
        ca-certificates

    # hard way, from github
    # install in $HOME/bin
    $ cd $HOME
    $ git clone https://github.com/lupoDharkael/flameshot
    $ cd flameshot/
    $ mkdir build/
    $ cd build/
    $ qmake ../
    $ make
    $ cp flameshot $HOME/bin
    $ cd $HOME
    $ rm -rf flameshot/

    {{ $HOME }}/bin/flameshot gui -d 500 -p {{ $HOME }}/Pictures
    /home/eevmanu/bin/flameshot gui -d 500 -p /home/eevmanu/Pictures

    # flameshot.conf
    [General]
    closeAfterScreenshot=true
    disabledTrayIcon=false
    filenamePattern=fs_%Y-%m-%d_%H-%M-%S
    showDesktopNotification=true
    startupLaunch=true
    ```

    ```
    Couldn't install in $HOME/bin
    Seems to be a limitation between $PATH, Gnome (shell, extensions, menu, not sure)
    because when I install via apt it works (it install in /usr/bin/flameshot) and calling
    from command declaration in custom keyboard shortcut is not a problem
    but when build binary and execute ./flameshot gui, nothing appears, nothing work
    ```

- [ngrok](https://ngrok.com/) - Public URLs for exposing your local web server.

    ```bash
    # install in $HOME/bin
    $ cd $HOME
    # dowload from https://ngrok.com/download
    $ wget -O $HOME/ngrok.zip https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip
    $ unzip $HOME/ngrok.zip
    $ mv $HOME/ngrok $HOME/bin/
    $ rm ngrok.zip
    ```

- `httpstat` - It's like curl -v, with graphs and colors
    - in [bash](https://github.com/b4b4r07/httpstat)
    - in [Go](https://github.com/davecheney/httpstat)
    - in [Python](https://github.com/reorx/httpstat)

    ```bash
    # install in $HOME/bin
    $ wget -O $HOME/bin/httpstat https://raw.githubusercontent.com/b4b4r07/httpstat/master/httpstat.sh
    $ chmod +x $HOME/bin/httpstat

    # install in $GOPATH/bin (Go)
    $ go get github.com/davecheney/httpstat

    # install where `pip` points (Python)
    $ pip install httpstat
    ```

- [hwinfo](https://github.com/openSUSE/hwinfo) - Hardware information tool

    ```bash
    # easy way, via apt packages
    $ apt install hwinfo

    $ hwinfo --disk
    ...
    Device Files: /dev/nvme0n1, /dev/disk/by-id/nvme-Samsung_SSD_950_PRO_512GB_S2GMNX0H413184R
    ...
    ```

- [ufw](https://help.ubuntu.com/community/UFW) - Uncomplicated Firewall
    - [Gufw](https://help.ubuntu.com/community/Gufw) - firewall powered by UFW

    ```bash
    $ apt install ufw
    $ apt install gufw
    ```

- [exiftool](https://github.com/exiftool/exiftool) - meta information reader/writer

    ```bash
    # set date time on pictures
    $ exiftool -AllDates="2015:09:22 12:00:00"
    ```

- [powertop](https://github.com/fenrus75/powertop) - The Linux PowerTOP tool

    ```bash
    # Packages needed
    # Pciutils-devel -> libpci-dev
    # Ncurses-devel -> libncurses5-dev
    # Libnl-devel -> libnl-genl-3-dev
    # autopoint
    # dh-autoreconf
    # autoconf-archive

    # download it
    $ wget https://01.org/sites/default/files/downloads/powertop-2.12.tar.gz
    # or
    $ git clone https://github.com/fenrus75/powertop
    $ git checkout v2.12

    # install in $HOME/bin
    $ cd powertop/
    $ ./autogen.sh
    $ ./configure
    $ make
    $ cp src/powertop $HOME/bin
    $ cd $HOME
    $ rm -rf powertop/
    ```

- [iotop](https://linux.die.net/man/1/iotop)
- [iftop](https://linux.die.net/man/8/iftop)
- [perf top](https://linux.die.net/man/1/perf-top)
- `ncdu`
- `nmon`
- `bmon`

- [AWS CLI](https://aws.amazon.com/cli/)
    - [Install - Version 2](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-install.html)
    - [Configure](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-configure.html)
    - [code](https://github.com/aws/aws-cli)
    - [More info, AWS Guides @ Gihub](https://github.com/open-guides/og-aws)

- [carbon](https://github.com/carbon-app/carbon) - Create and share beautiful images of your source code

- [jupyter](https://jupyter.org/)
    - [code](https://github.com/jupyter/jupyter)
    - [Installing the Jupyter Software](https://jupyter.org/install)

    ```bash
    # install dependent packages
    $ sudo apt install ipython ipython-notebook
    $ pip install jupyterlab
    $ pip install notebook

    $ jupyter notebook
    ```

- Java (Oracle version, not OpenJDK), in case a program required it
  - [How to Install Java on Ubuntu 18.04](https://linuxize.com/post/install-java-on-ubuntu-18-04/)
  - [How To Install Oracle Java 14 (JDK 14) On Ubuntu, Debian Or Linux Mint From APT PPA Repository](https://www.linuxuprising.com/2020/03/how-to-install-oracle-java-14-jdk14-on.html)
  - [How To Install Java with Apt on Ubuntu 20.04](https://www.digitalocean.com/community/tutorials/how-to-install-java-with-apt-on-ubuntu-20-04)




## Troubleshooting

### Spotify

- [SOLVED: Spotify desktop client communication failed | Mike Dixson](https://mikedixson.com/2014/11/solved-spotify-desktop-client-communication-failed/)

- [Spotify keyboard controls not working](https://askubuntu.com/a/1152539/879600)

    ```bash
    # Play/Stop
    $ dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.PlayPause

    # Next
    $ dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Next

    # Previous
    $ dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Previous
    ```

## Resource


## TODO

- Internet speed monitor script

```
1. download speedtest-cli latest script
    cd /home/{your_user} or cd ~/
    * wget -O speedtest-cli https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest_cli.py
    * curl -Lo speedtest-cli https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest_cli.py
    chmod +x speedtest-cli
2. add this snippet at final of 'speedtest' method
    info = {
        'dlspeed': (dlspeed / 1000 / 1000) * args.units[1],
        'ulspeed': (ulspeed / 1000 / 1000) * args.units[1],
        'ping': best.get('latency', 0),
    }
    from keen.client import KeenClient
    client = KeenClient(
        project_id='xxxx',
        write_key='xxxx',
        master_key='xxx',
    )
    client.add_event("speed_metrics", info)
3. change location of this script in root of your home
    to /home/{your_user}/speedtest-cli
4. install packages for normal working with this script
    sudo apt-get install libffi-dev
    sudo pip install -U cffi
    sudo pip install -U requests[security]
    sudo pip install -U keen
5. add this line to crontab
    crontab -e
    * * * * * /home/manuelsolorzano/speedtest-cli --simple
    */5 * * * * /home/manuelsolorzano/speedtest-cli --simple # cada 5 minutos
```

- Firefox nightly

```bash
$ cd $HOME/
$ wget -O firefox.nightly.tar.bz2 "https://download.mozilla.org/?product=firefox-nightly-latest-ssl&os=linux64&lang=en-US"
$ (sudo) mv firefox.nightly.tar.bz2 /opt/
$ cd /opt/
$ (sudo) tar -xvjf firefox.nightly.tar.bz2
$ (sudo) rm firefox.nightly.tar.bz2
$ cd $HOME/bin/
$ ln -s /opt/firefox/firefox firefoxnightly
```

- [dbeaver](https://github.com/dbeaver/dbeaver) - Free universal database tool and SQL client
- [neofetch](https://github.com/dylanaraps/neofetch) - A command-line system information tool written in bash 3.2+
- [rclone](https://github.com/rclone/rclone) - rsync for cloud storage
- [geekbench]

```bash
# TODO
$ wget http://cdn.geekbench.com/Geekbench-5.1.0-Linux.tar.gz
```

- glances
- traceroute
- mtr
- nethogs

- [FiraCode](https://github.com/tonsky/FiraCode) - Free monospaced font with programming ligatures


setup keyboard short to change keyboard layout
verify all chrome extensions which needs *Allow access to file URLs*
remember that shortcuts to change workspaces and move windows between workspaces are diff between OSes

https://github.com/xournalpp/xournalpp


- Switch `on/off` **camera** on linux

    ```bash
    # ON (default)
    $ sudo modprobe uvcvideo
    # OFF
    $ sudo modprobe -r uvcvideo
    ```
