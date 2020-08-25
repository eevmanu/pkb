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

- Verify change by number of files in a folder

    ```bash
    $ tree /media/$USER/manu/Documents/ | wc -l
    $ tree /media/$USER/manu/Downloads/ | wc -l
    $ tree /media/$USER/manu/Music/ | wc -l
    $ tree /media/$USER/manu/Pictures/ | wc -l
    $ tree /media/$USER/manu/Projects/ | wc -l
    $ tree /media/$USER/manu/Videos/ | wc -l
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

- Resources
    - [restic](https://github.com/restic/restic)
    - [duplicacy](https://github.com/gilbertchen/duplicacy) - A new generation cloud backup tool
    - [timeshift](https://github.com/teejee2008/timeshift) - System restore tool for Linux.

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


- Linux software distributions

    - [Snapcraft](https://snapcraft.io/)
        - [Install on Ubuntu](https://snapcraft.io/docs/installing-snap-on-ubuntu)

        ```bash
        $ sudo apt update
        $ sudo apt install snapd
        ```

    - [flatpak](https://flatpak.org/)

        - Directories used:

            ```bash
            $HOME/.cache/flatpak
            $HOME/.local/share/flatpak
            ```

    - [AppImage](https://appimage.org/)

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
    - [How to restore the default Google search engine in Chrome?](https://superuser.com/questions/578228/how-to-restore-the-default-google-search-engine-in-chrome)
    - [Flags](chrome://flags/)
    - [Config to avoid extra query params via Requestly](https://i.imgur.com/zzPO7rB.png)
    - [[Help] Subframe: Google Drive randomly spiking CPU usage](https://www.reddit.com/r/chrome/comments/foehds/help_subframe_google_drive_randomly_spiking_cpu/)
    - [Enable sharing page via QR Code](chrome://flags/#sharing-qr-code-generator)

    ```bash
    $ wget -O chrome.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
    ```

- [Brave](https://brave.com/) - browser with real privacy
    - [Install instructions for Linux](https://brave-browser.readthedocs.io/en/latest/installing-brave.html#linux)

    ```bash
        $ sudo apt install \
            apt-transport-https \
            curl

        $ curl \
            --silent \
                https://brave-browser-apt-nightly.s3.brave.com/brave-core-nightly.asc \
        | \
            sudo apt-key \
                --keyring /etc/apt/trusted.gpg.d/brave-browser-prerelease.gpg \
                    add -

        $ echo \
            "deb [arch=amd64] https://brave-browser-apt-nightly.s3.brave.com/ stable main" \
        | \
            sudo tee \
                /etc/apt/sources.list.d/brave-browser-nightly.list

        $ sudo apt update

        $ sudo apt install brave-browser-nightly

        # to remove it

        $ sudo apt remove brave-browser-nightly

        $ sudo apt purge brave-browser-nightly

        $ sudo rm /etc/apt/sources.list.d/brave-browser-nightly.list*

        $ sudo rm /etc/apt/trusted.gpg.d/brave-browser-prerelease.gpg*
    ```

- [Dropbox daemon](https://www.dropbox.com/install-linux)
    - [How to install Dropbox through flatpak on CentOS 8.0](https://vitux.com/how-to-install-dropbox-through-flatpak-on-centos-8-0/)

    ```bash
    $ wget -O dropbox.deb https://www.dropbox.com/download?dl=packages/ubuntu/dropbox_2020.03.04_amd64.deb

    # https://www.dropbox.com/install-linux
    $ cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -

    # install via flatpak
    $ flatpak install flathub com.dropbox.Client
    ```

    - Add to Startup Applications
        - In PopOS, be sure to have Gnome Tweaks, if not, install it
        - Open Gnome Tweaks
        - Go to option Startup Applications
        - Click in `+` to add a application
        - Click on search icon to search dropbox
        - Enter `dropbox` (should appear if was installed via flatpak)
        - Confirm to add it

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
    - [vscodium](https://github.com/VSCodium/vscodium)
    - Code Insiders
    - [FAQ](https://code.visualstudio.com/docs/supporting/faq)
    - [How can you export the Visual Studio Code extension list?](https://stackoverflow.com/questions/35773299/how-can-you-export-the-visual-studio-code-extension-list) @ stackoverflow
    - [How do I remove VS Code & settings from Ubuntu?](https://superuser.com/questions/1113022/how-do-i-remove-vs-code-settings-from-ubuntu)
    - [User and Workspace Settings](https://code.visualstudio.com/docs/getstarted/settings)
    - [How to change indentation in Visual Studio Code?](https://stackoverflow.com/questions/34174207/how-to-change-indentation-in-visual-studio-code)

    ```bash
    # set code (or code-insiders) as default editor manually
    $ sudo update-alternatives --set editor /usr/bin/code
    # set code (or code-insiders) as default editor interactively
    $ sudo update-alternatives --config editor

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

    # icon saved here
    $HOME/.local/share/icons/telegram.png

    # folders used for Telegram via Flatpak
    $HOME/.local/share/TelegramDesktop/
    $HOME/.var/app/org.telegram.desktop
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

    - Directories used:

        ```bash
        $HOME/.var/app/us.zoom.Zoom/
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

- [marktext](https://github.com/marktext/marktext) - A simple and elegant markdown editor, available for Linux, macOS and Windows.
    - Other option: [notable](https://github.com/notable/notable) - The Markdown-based note-taking app that doesn't suck.
    - `.desktop` file [example](https://github.com/marktext/marktext/blob/develop/resources/linux/marktext.desktop)
    - fix issue with [icon](https://askubuntu.com/questions/333133/how-to-set-app-icon-in-the-desktop-file-of-an-ubuntu-touch-application)

    ```bash
    # 0.16.1
    $ wget -O $HOME/bin/marktext https://github.com/marktext/marktext/releases/download/v0.16.1/marktext-x86_64.AppImage
    $ chmod +x $HOME/bin/marktext
    $ sha256sum $HOME/bin/marktext
    # 373080e22e6c0aa9fa9394c91b6cf1036898a17595e629983912bbced89653ec

    $ curl -L https://raw.githubusercontent.com/marktext/marktext/develop/resources/linux/marktext.desktop -o $HOME/.local/share/applications/marktext.desktop
    # Update the Exec in .desktop file to your real marktext command. Specify Path if necessary.
    $ code $HOME/.local/share/applications/marktext.desktop
    $ update-desktop-database $HOME/.local/share/applications/

    $ mkdir $HOME/.icons
    $ cd $HOME/.icons
    $ wget -O marktext.png https://github.com/marktext/marktext/blob/develop/resources/icons/icon.png?raw=true
    ```

    - Directories used:

        ```bash
        $HOME/.config/marktext
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
    # settings file: $HOME/.config/git-cola/settings
    ```

- [git-cola](https://github.com/git-cola/git-cola) - The highly caffeinated Git GUI
    - Clone repo (if you already have it, update it)

        ```
        $ mkdir -p $HOME/bin-sources/
        $ cd $HOME/bin-sources/
        $ git clone https://github.com/git-cola/git-cola
        ```

    - Install dependencies

        ```
        $ pip install PyQt5
        ```

    - Create soft links inside `$HOME/bin` folder

        ```
        $ ln -s $HOME/bin-sources/git-cola/bin/git-cola $HOME/bin/
        $ ln -s $HOME/bin-sources/git-cola/bin/git-dag $HOME/bin/
        ```

    - Create **.desktop** file into */usr/share/applications/* or *$HOME/.local/share/applications*

        ```bash
        $ touch $HOME/.local/share/applications/git-cola.desktop
        $ touch $HOME/.local/share/applications/git-dag.desktop
        ```

        - `git-cola.desktop` file content (example [here](https://github.com/git-cola/git-cola/blob/main/share/applications/git-cola.desktop))

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

        - `git-dag.desktop` file content (example [here](https://github.com/git-cola/git-cola/blob/main/share/applications/git-dag.desktop))

            ```
            [Desktop Entry]
            Name=Git DAG
            Comment=Git DAG visualizer
            Exec=git-dag --prompt
            Icon=git-cola
            StartupNotify=true
            Terminal=false
            Type=Application
            Categories=Development;RevisionControl;
            X-KDE-SubstituteUID=false
            ```

    - Add icons

        ```bash
        $ wget \
            -O $HOME/.local/share/icons/git-cola \
            https://raw.githubusercontent.com/git-cola/git-cola/main/share/git-cola/icons/dark/git-cola.ico
        ```

    - Update info about applictions (new desktop and icon files)

        ```bash
        $ update-desktop-database $HOME/.local/share/applications/
        ```

    - Remove everything

        ```bash
        $ rm $HOME/.local/share/icons/git-cola
        $ rm $HOME/.local/share/applications/git-cola.desktop
        $ rm $HOME/.local/share/applications/git-dag.desktop
        $ rm $HOME/bin-sources/git-cola/bin/git-cola
        $ rm $HOME/bin-sources/git-cola/bin/git-dag
        $ rm -rf $HOME/bin-sources/git-cola/
        ```

    - Settings

        ```
        GUI theme -> Flat dark grey
        Icon theme -> Dark theme
        Hide Branches
        Hide Submodules
        Move Status to right
        ```

    - Settings folder path - `$HOME/.config/git-cola/settings`

- [xclip](https://github.com/astrand/xclip) - for `myts` personal commands

    ```bash
    # $ sudo apt install xclip
    # (2020-05-27 14:33:23)
    # Inst xclip (0.13-1 Ubuntu:20.04/focal [amd64])
    $ sudo apt install xclip
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
    # verify `env python` works
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

    $ sudo apt install tree
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
    - [Ubuntu 20.04 FFmpeg installation](https://linuxconfig.org/ubuntu-20-04-ffmpeg-installation)

    ```bash
    # (2020-05-28 18:30:43)
    # Conf ffmpeg (7:4.2.2-1ubuntu1 Ubuntu:20.04/focal [amd64])
    $ sudo apt install ffmpeg
    ```

- [jq](https://github.com/stedolan/jq) - Command-line JSON processor

- [wrk](https://github.com/wg/wrk)
    - [awesome-http-benchmark](https://github.com/denji/awesome-http-benchmark) - HTTP(S) benchmark tools, testing/debugging, & restAPI (RESTful)

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
    # download with wget
    # install on $HOME/bin (could be $HOME/.local/bin)
    $ wget https://yt-dl.org/downloads/latest/youtube-dl -O $HOME/bin/youtube-dl
    $ chmod a+rx $HOME/bin/youtube-dl
    ```

- [flameshot](https://github.com/lupoDharkael/flameshot) - Powerful yet simple to use screenshot software
    - [Install @ Ubuntu](https://flameshot.js.org/#/getting-start?id=debianubuntu)

    ```bash
    # add `Super + Print` as keyboard shortcut
    # add `Print` as keyboard shortcut but
    # don't forget to check where `Take a screenshot` default shortcut is
    # -d, delay time in miliseconds
    # -p, path where capture will be saved
    /usr/local/bin/flameshot gui -d 100 -p {{ $HOME }}/Pictures
    /usr/bin/flameshot gui -d 100 -p {{ $HOME }}/Pictures

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

    {{ $HOME }}/bin/flameshot gui -d 100 -p {{ $HOME }}/Pictures

    # flameshot.conf
    [General]
    closeAfterScreenshot=true
    disabledTrayIcon=false
    filenamePattern=fs_%Y-%m-%d_%H-%M-%S
    showDesktopNotification=true
    startupLaunch=true

    # another example of flameshot.conf
    [General]
    closeAfterScreenshot=false
    disabledTrayIcon=false
    drawColor=#ff0000
    drawThickness=1
    filenamePattern=fs_%Y-%m-%d_%H-%M-%S
    savePath={{ $HOME }}/Pictures
    showDesktopNotification=false
    startupLaunch=true
    uiColor=#930096
    ```

    ```
    Couldn't install in $HOME/bin
    Seems to be a limitation between $PATH, Gnome (shell, extensions, menu, not sure)
    because when I install via apt it works (it install in /usr/bin/flameshot) and calling
    from command declaration in custom keyboard shortcut is not a problem
    but when build binary and execute ./flameshot gui, nothing appears, nothing work
    ```

    - Directories used:

        ```bash
        $HOME/.config/Dharkael/flameshot.ini
        ```

- [ksnip](https://github.com/ksnip/ksnip)
    - Install using `.AppImage`

        ```bash
        $ cd $HOME
        $ wget -O ksnip https://github.com/ksnip/ksnip/releases/download/v1.7.3/ksnip-1.7.3-x86_64.AppImage
        $ chmod +x ksnip
        $ mv ksnip $HOME/bin
        ```

        - Download icon files

            ```bash
            $ wget https://raw.githubusercontent.com/ksnip/ksnip/master/icons/ksnip.svg
            $ wget https://raw.githubusercontent.com/ksnip/ksnip/master/icons/ksnip.ico
            # Copy 64x64 and 128x128 png file from flatpak installation
            ```

        - Create folder hierarchy for `icon` files
            - [Icon size to provide for unity .desktop, and the syntax to reference it](https://askubuntu.com/questions/393104/icon-size-to-provide-for-unity-desktop-and-the-syntax-to-reference-it)

            ```bash
            # $HOME/.icons or $HOME/.local/share/icons
            $ mkdir $HOME/.icons/hicolor/64x64/apps/
            $ mkdir $HOME/.icons/hicolor/128x128/apps/
            ```

        - Copy icon files respectively

            ```bash
            $ cp ksnip_64x64.png $HOME/.icons/hicolor/64x64/apps/ksnip.png
            $ cp ksnip_128x128.png $HOME/.icons/hicolor/128x128/apps/ksnip.png
            ```

        - Move icon files downloaded from github

            ```bash
            $ mv ksnip.icon .icons/
            $ mv ksnip.svg .icons/
            ```

        - Setup shortcut

            ```
            Ksnip
            {{ $HOME }}/bin/ksnip -r -d 0.1
            Shift + Print or Print
            ```

        - Change config inside app

            ```
            [Application]
            ApplicationStyle=Fusion
            AutoCopyToClipboardNewCaptures=true
            CloseToTray=false
            MinimizeToTray=false
            PromptSaveBeforeExit=false
            RememberLastSaveDirectory=true
            SaveDirectory={{ $HOME }}/Pictures
            SaveFilename=$Y-$M-$D_$T
            StartMinimizedToTray=false
            UseTabs=false
            UseTrayIcon=false

            [ImageGrabber]
            LastRectArea=@Rect(2341 182 1058 426)

            [Imgur]
            AlwaysCopyToClipboard=true
            ForceAnonymous=true
            OpenLinkDirectlyToImage=true

            [MainWindow]
            Position=@Point(2253 69)

            [Painter]
            ItemShadowEnabled=false
            NumberFont=@Variant(\0\0\0@\0\0\0\x12\0\x46\0i\0r\0\x61\0 \0\x43\0o\0\x64\0\x65@>\0\0\0\0\0\0\xff\xff\xff\xff\x5\x1\0K\x10)
            RotateWatermark=false
            TextFont=@Variant(\0\0\0@\0\0\0\x12\0\x46\0i\0r\0\x61\0 \0\x43\0o\0\x64\0\x65@(\0\0\0\0\0\0\xff\xff\xff\xff\x5\x1\0\x32\x10)

            [UploadScript]
            UploadScriptStoOnStdErr=false

            ```

        - Path to config file

            ```bash
            $ cat $HOME/.config/ksnip/ksnip.conf
            ```

        - Create `.desktop` file on `$HOME/.local/share/applications/ksnip.desktop`

            ```
            #!/usr/bin/env xdg-open
            [Desktop Entry]
            Type=Application
            Exec={{ $HOME }}/bin/ksnip
            Name=ksnip
            GenericName=ksnip Screenshot Tool
            Comment=Qt based cross-platform screenshot tool that provides many annotation features for your screenshots.
            Icon=ksnip
            Terminal=false
            StartupNotify=true
            Categories=Utility;
            ```

        - Update manually desktop file database

            ```bash
            $ update-desktop-database $HOME/.local/share/applications/
            ```

        - Uninstall and remove completely

            ```bash
            $ rm -rf $HOME/.local/share/ksnip
            $ rm -rf $HOME/.config/ksnip
            $ rm $HOME/bin/ksnip
            ```

    - Install it via flatpak

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

### VS Code

- [[mitigated] Linux: Ctrl+Shift+E cannot be used as keybinding anymore](https://github.com/microsoft/vscode/issues/48480)
    - go to terminal type `ibus-setup`
    - go to Emoji tab, press the `...` next to Emoji choice to get `select keyboard shortcut for switching` window
    - use the delete button to delete the shortcut and leave nothing there, press OK
    - Close
    - Try typing `GTK_IM_MODULE=ibus` code into the terminal. This should work!
    - If it does just alias this as I put in the post above

## Resource

- [How To Delete A Repository And GPG Key In Ubuntu](https://www.ostechnix.com/how-to-delete-a-repository-and-gpg-key-in-ubuntu/)

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

- Firefox
    - [How to install Firefox Developer Edition on Linux](https://linuxconfig.org/how-to-install-firefox-developer-edition-on-linux)

    - Beta

        > How to install it, step by step
        > ```bash
        > $ cd $HOME/
        > $ mkdir -p $HOME/.local/opt
        > $ wget \
        >     -O firefox-beta.tar.bz2 \
        >     "https://download.mozilla.org/?product=firefox-beta-latest-ssl&os=linux64&lang=en-US"
        > # 2020-06-07
        > # version -> 78.0b3
        > # sha256sum -> 3967d661e5e3a92e0423172844d04c3bf0b9742c242d85e170e067a78f47bac8
        > # sha512sum -> 271c6bacbcf7ff853b85c83894f5c27544b0f7292f5c85a40f76414748c3fe5fd3e80d7b4cfcf0575b4b44b1d89f6c6593f9ef79560d5089c01f3037f76bd156
        > $ tar \
        >     --extract \
        >     --verbose \
        >     --preserve-permissions \
        >     --bzip2 \
        >     --file firefox-beta.tar.bz2
        > $ mv firefox/ firefox-beta/
        > $ mv firefox-beta/ $HOME/.local/opt/
        > $ ln -s $HOME/.local/opt/firefox-beta/firefox $HOME/bin/firefox-beta
        > $ nano $HOME/.local/share/applications/firefox-beta.desktop
        > $ update-desktop-database $HOME/.local/share/applications/
        > ```
        > **$HOME/.local/share/applications/firefox-beta**
        >
        > `{{ /path/to/home }}` -> `$ echo $HOME`
        > ```
        > [Desktop Entry]
        > Name=Firefox Beta Edition
        > GenericName=Web Browser
        > Exec={{ /path/to/home }}/bin/firefox-beta %u
        > Icon={{ /path/to/home }}/.local/opt/firefox-beta/browser/chrome/icons/default/default128.png
        > Terminal=false
        > Type=Application
        > MimeType=text/html;text/xml;application/xhtml+xml;application/vnd.mozilla.xul+xml;text/mml;x-scheme-handler/http;x-scheme-handler/https;
        > StartupNotify=true
        > Categories=Network;WebBrowser;
        > Keywords=web;browser;internet;
        > Actions=new-window;new-private-window;
        > StartupWMClass=Firefox Beta Edition
        >
        > [Desktop Action new-window]
        > Name=Open a New Window
        > Exec={{ /path/to/home }}/bin/firefox-beta %u
        >
        > [Desktop Action new-private-window]
        > Name=Open a New Private Window
        > Exec={{ /path/to/home }}/bin/firefox-beta --private-window %u
        > ```
        > to update it, use rsync (take a look to trailing [slashes](https://superuser.com/a/623846/944220))
        > ```bash
        > $ cd $HOME
        > $ wget \
        >     -O firefox-beta.tar.bz2 \
        >     "https://download.mozilla.org/?product=firefox-beta-latest-ssl&os=linux64&lang=en-US"
        > $ tar \
        >     --extract \
        >     --verbose \
        >     --preserve-permissions \
        >     --bzip2 \
        >     --file firefox-beta.tar.bz2
        > $ rsync -av --delete firefox/ $HOME/.local/opt/firefox-beta
        > $ rm -rf firefox/
        > ```

    - Developer

        > How to install it, step by step
        > ```bash
        > $ cd $HOME/
        > $ mkdir -p $HOME/.local/opt
        > $ wget \
        >     -O firefox-dev.tar.bz2 \
        >     "https://download.mozilla.org/?product=firefox-devedition-latest-ssl&os=linux64&lang=en-US"
        > # 2020-06-07
        > # version -> 78.0b3
        > # sha256sum -> 969c53556c30ce2c51b0e9c5febf7915c2a1b861638f454848f65a1931665537
        > # sha512sum -> 98582db0b9e5bbb1319e912c98aaa0e7ee8e9dbeceac07753203baf5da1b0172f90487973c1cf038fd48d5d407f381f58047b58192f8e5c38772a0083de331b0
        > $ tar \
        >     --extract \
        >     --verbose \
        >     --preserve-permissions \
        >     --bzip2 \
        >     --file firefox-dev.tar.bz2
        > $ mv firefox/ firefox-dev/
        > $ mv firefox-dev/ $HOME/.local/opt/
        > $ ln -s $HOME/.local/opt/firefox-dev/firefox $HOME/bin/firefox-dev
        > $ nano $HOME/.local/share/applications/firefox-dev.desktop
        > $ update-desktop-database $HOME/.local/share/applications/
        > ```
        > **$HOME/.local/share/applications/firefox-dev**
        >
        > `{{ /path/to/home }}` -> `$ echo $HOME`
        > ```
        > [Desktop Entry]
        > Name=Firefox Developer Edition
        > GenericName=Web Browser
        > Exec={{ /path/to/home }}/bin/firefox-dev %u
        > Icon={{ /path/to/home }}/.local/opt/firefox-dev/browser/chrome/icons/default/default128.png
        > Terminal=false
        > Type=Application
        > MimeType=text/html;text/xml;application/xhtml+xml;application/vnd.mozilla.xul+xml;text/mml;x-scheme-handler/http;x-scheme-handler/https;
        > StartupNotify=true
        > Categories=Network;WebBrowser;
        > Keywords=web;browser;internet;
        > Actions=new-window;new-private-window;
        > StartupWMClass=Firefox Developer Edition
        >
        > [Desktop Action new-window]
        > Name=Open a New Window
        > Exec={{ /path/to/home }}/bin/firefox-dev %u
        >
        > [Desktop Action new-private-window]
        > Name=Open a New Private Window
        > Exec={{ /path/to/home }}/bin/firefox-dev --private-window %u
        > ```
        > to update it, use rsync (take a look to trailing [slashes](https://superuser.com/a/623846/944220))
        > ```bash
        > $ cd $HOME
        > $ wget \
        >     -O firefox-dev.tar.bz2 \
        >     "https://download.mozilla.org/?product=firefox-devedition-latest-ssl&os=linux64&lang=en-US"
        > $ tar \
        >     --extract \
        >     --verbose \
        >     --preserve-permissions \
        >     --bzip2 \
        >     --file firefox-dev.tar.bz2
        > $ rsync -av --delete firefox/ $HOME/.local/opt/firefox-dev
        > $ rm -rf firefox/
        > ```

    - Nightly

        > How to install it, step by step
        > ```bash
        > $ cd $HOME/
        > $ mkdir -p $HOME/.local/opt
        > $ wget \
        >     -O firefox-nightly.tar.bz2 \
        >     "https://download.mozilla.org/?product=firefox-nightly-latest-ssl&os=linux64&lang=en-US"
        > # 2020-06-07
        > # version -> 79.0a1
        > # sha256sum -> 190de9367a5c063c38c91fecf472d0c653d96411bd9ecb0a5a17a9e66ccacd83
        > # sha512sum -> ff864cef35935aed56e27d24f190ce7d0f6b955f57046147c99fa23e1b8fdc6ec9f89df4bbf9727e2042107985060e8a9896484af21a203f1a36d8d84218c678
        > $ tar \
        >     --extract \
        >     --verbose \
        >     --preserve-permissions \
        >     --bzip2 \
        >     --file firefox-nightly.tar.bz2
        > $ mv firefox/ firefox-nightly/
        > $ mv firefox-nightly/ $HOME/.local/opt/
        > $ ln -s $HOME/.local/opt/firefox-nightly/firefox $HOME/bin/firefox-nightly
        > $ nano $HOME/.local/share/applications/firefox-nightly.desktop
        > $ update-desktop-database $HOME/.local/share/applications/
        > ```
        > **$HOME/.local/share/applications/firefox-nightly**
        >
        > `{{ /path/to/home }}` -> `$ echo $HOME`
        > ```
        > [Desktop Entry]
        > Name=Firefox Nightly Edition
        > GenericName=Web Browser
        > Exec={{ /path/to/home }}/bin/firefox-nightly %u
        > Icon={{ /path/to/home }}/.local/opt/firefox-nightly/browser/chrome/icons/default/default128.png
        > Terminal=false
        > Type=Application
        > MimeType=text/html;text/xml;application/xhtml+xml;application/vnd.mozilla.xul+xml;text/mml;x-scheme-handler/http;x-scheme-handler/https;
        > StartupNotify=true
        > Categories=Network;WebBrowser;
        > Keywords=web;browser;internet;
        > Actions=new-window;new-private-window;
        > StartupWMClass=Firefox Nightly Edition
        >
        > [Desktop Action new-window]
        > Name=Open a New Window
        > Exec={{ /path/to/home }}/bin/firefox-nightly %u
        >
        > [Desktop Action new-private-window]
        > Name=Open a New Private Window
        > Exec={{ /path/to/home }}/bin/firefox-nightly --private-window %u
        > ```
        > to update it, use rsync (take a look to trailing [slashes](https://superuser.com/a/623846/944220))
        > ```bash
        > $ cd $HOME
        > $ wget \
        >     -O firefox-nightly.tar.bz2 \
        >     "https://download.mozilla.org/?product=firefox-nightly-latest-ssl&os=linux64&lang=en-US"
        > $ tar \
        >     --extract \
        >     --verbose \
        >     --preserve-permissions \
        >     --bzip2 \
        >     --file firefox-nightly.tar.bz2
        > $ rsync -av --delete firefox/ $HOME/.local/opt/firefox-nightly
        > $ rm -rf firefox/
        > ```



- [dbeaver](https://github.com/dbeaver/dbeaver) - Free universal database tool and SQL client
- [neofetch](https://github.com/dylanaraps/neofetch) - A command-line system information tool written in bash 3.2+
- [rclone](https://github.com/rclone/rclone) - rsync for cloud storage
- [geekbench](https://www.geekbench.com/)

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

- Create soft link to `python` if no `python` in your OS

    ```bash
    # put in your $HOME `bin` folder
    $ ln -s /usr/bin/python3 $HOME/bin/python
    ```

- [Peek](https://github.com/phw/peek)

    ```bash
    $ sudo apt install ffmpeg
    # gstreamer1.0-libav -> 1.16.2-2
    $ sudo apt install gstreamer1.0-libav
    # gstreamer1.0-plugins-good -> 1.16.2-1ubuntu2
    # gstreamer1.0-plugins-ugly -> 1.16.2-2build1
    $ sudo apt install gstreamer1.0-plugins-good gstreamer1.0-plugins-ugly

    $ flatpak install flathub com.uploadedlobster.peek
    ```

- Preview images
    - [What's the best way to preview many images?](https://www.reddit.com/r/pop_os/comments/gmefd2/whats_the_best_way_to_preview_many_images/)

    - Option 1: Nautilus

        - [Best way to check if Nautilus File Manager is running?](https://unix.stackexchange.com/questions/546241/best-way-to-check-if-nautilus-file-manager-is-running)

            ```bash
            # check if you have Nautilus
            $ gdbus introspect \
                --session \
                --dest org.gnome.Nautilus \
                --object-path /org/gnome/Nautilus \
                --recurse \
            | \
            awk '/^ *node /{print $2}'
            ```

        - Install `gnome-sushi`

            ```bash
            # (2020-05-29 22:29:30)
            $ sudo apt install -s gnome-sushi
            ...
            Inst gnome-sushi (3.34.0-2 Ubuntu:20.04/focal [amd64])
            ...

            $ sudo apt install gnome-sushi
            ```

    - Option 2: Install `gThumb`

- [Screenkey](https://gitlab.com/screenkey/screenkey)

    - [slop](https://github.com/naelstrof/slop)

        ```bash
        # (2020-06-01 17:50:59)
        # slop is already the newest version (7.4-1ubuntu2).
        $ sudo apt install slop
        ```

    ```bash
    $ cd $HOME/bin-sources/
    $ git clone https://gitlab.com/screenkey/screenkey
    $ ./screenkey --show-settings
    $ ./setup.py install --user --record files.txt
    $ cat files.txt
    $HOME/.local/lib/python3.8/site-packages/screenkey-1.1-py3.8.egg
    $HOME/.local/bin/screenkey
    $ which -a screenkey
    $HOME/.local/bin/screenkey
    ```

- Record audio
    - [How to set up Audacity](https://manual.audacityteam.org/man/how_to_set_up_audacity.html)
    - [Tutorial - Recording Computer Playback on Linux](https://manual.audacityteam.org/man/tutorial_recording_computer_playback_on_linux.html)
    - [audiomass](https://audiomass.co/) - open-source web based audio and waveform editing tool.

    ```bash
    # install Audacity
    $ flatpak install flathub org.audacityteam.Audacity
    # install PulseAudio Volume Control
    $ sudo apt install pavucontrol
    ```

- [TabNine](https://www.tabnine.com/)
    - [Welcome](https://www.tabnine.com/welcome/)

- [ungoogled-chromium](https://github.com/Eloston/ungoogled-chromium) - Google Chromium, sans integration with Google
    - [ungoogled-chromium from home:ungoogled_chromium project @ opensuse](https://software.opensuse.org/download/package?package=ungoogled-chromium&project=home:ungoogled_chromium)
    - to install it

        ```bash
        # Recommended (because collides with Azul JDK)
        # Focal (20.04) version
        $ wget \
            https://download.opensuse.org/repositories/home:/ungoogled_chromium/Ubuntu_Focal/amd64/ungoogled-chromium_81.0.4044.138-1.focal1_amd64.deb \
            -O $HOME/ungoogled_chromium.deb

        $ echo 'deb http://download.opensuse.org/repositories/home:/ungoogled_chromium/Ubuntu_Focal/ /' \
            | \
            sudo tee /etc/apt/sources.list.d/home:ungoogled_chromium.list
        $ sudo wget \
            -O "/etc/apt/trusted.gpg.d/home:ungoogled_chromium.asc" \
            -nv \
                https://download.opensuse.org/repositories/home:ungoogled_chromium/Ubuntu_Focal/Release.key
        $ sudo apt update
        $ sudo apt install ungoogled-chromium
        # 2020-06-08
        # Inst ungoogled-chromium (81.0.4044.138-1.focal1 home:ungoogled_chromium:download.opensuse.org [amd64])
        ```

    - to remove it

        ```bash
        # remove links with apt
        $ sudo rm /etc/apt/trusted.gpg.d/home\:ungoogled_chromium.asc
        $ sudo rm /etc/apt/sources.list.d/home\:ungoogled_chromium.list
        $ sudo rm /etc/apt/sources.list.d/home\:ungoogled_chromium.list.save

        $ sudo apt remove ungoogled-chromium
        $ sudo apt purge ungoogled-chromium
        $ sudo apt autoremove
        ```

- [vnote](https://github.com/tamlok/vnote) - A note-taking application that knows programmers and Markdown better.

    ```bash
    $ cd $HOME/bin
    $ wget -O vnote https://github.com/tamlok/vnote/releases/download/v2.9.1/VNote-2.9.1-x86_64.AppImage
    $ chmod +x vnote
    ```

- [CopyQ](https://github.com/hluk/CopyQ) - Clipboard manager with advanced features

    ```bash
    $ sudo add-apt-repository ppa:hluk/copyq
    $ sudo apt update
    $ sudo apt install copyq
    ```

    - Directories used:

        ```
        $HOME/.config/copyq
        $HOME/.local/share/copyq
        $HOME/.var/app/com.github.hluk.copyq
        ```

- [Thinkorswim](https://www.tdameritrade.com/tools-and-platforms/thinkorswim.page)
    - [Learning Center](https://tlc.thinkorswim.com/center)
    - https://docs.azul.com/zulu/zuludocs/ZuluUserGuide/PrepareZuluPlatform/AttachAPTRepositoryUbuntuOrDebianSys.htm
    - https://docs.azul.com/zulu/zuludocs/ZuluUserGuide/InstallingZulu/InstallOnLinuxUsingAPTRepository.htm
    - https://docs.azul.com/zulu/zuludocs/ZuluUserGuide/InstallingZulu/InstallOLinuxUsingZuluDockerRegistry.htm
    - Install Zulu OpenJDK 8
        - Import Azul's public key.
            ```bash
            $ sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 0xB1998361219BD9C9
            ```
        - Add the Azul package to the Ubuntu APT repository.
            ```bash
            $ sudo apt-add-repository 'deb http://repos.azulsystems.com/ubuntu stable main'
            ```
        - Update the information about available packages.
            ```bash
            $ sudo apt update
            ```
        - Install `zulu`
            ```bash
            # 2020-06-09
            # Conf zulu-8 (8.46.0.19 Azul Systems, Inc., Ubuntu Repository:1.0/azulsystems [amd64])
            $ sudo apt install zulu-8
            $ sudo find /usr -name '*zulu*'
            /usr/lib/jvm/.zulu-8-amd64.jinfo
            /usr/lib/jvm/zulu-8-amd64
            /usr/share/app-install/desktop/zulucrypt-gui:zulucrypt-gui.desktop
            /usr/share/app-install/desktop/zulumount-gui:zulumount-gui.desktop
            ```
        - Verify `java` version
            ```bash
            $ java -version
            openjdk version "1.8.0_252"
            OpenJDK Runtime Environment (Zulu 8.46.0.19-CA-linux64) (build 1.8.0_252-b14)
            OpenJDK 64-Bit Server VM (Zulu 8.46.0.19-CA-linux64) (build 25.252-b14, mixed mode)
            $ sudo update-alternatives --config java
            There is only one alternative in link group java (providing /usr/bin/java): /usr/lib/jvm/zulu-8-amd64/jre/bin/java
            Nothing to configure.
            $ sudo update-alternatives --config javac
            There is only one alternative in link group javac (providing /usr/bin/javac): /usr/lib/jvm/zulu-8-amd64/bin/javac
            Nothing to configure.
            ```
    - Install Thinkorswim.sh
        - Dowload it
            ```bash
            $ wget https://mediaserver.thinkorswim.com/installer/InstFiles/thinkorswim_installer.sh
            ```
        - Allow to execute
            ```bash
            $ chmod a+x thinkorswim_installer.sh
            ```
        - Verify it
            ```bash
            $ sha256sum thinkorswim_installer.sh
            f5ce65c9f764c8fcc2698f050eadb2be30d0484260657f63a6f739ab06cbef1c  thinkorswim_installer.sh
            $ sha512sum thinkorswim_installer.sh
            4c5ae6a3d306ee021ec4ccd51e6e268fcb01a65f9dd24f1703a4384d7bfb360d069baab03a0c2fadcffc20e0d9021905aa9b9559781dc601703943597b9fdc7f  thinkorswim_installer.sh
            ```
        - Run it
            ```bash
            $ ./thinkorswim_installer.sh
            ```
        - Follow all steps, only change folder to `$HOME/.local/opt/thinkorswim`
        - Add binary to PATH
            ```
            $ ln -s $HOME/.local/opt/thinkorswim/thinkorswim $HOME/bin/thinkorswim
            ```
        - `.desktop` file example
            ```
            #!/usr/bin/env xdg-open
            [Desktop Entry]
            Type=Application
            Name=thinkorswim
            Exec=thinkorswim
            Icon={{ $HOME }}.local/opt/thinkorswim/.install4j/thinkorswim.png
            ```
        - Create `.desktop` file in `$HOME/.local/share/applications/` and update applications
            ```bash
            $ nano $HOME/.local/share/applications/thinkorswim.desktop
            $ update-desktop-database $HOME/.local/share/applications/
            ```
    - Directories used:

        ```bash
        $HOME/.thinkorswim/
        ```

- [figma-linux](https://github.com/figma-linux/figma-linux)

    ```bash
    $ cd $HOME
    $ wget \
        -O figma-linux \
        https://github.com/Figma-Linux/figma-linux/releases/download/v0.6.2/figma-linux-0.6.2.AppImage
    $ chmod a+x figma-linux
    $ mv figma-linux $HOME/bin

    #TODO desktop file
    ```

    - Directories used:

        ```bash
        $HOME/.config/figma-linux
        ```

- [googler](https://github.com/jarun/googler)

    ```bash
    $ wget -O $HOME/bin/googler https://raw.githubusercontent.com/jarun/googler/v4.1/googler
    $ chmod a+x $HOME/bin/googler
    ```

- [RealVNC](https://realvnc.com)
    - Server, .deb install in Linux
    - Clien, apk in android
    https://www.cyberciti.biz/faq/linux-command-to-suspend-hibernate-laptop-netbook-pc/
    https://www.zealfortechnology.com/2018/08/install-and-configure-realvnc-in-linux.html


- [scrcpy](https://github.com/Genymobile/scrcpy) - Display and control your Android device
    - Requirements
        - On your android mobile, change USB preferences from: no data transfer -> file transfer
        - On your android mobile, change developer options: active USB debugging
            - [Google Pixel 3a: How to Enable Developer Options @ YouTube](https://www.youtube.com/watch?v=qzl8KLIxj2Y)
        - Install `adb` (Optional: scrcpy from snap comes with scrcpy.adb)
            - [Platform Tools](https://developer.android.com/studio/releases/platform-tools)
            - [ADB](https://developer.android.com/studio/command-line/adb.html)
            - [platform-tools-latest-linux.zip](https://dl.google.com/android/repository/platform-tools-latest-linux.zip)
            - [How to install adb windows mac](https://beebom.com/how-to-install-adb-windows-mac/)
            - [Install adb windows macos linux](https://www.xda-developers.com/install-adb-windows-macos-linux/)
            - Version @ 2020-06-25
                ```
                $ ./adb version
                Android Debug Bridge version 1.0.41
                Version 30.0.3-6597393
                Installed as {{ $HOME }}/platform-tools/adb
                ```

    - Install it via `snap` ([github repo](https://github.com/sisco311/scrcpy-snap))
        ```
        $ sudo snap install scrcpy
        ```
    - Verify port is not being used
        ```
        $ sudo ss -tulpn | grep :5555
        ```
    - How to use ([useful link](https://www.genymotion.com/blog/open-source-project-scrcpy-now-works-wirelessly/))
        ```
        $ scrcpy.adb start-server
        $ scrcpy.adb devices
        $ scrcpy.adb tcpip 5555
        $ scrcpy.adb connect {{ android IP }}:5555
        $ scrcpy -b2M -m800
        $ scrcpy.adb kill-server
        ```
    - Considerations
        - Don't forget to allow connection on android phone
        - client (scrcpy) and server (scrcpy.adb) should be from same version, otherwise won't work

- [bashtop](https://github.com/aristocratos/bashtop)

    ```bash
    # to download or update it
    $ wget -O $HOME/bin/bashtop https://raw.githubusercontent.com/aristocratos/bashtop/master/bashtop
    ```

    - consider [bpytop](https://github.com/aristocratos/bpytop)
    - Directories used:

        ```bash
        $HOME/.config/bashtop
        ```


- [droidcam](https://www.dev47apps.com/)
    - [Linux instructions](https://www.dev47apps.com/droidcam/linux/)

        ```bash
        # verify requirements are met
        $ apt install -s apt install -s gcc make linux-headers-$(uname -r)
        ...
        gcc is already the newest version
        make is already the newest version
        linux-headers-5.4.0-7634-generic is already the newest version
        ...

        # download required files
        $ wget https://files.dev47apps.net/linux/droidcam_latest.zip

        # verify zip file
        $ echo "73db3a4c0f52a285b6ac1f8c43d5b4c7 droidcam_latest.zip" | md5sum -c --
        droidcam_latest.zip: OK

        # unzip it
        $ unzip droidcam_latest.zip -d droidcam

        # enter folder
        $ cd ./droidcam/

        # run installer
        $ sudo ./install

        # verify if modules were added to linux kernel
        $ lsmod | grep v4l2loopback_dc
        v4l2loopback_dc        24576  0
        videodev              225280  4 videobuf2_v4l2,v4l2loopback_dc,uvcvideo,videobuf2_common

        # install loopback device for get sound from phone
        $ sudo ./install-sound
        Loading Loopback device
        Done
        Use 'pacmd load-module module-alsa-source device=hw:Loopback,1,0' to load the card into PulseAudio while droidcam is running

        # load new device to module-alsa-source module
        $ pacmd load-module module-alsa-source device=hw:Loopback,1,0
        # $ pacmd load-module module-alsa-source device=hw:Loopback,1,1

        # if previous command doens't work, edit directly this file
        $ sudo nano /etc/pulse/default.pa

        # kill pulseaudio and restart it as daemon to get new conf
        $ pulseaudio -k ; pulseaudio -D

        # find pulseaudio process
        $ ps aux | grep pulseaudio

        # get modules loaded on pulseaudio
        $ pacmd list-modules
        # find index of module-alsa-source, probably last one

        # get description about a specific module, in this case module-alsa-source
        $ pacmd describe-module module-alsa-source

        # unload specific module from pulseaudio
        $ pacmd unload-module {{ $NUM }}

        # get devices from ALSA sound card driver
        $ arecord -l

        # soundcard mixer of ALSA sound card driver, using ncurses interface
        $ alsamixer

        # volume control of Pulse Audio sound server
        $ pavucontrol

        # specific file paths for this tool
        /etc/modules
        /etc/modprobe.d/droidcam.conf
        /etc/modules-load.d/cups-filters.conf
        /etc/modules-load.d/droidcam.conf
        /etc/modules-load.d/modules.conf
        /opt/droidcam-uninstall
        ```

    - Download icon and save in right path
        ```
        $ wget -O $HOME/.local/share/icons/droidcam https://files.dev47apps.net/img/app_icon.png
        ```

    - Create desktop entry in `$HOME/.local/share/applications/droidcam.desktop`

        ```
        [Desktop Entry]
        Type=Application
        Name=Droidcam
        Comment=Use your Android phone as a wireless webcam!
        Icon={{ $HOME }}/.local/share/icons/droidcam
        Exec=/usr/bin/droidcam
        Terminal=false
        Categories=GNOME;GTK;Video;
        ```

- [GIMP]
    - [Glimpse](https://github.com/glimpse-editor/glimpse/) - GIMP alternative

    - Directories used:

        ```bash
        $HOME/.var/app/org.gimp.GIMP/
        ```

- [LibreOffice]
    - [how do I change from inches to cm in page setup etc [closed]](https://ask.libreoffice.org/en/question/178466/how-do-i-change-from-inches-to-cm-in-page-setup-etc/)
    - [How to hide default print range/page break lines after clearing a print range?](https://ask.libreoffice.org/en/question/71003/how-to-hide-default-print-rangepage-break-lines-after-clearing-a-print-range/)


