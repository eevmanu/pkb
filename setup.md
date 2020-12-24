<!-- omit in toc -->
# Personal Setup

<!-- omit in toc -->
## Table of contents

- [1. Backup & Restore](#1-backup--restore)
- [2. Things to do after install PopOS](#2-things-to-do-after-install-popos)
- [3. Issue to be aware](#3-issue-to-be-aware)
    - [3.1. Bluetooth](#31-bluetooth)
    - [3.2. Wireless](#32-wireless)
    - [3.3. Screen / Monitor](#33-screen--monitor)
- [4. Revert partial upgrade PopOS verison](#4-revert-partial-upgrade-popos-verison)
- [5. Linux software distributions](#5-linux-software-distributions)
    - [5.1. Snapcraft](#51-snapcraft)
    - [5.2. flatpak](#52-flatpak)
    - [5.3. AppImage](#53-appimage)
- [6. Apps](#6-apps)
    - [6.1. Synaptic - package manager](#61-synaptic---package-manager)
    - [6.2. Flatseal - flatpak permissions manager](#62-flatseal---flatpak-permissions-manager)
    - [6.3. Flux - eye care](#63-flux---eye-care)
    - [6.4. Chrome - browser](#64-chrome---browser)
    - [6.5. VLC media player - play multimedia files](#65-vlc-media-player---play-multimedia-files)
    - [6.6. Visual Studio Code - code editor](#66-visual-studio-code---code-editor)
    - [6.7. Foxit PDF Reader - pdf viewer](#67-foxit-pdf-reader---pdf-viewer)
    - [6.8. Spotify - music streaming](#68-spotify---music-streaming)
    - [6.9. Slack - IM app](#69-slack---im-app)
    - [6.10. Zoom - video call app](#610-zoom---video-call-app)
    - [6.11. Telegram - IM app](#611-telegram---im-app)
    - [6.12. Ksnip - screenshot tool](#612-ksnip---screenshot-tool)
    - [6.13. SimpleScreenRecorder - record screen](#613-simplescreenrecorder---record-screen)
    - [6.14. Peek - record screen](#614-peek---record-screen)
    - [6.15. CopyQ - clipboard manager](#615-copyq---clipboard-manager)
    - [6.16. TeamViewer - remote control](#616-teamviewer---remote-control)
    - [6.17. OBS Studio - streaming](#617-obs-studio---streaming)
    - [6.18. DBeaver - database tool](#618-dbeaver---database-tool)
    - [6.19. BleachBit - clean disk space](#619-bleachbit---clean-disk-space)
    - [6.20. Stacer - monitor system resources](#620-stacer---monitor-system-resources)
    - [6.21. Wireshark - monitor network traffic](#621-wireshark---monitor-network-traffic)
    - [6.22. Dropbox - online storage](#622-dropbox---online-storage)
    - [6.23. Markdown editor apps](#623-markdown-editor-apps)
        - [6.23.1. Joplin](#6231-joplin)
        - [6.23.2. Marktext](#6232-marktext)
        - [6.23.3. vnote](#6233-vnote)
        - [6.23.4. PKB alternatives](#6234-pkb-alternatives)
    - [6.24. Math](#624-math)
    - [6.25. Finance](#625-finance)
    - [6.26. Extra](#626-extra)
- [7. Commands](#7-commands)
    - [7.1. git - version control manager](#71-git---version-control-manager)
    - [7.2. docker - containers](#72-docker---containers)
    - [7.3. xclip - clipboard manager](#73-xclip---clipboard-manager)
    - [7.4. htop - monitor computer resources](#74-htop---monitor-computer-resources)
    - [7.5. speedtest - internet bandwidth meter](#75-speedtest---internet-bandwidth-meter)
    - [7.6. httpie - simple http requests on terminal](#76-httpie---simple-http-requests-on-terminal)
    - [7.7. tmux - multiple sessions](#77-tmux---multiple-sessions)
    - [7.8. tree - file / folder structure](#78-tree---file--folder-structure)
    - [7.9. unrar - decompress files](#79-unrar---decompress-files)
    - [7.10. ffmpeg - handle multimedia files](#710-ffmpeg---handle-multimedia-files)
    - [7.11. jq - handle json files](#711-jq---handle-json-files)
    - [7.12. wrk - http benchmark](#712-wrk---http-benchmark)
    - [7.13. youtube-dl - youtube downloader](#713-youtube-dl---youtube-downloader)
    - [7.14. ngrok - expose local web server to internet](#714-ngrok---expose-local-web-server-to-internet)
    - [7.15. httpstat - stats about http requests](#715-httpstat---stats-about-http-requests)
    - [7.16. neofetch - info about your computer](#716-neofetch---info-about-your-computer)
    - [7.17. hwinfo - info about hardware devices](#717-hwinfo---info-about-hardware-devices)
    - [7.18. geekbench - cross-platform benchmark](#718-geekbench---cross-platform-benchmark)
    - [7.19. ufw - firewall tool](#719-ufw---firewall-tool)
    - [7.20. googler - googling via terminal](#720-googler---googling-via-terminal)
    - [7.21. exiftool - manage meta info from files](#721-exiftool---manage-meta-info-from-files)
    - [7.22. iproute2 - manage networking stuffs](#722-iproute2---manage-networking-stuffs)
    - [7.23. powertop - monitor electrical power consumption](#723-powertop---monitor-electrical-power-consumption)
    - [7.24. AWS CLI](#724-aws-cli)
    - [7.25. Carbon - beautify source code as img](#725-carbon---beautify-source-code-as-img)
    - [7.26. Project Jupyter - interactive notebook](#726-project-jupyter---interactive-notebook)
    - [7.27. Java](#727-java)
- [8. Troubleshooting](#8-troubleshooting)
    - [8.1. Spotify](#81-spotify)
    - [8.2. VS Code](#82-vs-code)
- [9. Final links](#9-final-links)

## 1. Backup & Restore

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

## 2. Things to do after install PopOS

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
    - [pop-os/fonts](https://github.com/pop-os/fonts)
    - [rsms/inter](https://github.com/rsms/inter)
    - [most starred repo with `font`](https://github.com/search?q=font&s=stars&type=Repositories)

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

## 3. Issue to be aware

### 3.1. Bluetooth

☝ [Table of contents](#table-of-contents)

Setup Amazon Echo device as speaker

- Location of config files

    ```bash
    $ ls /etc/bluetooth/
    input.conf  main.conf  network.conf
    ```

- Try with [Blueman]((https://github.com/blueman-project/blueman))

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

    Related links
    - Github Wiki - [Troubleshooting](https://github.com/blueman-project/blueman/wiki/Troubleshooting)

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

### 3.2. Wireless

☝ [Table of contents](#table-of-contents)

[System76 - Support - Solve Wireless Issues](https://support.system76.com/articles/wireless/)

### 3.3. Screen / Monitor

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

## 4. Revert partial upgrade PopOS verison

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

## 5. Linux software distributions

### 5.1. [Snapcraft](https://snapcraft.io/)

☝ [Table of contents](#table-of-contents)

Install it

```bash
$ sudo apt update
$ sudo apt install snapd
```

Related links
- [Install on Ubuntu](https://snapcraft.io/docs/installing-snap-on-ubuntu)

### 5.2. [flatpak](https://flatpak.org/)

☝ [Table of contents](#table-of-contents)

Directories used
- `$HOME/.cache/flatpak`
- `$HOME/.local/share/flatpak`

### 5.3. [AppImage](https://appimage.org/)

☝ [Table of contents](#table-of-contents)

## 6. Apps

### 6.1. Synaptic - package manager

☝ [Table of contents](#table-of-contents)

Graphical package manager

Install via `apt`

```bash
# simulate to check package version
$ apt install -s synaptic

$ sudo apt install synaptic
```

### 6.2. Flatseal - flatpak permissions manager

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

### 6.3. [Flux](https://justgetflux.com/) - eye care

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

### 6.4. [Chrome](https://www.google.com/chrome/) - browser

☝ [Table of contents](#table-of-contents)

Download it

```bash
$ wget \
    -O chrome.deb \
    https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
```

Useful Extensions
- [Canvas Blocker (Fingerprint protect)](https://chrome.google.com/webstore/detail/canvas-blocker-fingerprin/nomnklagbgmgghhjidfhnoelnjfndfpd/)
    - [Browser leaks - HTML5 Canvas Fingerprinting](https://browserleaks.com/canvas)
- [ClearUrls](https://gitlab.com/KevinRoebert/ClearUrls)
- [Cookie-AutoDelete](https://github.com/Cookie-AutoDelete/Cookie-AutoDelete)

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
        https://download.opensuse.org/repositories/home:/ungoogled_chromium/Ubuntu_Focal/amd64/ungoogled-chromium_81.0.4044.138-1.focal1_amd64.deb \
        -O $HOME/ungoogled_chromium.deb
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
        -O "/etc/apt/trusted.gpg.d/home:ungoogled_chromium.asc" \
        -nv \
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

### 6.5. [VLC media player](https://www.videolan.org/vlc/download-ubuntu.html) - play multimedia files

☝ [Table of contents](#table-of-contents)

[GitHub](https://github.com/videolan/vlc)

Install via `apt`

```bash
$ sudo apt install vlc
```

Install via `Snap`

```bash
$ snap install vlc
```

### 6.6. [Visual Studio Code](https://code.visualstudio.com/docs/setup/linux) - code editor

☝ [Table of contents](#table-of-contents)

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

Alternatives
- [VSCodium/vscodium](https://github.com/VSCodium/vscodium)
- Visual Studio Code [Insiders](https://code.visualstudio.com/insiders/)

Related links:
- [FAQ](https://code.visualstudio.com/docs/supporting/faq)
- [User and Workspace Settings](https://code.visualstudio.com/docs/getstarted/settings)
- [How can you export the Visual Studio Code extension list?](https://stackoverflow.com/questions/35773299/how-can-you-export-the-visual-studio-code-extension-list)
- [How do I remove VS Code & settings from Ubuntu?](https://superuser.com/questions/1113022/how-do-i-remove-vs-code-settings-from-ubuntu)
- [How to change indentation in Visual Studio Code?](https://stackoverflow.com/questions/34174207/how-to-change-indentation-in-visual-studio-code)

### 6.7. [Foxit PDF Reader](https://www.foxitsoftware.com/pdf-reader/) - pdf viewer

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

### 6.8. [Spotify](https://www.spotify.com/download/linux/) - music streaming

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

### 6.9. [Slack](https://slack.com/intl/en-us/downloads/linux) - IM app

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

### 6.10. [Zoom](https://support.zoom.us/hc/en-us/articles/204206269-Installing-or-updating-Zoom-on-Linux) - video call app

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

### 6.11. [Telegram](https://telegram.org/dl/desktop/linux) - IM app

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

### 6.12. [Ksnip](https://github.com/ksnip/ksnip) - screenshot tool

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

### 6.13. [SimpleScreenRecorder](http://www.maartenbaert.be/simplescreenrecorder/) - record screen

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

### 6.14. Peek - record screen

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

### 6.15. CopyQ - clipboard manager

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
    -nv https://download.opensuse.org/repositories/home:manuelschneid3r/xUbuntu_20.04/Release.key

$ sudo apt update

$ apt install -s albert

$ sudo apt install albert
```

Related links
- [Using it](https://albertlauncher.github.io/docs/using/)
- [GPG Signature error for Ubuntu Repo - Solution](https://github.com/albertlauncher/albert/issues/865#issuecomment-572396128)

### 6.16. [TeamViewer](https://www.teamviewer.com/en/download/linux/) - remote control

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

### 6.17. [OBS Studio](https://obsproject.com/wiki/install-instructions#linux) - streaming

☝ [Table of contents](#table-of-contents)

[GitHub](https://github.com/obsproject/obs-studio)

Install it

```bash
$ sudo add-apt-repository ppa:obsproject/obs-studio
$ sudo apt update
$ sudo apt install obs-studio
```

### 6.18. [DBeaver](https://dbeaver.io/) - database tool

☝ [Table of contents](#table-of-contents)

Free multi-platform database tool for developers, database administrators, analysts and all people who need to work with databases. Supports all popular databases: MySQL, PostgreSQL, SQLite, Oracle, DB2, SQL Server, Sybase, MS Access, Teradata, Firebird, Apache Hive, Phoenix, Presto, etc.

[GitHub](https://github.com/dbeaver/dbeaver)

Install via `flatpak`

```bash
$ flatpak install flathub io.dbeaver.DBeaverCommunity

# run
$ flatpak run io.dbeaver.DBeaverCommunity
```

### 6.19. [BleachBit](https://www.bleachbit.org/) - clean disk space

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

### 6.20. Stacer - monitor system resources

☝ [Table of contents](#table-of-contents)

Linux System Optimizer and Monitoring

[GitHub](https://github.com/oguzhaninan/Stacer)

### 6.21. [Wireshark](https://www.wireshark.org/download.html) - monitor network traffic

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

### 6.22. [Dropbox](https://www.dropbox.com/install-linux) - online storage

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

### 6.23. Markdown editor apps

#### 6.23.1. [Joplin](https://joplinapp.org/)

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

#### 6.23.2. [Marktext](https://marktext.app/)

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

#### 6.23.3. [vnote](https://vnotex.github.io/vnote/en_us/)

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

#### 6.23.4. PKB alternatives

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

### 6.24. Math

List

- [GNU Octave](https://flathub.org/apps/details/org.octave.Octave)
- [ZeGrapher](https://github.com/AdelKS/ZeGrapher)
- [desmos](https://www.desmos.com/calculator)
- [GeoGebra ](https://www.geogebra.org/graphing)

Related links

- [What’s another good online calculator like Desmos, but without the graphing, and more space for equations?](https://www.quora.com/What%E2%80%99s-another-good-online-calculator-like-Desmos-but-without-the-graphing-and-more-space-for-equations/answer/Jules-Opeth-Manson)

### 6.25. Finance

List

- [GNU Cash](https://flathub.org/apps/details/org.gnucash.GnuCash)
- [firefly-iii](https://github.com/firefly-iii/firefly-iii)

### 6.26. Extra

- [uw-labs/bloomrpc](https://github.com/uw-labs/bloomrpc) - The missing GUI Client for GRPC services

- [Meld](http://meldmerge.org/)

    Visual diff and merge tool targeted at developers.

    [GitLab](https://gitlab.gnome.org/GNOME/meld)

    [Flathub](https://flathub.org/apps/details/org.gnome.meld)

- [kovidgoyal/calibre](https://github.com/kovidgoyal/calibre) - ebook manager

## 7. Commands

### 7.1. [git](https://git-scm.com/) - version control manager

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

### 7.2. docker - containers

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

### 7.3. xclip - clipboard manager

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

### 7.4. [htop](https://htop.dev/) - monitor computer resources

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


### 7.5. speedtest - internet bandwidth meter

☝ [Table of contents](#table-of-contents)

Command line interface for testing internet bandwidth using speedtest.net

[GitHub](https://github.com/sivel/speedtest-cli)

Install directly from GitHub

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

### 7.6. [httpie](https://httpie.io/) - simple http requests on terminal

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

### 7.7. tmux - multiple sessions

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

### 7.8. [tree](http://mama.indstate.edu/users/ice/tree/) - file / folder structure

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

### 7.9. unrar - decompress files

☝ [Table of contents](#table-of-contents)

Unarchiver for .rar files

Install it

```bash
$ sudo apt install unrar
```

### 7.10. [ffmpeg](https://ffmpeg.org/) - handle multimedia files

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

### 7.11. jq - handle json files

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

### 7.12. wrk - http benchmark

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

### 7.13. [youtube-dl](https://ytdl-org.github.io/youtube-dl/) - youtube downloader

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

### 7.14. [ngrok](https://ngrok.com/) - expose local web server to internet

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

### 7.15. httpstat - stats about http requests

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

### 7.16. neofetch - info about your computer

☝ [Table of contents](#table-of-contents)

A command-line system information tool written in bash 3.2+

[GitHub](https://github.com/dylanaraps/neofetch)

Install via `apt`

```bash
$ sudo apt install neofetch
```

### 7.17. hwinfo - info about hardware devices

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

### 7.18. [geekbench](https://www.geekbench.com/) - cross-platform benchmark

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


### 7.19. [ufw](https://help.ubuntu.com/community/UFW) - firewall tool

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

### 7.20. googler - googling via terminal

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

### 7.21. exiftool - manage meta info from files

☝ [Table of contents](#table-of-contents)

Meta information reader/writer

[GitHub](https://github.com/exiftool/exiftool)

Set date time on pictures

```bash
$ exiftool -AllDates="2015:09:22 12:00:00"
```

### 7.22. [iproute2](https://en.wikipedia.org/wiki/Iproute2) - manage networking stuffs

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

### 7.23. [powertop](https://01.org/powertop) - monitor electrical power consumption

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

### 7.24. [AWS CLI](https://aws.amazon.com/cli/)

☝ [Table of contents](#table-of-contents)

[GitHub](https://github.com/aws/aws-cli)

Related links
- [Installing, updating, and uninstalling the AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-install.html)
- [Configuring the AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-configure.html)
- [open-guides/og-aws](https://github.com/open-guides/og-aws) - :books: Amazon Web Services — a practical guide

### 7.25. [Carbon](https://carbon.now.sh/) - beautify source code as img

☝ [Table of contents](#table-of-contents)

Create and share beautiful images of your source code

[GitHub](https://github.com/carbon-app/carbon)

Related tools
- [octref/polacode](https://github.com/octref/polacode) - 📸 Polaroid for your code

### 7.26. [Project Jupyter](https://jupyter.org/) - interactive notebook

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

### 7.27. Java

☝ [Table of contents](#table-of-contents)

Related links
- [How to Install Java on Ubuntu 18.04](https://linuxize.com/post/install-java-on-ubuntu-18-04/)
- [How To Install Oracle Java 14 (JDK 14) On Ubuntu, Debian Or Linux Mint From APT PPA Repository](https://www.linuxuprising.com/2020/03/how-to-install-oracle-java-14-jdk14-on.html)
- [How To Install Java with Apt on Ubuntu 20.04](https://www.digitalocean.com/community/tutorials/how-to-install-java-with-apt-on-ubuntu-20-04)

## 8. Troubleshooting

### 8.1. Spotify

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

### 8.2. VS Code

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

## 9. Final links

☝ [Table of contents](#table-of-contents)

- [How To Delete A Repository And GPG Key In Ubuntu](https://www.ostechnix.com/how-to-delete-a-repository-and-gpg-key-in-ubuntu/)
- [Lissy93/personal-security-checklist](https://github.com/Lissy93/personal-security-checklist) - A curated checklist of 300+ tips for protecting digital security and privacy in 2020
- [The Spamhaus project](https://www.spamhaus.org/) - track email spammers and spam-related activity
- 2020-03-19 - [Using Cloudflare Gateway to Stay Productive (and turn off distractions) While Working Remotely](https://blog.cloudflare.com/using-cloudflare-gateway-to-stay-productive-and-turn-off-distractions-while-working-remotely/)
