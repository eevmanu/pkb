<!-- omit in toc -->
# Personal Setup

<!-- omit in toc -->
## Table of contents

- [Backup & Restore](#backup--restore)
- [Things to do after install PopOS](#things-to-do-after-install-popos)
- [Issue to be aware](#issue-to-be-aware)
    - [Bluetooth](#bluetooth)
    - [Wireless](#wireless)
    - [Screen / Monitor](#screen--monitor)
    - [Keyboard - Keychron k4 v1](#keyboard---keychron-k4-v1)
- [Revert partial upgrade PopOS verison](#revert-partial-upgrade-popos-verison)
- [Linux software distributions](#linux-software-distributions)
    - [Snapcraft](#snapcraft)
    - [flatpak](#flatpak)
    - [AppImage](#appimage)
- [Apps](#apps)
    - [Synaptic - package manager](#synaptic---package-manager)
    - [Flatseal - flatpak permissions manager](#flatseal---flatpak-permissions-manager)
    - [Flux - eye care](#flux---eye-care)
    - [Chrome - browser](#chrome---browser)
    - [VLC media player - play multimedia files](#vlc-media-player---play-multimedia-files)
    - [Visual Studio Code - code editor](#visual-studio-code---code-editor)
    - [Foxit PDF Reader - pdf viewer](#foxit-pdf-reader---pdf-viewer)
    - [Spotify - music streaming](#spotify---music-streaming)
    - [Slack - IM app](#slack---im-app)
    - [Zoom - video call app](#zoom---video-call-app)
    - [Telegram - IM app](#telegram---im-app)
    - [Ksnip - screenshot tool](#ksnip---screenshot-tool)
    - [SimpleScreenRecorder - record screen](#simplescreenrecorder---record-screen)
    - [Peek - record screen](#peek---record-screen)
    - [CopyQ - clipboard manager](#copyq---clipboard-manager)
    - [Albert - keyboard launcher](#albert---keyboard-launcher)
    - [Activity Watch - time tracker](#activity-watch---time-tracker)
    - [TeamViewer - remote control](#teamviewer---remote-control)
    - [OBS Studio - streaming](#obs-studio---streaming)
    - [Autokey - desktop automation utility](#autokey---desktop-automation-utility)
    - [DBeaver - database tool](#dbeaver---database-tool)
    - [BleachBit - clean disk space](#bleachbit---clean-disk-space)
    - [Stacer - monitor system resources](#stacer---monitor-system-resources)
    - [Wireshark - monitor network traffic](#wireshark---monitor-network-traffic)
    - [Dropbox - online storage](#dropbox---online-storage)
    - [scrcpy - control android device from your computer](#scrcpy---control-android-device-from-your-computer)
    - [droidcam - turn mobile device into webcam](#droidcam---turn-mobile-device-into-webcam)
    - [Thinkorswim - Trading Platforms](#thinkorswim---trading-platforms)
    - [Virtualbox - virtualization](#virtualbox---virtualization)
    - [Markdown editor apps](#markdown-editor-apps)
        - [Joplin](#joplin)
        - [Marktext](#marktext)
        - [vnote](#vnote)
        - [PKB alternatives](#pkb-alternatives)
    - [Math](#math)
    - [Finance](#finance)
    - [Extra](#extra)
- [Commands](#commands)
    - [git - version control manager](#git---version-control-manager)
    - [docker - containers](#docker---containers)
    - [xclip - clipboard manager](#xclip---clipboard-manager)
    - [htop - monitor computer resources](#htop---monitor-computer-resources)
    - [speedtest - internet bandwidth meter](#speedtest---internet-bandwidth-meter)
    - [vnstat - network traffic monitor](#vnstat---network-traffic-monitor)
    - [httpie - simple http requests on terminal](#httpie---simple-http-requests-on-terminal)
    - [tmux - multiple sessions](#tmux---multiple-sessions)
    - [tree - file / folder structure](#tree---file--folder-structure)
    - [unrar - decompress files](#unrar---decompress-files)
    - [ffmpeg - handle multimedia files](#ffmpeg---handle-multimedia-files)
    - [jq - handle json files](#jq---handle-json-files)
    - [wrk - http benchmark](#wrk---http-benchmark)
    - [youtube-dl - youtube downloader](#youtube-dl---youtube-downloader)
    - [ngrok - expose local web server to internet](#ngrok---expose-local-web-server-to-internet)
    - [httpstat - stats about http requests](#httpstat---stats-about-http-requests)
    - [neofetch - info about your computer](#neofetch---info-about-your-computer)
    - [hwinfo - info about hardware devices](#hwinfo---info-about-hardware-devices)
    - [geekbench - cross-platform benchmark](#geekbench---cross-platform-benchmark)
    - [ufw - firewall tool](#ufw---firewall-tool)
    - [googler - googling via terminal](#googler---googling-via-terminal)
    - [screenkey - display key pressed](#screenkey---display-key-pressed)
    - [exiftool - manage meta info from files](#exiftool---manage-meta-info-from-files)
    - [iproute2 - manage networking stuffs](#iproute2---manage-networking-stuffs)
    - [powertop - monitor electrical power consumption](#powertop---monitor-electrical-power-consumption)
    - [espanso - text expander](#espanso---text-expander)
    - [Keepassxc - password manager](#keepassxc---password-manager)
    - [AWS CLI](#aws-cli)
    - [Carbon - beautify source code as img](#carbon---beautify-source-code-as-img)
    - [Project Jupyter - interactive notebook](#project-jupyter---interactive-notebook)
    - [Java](#java)
    - [Z](#z)
    - [direnv](#direnv)
    - [Node.js Javascript runtime](#node.js-javascript-runtime)
- [Troubleshooting](#troubleshooting)
    - [Spotify](#spotify)
    - [VS Code](#vs-code)
- [Final links](#final-links)

## Backup & Restore

☝ [Table of contents](#table-of-contents)

Show folder sizes you want to backup

<!-- adding code section is like adding an identation level -->
```bash
$ du -sh \
    $HOME/Documents/ \
    $HOME/Downloads/ \
    $HOME/Music/ \
    $HOME/Pictures/ \
    $HOME/Projects/ \
    $HOME/Videos/
```

Check for big unneeded files

```bash
$ du -ah $HOME | \
    grep -v "/$" | \
    sort -rh > 1.txt

# check top 200 and delete any file which is using huge space disk
$ du -ah $HOME | \
    grep -v "/$" | \
    sort -rh | \
    head -n 200 > 1.txt

# check any huge unneed file from folders I backup
$ du -ah \
    $HOME/Documents/ \
    $HOME/Downloads/ \
    $HOME/Music/ \
    $HOME/Pictures/ \
    $HOME/Projects/ \
    $HOME/Videos/ | \
        grep -v "/$" | \
        sort -rh > 2.txt
```

Verify changes in backup folders by number of files inside

```bash
$ tree $HOME/Documents/ | \
    wc -l && tree /media/$USER/manu/Documents/ | \
    wc -l && echo "$(date +"%Y-%m-%d")"

# for
# $HOME/Downloads/
# $HOME/Music/
# $HOME/Pictures/
# $HOME/Projects/
# $HOME/Videos/
```

Backup folders to an external drive

```bash
$ sudo rsync -aPv --delete "$HOME/Documents/" "/media/$USER/manu/Documents/"
$ sudo rsync -aPv --delete "$HOME/Downloads/" "/media/$USER/manu/Downloads/"
$ sudo rsync -aPv --delete "$HOME/Music/"     "/media/$USER/manu/Music/"
$ sudo rsync -aPv --delete "$HOME/Pictures/"  "/media/$USER/manu/Pictures/"
$ sudo rsync -aPv --delete "$HOME/Projects/"  "/media/$USER/manu/Projects/"
$ sudo rsync -aPv --delete "$HOME/Videos/"    "/media/$USER/manu/Videos/"
<!-- TODO backup $HOME/.config/espanso -->
```

Restore folders from external drive

```bash
$ sudo rsync -aPv "/media/$USER/manu/Documents/" "$HOME/Documents/"
$ sudo rsync -aPv "/media/$USER/manu/Downloads/" "$HOME/Downloads/"
$ sudo rsync -aPv "/media/$USER/manu/Music/"     "$HOME/Music/"
$ sudo rsync -aPv "/media/$USER/manu/Pictures/"  "$HOME/Pictures/"
$ sudo rsync -aPv "/media/$USER/manu/Projects/"  "$HOME/Projects/"
$ sudo rsync -aPv "/media/$USER/manu/Videos/"    "$HOME/Videos/"
```

Related tools
<!-- TODO maybe turn this into a table -->
<!-- details open -->
- <details >
    <summary>
    <a href="https://github.com/syncthing/syncthing">
    syncthing/syncthing
    </a>
    <!--
    <code>
    if want code inside summary block
    </code>
     -->
    </summary>

    Open Source Continuous File Synchronization

    YouTube:
    - [Syncing your Files Across ALL your Computers via Syncthing](https://www.youtube.com/watch?v=J1bCWv14zYg)

</details>

- <details>
    <summary>
    <a href="https://github.com/rclone/rclone">
    rclone/rclone
    </a>
    </summary>

    "rsync for cloud storage" - Google Drive, Amazon Drive, S3, Dropbox, Backblaze B2, One Drive, Swift, Hubic, Cloudfiles, Google Cloud Storage, Yandex Files

</details>

- <details>
    <summary>
    <a href="https://github.com/restic/restic">
    restic/restic
    </a>
    </summary>

    Fast, secure, efficient backup program

</details>

- <details>
    <summary>
    <a href="https://github.com/gilbertchen/duplicacy">
    gilbertchen/duplicacy
    </a>
    </summary>

    A new generation cloud backup tool

</details>

- <details>
    <summary>
    <a href="https://github.com/teejee2008/timeshift">
    teejee2008/timeshift
    </a>
    </summary>

    System restore tool for Linux.

</details>

- <details>
    <summary>
    <a href="https://github.com/duplicati/duplicati">
    duplicati/duplicati
    </a>
    </summary>

    Store securely encrypted backups in the cloud!

</details>

- Backblaze - [B2 Cloud Storage](https://www.backblaze.com/b2/cloud-storage.html)

Related links
- [most starred repo with `backup`](https://github.com/search?q=backup&s=stars&type=Repositories)
- [most starred repo with `sync`](https://github.com/search?q=sync&s=stars&type=Repositories)
- [Online Storage vs. Online Backup](https://www.backblaze.com/online-storage-vs-online-backup.html) -

## Things to do after install PopOS

☝ [Table of contents](#table-of-contents)

Be aware of [Pop!_OS Keyboard Shortcuts](https://support.system76.com/articles/pop-keyboard-shortcuts/)

Add keyboard layouts

- `Settings` -> `Keyboard` -> `Input Sources` -> Add `Spanish (Latin American)`

Set system Format

- `Settings` -> `Region & Language` -> `Formats` -> Set `United States (English)`

Update system Fonts

- Default on **PopOS**

    | Property          | Value             |
    | ----------------- | ----------------- |
    | Standard font     | Source Code Pro   |
    | Serif font        | Serif             |
    | Sans-serif font   | Sans              |
    | Fixed-width font  | Monospace         |

- Extra fonts
    - [tonsky/FiraCode](https://github.com/tonsky/FiraCode)
    - [source-foundry/Hack](https://github.com/source-foundry/Hack)
    - [adobe-fonts/source-code-pro](https://github.com/adobe-fonts/source-code-pro)
    - [microsoft/cascadia-code](https://github.com/microsoft/cascadia-code)
    - [be5invis/Iosevka](https://github.com/be5invis/Iosevka)
    - [pop-os/fonts](https://github.com/pop-os/fonts)
    - [rsms/inter](https://github.com/rsms/inter)
    - [kiliman/operator-mono-lig](https://github.com/kiliman/operator-mono-lig)
    - [GitHub: font (sort: Most stars)](https://github.com/search?q=font&s=stars&type=Repositories)
    - [GitHub: ligature (sort: Most stars)](https://github.com/search?q=ligature&s=stars&type=Repositories)
    - [Circular](https://lineto.com/typefaces/circular/) - 190 CHF

- Related links
    - [Go fonts](https://blog.golang.org/go-fonts)
    - [Best 20 Fonts for Ubuntu](https://linuxhint.com/best_fonts_ubuntu_linux/)
    - [List of monospaced typefaces](https://en.wikipedia.org/wiki/List_of_monospaced_typefaces)

`Python` scripts

- Clean up your Python bytecode - [man](https://manpages.ubuntu.com/manpages/trusty/man1/py3clean.1.html) - [GitHub](https://github.com/bittner/pyclean)

    ```bash
    $ py3clean
    ```

- Byte compile Python 3 source files - [man](https://manpages.ubuntu.com/manpages/bionic/man1/py3compile.1.html)

    ```bash
    $ py3compile
    ```

- Print python3 version information - [man](https://manpages.ubuntu.com/manpages/bionic/man1/py3versions.1.html)

    ```bash
    $ py3versions
    ```

- The Python documentation tool - [man](https://manpages.ubuntu.com/manpages/disco/man1/pydoc3.8.1.html)

    ```bash
    $ pydoc3.8
    ```

**GNOME** `Update Manager`

- Search if package is already installed

    ```bash
    $ apt search update-manager
    ...
    update-manager/focal-updates,focal-updates,now 1:20.04.10 all [installed]
    GNOME application that manages apt updates
    ...
    ```

- Simulate install to verify package version able to install

    ```bash
    # download latest package information from all configured sources
    $ sudo apt install update

    $ sudo apt install -s update-manager
    ```

- Install it

    ```bash
    $ sudo apt install update-manager
    ```

**GNOME** `Tweaks Tool`

- Install it

    ```bash
    $ sudo apt install gnome-tweak-tool
    ...
    Setting up gir1.2-handy-0.0:amd64 (0.0.13-1) ...
    Setting up gnome-tweaks (3.34.0-2ubuntu1) ...
    Setting up gnome-tweak-tool (3.34.0-2ubuntu1) ...
    ...
    ```

- Things to do after install it:

    `General` -> `Animations` -> `Turn off`

    `Interface text` -> Fira Sans book 10 (default)
    - [How do I change fonts and adjust their size?](https://askubuntu.com/questions/19770/how-do-i-change-fonts-and-adjust-their-size)

    Setup keyboard shortcut (`Alt+Space`) to change keyboard layout
    - Open `Tweaks`
    - Go to `Keyboard & Mouse` tab
    - Click on `Additional Layout Options`
    - Unfold `Switching to another layout`
    - Check `Alt+Space` option - [img](https://i.imgur.com/aSZxajn.png)

**GNOME** `Shell integration` - install [chrome extension](https://chrome.google.com/webstore/detail/gnome-shell-integration/gphhapmejobijbbhgpjhcjognlahblep)

**GNOME** `Extensions` to install

- [Ubuntu AppIndicators](https://extensions.gnome.org/extension/1301/ubuntu-appindicators/)

- [Dash to Dock](https://extensions.gnome.org/extension/307/dash-to-dock/)

    Avoid overwrite **Super+Q** used to close program
    - Open `Tweaks`
    - Go to `Extensions` tab
    - Click on `Dash to dock` config
    - Go to `Behaviour` tab
    - Turn off `Use keyboards shortcuts to activate apps` option

- [AlternateTab](https://extensions.gnome.org/extension/15/alternatetab/)

- [Sound Input & Output Device Chooser](https://extensions.gnome.org/extension/906/sound-output-device-chooser/)

- [system-monitor](https://extensions.gnome.org/extension/120/system-monitor/)

    Install [prerequisites / dependencies](https://github.com/paradoxxxzero/gnome-shell-system-monitor-applet#prerequisites)

    ```bash
    $ sudo apt install \
        gir1.2-gtop-2.0 \
        gir1.2-nm-1.0 \
        gir1.2-clutter-1.0
    ```

    Reboot gnome shell if needed (`Alt + F2` and input `r` in the prompt)

- [Multi Monitors Add-On](https://extensions.gnome.org/extension/921/multi-monitors-add-on/)

- [Dynamic Panel Transparency](https://extensions.gnome.org/extension/1011/dynamic-panel-transparency/)

- [List of extensions installed locally](https://extensions.gnome.org/local/)
    - Alt Tab: Raise First Window
    - AlternateTab
    - Always Show Workspaces
    - Dash to Dock
    - Desktop Icons
    - Dynamic Panel Transparency
    - Multi Monitors Add-On
    - Pop Battery Icon Fix
    - Pop Shell
    - Pop Shop Details
    - Sound Input & Output Device Chooser
    - system-monitor
    - System76 Power
    - Tweaks in System Menu
    - Ubuntu AppIndicators

PulseAudio

- Simulate install to verify package version able to install

    ```bash
    # download latest package information from all configured sources
    $ sudo apt install update

    $ apt install -s pulseaudio
    ...
    pulseaudio is already the newest version (1:13.99.1-1ubuntu3.8).
    ...
    ```

- Install it

    ```bash
    $ sudo apt install pulseaudio -y
    ```

- Show `daemon` config file

    ```bash
    $ cat /etc/pulse/daemon.conf
    ```

- Show default `Startup Script` config file

    ```bash
    $ cat /etc/pulse/default.pa
    ```

- Components

    - Sound Server app - [GitLab](https://gitlab.freedesktop.org/pulseaudio/pulseaudio)

    - Preferences app - [pulseaudio/paprefs](https://freedesktop.org/software/pulseaudio/paprefs/) - [GitLab](https://gitlab.freedesktop.org/pulseaudio/paprefs)

        ```bash
        $ sudo apt install paprefs
        ```

    - System Tray app - [GitHub](https://github.com/christophgysin/pasystray)

        ```bash
        $ sudo apt install pasystray
        ```

    - Volume Control app - [pulseaudio/pavucontrol](https://freedesktop.org/software/pulseaudio/pavucontrol/) - [GitLab](https://gitlab.freedesktop.org/pulseaudio/pavucontrol/)

        ```bash
        $ sudo apt install pavucontrol
        ```

- Commands

    - Get version

        ```bash
        $ pulseaudio --version
        pulseaudio 13.99.1
        ```

    - Increase verbosity level

        ```bash
        $ pulseaudio -v
        I: [pulseaudio] main.c: setrlimit(RLIMIT_NICE, (31, 31)) failed: Operation not permitted
        I: [pulseaudio] main.c: setrlimit(RLIMIT_RTPRIO, (9, 9)) failed: Operation not permitted
        I: [pulseaudio] core-util.c: Successfully gained nice level -11.
        I: [pulseaudio] main.c: This is PulseAudio 13.99.1
        I: [pulseaudio] main.c: Page size is 4096 bytes
        I: [pulseaudio] main.c: Machine ID is 71f96618bfd3c8e3e7f624765ec218e6.
        I: [pulseaudio] main.c: Using runtime directory /run/user/1000/pulse.
        I: [pulseaudio] main.c: Using state directory /home/$USER/.config/pulse.
        I: [pulseaudio] main.c: Using modules directory /usr/lib/pulse-13.99.1/modules.
        I: [pulseaudio] main.c: Running in system mode: no
        E: [pulseaudio] pid.c: Daemon already running.
        E: [pulseaudio] main.c: pa_pid_file_create() failed.
        ```

    - List of cards attached

        ```bash
        $ pacmd list-cards
        ```

    - List of available modules

        ```bash
        $ ls /usr/lib | grep pulse
        pulse-13.99.1

        $ ls /usr/lib/pulse-13.99.1/modules/
        ```

- Debugging

    - Get logs from `rsyslog`

        ```bash
        $ cat /var/log/syslog* | grep -i pulse
        $ cat /var/log/syslog* | grep -i audio
        ```

    - Get logs from `journalctl`

        ```bash
        $ journalctl --pager-end
        $ journalctl --follow
        ```

        Related links
        - 2018-02-20 - [How To Use Journalctl to View and Manipulate Systemd Logs](https://www.digitalocean.com/community/tutorials/how-to-use-journalctl-to-view-and-manipulate-systemd-logs)

- Related links
    - [Things to do after installing Pop!_OS 20.04 (Apps, Settings, and Tweaks)](https://mutschler.eu/linux/install-guides/pop-os-post-install/) - [archive](https://web.archive.org/web/20201217152053/https://mutschler.eu/linux/install-guides/pop-os-post-install/)

LibreOffice

- [how do I change from inches to cm in page setup etc [closed]](https://ask.libreoffice.org/en/question/178466/how-do-i-change-from-inches-to-cm-in-page-setup-etc/)

    Preferences > LibreOffice Writer > General > Settings > Measurement Unit

- [How to enable the “Tabbed Ribbon” interface style in LibreOffice 6](https://www.reallinuxuser.com/how-to-enable-the-tabbed-ribbon-interface-style-in-libreoffice-6/)

    `View` > `User Interface` > `Tabbed`

    `...` / `View` > `Menubar`

- [How to Enable ‘Dark Mode’ in LibreOffice](https://www.debugpoint.com/2020/01/how-to-enable-dark-mode-libreoffice/)

    `Tools` > `Options` > `Personalization` > Dark **Preinstalled Theme**

    `Tools` > `Options` > `Application Colors` > `Document Background` > Dark Grey 1 / 2 and **Automatic** on other options

- [How to hide default print range/page break lines after clearing a print range?](https://ask.libreoffice.org/en/question/71003/how-to-hide-default-print-rangepage-break-lines-after-clearing-a-print-range/)

    `Format` > `Print ranges` > `Edit...` ([img](https://i.imgur.com/fbmfJdP.png))

Camera

- Turn `ON/OFF` via terminal

    ```bash
    # ON (default)
    $ sudo modprobe uvcvideo

    # OFF
    $ sudo modprobe -r uvcvideo
    ```

Preview thumbnails at file / folder manager

- Via `Nautilus`

    [Best way to check if Nautilus File Manager is running?](https://unix.stackexchange.com/questions/546241/best-way-to-check-if-nautilus-file-manager-is-running)

    ```bash
    # check if you have Nautilus
    $ gdbus \
        introspect \
            --session \
            --dest org.gnome.Nautilus \
            --object-path /org/gnome/Nautilus \
            --recurse \
        | \
        awk '/^ *node /{print $2}'
    ```

    Install `gnome-sushi`

    ```bash
    # (2020-05-29 22:29:30)
    # simulate to check package version
    $ sudo apt install -s gnome-sushi
    ...
    Inst gnome-sushi (3.34.0-2 Ubuntu:20.04/focal [amd64])
    ...

    $ sudo apt install gnome-sushi
    ```

- Via `gThumb`

- Related links
    - [What's the best way to preview many images?](https://www.reddit.com/r/pop_os/comments/gmefd2/whats_the_best_way_to_preview_many_images/)

`GNOME` File indexer

```bash
$ systemctl --user mask \
    tracker-store.service \
    tracker-miner-fs.service \
    tracker-miner-rss.service \
    tracker-extract.service \
    tracker-miner-apps.service \
    tracker-writeback.service

$ tracker reset --hard

$ systemctl --user unmask \
    tracker-store.service \
    tracker-miner-fs.service \
    tracker-miner-rss.service \
    tracker-extract.service \
    tracker-miner-apps.service \
    tracker-writeback.service

$ tracker status
```

Restart Gnome: `Alt` + `F2`, enter `r` and press `enter`

- Related links
    - 2020-04-27 - [How To Completely Disable Tracker, GNOME's File Indexing And Search Tool](https://www.linuxuprising.com/2019/07/how-to-completely-disable-tracker.html) - [archive](https://web.archive.org/web/20201226151700/https://www.linuxuprising.com/2019/07/how-to-completely-disable-tracker.html)
    - [vancluever/gnome-tracker-disable.md](https://gist.github.com/vancluever/d34b41eb77e6d077887c) -  GNOME Tracker Disable

## Issue to be aware

### Bluetooth

☝ [Table of contents](#table-of-contents)

Setup Amazon Echo device as speaker

- Location of config files

    ```bash
    $ ls /etc/bluetooth/
    input.conf  main.conf  network.conf
    ```

- Steps
    - Connect laptop to speaker (not viceversa)
    - After connect, if output device selected is on bluetooth speaker, move to another device and move back to check it works properly
    - When disconnected, remove both devices from sides as `known device`.
    - Reconnect again from laptop to speaker (not viceversa)

- Guides
    - [Pair Your Phone or Bluetooth Speaker to Your Echo Device](https://www.amazon.com/gp/help/customer/display.html?nodeId=GG8S76D3BYTGC424)
    - [Can't send audio to Amazon Echo via Bluetooth](https://bugs.launchpad.net/ubuntu/+source/bluez/+bug/1691556)
    - [Ubuntu – Amazon Echo “Alexa” now only shows up as an input device](https://itectec.com/ubuntu/ubuntu-amazon-echo-alexa-now-only-shows-up-as-an-input-device/)
    - [Amazon Echo Plus as bluetooth speaker on Ubuntu 20.04](https://manuelfedele.github.io/guides/2020/05/02/amazon-echo-plus-as-ubuntu-20.04-bluetooth-speaker.html)

- Troubleshooting
    - [Troubleshoot Bluetooth Issues](https://support.system76.com/articles/bluetooth/)
    - [BluetoothUser a2dp](https://wiki.debian.org/BluetoothUser/a2dp)
    - ArchLinux - [PulseAudio/Troubleshooting](https://wiki.archlinux.org/index.php/PulseAudio/Troubleshooting)
    - blueman-project/blueman - Wiki - [Troubleshooting](https://github.com/blueman-project/blueman/wiki/Troubleshooting)
    - [pylover/a2dp.py](https://gist.github.com/pylover/d68be364adac5f946887b85e6ed6e7ae) - Fixing bluetooth stereo headphone/headset problem in ubuntu 16.04, 16.10 and also debian jessie, with bluez5.

- Questions:
    - [Ubuntu 20.04 bluetooth not working](https://askubuntu.com/questions/1231074/ubuntu-20-04-bluetooth-not-working)
    - [PulseAudio fails to set card profile to 'a2dp_sink'. How can I see the logs and figure out whats wrong?](https://askubuntu.com/questions/765233/pulseaudio-fails-to-set-card-profile-to-a2dp-sink-how-can-i-see-the-logs-and)
    - [Ubuntu Connects with Amazon Echo as Bluetooth Speaker not Treating that as Speaker](https://askubuntu.com/questions/1205930/ubuntu-connects-with-amazon-echo-as-bluetooth-speaker-not-treating-that-as-speak)
    - [Bluetooth speaker connected but not listed in sound output](https://askubuntu.com/questions/824404/bluetooth-speaker-connected-but-not-listed-in-sound-output)
    - [Bluetooth speaker no sound in Ubuntu 16.04](https://askubuntu.com/questions/763539/bluetooth-speaker-no-sound-in-ubuntu-16-04)
    - [A2DP sink without pulseaudio](https://stackoverflow.com/questions/12338621/a2dp-sink-without-pulseaudio)

#### Blueman

[Github](https://github.com/blueman-project/blueman)

<!-- TODO move to apps when apps is clean -->

Blueman is a GTK+ Bluetooth Manager

Simulate install to verify package version able to install or installed

```bash
# download latest package information from all configured sources
$ sudo apt install update

$ apt install -s blueman
...
Inst blueman (2.2-git1601238013r3bcd6003-python3.8-1 cschramm.eu [amd64])
...
```

Install dependencies

```bash
$ sudo apt install \
    apt-transport-https \
    curl
```

Add [APT repository](https://blueman.cschramm.eu/debian/) with git snapshots

```bash
$ curl https://blueman.cschramm.eu/debian/blueman.gpg.key | \
    sudo apt-key add -
```

Set right `python` version to use in APT repository

```bash
# create file
$ sudo touch /etc/apt/sources.list.d/blueman.list

# edit it
$ sudo nano /etc/apt/sources.list.d/blueman.list

# add lines below
deb https://cschramm.eu/blueman/debian/ python3.8 main
deb-src https://cschramm.eu/blueman/debian/ python3.8 main
```

Start `blueman` applet with `debug` logs

```bash
$ blueman-applet --loglevel debug
```

Error: `AttributeError: 'NetConf' object has no attribute 'ip4_address'` - [img](https://i.imgur.com/pD8Ukd1.png)

```
g-dbus-error-quark: GDBus.Error:org.freedesktop.DBus.Error.Failed: Traceback (most recent call last):
File "/usr/lib/python3/dist-packages/blueman/main/DbusService.py", line 126, in _handle_method_call
    ok(method(*args))
File "/usr/lib/python3/dist-packages/blueman/plugins/mechanism/Network.py", line 56, in _reload_network
    if nc.ip4_address is None or nc.ip4_mask is None:
AttributeError: 'NetConf' object has no attribute 'ip4_address'
(0)
```

Uninstall / remove

- Command

    ```
    $ sudo apt remove blueman && sudo apt purge blueman
    ```

- Remove apt list from `/etc/apt/sources.list.d/`

Related links

- Github Wiki - [Troubleshooting](https://github.com/blueman-project/blueman/wiki/Troubleshooting)

### Wireless

☝ [Table of contents](#table-of-contents)

[System76 - Support - Solve Wireless Issues](https://support.system76.com/articles/wireless/)

### Screen / Monitor

☝ [Table of contents](#table-of-contents)

Screen or Monitor doesn't wake up after suspend laptop

- Install `laptop-mode-tools` utility - [GitHub](https://github.com/rickysarraf/laptop-mode-tools)

    ```bash
    $ sudo apt-get install laptop-mode-tools
    ```

- Mark `Enable module video-out` checkbox

- Related links
    - Google - [displayport monitor suspend ubuntu not turn on](https://www.google.com/search?q=displayport+monitor+suspend+ubuntu+not+turn+on)
    - [DisplayPort Monitors No Longer Detected](https://askubuntu.com/questions/1204491/displayport-monitors-no-longer-detected)
    - [External monitor not detected by Ubuntu 19.04 after sleep](https://askubuntu.com/questions/1167424/external-monitor-not-detected-by-ubuntu-19-04-after-sleep)
    - [Ubuntu – Ubuntu 20.04 doesn’t wake up monitor](https://itectec.com/ubuntu/ubuntu-ubuntu-20-04-doesnt-wake-up-monitor/) - [archive](https://web.archive.org/web/20201222170345/https://itectec.com/ubuntu/ubuntu-ubuntu-20-04-doesnt-wake-up-monitor/)

Deactive HiDPI Daemon if CPU spike without no reason

- Related links
    - Google - [hidpi daemon cpu spike](https://www.google.com/search?q=hidpi+daemon+cpu+spike)
    - [Ubuntu 18.04 gnome-shell high CPU usage](https://askubuntu.com/questions/1036441/ubuntu-18-04-gnome-shell-high-cpu-usage)
    - [HiDPI performance issues?](https://www.reddit.com/r/gnome/comments/7j5lkh/hidpi_performance_issues/)
    - [All About the HiDPI Daemon](https://blog.system76.com/post/174414833678/all-about-the-hidpi-daemon)

### Keyboard - Keychron k4 v1

☝ [Table of contents](#table-of-contents)

In `v1` a set of keys in a specific order didn't make easy my shortcuts, reason why I take the decision to remap for my specific needs.

Retrieve info about keycaps

```bash
$ xmodmap -pke > .Xmodmap
```

Detect keycode I'm pressing

```bash
$ xev -event keyboard
```

Related links
- [How to remap or swap special keyboard keys in Linux?](https://ictsolved.github.io/remap-key-in-linux/)
- [Remap keys in the keyboard in Ubuntu](https://dev.to/0xbf/remap-keys-in-the-keyboard-in-ubuntu-5a36)

Map:
- `home` -> `del`
- `end` -> `home`
- `pgup` -> `end`
- `pgdn` -> `pgup`
- `del` -> `pgdown`

I use two `.desktop` files for this

Create `$HOME/.local/share/applications/keychronk4map-apply.desktop`

```ini
[Desktop Entry]
Name=Apply Keychron K4 keycap map
Description=Change map on key caps to adapt change on my keychron k4 v1
Exec=xmodmap -e "keycode 110 = Delete NoSymbol Delete NoSymbol Delete" && xmodmap -e "keycode 115 = Home NoSymbol Home NoSymbol Home" && xmodmap -e "keycode 112 = End NoSymbol End NoSymbol End" && xmodmap -e "keycode 117 = Prior NoSymbol Prior NoSymbol Prior" && xmodmap -e "keycode 119 = Next NoSymbol Next NoSymbol Next"
Terminal=false
Type=Application
```

Create `$HOME/.local/share/applications/keychronk4map-rollback.desktop`

```ini
[Desktop Entry]
Name=Rollback keychron k4 keycap map
Description=Change map to normal map instead of adapt for specific use on my keychron k4 v1 keyboard
Exec=xmodmap -e "keycode 110 = Home NoSymbol Home NoSymbol Home" && xmodmap -e "keycode 115 = End NoSymbol End NoSymbol End" && xmodmap -e "keycode 112 = Prior NoSymbol Prior NoSymbol Prior" && xmodmap -e "keycode 117 = Next NoSymbol Next NoSymbol Next" && xmodmap -e "keycode 119 = Delete NoSymbol Delete NoSymbol Delete"
Terminal=false
Type=Application
```

Create `$HOME/bin/keychronk4map-apply.sh`

```bash
xmodmap -e "keycode 110 = Delete NoSymbol Delete NoSymbol Delete" && \
xmodmap -e "keycode 115 = Home NoSymbol Home NoSymbol Home" && \
xmodmap -e "keycode 112 = End NoSymbol End NoSymbol End" && \
xmodmap -e "keycode 117 = Prior NoSymbol Prior NoSymbol Prior" && \
xmodmap -e "keycode 119 = Next NoSymbol Next NoSymbol Next"
```

Create `$HOME/bin/keychronk4map-rollback.sh`

```bash
xmodmap -e "keycode 110 = Home NoSymbol Home NoSymbol Home" && \
xmodmap -e "keycode 115 = End NoSymbol End NoSymbol End" && \
xmodmap -e "keycode 112 = Prior NoSymbol Prior NoSymbol Prior" && \
xmodmap -e "keycode 117 = Next NoSymbol Next NoSymbol Next" && \
xmodmap -e "keycode 119 = Delete NoSymbol Delete NoSymbol Delete"
```

Assign execution permissions to scripts

```bash
$ chmod u+x $HOME/bin/keychronk4map-apply.sh
$ chmod u+x $HOME/bin/keychronk4map-rollback.sh
```

Build cache database of MIME types handled by desktop files

```bash
$ update-desktop-database $HOME/.local/share/applications/
```

Remap `f1` to `f12` from multimedia keycodes to functional keycodes
- [adam-savard/keychron-k2-function-keys-linux](https://github.com/adam-savard/keychron-k2-function-keys-linux) - A small script to allow the Keychron K2 Keyboard to boot up with function keys enabled by default.

Solution to `print screen` featur, map `ksnip` to `f3`

TODO
- add  `.desktop` files
- add script to load at startup application
    - everytime when start run `keychronk4map-apply.sh`

## Revert partial upgrade PopOS verison

☝ [Table of contents](#table-of-contents)

Assuming you already click on `Download` button from `Settings` - `OS Upgrade` section

Detect on which `apt` important files put new version on

```bash
# groovy is ubuntu 20.10
$ grep -r groovy /etc/apt/
...
```

Comment those lines and replace it with actual version you're using

Run `apt update`

Activate all PPA files where commented by `Download` button action

## Linux software distributions

### [Snapcraft](https://snapcraft.io/)

☝ [Table of contents](#table-of-contents)

Install it

```bash
$ sudo apt update
$ sudo apt install snapd
```

Related links
- [Install on Ubuntu](https://snapcraft.io/docs/installing-snap-on-ubuntu)

### [flatpak](https://flatpak.org/)

☝ [Table of contents](#table-of-contents)

Directories used
- `$HOME/.cache/flatpak`
- `$HOME/.local/share/flatpak`

### [AppImage](https://appimage.org/)

☝ [Table of contents](#table-of-contents)

## Apps

### Synaptic - package manager

☝ [Table of contents](#table-of-contents)

Graphical package manager

Install via `apt`

```bash
# simulate to check package version
$ apt install -s synaptic

$ sudo apt install synaptic
```

### Flatseal - flatpak permissions manager

☝ [Table of contents](#table-of-contents)

Manage Flatpak permissions

[GitHub](https://github.com/tchx84/flatseal)

[Flathub](https://flathub.org/apps/details/com.github.tchx84.Flatseal)

Install via `flatpak`

```bash
$ flatpak install flathub com.github.tchx84.Flatseal

# run
$ flatpak run com.github.tchx84.Flatseal
```

### [Flux](https://justgetflux.com/) - eye care

☝ [Table of contents](#table-of-contents)

Better lighting for your computer

[GitHub](https://github.com/xflux-gui/fluxgui)

List of package dependencies

```text
- gir1.2-appindicator3-0.1
- gir1.2-gtk-3.0
- git
- libcanberra-gtk-module
- libxxf86vm1
- python-appindicator
- python-gconf
- python-glade2
- python-gtk2
- python-pexpect
- python-xdg
- python3-distutils
- python3-pexpect
```

Install it

```bash
$ sudo add-apt-repository ppa:nathan-renniewaldock/flux
$ sudo apt update
$ sudo apt install fluxgui
```

Alternatives
- [jonls/redshift](https://github.com/jonls/redshift)
- Gnome - [Night light](https://www.gnome.org/news/2017/03/gnome-3-24-released/attachment/night-light/)

### [Chrome](https://www.google.com/chrome/) - browser

☝ [Table of contents](#table-of-contents)

Download it

```bash
$ wget \
    -O chrome.deb \
    https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
```

Useful internal urls:
- [chrome://system/](chrome://system/) - System diagnostic data
- [chrome://extensions/shortcuts](chrome://extensions/shortcuts) - Extension shortcuts
- [chrome://flags/](chrome://flags/) - Experiments

Useful Extensions
- [ActivityWatch Web Watcher](https://chrome.google.com/webstore/detail/activitywatch-web-watcher/nglaklhklhcoonedhgnpgddginnjdadi)
- [Bitwarden - Free Password Manager](https://chrome.google.com/webstore/detail/bitwarden-free-password-m/nngceckbapebfimnlniiiahkandclblb)
    - Activate `Auto-fill the last used login for the current website`
    - Activate `Generate and copy a new random password to the clipboard`
- [Canvas Blocker (Fingerprint protect)](https://chrome.google.com/webstore/detail/canvas-blocker-fingerprin/nomnklagbgmgghhjidfhnoelnjfndfpd/)
    - [Browser leaks - HTML5 Canvas Fingerprinting](https://browserleaks.com/canvas)
- [ClearUrls](https://chrome.google.com/webstore/detail/clearurls/lckanjgmijmafbedllaakclkaicjfmnk) - [GitHub](https://gitlab.com/KevinRoebert/ClearUrls)
- [Clickbait Remover for Youtube](https://chrome.google.com/webstore/detail/clickbait-remover-for-you/omoinegiohhgbikclijaniebjpkeopip)
- [Cookie-AutoDelete](https://chrome.google.com/webstore/detail/cookie-autodelete/fhcgjolkccmbidfldomjliifgaodjagh) - [GitHub](https://github.com/Cookie-AutoDelete/Cookie-AutoDelete)
- [Cookie Editor](https://chrome.google.com/webstore/detail/cookie-editor/iphcomljdfghbkdcfndaijbokpgddeno)
- [EditThisCookie](https://chrome.google.com/webstore/detail/editthiscookie/fngmhnnpilhplaeedifhccceomclgfbg)
- [Extensity](https://chrome.google.com/webstore/detail/extensity/jjmflmamggggndanpgfnpelongoepncg)
- [GNOME Shell integration](https://chrome.google.com/webstore/detail/gnome-shell-integration/gphhapmejobijbbhgpjhcjognlahblep)
- [GoFullPage - Full Page Screen Capture](https://chrome.google.com/webstore/detail/gofullpage-full-page-scre/fdpohaocaechififmbbbbbknoalclacl)
- [History Trends Unlimited](https://chrome.google.com/webstore/detail/history-trends-unlimited/pnmchffiealhkdloeffcdnbgdnedheme)
- [HTTPS Everywhere](https://chrome.google.com/webstore/detail/https-everywhere/gcbommkclmclpchllfjekcdonpmejbdp)
- [Improve YouTube! (Open-Source for YouTube)](https://chrome.google.com/webstore/detail/improve-youtube-open-sour/bnomihfieiccainjcjblhegjgglakjdd)
- [JSON Viewer](https://chrome.google.com/webstore/detail/json-viewer/gbmdgpbipfallnflgajpaliibnhdgobh)
- [Just Read](https://chrome.google.com/webstore/detail/just-read/dgmanlpmmkibanfdgjocnabmcaclkmod/)
    - Create extension for `Open the Just Read format for the current page` - `Ctrl+Shift+1`
    - [Dark theme](https://gist.github.com/dflock/d102df29dae3229481af71b2ff91aa70)
- [LastPass: Free Password Manager](https://chrome.google.com/webstore/detail/lastpass-free-password-ma/hdokiejnpimakedhajhdlcegeplioahd)
- [LIFX Web Control](https://chrome.google.com/webstore/detail/lifx-web-control/ohedkkoibkekbipjoeehpofmjbmmkhin)
- [Link to Text Fragment](https://chrome.google.com/webstore/detail/link-to-text-fragment/pbcodcjpfjdpcineamnnmbkkmkdpajjg)
- [Markdown Viewer](https://chrome.google.com/webstore/detail/markdown-viewer/ckkdlimhmcjmikdlpkmbgfkaikojcbjk)
    - Theme -> `GITHUB DARK`
    - Compiler -> `MARKED`, activate:
        - `gfm`
        - `breaks`
        - `smartLists`
        - `smartypants`
    - Content, activate:
        - `scroll`
        - `autoreload`
        - `emoji`
        - `mermaid`
        - `mathjax`
- [Onetab](https://chrome.google.com/webstore/detail/onetab/chphlpgkkbolifaimnlloiipkdnihall)
- [PocketTube: Youtube Subscription Manager](https://chrome.google.com/webstore/detail/kdmnjgijlmjgmimahnillepgcgeemffb)
- [Proxy SwitchyOmega](https://chrome.google.com/webstore/detail/proxy-switchyomega/padekgcemlokbadohgkifijomclgjgif)
- [Pushbullet](https://chrome.google.com/webstore/detail/pushbullet/chlffgpmiacpedhhbkiomidkjlcfhogd)
- [Refined GitHub](https://chrome.google.com/webstore/detail/refined-github/hlepfoohegkhhmjieoechaddaejaokhf)
- [Refined Hacker News](https://chrome.google.com/webstore/detail/refined-hacker-news/gcibdgjaladjjloeocimnijdgopejkfk)
- [Requestly: Redirect Url, Modify Headers etc](https://chrome.google.com/webstore/detail/requestly-redirect-url-mo/mdnleldcmiljblolnjhpnblkcekpdkpa)
- [SimilarWeb - Traffic Rank & Website Analysis](https://chrome.google.com/webstore/detail/similarweb-traffic-rank-w/hoklmmgfnpapgjgcpechhaamimifchmp)
- [The Marvellous Suspender](https://chrome.google.com/webstore/detail/the-marvellous-suspender/noogafoofpebimajpfpamcfhoaifemoa)
- [uBlock Origin](https://chrome.google.com/webstore/detail/ublock-origin/cjpalhdlnbpafiamejdnhcphjbkeiagm)
- [Unlimited Email Tracker](https://chrome.google.com/webstore/detail/unlimited-email-tracker/gojogohjgpelafgaeejgelmplndppifh)
- [Video Speed Controller](https://chrome.google.com/webstore/detail/video-speed-controller/nffaoalbilbmmfgbnbgppjihopabppdk)
- [vidIQ Vision for YouTube](https://chrome.google.com/webstore/detail/vidiq-vision-for-youtube/pachckjkecffpdphbpmfolblodfkgbhl)
- Optionals
    - [AlphaText - Make text readable!](https://chrome.google.com/webstore/detail/alphatext-make-text-reada/lpcaoilgpobajbkiamaojipjddpkkida)
    - [ColorZilla](https://chrome.google.com/webstore/detail/colorzilla/bhlhnicpbhignbdhedgjhgdocnmhomnp)
    - [Distill web monitor](https://chrome.google.com/webstore/detail/distill-web-monitor/inlikjemeeknofckkjolnjbpehgadgge)
    - [Honey](https://chrome.google.com/webstore/detail/honey/bmnlcjabgnpnenekpadlanbbkooimhnj)
    - [MarkUp For Chrome](https://chrome.google.com/webstore/detail/markup-for-chrome/llbkdcpbiogplgmefnkbgcdfiopfphbc)
    - [Screen Shader | Smart Screen Tinting](https://chrome.google.com/webstore/detail/screen-shader-smart-scree/fmlboobidmkelggdainpknloccojpppi)
    - [Singlefile](https://chrome.google.com/webstore/detail/singlefile/mpiodijhokgodhhofbcjdecpffjipkle)
    - [Tampermonkey](https://chrome.google.com/webstore/detail/tampermonkey/dhdgffkkebhmkfjojejmpbldmpobfkfo)
    - [Toggle track](https://chrome.google.com/webstore/detail/toggl-track-productivity/oejgccbfbmkkpaidnkphaiaecficdnfn)
    - [URL render](https://chrome.google.com/webstore/detail/url-render/flhclpkhoiajoikkabbfbinnjapaflog)
    - [Volume Master](https://chrome.google.com/webstore/detail/volume-master/jghecgabfgfdldnmbfkhmffcabddioke)

Personal settings
- [How to restore the default Google search engine in Chrome?](https://superuser.com/questions/578228/how-to-restore-the-default-google-search-engine-in-chrome)
- [Chrome Flags in your machine](chrome://flags/)
- [Config to avoid extra query params via Requestly](https://i.imgur.com/zzPO7rB.png)
- [[Help] Subframe: Google Drive randomly spiking CPU usage](https://www.reddit.com/r/chrome/comments/foehds/help_subframe_google_drive_randomly_spiking_cpu/)
- [Enable sharing page via QR Code](chrome://flags/#sharing-qr-code-generator)
- To allow downloads from Google Drive, add drive.google.com to **Sites that can always use cookies**, mark **Including third-party cookies on this site**.
- Check which Chrome Extensions needs **Allow access to file URLs** Permission (Markdown one of them)

Alternatives

- [Brave](https://brave.com/)

    Install dependencies

    ```
    $ sudo apt install \
        apt-transport-https \
        curl
    ```

    Add apt key

    ```bash
    $ curl --silent https://brave-browser-apt-nightly.s3.brave.com/brave-core-nightly.asc | \
        sudo apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-prerelease.gpg add -
    ```

    Add package repository url

    ```bash
    $ echo "deb [arch=amd64] https://brave-browser-apt-nightly.s3.brave.com/ stable main" | \
        sudo tee /etc/apt/sources.list.d/brave-browser-nightly.list
    ```

    Update package repository

    ```bash
    $ sudo apt update
    ```

    Install it

    ```bash
    $ sudo apt install brave-browser-nightly
    ```

    Uninstall / Remove it

    ```bash
    $ sudo apt remove brave-browser-nightly

    $ sudo apt purge brave-browser-nightly

    $ sudo rm /etc/apt/sources.list.d/brave-browser-nightly.list*

    $ sudo rm /etc/apt/trusted.gpg.d/brave-browser-prerelease.gpg*
    ```

    Related links
    - [Install instructions for Linux](https://brave-browser.readthedocs.io/en/latest/installing-brave.html#linux)

- [Firefox](https://www.mozilla.org/en-US/firefox/new/)

    [Beta](https://www.mozilla.org/en-US/firefox/channel/desktop/#beta)

    - Install it

        Download `.tar.bz2` file

        ```bash
        $ wget \
            -O firefox-beta.tar.bz2 \
            "https://download.mozilla.org/?product=firefox-beta-latest-ssl&os=linux64&lang=en-US"
        ```

        Unextract file

        ```bash
        $ tar \
            --extract \
            --verbose \
            --preserve-permissions \
            --bzip2 \
            --file firefox-beta.tar.bz2
        ```

        Change folder name

        ```bash
        $ mv firefox/ firefox-beta/
        ```

        Move to right place

        ```bash
        $ mv firefox-beta/ $HOME/.local/opt/
        ```

        Create symlink

        ```bash
        $ ln -s $HOME/.local/opt/firefox-beta/firefox $HOME/bin/firefox-beta
        ```

        Add / Update `.desktop` file

        ```bash
        $ nano $HOME/.local/share/applications/firefox-beta.desktop
        ```

        - `$HOME/.local/share/applications/firefox-beta.desktop`

            ```ini
            [Desktop Entry]
            Name=Firefox Beta Edition
            GenericName=Web Browser
            Exec={{ /path/to/home }}/bin/firefox-beta %u
            Icon={{ /path/to/home }}/.local/opt/firefox-beta/browser/chrome/icons/default/default128.png
            Terminal=false
            Type=Application
            MimeType=text/html;text/xml;application/xhtml+xml;application/vnd.mozilla.xul+xml;text/mml;x-scheme-handler/http;x-scheme-handler/https;
            StartupNotify=true
            Categories=Network;WebBrowser;
            Keywords=web;browser;internet;
            Actions=new-window;new-private-window;
            StartupWMClass=Firefox Beta Edition

            [Desktop Action new-window]
            Name=Open a New Window
            Exec={{ /path/to/home }}/bin/firefox-beta %u

            [Desktop Action new-private-window]
            Name=Open a New Private Window
            Exec={{ /path/to/home }}/bin/firefox-beta --private-window %u
            ```

        Build cache database of MIME types handled by desktop files

        ```bash
        $ update-desktop-database $HOME/.local/share/applications/
        ```

    - Update it

        Download recent version

        ```bash
        $ wget \
            -O firefox-beta.tar.bz2 \
            "https://download.mozilla.org/?product=firefox-beta-latest-ssl&os=linux64&lang=en-US"
        ```

        Extract it

        Apply `rsync` command

        ```
        $ rsync \
            -av \
            --delete firefox/ \
            $HOME/.local/opt/firefox-beta
        ```

        Remove unneeded folder

        ```
        $ rm -rf firefox/
        ```

    [Developer](https://www.mozilla.org/en-US/firefox/developer/)

    - Install it

        Download `.tar.bz2` file

        ```bash
        $ wget \
            -O firefox-dev.tar.bz2 \
            "https://download.mozilla.org/?product=firefox-devedition-latest-ssl&os=linux64&lang=en-US"
        ```

        Unextract file

        ```bash
        $ tar \
            --extract \
            --verbose \
            --preserve-permissions \
            --bzip2 \
            --file firefox-dev.tar.bz2
        ```

        Change folder name

        ```bash
        $ mv firefox/ firefox-dev/
        ```

        Move to right place

        ```bash
        $ mv firefox-dev/ $HOME/.local/opt/
        ```

        Create symlink

        ```bash
        $ ln -s $HOME/.local/opt/firefox-dev/firefox $HOME/bin/firefox-dev
        ```

        Add / Update `.desktop` file

        ```bash
        $ nano $HOME/.local/share/applications/firefox-dev.desktop
        ```

        - `$HOME/.local/share/applications/firefox-dev.desktop`

            ```ini
            [Desktop Entry]
            Name=Firefox Developer Edition
            GenericName=Web Browser
            Exec={{ /path/to/home }}/bin/firefox-dev %u
            Icon={{ /path/to/home }}/.local/opt/firefox-dev/browser/chrome/icons/default/default128.png
            Terminal=false
            Type=Application
            MimeType=text/html;text/xml;application/xhtml+xml;application/vnd.mozilla.xul+xml;text/mml;x-scheme-handler/http;x-scheme-handler/https;
            StartupNotify=true
            Categories=Network;WebBrowser;
            Keywords=web;browser;internet;
            Actions=new-window;new-private-window;
            StartupWMClass=Firefox Developer Edition

            [Desktop Action new-window]
            Name=Open a New Window
            Exec={{ /path/to/home }}/bin/firefox-dev %u

            [Desktop Action new-private-window]
            Name=Open a New Private Window
            Exec={{ /path/to/home }}/bin/firefox-dev --private-window %u
            ```

        Build cache database of MIME types handled by desktop files

        ```bash
        $ update-desktop-database $HOME/.local/share/applications/
        ```

    - Update it

        Download recent version

        ```bash
        $ wget \
            -O firefox-beta.tar.bz2 \
            "https://download.mozilla.org/?product=firefox-devedition-latest-ssl&os=linux64&lang=en-US"
        ```

        Extract it

        Apply `rsync` command

        ```
        $ rsync \
            -av \
            --delete firefox/ \
            $HOME/.local/opt/firefox-dev
        ```

        Remove unneeded folder

        ```
        $ rm -rf firefox/
        ```

    [Nightly](https://www.mozilla.org/en-US/firefox/channel/desktop/#nightly)

    - Install it

        Download `.tar.bz2` file

        ```bash
        $ wget \
            -O firefox-nightly.tar.bz2 \
            "https://download.mozilla.org/?product=firefox-nightly-latest-ssl&os=linux64&lang=en-US"
        ```

        Unextract file

        ```bash
        $ tar \
            --extract \
            --verbose \
            --preserve-permissions \
            --bzip2 \
            --file firefox-nightly.tar.bz2
        ```

        Change folder name

        ```bash
        $ mv firefox/ firefox-nightly/
        ```

        Move to right place

        ```bash
        $ mv firefox-nightly/ $HOME/.local/opt/
        ```

        Create symlink

        ```bash
        $ ln -s $HOME/.local/opt/firefox-nightly/firefox $HOME/bin/firefox-nightly
        ```

        Add / Update `.desktop` file

        ```bash
        $ nano $HOME/.local/share/applications/firefox-nightly.desktop
        ```

        - `$HOME/.local/share/applications/firefox-nightly.desktop`

            ```ini
            [Desktop Entry]
            Name=Firefox Nightly Edition
            GenericName=Web Browser
            Exec={{ /path/to/home }}/bin/firefox-nightly %u
            Icon={{ /path/to/home }}/.local/opt/firefox-nightly/browser/chrome/icons/default/default128.png
            Terminal=false
            Type=Application
            MimeType=text/html;text/xml;application/xhtml+xml;application/vnd.mozilla.xul+xml;text/mml;x-scheme-handler/http;x-scheme-handler/https;
            StartupNotify=true
            Categories=Network;WebBrowser;
            Keywords=web;browser;internet;
            Actions=new-window;new-private-window;
            StartupWMClass=Firefox Nightly Edition

            [Desktop Action new-window]
            Name=Open a New Window
            Exec={{ /path/to/home }}/bin/firefox-nightly %u

            [Desktop Action new-private-window]
            Name=Open a New Private Window
            Exec={{ /path/to/home }}/bin/firefox-nightly --private-window %u
            ```

        Build cache database of MIME types handled by desktop files

        ```bash
        $ update-desktop-database $HOME/.local/share/applications/
        ```

    - Update it

        Download recent version

        ```bash
        $ wget \
            -O firefox-beta.tar.bz2 \
            "https://download.mozilla.org/?product=firefox-nightly-latest-ssl&os=linux64&lang=en-US"
        ```

        Extract it

        Apply `rsync` command

        ```
        $ rsync \
            -av \
            --delete firefox/ \
            $HOME/.local/opt/firefox-nightly
        ```

        Remove unneeded folder

        ```
        $ rm -rf firefox/
        ```

    Related links
    - 2020-05-28 - [How to install Firefox Developer Edition on Linux](https://linuxconfig.org/how-to-install-firefox-developer-edition-on-linux)

- [ungoogled-chromium](https://github.com/Eloston/ungoogled-chromium) - Google Chromium, sans integration with Google

    Install via `.deb` file

    ```bash
    $ wget \
        -O $HOME/ungoogled_chromium.deb \
        https://download.opensuse.org/repositories/home:/ungoogled_chromium/Ubuntu_Focal/amd64/ungoogled-chromium_81.0.4044.138-1.focal1_amd64.deb
    ```

    Install via package repository

    - Add package repository url

    ```bash
    $ echo 'deb http://download.opensuse.org/repositories/home:/ungoogled_chromium/Ubuntu_Focal/ /' | \
        sudo tee /etc/apt/sources.list.d/home:ungoogled_chromium.list
    ```

    - Add key

    ```bash
    $ sudo wget \
        -nv \
        -O "/etc/apt/trusted.gpg.d/home:ungoogled_chromium.asc" \
        https://download.opensuse.org/repositories/home:ungoogled_chromium/Ubuntu_Focal/Release.key
    ```

    - Update package repository

    ```
    $ sudo apt update
    ```

    - Install it

    ```bash
    # 2020-06-08
    $ apt install -s ungoogled-chromium
    # Inst ungoogled-chromium (81.0.4044.138-1.focal1 home:ungoogled_chromium:download.opensuse.org [amd64])

    $ sudo apt install ungoogled-chromium
    ```

    Remove it

    ```bash
    # remove links with apt
    $ sudo rm /etc/apt/trusted.gpg.d/home\:ungoogled_chromium.asc
    $ sudo rm /etc/apt/sources.list.d/home\:ungoogled_chromium.list
    $ sudo rm /etc/apt/sources.list.d/home\:ungoogled_chromium.list.save

    $ sudo apt remove ungoogled-chromium
    $ sudo apt purge ungoogled-chromium
    $ sudo apt autoremove
    ```

    Related links
    - [ungoogled-chromium from home:ungoogled_chromium project @ opensuse](https://software.opensuse.org/download/package?package=ungoogled-chromium&project=home:ungoogled_chromium)

Change to `DuckDuckGo` search engine
- [Search Syntax](https://help.duckduckgo.com/duckduckgo-help-pages/results/syntax/)
- [URL Params](https://duckduckgo.com/params)
- [!Bang lite](https://duckduckgo.com/bang_lite.html)
- [All DuckDuckGo bang operators on one page (mosermichael.github.io)](https://news.ycombinator.com/item?id=24618447)
- [ordered by date](https://www.reddit.com/r/duckduckgo/comments/3glmr1/ordered_by_date/)
- [The ultimate guide to DuckDuckGo](https://brettterpstra.com/2019/03/07/the-ultimate-guide-to-duckduckgo/)

Related links
- [CRXcavator](https://crxcavator.io/) - Submit a Chrome Extension ID to scan

### VLC media player - play multimedia files

☝ [Table of contents](#table-of-contents)

[Download Ubuntu](https://www.videolan.org/vlc/download-ubuntu.html)

[GitHub](https://github.com/videolan/vlc)

Simulate install to verify package version

```bash
# 2021-01-07
$ apt install -s vlc
...
Inst vlc (3.0.9.2-1 Ubuntu:20.04/focal [amd64])
...
```

Install via `apt`

```bash
$ sudo apt install vlc
```

Install via `flatpak` - [Flathub](https://flathub.org/apps/details/org.videolan.VLC)

```bash
$ flatpak install flathub org.videolan.VLC

# run
$ flatpak run org.videolan.VLC
```

Install via `snap`

```bash
$ snap install vlc
```

Shortucts
- `e` - Next frame
- `[` - speed down
- `]` - speed up
- `Shift + ⬅️` - move backward 3 sec
- `Shift + ➡️` - move forward 3 sec
- `Ctrl + ⬅️` - move backward 1 min
- `Ctrl + ➡️` - move forward 1 min

Related links
- [Changelog](https://www.videolan.org/developers/vlc-branch/NEWS)
- [Releases](https://www.videolan.org/vlc/releases/)
- [QtHotkeys](https://wiki.videolan.org/QtHotkeys/)

### Visual Studio Code - code editor

☝ [Table of contents](#table-of-contents)

Also called VSCode

[Visual Studio Code on Linux](https://code.visualstudio.com/docs/setup/linux)

Install via `.deb`

TODO

Install via `snap`

```bash
$ snap install code
```

Set `Code` as default editor

```bash
# manually
$ sudo update-alternatives --set editor /usr/bin/code
# for code insiders version
$ sudo update-alternatives --set editor /usr/bin/code-insiders

# interactively
$ sudo update-alternatives --config editor
```

Save `User` settings as symlink

```bash
# Copy to another place
$ cp ${HOME}/.config/"Code - Insiders"/User/settings.json ${HOME}/Projects/vscode.user.settings.json
# Remove the actual one
$ rm ${HOME}/.config/"Code - Insiders"/User/settings.json
# Create symlink reference
$ ln -sT ${HOME}/Projects/vscode.user.settings.json ${HOME}/.config/"Code - Insiders"/User/settings.json
```

Personal custom shortcuts:

```json
{
  "key": "ctrl+'",
  "command": "workbench.files.action.collapseExplorerFolders",
  "when": "viewContainer.workbench.view.explorer.enabled"
}
```

Alternatives
- [VSCodium/vscodium](https://github.com/VSCodium/vscodium)
- Visual Studio Code [Insiders](https://code.visualstudio.com/insiders/)

Related links:
- [FAQ](https://code.visualstudio.com/docs/supporting/faq)
- [User and Workspace Settings](https://code.visualstudio.com/docs/getstarted/settings)
- [How can you export the Visual Studio Code extension list?](https://stackoverflow.com/questions/35773299/how-can-you-export-the-visual-studio-code-extension-list)

    ```bash
    $ code --list-extensions

    $ code-insiders --list-extensions

    $ code --list-extensions | xargs -L 1 echo code --install-extension

    $ code-insiders --list-extensions | xargs -L 1 echo code-insiders --install-extension
    ```

    [List of extensions](./vscode-extensions.md)

- [How do I remove VS Code & settings from Ubuntu?](https://superuser.com/questions/1113022/)
- [How to change indentation in Visual Studio Code?](https://stackoverflow.com/questions/34174207/)
- [Choose folders to be ignored during search in VS Code](https://stackoverflow.com/questions/29971600/)

### [Foxit PDF Reader](https://www.foxitsoftware.com/pdf-reader/) - pdf viewer

☝ [Table of contents](#table-of-contents)

Industry’s Most Powerful PDF Reader

Download `.tar.gz` file

```bash
$ wget \
    -O FoxitReader.run.tar.gz \
    https://cdn01.foxitsoftware.com/pub/foxit/reader/desktop/linux/2.x/2.4/en_us/FoxitReader.enu.setup.2.4.4.0911.x64.run.tar.gz
```

Uncompress it

```bash
$ gzip -d FoxitReader.run.tar.gz

$ tar xzvf FoxitReader.run.tar
```

Assign permissions to `.run` file

```bash
$ chmod u+x FoxitReader*.run
```

Run installer

```bash
$ ./FoxitReader.enu.setup.2.4.4.0911\(r057d814\).x64.run
```

Choose any of the following paths as `Installation Folder`
- `$HOME/.local/opt/foxitsoftware/foxitreader`
- `/opt/foxitsoftware/foxitreader`

Alternatives
- [Master PDF Editor](https://code-industry.net/free-pdf-editor/)

Related links
- 2020-05-12 - [PDF viewer list on Ubuntu 20.04 Focal Fossa Linux](https://linuxconfig.org/pdf-viewer-list-on-ubuntu-20-04-focal-fossa-linux)

### [Spotify](https://www.spotify.com/download/linux/) - music streaming

☝ [Table of contents](#table-of-contents)

Install via `flatpak` (recommended / preferred way)

```bash
$ flatpak install flathub com.spotify.Client
```

Install via `Snap`

```bash
$ snap install spotify
```

Install via package repository

```bash
# add apt key
$ curl -sS https://download.spotify.com/debian/pubkey.gpg | \
    sudo apt-key add -

# add package repository url
$ echo "deb http://repository.spotify.com stable non-free" | \
    sudo tee /etc/apt/sources.list.d/spotify.list

# update package repository and install it
$ sudo apt update && \
    sudo apt install spotify-client
```

Uninstall / Remove it

```bash
$ sudo apt remove spotify-client
$ sudo apt purge spotify-client
$ rm -rf $HOME/.config/spotify/*
$ rm -rf $HOME/.cache/spotify/*
```

Personal Settings

TODO

Related links
- [archive](https://web.archive.org/web/20201221183349/https://www.spotify.com/pe/download/linux/)

### [Slack](https://slack.com/intl/en-us/downloads/linux) - IM app

☝ [Table of contents](#table-of-contents)

Install via `.deb`

```bash
$ wget \
    -O $HOME/slack.deb \
    https://downloads.slack-edge.com/linux_releases/slack-desktop-4.4.2-amd64.deb
```

Install via `Snap`

```bash
$ snap install slack

# https://snapcraft.io/docs/snap-confinement
$ snap install slack --classic
$ snap install --classic slack
```

Related links
- [Release notes for Linux](https://slack.com/intl/en-us/release-notes/linux)

### [Zoom](https://support.zoom.us/hc/en-us/articles/204206269-Installing-or-updating-Zoom-on-Linux) - video call app

☝ [Table of contents](#table-of-contents)

Install via `flatpak`

```bash
$ flatpak install flathub us.zoom.Zoom
```

- Directories used by `flatpak`

    ```bash
    $HOME/.var/app/us.zoom.Zoom/
    ```

Install via [`Snap`](https://snapcraft.io/zoom-client)

```bash
$ snap install zoom-client
```

Alternatives

- [Skype](https://www.skype.com/en/get-skype/download-skype-for-desktop/)

    Install via `.deb`

    ```bash
    $ wget \
        -O skype.deb \
        https://repo.skype.com/latest/skypeforlinux-64.deb
    ```

    Install via `Snap`

    ```bash
    $ snap install skype
    ```
Related links
- Install [using the terminal](https://support.zoom.us/hc/en-us/articles/204206269-Installing-or-updating-Zoom-on-Linux#h_89c268b4-2a68-4e4c-882f-441e374b87cb)

### [Telegram](https://telegram.org/dl/desktop/linux) - IM app

☝ [Table of contents](#table-of-contents)

Install via `flatpak`

```bash
$ flatpak install flathub org.telegram.desktop
```

Telegram icon location - `$HOME/.local/share/icons/telegram.png`

Telegram folders used via `flatpak` installation

```bash
# folders used for Telegram via Flatpak
$HOME/.local/share/TelegramDesktop/
$HOME/.var/app/org.telegram.desktop/
```

Alternatives

- For Whatsapp with multiple accounts
    - [franz](https://github.com/meetfranz/franz)
    - [ferdi](https://github.com/getferdi/ferdi)
    - [altus](https://github.com/amanharwara/altus)
    - [ttth](https://github.com/yafp/ttth)
    - [ramboxapp](https://github.com/ramboxapp/community-edition)
    - [hamsket](https://github.com/TheGoddessInari/hamsket)

Related links
- [Changelog - Version history](https://desktop.telegram.org/changelog)
- [Wiki](https://github.com/telegramdesktop/tdesktop/wiki)
    - [Keyboard Shortcuts](https://github.com/telegramdesktop/tdesktop/wiki/Keyboard-Shortcuts)

### [Ksnip](https://github.com/ksnip/ksnip) - screenshot tool

☝ [Table of contents](#table-of-contents)

Install via `flatpak`

```bash
$ flatpak install flathub org.ksnip.ksnip

# run
$ flatpak run org.ksnip.ksnip
```

Install via `AppImage`

- Download `.AppImage` file

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

Alternatives

- [lupoDharkael/flameshot](https://github.com/lupoDharkael/flameshot) - Powerful yet simple to use screenshot software

    Install via `apt`

    ```bash
    # simulate install
    $ apt install -s flameshot

    $ sudo apt install flameshot
    ```

    Create keyboard shortcut

    - Command to use

        ```bash
        # -d, delay time in miliseconds
        # -p, path where capture will be saved
        /usr/local/bin/flameshot gui -d 100 -p {{ $HOME }}/Pictures
        /usr/bin/flameshot gui -d 100 -p {{ $HOME }}/Pictures
        ```

    - Key combination: `Super+Print` or `Print`

    - Disable shorcuts assign by default to key combination to use

    Install from `master` branch

    ```bash
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
    ```

    - If create a keyboard shortcut, update command

        ```bash
        $ {{ $HOME }}/bin/flameshot gui -d 100 -p {{ $HOME }}/Pictures
        ```

    - Location of config file - `$HOME/.config/Dharkael/flameshot.ini`

    - Example of config file

        ```bash
        # example 1
        [General]
        closeAfterScreenshot=true
        disabledTrayIcon=false
        filenamePattern=fs_%Y-%m-%d_%H-%M-%S
        showDesktopNotification=true
        startupLaunch=true

        # example 2
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

Related tools
- [sindresorhus/capture-website-cli](https://github.com/sindresorhus/capture-website-cli) - Capture screenshots of websites from the command-line
- [gildas-lormeau/SingleFile](https://github.com/gildas-lormeau/SingleFile) - Web Extension for Firefox/Chrome/MS Edge and CLI tool to save a faithful copy of an entire web page in a single HTML file

### [SimpleScreenRecorder](http://www.maartenbaert.be/simplescreenrecorder/) - record screen

☝ [Table of contents](#table-of-contents)

Record programs and games.

[GitHub](https://github.com/MaartenBaert/ssr)

Install it

```bash
$ sudo apt-add-repository ppa:maarten-baert/simplescreenrecorder
$ sudo apt-get update
$ sudo apt-get install simplescreenrecorder
```

Alternatives

- [hzbd/kazam](https://github.com/hzbd/kazam)
- [GNOME/cheese](https://gitlab.gnome.org/GNOME/cheese)

Related links
- 2020-06-10 - [5 Tools To Record Your Linux Desktop (Screencast) In 2020](https://www.linuxuprising.com/2020/01/4-tools-to-record-your-linux-desktop.html)

### Peek - record screen

☝ [Table of contents](#table-of-contents)

[GitHub](https://github.com/phw/peek)

Package dependencies

```
- ffmpeg
- gstreamer1.0-libav
- gstreamer1.0-plugins-good
- gstreamer1.0-plugins-ugly
```

Install via `flatpak`

```bash
$ flatpak install flathub com.uploadedlobster.peek
```

Folder used - `$HOME/.var/app/com.uploadedlobster.peek/`

### CopyQ - clipboard manager

☝ [Table of contents](#table-of-contents)

Clipboard manager with advanced features

[GitHub](https://github.com/hluk/CopyQ)

[Flathub](https://flathub.org/apps/details/com.github.hluk.copyq)

Install via `flatpak`

```bash
$ flatpak install flathub com.github.hluk.copyq

# run
$ flatpak run com.github.hluk.copyq
```

Install via package repository from creator

```bash
$ sudo add-apt-repository ppa:hluk/copyq
$ sudo apt update
$ sudo apt install copyq
```

Folders used
- `$HOME/.config/copyq`
- `$HOME/.local/share/copyq`
- `$HOME/.var/app/com.github.hluk.copyq`

### [Albert](https://albertlauncher.github.io/) - keyboard launcher

☝ [Table of contents](#table-of-contents)

Albert is a desktop agnostic launcher. Its goals are usability and beauty, performance and extensibility. It is written in C++ and based on the Qt framework.

[GitHub](https://github.com/albertlauncher/albert)

Install it

```bash
$ curl https://build.opensuse.org/projects/home:manuelschneid3r/public_key | sudo apt-key add -

$ echo 'deb http://download.opensuse.org/repositories/home:/manuelschneid3r/xUbuntu_20.04/ /' | sudo tee /etc/apt/sources.list.d/home:manuelschneid3r.list

$ sudo wget \
    -O "/etc/apt/trusted.gpg.d/home:manuelschneid3r.asc" \
    -nv \
    https://download.opensuse.org/repositories/home:manuelschneid3r/xUbuntu_20.04/Release.key

$ sudo apt update

$ apt install -s albert

$ sudo apt install albert
```

Personal settings

- On `General` tab
    - Hotkey - `Ctrl+Shift+Space`
    - Check `Show tray icon`
    - Check `Autostart on login`
    - Theme - `Dark`
    - Check `Display icons`
    - Check `Display shadow`
    - Check `Always center Albert`
    - Check `Always on top`
    - Check `Hide on focus out`
- On `Extensions` tab
    - Check `Applications`
    - Check `Calculator`
    - Check `Files`
        - `Paths` - Add `$HOME`
        - `Indexed MIME Types` - `Advanced` - move `text/plain` from `MIME Types` to `Filter patterns`
    - Check `System`
    - Check `WebSearch`

Related links
- [Using it](https://albertlauncher.github.io/docs/using/)
- [GPG Signature error for Ubuntu Repo - Solution](https://github.com/albertlauncher/albert/issues/865#issuecomment-572396128)

### [Activity Watch](https://activitywatch.net/) - time tracker

☝ [Table of contents](#table-of-contents)

Open-source time tracker

[GitHub](https://github.com/ActivityWatch/activitywatch)

Install and setup

- Download `zip` file

    ```bash
    $ wget https://github.com/ActivityWatch/activitywatch/releases/download/v0.9.2/activitywatch-v0.9.2-linux-x86_64.zip
    ```

- Unzip in correct path `$HOME/.local/opt/...`

    ```bash
    $ cp {{ zip file }} $HOME/.local/opt
    $ unzip {{ zip file }}
    ```

- Copy `.desktop` to correct path `.local/share/applications/...`

    ```bash
    $ cp \
        $HOME/.local/opt/activitywatch/aw-qt.desktop \
        $HOME/.local/share/applications/
    ```

- Edit `.desktop` file with right binary path

    ```ini
    ...
    Exec={{ $HOME }}/.local/opt/activitywatch/aw-qt
    ...
    ```

- Download logo file

    ```bash
    # could dowload in $HOME/.icons or $HOME/.local/share/icons
    $ wget \
        -O $HOME/.icons/activitywatch.png \
        https://github.com/ActivityWatch/media/raw/master/logo/logo.png
    ```

- Edit `.desktop` file with right icon path

    ```ini
    ...
    Icon=activitywatch
    ...
    ```

- Add binary path to **Startup Applications**

### [TeamViewer](https://www.teamviewer.com/en/download/linux/) - remote control

☝ [Table of contents](#table-of-contents)

Install via `.deb`

```bash
$ wget \
    -O teamviewer.deb \
    https://download.teamviewer.com/download/linux/teamviewer_amd64.deb
```

Disable package repository url

```bash
$ sudo teamviewer repo disable
```

Set package repository url as default

```bash
$ sudo teamviewer repo default
```

Alternatives

- [RealVNC](https://realvnc.com)

    For `Server` side on `Linux`

    - [Download VNC Server for Linux](https://www.realvnc.com/en/connect/download/vnc/linux/)

        ```bash
        $ wget \
            -O realvnc.deb \
            https://www.realvnc.com/download/file/vnc.files/VNC-Server-6.7.2-Linux-x64.deb
        ```

    - Verify file with `SHA-256` sum

    For `Client` side on `Android` phone, download app or install `.apk` file

    Related links
    - 2018-08-01 - [Install and Configure RealVNC in Linux Ubuntu 18.04 LTS](https://www.zealfortechnology.com/2018/08/install-and-configure-realvnc-in-linux.html) - [archive](https://web.archive.org/web/20201226150515/https://www.zealfortechnology.com/2018/08/install-and-configure-realvnc-in-linux.html)

### [OBS Studio](https://obsproject.com/wiki/install-instructions#linux) - streaming

☝ [Table of contents](#table-of-contents)

[GitHub](https://github.com/obsproject/obs-studio)

Install it

```bash
$ sudo add-apt-repository ppa:obsproject/obs-studio
$ sudo apt update
$ sudo apt install obs-studio
```

### Autokey - desktop automation utility

☝ [Table of contents](#table-of-contents)

[GitHub](https://github.com/autokey/autokey)

Simulate install to verify which packages are going to be installed

```bash
# 2021-01-10
$ apt install -s autokey-gtk
...
Inst python3-pyinotify (0.9.6-1.2ubuntu1 Ubuntu:20.04/focal [all])
Inst wmctrl (1.07-7build1 Ubuntu:20.04/focal [amd64])
Inst autokey-common (0.95.10-1 Ubuntu:20.04/focal [all])
Inst gir1.2-appindicator3-0.1 (12.10.1+20.04.20200408.1-0ubuntu1 Ubuntu:20.04/focal [amd64])
Inst libgtksourceview-3.0-common (3.24.11-2 Ubuntu:20.04/focal [all])
Inst libgtksourceview-3.0-1 (3.24.11-2 Ubuntu:20.04/focal [amd64])
Inst gir1.2-gtksource-3.0 (3.24.11-2 Ubuntu:20.04/focal [amd64])
Inst autokey-gtk (0.95.10-1 Ubuntu:20.04/focal [all])
...
```

Install it

```bash
$ sudo apt install autokey-gtk
```

Remove it

```bash
$ sudo apt remove autokey-gtk &&
    sudo apt purge autokey-gtk &&
    sudo apt autoremove
```

### [DBeaver](https://dbeaver.io/) - database tool

☝ [Table of contents](#table-of-contents)

Free multi-platform database tool for developers, database administrators, analysts and all people who need to work with databases. Supports all popular databases: MySQL, PostgreSQL, SQLite, Oracle, DB2, SQL Server, Sybase, MS Access, Teradata, Firebird, Apache Hive, Phoenix, Presto, etc.

[GitHub](https://github.com/dbeaver/dbeaver)

Install via `flatpak`

```bash
$ flatpak install flathub io.dbeaver.DBeaverCommunity

# run
$ flatpak run io.dbeaver.DBeaverCommunity
```

### [BleachBit](https://www.bleachbit.org/) - clean disk space

☝ [Table of contents](#table-of-contents)

Cleans files to free disk space and to maintain privacy.

[GitHub](https://github.com/bleachbit/bleachbit)

Install via `apt`

```bash
$ sudo apt install bleachbit
```

Install from `master` branch

```bash
$ cd $HOME
$ git clone https://github.com/bleachbit/bleachbit
$ cd bleachbit/
$ make -C po local
$ cp bleachbit.py $HOME/bin/bleachbit
$ rm -rf $HOME/bleachbit/
```

### Stacer - monitor system resources

☝ [Table of contents](#table-of-contents)

Linux System Optimizer and Monitoring

[GitHub](https://github.com/oguzhaninan/Stacer)

Install it

```bash
$ sudo add-apt-repository ppa:oguzhaninan/stacer -y
$ sudo apt-get update
$ sudo apt-get install stacer -y
```

### [Wireshark](https://www.wireshark.org/download.html) - monitor network traffic

☝ [Table of contents](#table-of-contents)

World’s foremost and widely-used network protocol analyzer

[GitHub](https://github.com/wireshark/wireshark)

Install it

```bash
$ sudo add-apt-repository ppa:wireshark-dev/stable
$ sudo apt update
$ sudo apt install wireshark
```

Package repositories
- [Standard package](https://launchpad.net/ubuntu/+source/wireshark)
- [Latest stable PPA](https://launchpad.net/~wireshark-dev/+archive/ubuntu/stable)

Related tools
- [gcla/termshark](https://github.com/gcla/termshark) - A terminal UI for tshark, inspired by Wireshark
- [KimiNewt/pyshark](https://github.com/KimiNewt/pyshark) - Python wrapper for tshark, allowing python packet parsing using wireshark dissectors
- [cloudflare/wirefilter](https://github.com/cloudflare/wirefilter) - An execution engine for Wireshark-like filters

Related links
- [How to Install and Use Wireshark on Ubuntu](https://linuxhint.com/install_wireshark_ubuntu/)
- [How to install Wireshark](https://askubuntu.com/questions/700712/how-to-install-wireshark)

### [Dropbox](https://www.dropbox.com/install-linux) - online storage

☝ [Table of contents](#table-of-contents)

Install via `.deb` file

```bash
$ wget \
    -O dropbox.deb \
    https://www.dropbox.com/download?dl=packages/ubuntu/dropbox_2020.03.04_amd64.deb
```

Dropbox Headless Install via command line

```bash

$ cd ~ && \
    wget \
        -O - \
        "https://www.dropbox.com/download?plat=lnx.x86_64" | \
    tar xzf -
```

Install via `flatpak`

```bash
$ flatpak install flathub com.dropbox.Client
```

Add to `Startup Applications`
- Open `Gnome Tweaks`
- Go to option `Startup Applications`
- Click in `+` to add a application
- Click on search icon
- Enter `dropbox` (should appear if was installed via `flatpak`)
- Confirm to add it

### scrcpy - control android device from your computer

☝ [Table of contents](#table-of-contents)

Display and control your Android device

[GitHub](https://github.com/Genymobile/scrcpy)

Requirements
- On `android` device - `USB preferences` - `no data transfer` -> `file transfer`

- On `android` device -  `developer options` - `active USB debugging`

    YT - [Google Pixel 3a: How to Enable Developer Options](https://www.youtube.com/watch?v=qzl8KLIxj2Y)

- Install `adb` (Optional: `scrcpy` from `snap` comes with `scrcpy.adb`)
    - [Platform Tools](https://developer.android.com/studio/releases/platform-tools)
    - [ADB](https://developer.android.com/studio/command-line/adb.html)
    - [platform-tools-latest-linux.zip](https://dl.google.com/android/repository/platform-tools-latest-linux.zip)
    - [How to install adb windows mac](https://beebom.com/how-to-install-adb-windows-mac/)
    - [Install adb windows macos linux](https://www.xda-developers.com/install-adb-windows-macos-linux/)
    - Verify `adb` version

        ```bash
        $ ./adb version
        Android Debug Bridge version 1.0.41
        Version 30.0.3-6597393
        Installed as {{ $HOME }}/platform-tools/adb
        ```

Install via `snap`

```bash
$ sudo snap install scrcpy
```

Verify `port` is not being used

```bash
$ sudo ss -tulpn | grep :5555
```

Commands

```bash
$ scrcpy.adb start-server
$ scrcpy.adb devices
$ scrcpy.adb tcpip 5555
$ scrcpy.adb connect {{ android IP }}:5555
$ scrcpy -b2M -m800
$ scrcpy.adb kill-server
```

Considerations
- Don't forget to allow connection on android phone
- client (scrcpy) and server (scrcpy.adb) should be from same version, otherwise won't work

Alternatives
- [KDEConnect](https://community.kde.org/KDEConnect) - control your phone remotely

Related links
- 2018-05-14 - [Open Source Project: Scrcpy now works wirelessly!](https://www.genymotion.com/blog/open-source-project-scrcpy-now-works-wirelessly/)
- [sisco311/scrcpy-snap](https://github.com/sisco311/scrcpy-snap)

### [droidcam](https://www.dev47apps.com/) - turn mobile device into webcam

☝ [Table of contents](#table-of-contents)

Requirements

```bash
# verify requirements are met
$ apt install -s gcc make linux-headers-$(uname -r)
...
gcc is already the newest version
make is already the newest version
linux-headers-5.4.0-7634-generic is already the newest version
...
```

Download `zip` file

```bash
# download required files
$ wget https://files.dev47apps.net/linux/droidcam_latest.zip
```

Verify `zip` file

```bash
# verify zip file
$ echo "73db3a4c0f52a285b6ac1f8c43d5b4c7 droidcam_latest.zip" | md5sum -c --
droidcam_latest.zip: OK
```

Uncompress `zip` file

```bash
# unzip it
$ unzip droidcam_latest.zip -d droidcam
```

Run installer

```bash
$ cd ./droidcam/
$ sudo ./install
```

Verify modules added to linux kernel

```bash
# verify if modules were added to linux kernel
$ lsmod | grep v4l2loopback_dc
v4l2loopback_dc        24576  0
videodev              225280  4 videobuf2_v4l2,v4l2loopback_dc,uvcvideo,videobuf2_common
```

Install loopback device

```bash
# install loopback device for get sound from phone
$ sudo ./install-sound
Loading Loopback device
Done
Use 'pacmd load-module module-alsa-source device=hw:Loopback,1,0' to load the card into PulseAudio while droidcam is running
```

Some util commands

```bash
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
```

Important files and paths
- `/etc/modules`
- `/etc/modprobe.d/droidcam.conf`
- `/etc/modules-load.d/cups-filters.conf`
- `/etc/modules-load.d/droidcam.conf`
- `/etc/modules-load.d/modules.conf`
- `/opt/droidcam-uninstall`

Download and save icon

```
$ wget \
    -O $HOME/.local/share/icons/droidcam \
    https://files.dev47apps.net/img/app_icon.png
```

Create desktop file - `$HOME/.local/share/applications/droidcam.desktop`

```ini
[Desktop Entry]
Type=Application
Name=Droidcam
Comment=Use your Android phone as a wireless webcam!
Icon={{ $HOME }}/.local/share/icons/droidcam
Exec=/usr/bin/droidcam
Terminal=false
Categories=GNOME;GTK;Video;
```

Related links
- [Linux instructions](https://www.dev47apps.com/droidcam/linux/)

### [Thinkorswim](https://www.tdameritrade.com/tools-and-platforms/thinkorswim.page) - Trading Platforms

☝ [Table of contents](#table-of-contents)

Prerequisites - Install Zulu OpenJDK 8

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

Install it

- Dowload installer file

    ```bash
    $ wget https://mediaserver.thinkorswim.com/installer/InstFiles/thinkorswim_installer.sh
    ```

- Allow execution permission

    ```bash
    $ chmod u+x thinkorswim_installer.sh
    ```

- Verify installer file

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

- Add path to binary file to `$PATH`

    ```bash
    $ ln \
        -s $HOME/.local/opt/thinkorswim/thinkorswim \
        $HOME/bin/thinkorswim
    ```

`.desktop` file example

```ini
#!/usr/bin/env xdg-open
[Desktop Entry]
Type=Application
Name=thinkorswim
Exec=thinkorswim
Icon={{ $HOME }}.local/opt/thinkorswim/.install4j/thinkorswim.png
```

Create `.desktop` file in `$HOME/.local/share/applications/`

```bash
$ nano $HOME/.local/share/applications/thinkorswim.desktop
```

Build cache database of MIME types handled by desktop files

```bash
$ update-desktop-database $HOME/.local/share/applications/
```

Directories used
- `$HOME/.thinkorswim/`

Related links
- [Learning Center](https://tlc.thinkorswim.com/center)
- [Add the APT Repository on Ubuntu or Debian](https://docs.azul.com/zulu/zuludocs/ZuluUserGuide/PrepareZuluPlatform/AttachAPTRepositoryUbuntuOrDebianSys.htm)
- [Installation on Linux Using the Zulu Docker Registry](https://docs.azul.com/zulu/zuludocs/ZuluUserGuide/InstallingZulu/InstallOLinuxUsingZuluDockerRegistry.htm)
<!-- https://docs.azul.com/zulu/zuludocs/ZuluUserGuide/InstallingZulu/InstallOnLinuxUsingAPTRepository.htm -->

### [Virtualbox](https://www.virtualbox.org/) - virtualization

☝ [Table of contents](#table-of-contents)

[Steps to install](https://www.virtualbox.org/wiki/Linux_Downloads)

```bash
$ wget \
    -O virtualbox.deb \
    https://download.virtualbox.org/virtualbox/6.1.16/virtualbox-6.1_6.1.16-140961~Ubuntu~eoan_amd64.deb
```

[Changelog / Release Notes](https://www.virtualbox.org/wiki/Changelog)

[Linux build instructions](https://www.virtualbox.org/wiki/Linux%20build%20instructions)

Extra packages when installed (6.1.10 <-> 6.1.14)

```
- libpython2-stdlib
- libpython2.7-minimal
- libpython2.7-stdlib
- libsdl1.2debian
- python-is-python2
- python2
- python2-minimal
- python2.7
- python2.7-minimal
```

`Windows 10` ova & iso files:
- [OVA](https://developer.microsoft.com/en-us/windows/downloads/virtual-machines/) (Open Virtualization Format)
- [ISO](https://www.microsoft.com/en-us/software-download/windows10ISO)

### Markdown editor apps

#### [Joplin](https://joplinapp.org/)

☝ [Table of contents](#table-of-contents)

An open source note taking and to-do application with synchronization capabilities for Windows, macOS, Linux, Android and iOS. Forum: discourse.joplinapp.org

[GitHub](https://github.com/laurent22/joplin)

Download `AppImage` file

```bash
$ wget https://github.com/laurent22/joplin/releases/download/v1.0.236/Joplin-1.0.236.AppImage
```

Give permissions to execute

```bash
$ chmod u+x Joplin-1.0.236.AppImage
```

Move to **executable files** folder

```bash
$ mv Joplin-1.0.236.AppImage $HOME/bin
```

Create soft link to simplify command

```bash
$ ln -s $HOME/bin/Joplin-1.0.236.AppImage $HOME/bin/joplin
```

Create `.desktop` file

```bash
# TODO
```

#### [Marktext](https://marktext.app/)

☝ [Table of contents](#table-of-contents)

A simple and elegant markdown editor, available for Linux, macOS and Windows.

[GitHub](https://github.com/marktext/marktext)

Download `AppImage` file

```bash
$ wget \
    -O $HOME/bin/marktext \
    https://github.com/marktext/marktext/releases/download/v0.16.1/marktext-x86_64.AppImage
```

Verify file

```bash
$ echo "373080e22e6c0aa9fa9394c91b6cf1036898a17595e629983912bbced89653ec $HOME/bin/marktext" | sha256sum --check --status
```

Assign permissions

```bash
$ chmod u+x $HOME/bin/marktext
```

Download `.desktop` file

```bash
$ curl \
    --location https://raw.githubusercontent.com/marktext/marktext/develop/resources/linux/marktext.desktop \
    --output $HOME/.local/share/applications/marktext.desktop

$ wget \
    -O $HOME/.local/share/applications/marktext.desktop \
    https://raw.githubusercontent.com/marktext/marktext/develop/resources/linux/marktext.desktop
```

Update `Exec` path in `.desktop` file

```bash
$ nano $HOME/.local/share/applications/marktext.desktop

# on this line
Exec=marktext %F
# complete full path of marktext
```

Build cache database of MIME types handled by desktop files

```bash
$ update-desktop-database $HOME/.local/share/applications/
```

Update icon

```bash
$ mkdir $HOME/.icons
$ cd $HOME/.icons
$ wget \
    -O marktext.png \
    https://github.com/marktext/marktext/blob/develop/resources/icons/icon.png?raw=true
```

Config folder - `$HOME/.config/marktext`

Related links
- Fix issue with [icon](https://askubuntu.com/questions/333133/how-to-set-app-icon-in-the-desktop-file-of-an-ubuntu-touch-application)

#### [vnote](https://vnotex.github.io/vnote/en_us/)

☝ [Table of contents](#table-of-contents)

A note-taking application that knows programmers and Markdown better.

[GitHub](https://github.com/tamlok/vnote)

Download `AppImage` file

```bash
$ wget \
    -O $HOME/bin/vnote \
    https://github.com/tamlok/vnote/releases/download/v2.9.1/VNote-2.9.1-x86_64.AppImage
```

Give permissiones to `AppImage` file

```bash
$ chmod u+x $HOME/bin/vnote
```

Directories needed
- `$HOME/.cache/VNote-2.9.1-x86_64.AppImage/`
- `$HOME/.local/share/vnote/`
- `$HOME/.local/share/VNote/`
- `$HOME/.local/share/VNote-2.9.1-x86_64.AppImage/`

#### PKB alternatives

☝ [Table of contents](#table-of-contents)

To manage a Personal Knowledge Base:

- [Athens](https://github.com/athensresearch/athens)
- [Emvi](https://emvi.com/)
- [Froost](https://froosthq.com/)
- [Fibery](https://fibery.io/)
- [Jetbrains Space](https://www.jetbrains.com/space/)
- [Notable app](https://notable.app/) - [GitHub](https://github.com/notable/notable)
- [Notion clone](https://github.com/konstantinmuenster/notion-clone)
- [Notion](https://www.notion.so/)
    - [Notion for studens & teachers](https://www.notion.so/Notion-for-students-teachers-adc631df15ee4ab9a7a33dd50f4c16fe)
    - [Guides & tutorials](https://www.notion.so/guides/)
    - [How Notion Uses Notion](https://www.notion.so/How-Notion-Uses-Notion-616f41d2f5124f3185cf1c36d267c07e)
- [Org-roam](https://www.orgroam.com/) - [github](https://github.com/org-roam/org-roam)
- [Obsidian](https://obsidian.md/)
    - [kmaasrud/awesome-obsidian](https://github.com/kmaasrud/awesome-obsidian)
- [Outline](https://www.getoutline.com/)
- [Qatalog](https://qatalog.com/)
- [Roam Research](https://roamresearch.com/)
- [Supernotes app](https://supernotes.app/)
- [Trilium notes](https://github.com/zadam/trilium)
- [TiddlyWiki](https://tiddlywiki.com/)
- [Wiki js](https://wiki.js.org/)
- [Xournal++](https://github.com/xournalpp/xournalpp)
- [Zettlr](https://www.zettlr.com/) - [github](https://github.com/Zettlr/Zettlr)
- [Zim](https://zim-wiki.org/) - A Desktop Wiki
- [Zotero](https://www.zotero.org/)
- [ZETTELKASTEN - The Archive](https://zettelkasten.de/the-archive/)

### Math

List

- [GNU Octave](https://flathub.org/apps/details/org.octave.Octave)
- [ZeGrapher](https://github.com/AdelKS/ZeGrapher)
- [desmos](https://www.desmos.com/calculator)
- [GeoGebra ](https://www.geogebra.org/graphing)

Related links

- [What’s another good online calculator like Desmos, but without the graphing, and more space for equations?](https://www.quora.com/What%E2%80%99s-another-good-online-calculator-like-Desmos-but-without-the-graphing-and-more-space-for-equations/answer/Jules-Opeth-Manson)

### Finance

List

- [GNU Cash](https://flathub.org/apps/details/org.gnucash.GnuCash)
- [firefly-iii](https://github.com/firefly-iii/firefly-iii)

### Extra

- [Audacity](https://www.audacityteam.org/) - Free, open source, cross-platform audio software

    [GitHub](https://github.com/audacity/audacity)

    Install via `flatpak`

    ```bash
    $ flatpak install flathub org.audacityteam.Audacity

    # run
    $ flatpak run org.audacityteam.Audacity
    ```

    Related tool
    - `pavucontrol` - Pulse Audio Volume Control

        ```bash
        $ sudo apt install pavucontrol
        ```

    Alternatives
    - [audiomass](https://audiomass.co/) - open-source web based audio and waveform editing tool.


    Directories used:
    - `$HOME/.var/app/org.audacityteam.Audacity/`

    Related links
    - [How to set up Audacity](https://manual.audacityteam.org/man/how_to_set_up_audacity.html)
    - [Tutorial - Recording Computer Playback on Linux](https://manual.audacityteam.org/man/tutorial_recording_computer_playback_on_linux.html)

- [GIMP](https://www.gimp.org/) - GNU Image Manipulation Program

    [GitLab](https://gitlab.gnome.org/GNOME/gimp)

    Alternatives
    - [Glimpse](https://github.com/glimpse-editor/glimpse/)

    Related tools
    - [figma-linux](https://github.com/figma-linux/figma-linux)

        Figma electron app (unofficial)

        Install via `AppImage`

        ```bash
        $ wget \
            -O figma-linux \
            https://github.com/Figma-Linux/figma-linux/releases/download/v0.6.4/figma-linux-0.6.4.AppImage

        $ chmod u+x figma-linux

        $ mv figma-linux $HOME/bin
        ```

        <!-- TODO Create `.desktop` file -->

        Directories used:
        - `$HOME/.config/figma-linux`

    Directories used
    - `$HOME/.var/app/org.gimp.GIMP/`

- [Shotcut](https://www.shotcut.org/) - Free, open source, cross-platform (Qt), open-source (GPLv3) video editor

    [GitHub](https://github.com/mltframework/shotcut)

    Alternatives
    - [kdenlive](https://github.com/KDE/kdenlive) - Free and open source video editor, based on MLT Framework and KDE Frameworks 5

- [Meld](http://meldmerge.org/) - Visual diff and merge tool targeted at developers.

    [GitLab](https://gitlab.gnome.org/GNOME/meld)

    [Flathub](https://flathub.org/apps/details/org.gnome.meld)

    Personal settings
    - `Preferences` - `Display` - `Highlight current line`
    - `Preferences` - `Display` - `Show line numbers`

- [Calibre](https://calibre-ebook.com/) - ebook manager

    [Github](https://github.com/kovidgoyal/calibre)

    [Flathub](https://flathub.org/apps/details/com.calibre_ebook.calibre)

    Install it

    ```bash
    $ flatpak install flathub com.calibre_ebook.calibre

    # run
    $ flatpak run com.calibre_ebook.calibre
    ```

    Convert `.epub` to `.pdf`

    ```bash
    $ flatpak run \
        --command=ebook-convert \
        com.calibre_ebook.calibre \
        file.pdf \
        file.epub \
        --enable-heuristics
    ```

- [NoiseTorch](https://github.com/lawl/NoiseTorch) - Real-time microphone noise suppression on Linux.

    Alternatives
    - [krisp.ai](https://krisp.ai/)

- [Stoplight Studio](https://github.com/stoplightio/studio/) - API docs editor

    The modern editor for API Design and Technical Writing.

    Install it

    ```bash
    # download binary
    $ wget \
        -O $HOME/bin/stoplight-studio \
        https://github.com/stoplightio/studio/releases/download/v2.0.0/stoplight-studio-linux-x86_64.AppImage

    # assign permissions
    $ chmod u+x $HOME/bin/stoplight-studio
    ```

- [uw-labs/bloomrpc](https://github.com/uw-labs/bloomrpc) - The missing GUI Client for GRPC services

## Commands

### [git](https://git-scm.com/) - version control manager

☝ [Table of contents](#table-of-contents)

[GitHub](https://github.com/git/git)

Install it

```bash
$ sudo apt-add-repository ppa:git-core/ppa
$ sudo apt update
$ sudo apt install git
```

Complementary tools

- [gitk](https://git-scm.com/docs/gitk) - The Git repository browser

    Install it

    ```bash
    $ sudo apt install gitk
    ```

- [Gitg](https://wiki.gnome.org/Apps/Gitg/) - GNOME GUI client to view git repositories.

    [GitLab](https://gitlab.gnome.org/GNOME/gitg)

    Install it

    ```bash
    $ sudo apt install gitg
    ```

- [Git Cola](https://git-cola.github.io/) - sleek and powerful graphical user interface for Git

    [GitHub](https://github.com/git-cola/git-cola) - The highly caffeinated Git GUI

    Install via `apt`

    ```bash
    $ sudo apt install git-cola
    ```

    Settings file - `$HOME/.config/git-cola/settings`

    Personal settings
    - GUI theme -> Flat dark grey
    - Icon theme -> Dark theme
    - Hide Branches
    - Hide Submodules
    - Move Status to right

    Install from `master` branch

    - Clone repo (if you already have it, update it)

        ```bash
        $ mkdir -p $HOME/bin-sources/
        $ cd $HOME/bin-sources/
        $ git clone https://github.com/git-cola/git-cola
        ```

    - Install dependencies

        ```bash
        $ pip install PyQt5
        ```

    - Create soft links inside `$HOME/bin` folder

        ```bash
        $ ln -s $HOME/bin-sources/git-cola/bin/git-cola $HOME/bin/
        $ ln -s $HOME/bin-sources/git-cola/bin/git-dag $HOME/bin/
        ```

    - Create `.desktop` file in `$HOME/.local/share/applications`  (or `/usr/share/applications/`)

        ```bash
        $ touch $HOME/.local/share/applications/git-cola.desktop
        $ touch $HOME/.local/share/applications/git-dag.desktop
        ```

        `git-cola.desktop` (example [here](https://github.com/git-cola/git-cola/blob/main/share/applications/git-cola.desktop))

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

        `git-dag.desktop` (example [here](https://github.com/git-cola/git-cola/blob/main/share/applications/git-dag.desktop))

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

    Uninstall / remove it

    ```bash
    $ rm $HOME/.local/share/icons/git-cola
    $ rm $HOME/.local/share/applications/git-cola.desktop
    $ rm $HOME/.local/share/applications/git-dag.desktop
    $ rm $HOME/bin-sources/git-cola/bin/git-cola
    $ rm $HOME/bin-sources/git-cola/bin/git-dag
    $ rm -rf $HOME/bin-sources/git-cola/
    ```

### docker - containers

☝ [Table of contents](#table-of-contents)

[Install Docker Engine on Ubuntu](https://docs.docker.com/install/linux/docker-ce/ubuntu/)

In case you have problem downloading **Docker’s official GPG key**

```bash
$ sudo wget \
    -O /etc/apt/trusted.gpg.d/docker.asc \
    "https://download.docker.com/linux/ubuntu/gpg"
```

Related tools

- [moby/moby](https://github.com/moby/moby) - Moby Project - a collaborative project for the container ecosystem to assemble container-based systems

- [containerd/containerd](https://github.com/containerd/containerd) - An open and reliable container runtime

- [docker-compose](https://github.com/docker/compose)

    Install from `GitHub`

    ```bash
    # install via github in /usr/local/bin
    $ curl \
        -L https://github.com/docker/compose/releases/download/1.25.5/docker-compose-`uname -s`-`uname -m` \
        -o /usr/local/bin/docker-compose

    $ chmod +x /usr/local/bin/docker-compose
    ```

    Install via `pip`

    ```bash
    $ pip install -U docker-compose
    ```

Related links
- [Post-installation steps for Linux](https://docs.docker.com/install/linux/linux-postinstall/#manage-docker-as-a-non-root-user)

### xclip - clipboard manager

☝ [Table of contents](#table-of-contents)

Command line interface to the X11 clipboard

[GitHub](https://github.com/astrand/xclip)

For personal `myts` commands

Simulate to check version to install

```bash
# 2020-05-27 14:33:23
$ apt install -s xclip
# Inst xclip (0.13-1 Ubuntu:20.04/focal [amd64])
```

Install it

```bash
$ sudo apt install xclip
```

### [htop](https://htop.dev/) - monitor computer resources

☝ [Table of contents](#table-of-contents)

An interactive process viewer

[GitHub](https://github.com/htop-dev/htop)

Package dependencies

```
autoconf
automake
autopoint
autoreconf
autotools-dev
debhelper
dh-autoreconf
dh-strip-nondeterminism
dwz
gettext
intltool-debian
libarchive-cpio-perl
libarchive-zip-perl
libcroco3
libdebhelper-perl
libfile-stripnondeterminism-perl
libltdl-dev
libmail-sendmail-perl
libncursesw5
libncursesw5-dev
libsigsegv2
libsub-override-perl
libsys-hostname-long-perl
libtool
m4
po-debconf
```

Install via `apt`

```bash
$ sudo apt install htop
```

Install from `master` branch

```bash
$ cd $HOME
$ git clone https://github.com/hishamhm/htop
$ cd htop
$ ./autogen.sh
$ ./configure
$ make
$ cp htop $HOME/bin
$ cd $HOME
$ rm -rf $HOME/htop
```

Config file - `$HOME/.config/htop/htoprc`

Alternatives

- [nicolargo/glances](https://github.com/nicolargo/glances) - Glances an Eye on your system. A top/htop alternative for GNU/Linux, BSD, Mac OS and Windows operating systems.

- [bpytop](https://github.com/aristocratos/bpytop)

    Initial verification before install it

    ```bash
    $ python -V
    $ python -m pip -V
    $ pyenv versions
    $ pip list | grep bpytop
    $ pip freeze | grep bpytop
    ```

    Package dependencies

    ```bash
    # python3-dev needed to compile psutil, which is dependency of bpytop
    $ apt install python3-dev
    ```

    Install via `pip`

    ```bash
    $ pip install --upgrade bpytop
    ```

    Directories used
    - `$HOME/.config/bpytop/bpytop.conf`
    - `$HOME/.config/bpytop/error.log`
    - `$HOME/.config/bpytop/themes/`


### speedtest - internet bandwidth meter

☝ [Table of contents](#table-of-contents)

Command line interface for testing internet bandwidth using speedtest.net

[GitHub](https://github.com/sivel/speedtest-cli)

Install from `master`

```bash
$ wget \
    -O $HOME/bin/speedtest \
    https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py

# verify `env python` (python shebang) works
$ chmod u+x $HOME/bin/speedtest
```

Commands

- Get `json` output

    ```bash
    $ speedtest --json --single
    ```

    e.g.:

    ```
    {
        "download": 92807569.08109826,
        "upload": 9310265.771436416,
        "ping": 14.002,
        "server": {
            "url": "http://speedtest11.amx.com.pe:8080/speedtest/upload.php",
            "lat": "",
            "lon": "-",
            "name": "",
            "country": "",
            "cc": "",
            "sponsor": "",
            "id": "",
            "host": "speedtest11.amx.com.pe:8080",
            "d": 1.6140678358667562,
            "latency": 14.002
        },
        "timestamp": "2020-09-01T03:47:54.290416Z",
        "bytes_sent": 11739136,
        "bytes_received": 116184700,
        "share": null,
        "client": {
            "ip": "",
            "lat": "",
            "lon": "",
            "isp": "",
            "isprating": "3.7",
            "rating": "",
            "ispdlavg": "",
            "ispulavg": "",
            "loggedin": "",
            "country": ""
        }
    }
    ```

### vnstat - network traffic monitor

☝ [Table of contents](#table-of-contents)

Network traffic monitor for Linux and BSD

[GitHub](https://github.com/vergoh/vnstat)

Install via `apt`

```bash
# simulate install to check package version
$ apt instal -s vnstat

$ sudo apt install vnstat vnstati
```

List your network interfaces

```bash
$ vnstat --iflist
Available interfaces: {{ INTERFACE_NAME }} (1000 Mbit) ...
```

Setup network interface to use

```bash
$ sudo vnstat --iface {{ INTERFACE_NAME }}
$ sudo vnstat --update --iface {{ INTERFACE_NAME }}
```

Start `systemd` service

```bash
$ sudo systemctl enable vnstat.service
```

Generate graph about traffic

```bash
$ vnstati \
    -vs \
    -i {{ INTERFACE_NAME }} \
    -o $HOME/traffic-monitor-summary.png
```

Database path - `/var/lib/vnstat/vnstat.db`

Configuration file - `/etc/vnstat.conf`

Related tools

- [vnstat-dashboard](https://github.com/alexandermarston/vnstat-dashboard)

    A responsive web UI to view network traffic statistics provided by vnStat (with support for version 2.x)

    Issues
    - lots of warnings with debian 8.11 and php 7.2 #47 - [fix](https://github.com/alexandermarston/vnstat-dashboard/issues/47#issuecomment-653746262)

Related links
- [How can you monitor total internet data usage across reboots?](https://askubuntu.com/questions/1459/how-can-you-monitor-total-internet-data-usage-across-reboots)
- [Monitoring Network Bandwidth and Speed in Linux](https://itsfoss.com/network-speed-monitor-linux/)
- [Ubuntu install vnstat console network traffic monitor](https://www.cyberciti.biz/faq/ubuntu-install-vnstat-console-network-traffic-monitor/)

### [httpie](https://httpie.io/) - simple http requests on terminal

☝ [Table of contents](#table-of-contents)

As easy as HTTPie /aitch-tee-tee-pie/ pie Modern command-line HTTP client – user-friendly curl alternative with intuitive UI, JSON support, syntax highlighting, wget-like downloads, extensions, etc

[GitHub](https://github.com/jakubroztocil/httpie)

Install via `pip`

```bash
# install in $HOME/.local/bin
$ pip install --user -U httpie

# if pip was already installed with --user,
# don't need `sudo` neither `--user`
$ pip install -U httpie

# install in /usr/bin or /usr/local/bin
# because pip is installed at system directory
# requires `sudo`
$ sudo pip install -U httpie
```

### tmux - multiple sessions

☝ [Table of contents](#table-of-contents)

Terminal multiplexer

[GitHub](https://github.com/tmux/tmux)

Simulate install to check package version in your package repository

```bash
$ apt install -s tmux
...
tmux is already the newest version (3.0a-2ubuntu0.2).
...
```

Package dependencies

```
autoconf
automake
autopoint
autoreconf
autotools-dev
debhelper
dh-autoreconf
dh-strip-nondeterminism
dwz
gettext
intltool-debian
libarchive-cpio-perl
libarchive-zip-perl
libcroco3
libdebhelper-perl
libevent-dev
libfile-stripnondeterminism-perl
libltdl-dev
libmail-sendmail-perl
libncursesw5
libncursesw5-dev
libsigsegv2
libsub-override-perl
libsys-hostname-long-perl
libtool
m4
po-debconf
```

Install via `apt`

```bash
$ sudo apt install bash
```

Install from `master` branch

```bash
$ cd $HOME
$ git clone https://github.com/tmux/tmux
$ cd tmux/
$ ./autogen.sh
$ ./configure
$ make
$ cp tmux $HOME/bin
$ cd $HOME
$ rm -rf $HOME/tmux
```

### [tree](http://mama.indstate.edu/users/ice/tree/) - file / folder structure

☝ [Table of contents](#table-of-contents)

Recursive directory listing command that produces a depth indented listing of files, which is colorized ala dircolors if the `LS_COLORS` environment variable is set and output is to tty.

[GitHub](https://github.com/nodakai/tree-command)

Install it

```bash
# -a   All files are listed.
# -f   Print the full path prefix for each file.
# -d   only folders
# -L   {{ number }}, where {{ number }} is level of depth
# -p   Print the protections for each file.

$ sudo apt install tree
```

Related links
- 2019-10-04 - [Linux ‘tree Command’ Usage Examples for Beginners](https://www.tecmint.com/linux-tree-command-examples/)

### unrar - decompress files

☝ [Table of contents](#table-of-contents)

Unarchiver for .rar files

Install it

```bash
$ sudo apt install unrar
```

### [ffmpeg](https://ffmpeg.org/) - handle multimedia files

☝ [Table of contents](#table-of-contents)

A complete, cross-platform solution to record, convert and stream audio and video.

[GitHub](https://github.com/FFmpeg/FFmpeg)

Install it

```bash
# 2020-05-28 18:30:43
$ sudo apt install ffmpeg
# Conf ffmpeg (7:4.2.2-1ubuntu1 Ubuntu:20.04/focal [amd64])
```

Related links
- [Ubuntu 20.04 FFmpeg installation](https://linuxconfig.org/ubuntu-20-04-ffmpeg-installation)

### jq - handle json files

☝ [Table of contents](#table-of-contents)

Command-line JSON processor

[GitHub](https://github.com/stedolan/jq)

Download binary

```bash
$ wget \
    -O $HOME/bin/jq \
    https://github.com/stedolan/jq/releases/download/jq-1.6/jq-linux64
```

Assign permissions

```bash
$ chmod u+x $HOME/bin/jq
```

Usage

- Pretty print **ugly** json

    ```bash
    $ jq . {{ json file }}
    ```

### wrk - http benchmark

☝ [Table of contents](#table-of-contents)

Modern HTTP benchmarking tool

[GitHub](https://github.com/wg/wrk)

Install from `master` branch

```bash
$ cd $HOME
$ git clone https://github.com/wg/wrk
$ cd wrk
$ make
$ cp wrk $HOME/bin/wrk
```

Usage

```
# -c  --connections: total number of HTTP connections to keep open with
#                    each thread handling N = connections/threads
# -d  --duration:    duration of the test, e.g. 2s, 2m, 2h
# -t  --threads:     total number of threads to use
# -s  --script:      LuaJIT script, see SCRIPTING
# -H  --header:      HTTP header to add to request, e.g. "User-Agent: wrk"
#     --latency:     print detailed latency statistics
#     --timeout:     record a timeout if a response is not received within
#                    this amount of time.
```

Alternatives

- [wrk2](https://github.com/giltene/wrk2)

    A constant throughput, correct latency recording variant of wrk

    Install from `GitHub`

    ```bash
    $ git clone https://github.com/giltene/wrk2
    $ cd wrk2
    $ make
    $ cp wrk $HOME/bin/wrk2
    ```

Related links
- [denji/awesome-http-benchmark](https://github.com/denji/awesome-http-benchmark) - HTTP(S) benchmark tools, testing/debugging, & restAPI (RESTful)
- TechEmpower - [Benchmarks](https://www.techempower.com/benchmarks/) - [GitHub](https://github.com/TechEmpower/FrameworkBenchmarks) - Source for the TechEmpower Framework Benchmarks project

### [youtube-dl](https://ytdl-org.github.io/youtube-dl/) - youtube downloader

☝ [Table of contents](#table-of-contents)

Command-line program to download videos from YouTube.com and other video sites

[GitHub](https://github.com/ytdl-org/youtube-dl)

Install it

```bash
# install directly from github using wget on $HOME/bin (could be $HOME/.local/bin)
# without using sudo
$ wget \
    -O $HOME/bin/youtube-dl \
    https://yt-dl.org/downloads/latest/youtube-dl

$ chmod u+rx $HOME/bin/youtube-dl
```

### [ngrok](https://ngrok.com/) - expose local web server to internet

☝ [Table of contents](#table-of-contents)

Public URLs for exposing your local web server.

Install it

```bash
# https://ngrok.com/download
$ cd $HOME
$ wget \
    -O $HOME/ngrok.zip \
    https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip
$ unzip $HOME/ngrok.zip
$ mv $HOME/ngrok $HOME/bin/
$ rm ngrok.zip
```

### httpstat - stats about http requests

☝ [Table of contents](#table-of-contents)

It's like curl -v, with graphs and colors

[GitHub](https://github.com/davecheney/httpstat)

Download `.sh` file and install it

```bash
# install in $HOME/bin
$ wget \
    -O $HOME/bin/httpstat \
    https://raw.githubusercontent.com/b4b4r07/httpstat/master/httpstat.sh

$ chmod u+x $HOME/bin/httpstat
```

Install via `go`

```bash
# install on $GOPATH/bin folder
$ go get github.com/davecheney/httpstat
```

Install via `pip`

```bash
$ pip install httpstat
```

Similar tools
- in [bash](https://github.com/b4b4r07/httpstat)
- in [Go](https://github.com/davecheney/httpstat)
- in [Python](https://github.com/reorx/httpstat)

### neofetch - info about your computer

☝ [Table of contents](#table-of-contents)

A command-line system information tool written in bash 3.2+

[GitHub](https://github.com/dylanaraps/neofetch)

Install via `apt`

```bash
$ sudo apt install neofetch
```

### hwinfo - info about hardware devices

☝ [Table of contents](#table-of-contents)

Hardware information tool

[GitHub](https://github.com/openSUSE/hwinfo)

Install via `apt`

```bash
$ apt install hwinfo
```

Usage

```bash
$ hwinfo --disk
...
Device Files: /dev/nvme0n1, /dev/disk/by-id/nvme-Samsung_SSD_950_PRO_512GB_S2GMNX0H413184R
...
```

### [geekbench](https://www.geekbench.com/) - cross-platform benchmark

☝ [Table of contents](#table-of-contents)

Download it

```bash
$ wget https://cdn.geekbench.com/Geekbench-5.3.1-Linux.tar.gz
```

Uncompress it

```bash
$ tar -xvz -f Geekbench-5.3.1-Linux.tar.gz
```

Use it

```bash
$ ./geekbench5 --cpu
```

Related links
- [2020-12-23 results](https://browser.geekbench.com/v5/cpu/5493141)
- [Geekbench 5 Pro Command Line Tool](http://support.primatelabs.com/kb/geekbench/geekbench-5-pro-command-line-tool)
- [Installing Geekbench 5 on Linux](http://support.primatelabs.com/kb/geekbench/installing-geekbench-5-on-linux)


### [ufw](https://help.ubuntu.com/community/UFW) - firewall tool

☝ [Table of contents](#table-of-contents)

Uncomplicated Firewall

```bash
$ sudo apt install ufw
```

Related tools

- [Gufw](https://help.ubuntu.com/community/Gufw) - firewall powered by UFW

    Install it

    ```bash
    $ sudo apt install gufw
    ```

- [evilsocket/opensnitch](https://github.com/evilsocket/opensnitch) - OpenSnitch is a GNU/Linux port of the Little Snitch application firewall

    [Installation](https://github.com/gustavo-iniguez-goya/opensnitch/wiki/Installation)

### googler - googling via terminal

☝ [Table of contents](#table-of-contents)

[GitHub](https://github.com/jarun/googler)

Install it

```bash
# download binary
$ wget \
    -O $HOME/bin/googler \
    https://raw.githubusercontent.com/jarun/googler/v4.1/googler

# assign permissions
$ chmod u+x $HOME/bin/googler
```

### screenkey - display key pressed

☝ [Table of contents](#table-of-contents)

[GitLab](https://gitlab.com/screenkey/screenkey)

Package dependencies

- [naelstrof/slop](https://github.com/naelstrof/slop)

    slop (Select Operation) is an application that queries for a selection from the user and prints the region to stdout.

    Install via `apt`

    ```bash
    # simulate install to check package version
    # (2020-06-01 17:50:59)
    $ apt install -s slop
    # slop is already the newest version (7.4-1ubuntu2).

    $ sudo apt install slop
    ```

Install it

```bash
$ git clone https://gitlab.com/screenkey/screenkey

$ cd screenkey

$ ./screenkey --show-settings

$ ./setup.py install --user --record files.txt

$ cat files.txt
$HOME/.local/lib/python3.8/site-packages/screenkey-1.1-py3.8.egg
$HOME/.local/bin/screenkey

$ which -a screenkey
$HOME/.local/bin/screenkey
```

Config file - `$HOME/.config/screenkey.json`

### exiftool - manage meta info from files

☝ [Table of contents](#table-of-contents)

Meta information reader/writer

[GitHub](https://github.com/exiftool/exiftool)

Set date time on pictures

```bash
$ exiftool -AllDates="2015:09:22 12:00:00"
```

### [iproute2](https://en.wikipedia.org/wiki/Iproute2) - manage networking stuffs

☝ [Table of contents](#table-of-contents)

collection of userspace utilities for controlling and monitoring various aspects of networking in the Linux kernel, including routing, network interfaces, tunnels, traffic control, and network-related device drivers.

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

Related tools

- [iftop](https://linux.die.net/man/8/iftop) - display bandwidth usage on an interface by host
- [traceroute](https://en.wikipedia.org/wiki/Traceroute) - computer network diagnostic commands for displaying possible routes (paths) and measuring transit delays of packets across an Internet Protocol (IP) network.
- [mtr](https://linux.die.net/man/8/mtr) - a network diagnostic tool
- [nethogs](https://linux.die.net/man/8/nethogs) - Net top tool grouping bandwidth per process
- [nload](https://linux.die.net/man/1/nload) - displays the current network usage
- [iPerf](https://iperf.fr/) - a tool for active measurements of the maximum achievable bandwidth on IP networks
- [CBM](https://zenway.ru/page/cbm) - [GitHub](https://github.com/resurrecting-open-source-projects/cbm) - display in real time the network traffic speed

### [powertop](https://01.org/powertop) - monitor electrical power consumption

☝ [Table of contents](#table-of-contents)

The Linux PowerTOP tool

[GitHub](https://github.com/fenrus75/powertop)

Packages needed

```
- Pciutils-devel   -> libpci-dev
- Ncurses-devel    -> libncurses5-dev
- Libnl-devel      -> libnl-genl-3-dev
- autopoint
- dh-autoreconf
- autoconf-archive
```

Download `.tar.gz` file

```bash
$ wget \
    -O powertop.tar.gz \
    https://01.org/sites/default/files/downloads/powertop-2.12.tar.gz
```

Install via `GitHub`

```bash
$ git clone https://github.com/fenrus75/powertop
$ git checkout v2.12
$ cd powertop/
$ ./autogen.sh
$ ./configure
$ make
$ cp src/powertop $HOME/bin/
$ cd $HOME
$ rm -rf powertop/
```

Related tools
- [iotop](https://linux.die.net/man/1/iotop) - simple top-like I/O monitor
- [perf top](https://linux.die.net/man/1/perf-top) - System profiling tool
- [ncdu](https://dev.yorhel.nl/ncdu) - Ncdu is a disk usage analyzer with an ncurses interface.
- [nmon](http://nmon.sourceforge.net/pmwiki.php) - Nigel's performance Monitor for Linux
- [bmon](https://linux.die.net/man/1/bmon) - Portable bandwidth monitor and rate estimator - [GitHub](https://github.com/tgraf/bmon)
- [lm-sensors](https://hwmon.wiki.kernel.org/lm_sensors) - [GitHub](https://github.com/lm-sensors/lm-sensors) - Linux hardware monitoring

### espanso - text expander

☝ [Table of contents](#table-of-contents)

Cross-platform Text Expander written in Rust

Find it on `snap`

```bash
$ snap find espanso
```

Check `confinement` level

```bash
$ snap info --verbose espanso
...
notes:
  private:     false
  confinement: classic
...
```

Install it via `snap` (on `Linux`, instructions [here](https://espanso.org/install/linux/#installing-on-ubuntu--debian))

```bash
$ snap install espanso --classic
```

If install without `sudo` will request your password through a pop-up

Where it installed

```bash
$ which espanso
/snap/bin/espanso
```

How to start it

```bash
$ espanso start
espanso must be registered to systemd (user level) first. Do you want to proceed? yes
Creating service entry: ${HOME}/.config/systemd/user/espanso.service
Entry will point to: /snap/espanso/84/bin/espanso
Service file created correctly!
Enabling espanso for systemd...
Created symlink ${HOME}/.config/systemd/user/default.target.wants/espanso.service → ${HOME}/.config/systemd/user/espanso.service.
Service registered correctly!
Daemon started correctly!
```

In case next error:

```
Error: 'notify-send' command is needed for espanso to work correctly, please install it.

Pre-check was not successful, espanso could not be started.
```

install `libnotify-bin` dependecy

```bash
$ sudo apt install libnotify-bin
```

Installing [modulo](https://github.com/federico-terzi/modulo/)

```bash
$ wget \
    -O $HOME/bin/modulo \
    https://github.com/federico-terzi/modulo/releases/download/v0.1.1/modulo-x86_64.AppImage

$ chmod u+x $HOME/bin/modulo
```

Show configuration folders

```bash
$ espanso path
Config: ${HOME}/.config/espanso
Packages: ${HOME}/.local/share/espanso/packages
Data: ${HOME}/.local/share/espanso
```

Edit configuration

```bash
$ espanso edit
```

My configuration

```yaml
matches:
  - trigger: ":date"
    replace: "{{mydate}}"
    vars:
      - name: mydate
        type: date
        params:
          format: "%Y-%m-%d"

  - trigger: ":dt"
    replace: "{{mydatetime}}"
    vars:
      - name: mydatetime
        type: date
        params:
          format: "%F %T"
```


To activate/deactivate press `Alt` twice


- [GitHub](https://github.com/federico-terzi/espanso)
- [Docs](https://espanso.org/docs/)
    - [Getting Started](https://espanso.org/docs/get-started/)
    - [Configuration](https://espanso.org/docs/configuration/)

### Keepassxc - password manager

☝ [Table of contents](#table-of-contents)

KeePassXC is a cross-platform community-driven port of the Windows application “Keepass Password Safe”.

[GitHub](https://github.com/keepassxreboot/keepassxc)

Install via `.AppImage` file

```bash
$ wget \
    -O $HOME/bin/keepassxc \
    https://github.com/keepassxreboot/keepassxc/releases/download/2.6.1/KeePassXC-2.6.1-x86_64.AppImage

$ chmod u+x $HOME/bin/keepassxc
```

Create `.desktop` file on `$HOME/.local/share/applications/keepassxc.desktop`

```ini
[Desktop Entry]
Name=KeePassXC
GenericName=Password Manager
Comment=Community-driven port of the Windows application “KeePass Password Safe”
Exec=keepassxc %f
TryExec=keepassxc
Icon=keepassxc
StartupWMClass=keepassxc
StartupNotify=true
Terminal=false
Type=Application
Version=1.0
Categories=Utility;Security;Qt;
MimeType=application/x-keepass2;
```

Add `icon` files

```bash
$ wget \
    -O $HOME/.icons/keepassxc.svg \
    https://github.com/keepassxreboot/keepassxc/raw/develop/share/icons/application/scalable/apps/keepassxc.svg
```

Build cache database of MIME types handled by desktop files

```bash
$ update-desktop-database $HOME/.local/share/applications/
```

Related links
- [How do I use the KeePassXC CLI tool with the AppImage?](https://keepassxc.org/docs/#faq-appsnap-appimage-cli)
- [KeepassXC Question about CLI](https://www.reddit.com/r/KeePass/comments/a5tjx2/keepassxc_question_about_cli/)

### [AWS CLI](https://aws.amazon.com/cli/)

☝ [Table of contents](#table-of-contents)

[GitHub](https://github.com/aws/aws-cli)

Related links
- [Installing, updating, and uninstalling the AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-install.html)
- [Configuring the AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-configure.html)
- [open-guides/og-aws](https://github.com/open-guides/og-aws) - :books: Amazon Web Services — a practical guide

### [Carbon](https://carbon.now.sh/) - beautify source code as img

☝ [Table of contents](#table-of-contents)

Create and share beautiful images of your source code

[GitHub](https://github.com/carbon-app/carbon)

Related tools
- [octref/polacode](https://github.com/octref/polacode) - 📸 Polaroid for your code

### [Project Jupyter](https://jupyter.org/) - interactive notebook

☝ [Table of contents](#table-of-contents)

Project Jupyter exists to develop open-source software, open-standards, and services for interactive computing across dozens of programming languages.

[GitHub](https://github.com/jupyter/jupyter)

Install dependencies

```bash
$ sudo apt install ipython ipython-notebook
```

Install via `pip`

```bash
$ pip install jupyterlab
$ pip install notebook
```

Try it

```bash
$ jupyter notebook
```

Related links
- [Installing the Jupyter Software](https://jupyter.org/install)

### Java

☝ [Table of contents](#table-of-contents)

Related links
- [How to Install Java on Ubuntu 18.04](https://linuxize.com/post/install-java-on-ubuntu-18-04/)
- [How To Install Oracle Java 14 (JDK 14) On Ubuntu, Debian Or Linux Mint From APT PPA Repository](https://www.linuxuprising.com/2020/03/how-to-install-oracle-java-14-jdk14-on.html)
- [How To Install Java with Apt on Ubuntu 20.04](https://www.digitalocean.com/community/tutorials/how-to-install-java-with-apt-on-ubuntu-20-04)

### Z

☝ [Table of contents](#table-of-contents)

[GitHub](https://github.com/rupa/z/blob/master/z.sh) - z - jump around

Download script

```bash
$ wget -O $HOME/bin/z.sh https://raw.githubusercontent.com/rupa/z/master/z.sh
```

Assign permission to execute

```bash
$ chmod u+x $HOME/bin/z.sh
```

Add setup to `$HOME/.bashrc`

```text
...
. $HOME/bin/z.sh
...
```

### direnv


### Node.js Javascript runtime

First install nvm

```bash
$ curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash
...
=> Appending nvm source string to $HOME/.bashrc
=> Appending bash_completion source string to $HOME/.bashrc
=> Close and reopen your terminal to start using nvm or run the following to use it now:

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
```

Verify installation

```bash
$ command -v nvm
```

Node versions available

```bash
$ nvm list-remote
```

Install a specific version of node

```bash
$ nvm install v14.16.0
Downloading and installing node v14.16.0...
Downloading https://nodejs.org/dist/v14.16.0/node-v14.16.0-linux-x64.tar.xz...
######################################################################## 100.0%
Computing checksum with sha256sum
Checksums matched!
Now using node v14.16.0 (npm v6.14.11)
Creating default alias: default -> v14.16.0
```

Retrieve nvm setup with node version already installed

```bash
$ nvm list
->     v14.16.0
default -> v14.16.0
iojs -> N/A (default)
unstable -> N/A (default)
node -> stable (-> v14.16.0) (default)
stable -> 14.16 (-> v14.16.0) (default)
lts/* -> lts/fermium (-> v14.16.0)
lts/argon -> v4.9.1 (-> N/A)
lts/boron -> v6.17.1 (-> N/A)
lts/carbon -> v8.17.0 (-> N/A)
lts/dubnium -> v10.24.0 (-> N/A)
lts/erbium -> v12.21.0 (-> N/A)
lts/fermium -> v14.16.0
```

Use a node version

```bash
$ nvm use v14.16.0
```

Valide node version

```bash
$ node -v
v14.16.0
```

## Troubleshooting

### Spotify

☝ [Table of contents](#table-of-contents)

[SOLVED: Spotify desktop client communication failed | Mike Dixson](https://mikedixson.com/2014/11/solved-spotify-desktop-client-communication-failed/)

[Spotify keyboard controls not working](https://askubuntu.com/a/1152539/879600)

- Fix `Play/Pause`

    ```bash
    $ dbus-send \
        --print-reply \
        --dest=org.mpris.MediaPlayer2.spotify \
        /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.PlayPause
    ```

- Fix `Stop`

    ```bash
    $ dbus-send \
        --print-reply \
        --dest=org.mpris.MediaPlayer2.spotify \
        /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Stop
    ```

- Fix `Next`

    ```bash
    $ dbus-send \
        --print-reply \
        --dest=org.mpris.MediaPlayer2.spotify \
        /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Next
    ```

- Fix `Previous`

    ```bash
    $ dbus-send \
        --print-reply \
        --dest=org.mpris.MediaPlayer2.spotify \
        /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Previous
    ```

- Other option: disable hardware-media-key-handling from chrome [link](chrome://flags/#hardware-media-key-handling)

- Related links
    - Google - [gnome play button spotify](https://www.google.com/search?q=gnome+play+button+spotify)
    - [Spotify Media Keys Fix on Ubuntu 20.04 Gnome | TUTORIAL |](https://www.youtube.com/watch?v=Z3bqIjA8Dso)
    - [Media controls on Gnome like play, pause, next, volume up/down](https://www.reddit.com/r/gnome/comments/ghg7y0/media_controls_on_gnome_like_play_pause_next/)

### VS Code

☝ [Table of contents](#table-of-contents)

[[mitigated] Linux: Ctrl+Shift+E cannot be used as keybinding anymore](https://github.com/microsoft/vscode/issues/48480)

- The idea is to remove content on shorcuts which appears [here](https://i.imgur.com/PMxFsuh.png)

- Steps:
    - Run `ibus-setup` on a terminal
    - Go to `Emoji` tab
    - Press `...` button next to `Emoji annotation`, this choice is to get `select keyboard shortcut for switching` window
    - Press `delete` button to delete shortcut and leave nothing there
    - Press OK
    - Repeat process for `Unicode code point`
    - Close
    - Run `GTK_IM_MODULE=ibus` on a terminal. This should work!
    - If it does just alias this as I put in the post above

## Final links

☝ [Table of contents](#table-of-contents)

- [How To Delete A Repository And GPG Key In Ubuntu](https://www.ostechnix.com/how-to-delete-a-repository-and-gpg-key-in-ubuntu/)
- [Lissy93/personal-security-checklist](https://github.com/Lissy93/personal-security-checklist) - A curated checklist of 300+ tips for protecting digital security and privacy in 2020
- [The Spamhaus project](https://www.spamhaus.org/) - track email spammers and spam-related activity
- 2020-03-19 - [Using Cloudflare Gateway to Stay Productive (and turn off distractions) While Working Remotely](https://blog.cloudflare.com/using-cloudflare-gateway-to-stay-productive-and-turn-off-distractions-while-working-remotely/)
