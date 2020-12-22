# Personal Setup

## Table of contents

- [Personal Setup](#personal-setup)
  - [Table of contents](#table-of-contents)
  - [Backup & Restore](#backup--restore)
  - [Things to do after install PopOS](#things-to-do-after-install-popos)
  - [Issue to be aware](#issue-to-be-aware)
    - [Bluetooth](#bluetooth)
    - [Wireless](#wireless)
  - [Revert partial upgrade PopOS verison](#revert-partial-upgrade-popos-verison)
  - [Linux software distributions](#linux-software-distributions)
    - [Snapcraft](#snapcraft)
    - [flatpak](#flatpak)
    - [AppImage](#appimage)
  - [Apps](#apps)
    - [Synaptic](#synaptic)
    - [Flux](#flux)
    - [Chrome](#chrome)
    - [Dropbox](#dropbox)
    - [Spotify](#spotify)
    - [Visual Studio Code](#visual-studio-code)
    - [Telegram](#telegram)
    - [Slack](#slack)
    - [VLC media player](#vlc-media-player)
    - [Foxit PDF Reader](#foxit-pdf-reader)
    - [Zoom](#zoom)
    - [Skype](#skype)
    - [TeamViewer](#teamviewer)
    - [OBS Studio](#obs-studio)
    - [SimpleScreenRecorder](#simplescreenrecorder)
    - [Wireshark](#wireshark)
    - [BleachBit](#bleachbit)
    - [Markdown editor apps](#markdown-editor-apps)
      - [Joplin](#joplin)
      - [Marktext](#marktext)
      - [vnote](#vnote)
      - [PKB alternatives](#pkb-alternatives)
  - [Commands](#commands)
    - [git](#git)
    - [xclip](#xclip)
    - [htop](#htop)
    - [speedtest](#speedtest)
    - [httpie](#httpie)
    - [tmux](#tmux)
    - [tree](#tree)
    - [Docker](#docker)
    - [iproute2](#iproute2)
    - [unrar](#unrar)
    - [ffmpeg](#ffmpeg)
    - [jq](#jq)
    - [wrk](#wrk)
    - [youtube-dl](#youtube-dl)
    - [flameshot](#flameshot)
    - [ksnip](#ksnip)
    - [ngrok](#ngrok)
    - [httpstat](#httpstat)
    - [hwinfo](#hwinfo)
    - [ufw](#ufw)
    - [opensnitch](#opensnitch)
    - [exiftool](#exiftool)
    - [powertop](#powertop)
    - [AWS CLI](#aws-cli)
    - [Carbon](#carbon)
    - [Project Jupyter](#project-jupyter)
    - [Java](#java)
  - [Troubleshooting](#troubleshooting)
    - [Spotify](#spotify-1)
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

Related links
- [most starred repo with `backup`](https://github.com/search?q=backup&s=stars&type=Repositories)
- [most starred repo with `sync`](https://github.com/search?q=sync&s=stars&type=Repositories)

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

## Issue to be aware

### Bluetooth

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

### Wireless

☝ [Table of contents](#table-of-contents)

[System76 - Support - Solve Wireless Issues](https://support.system76.com/articles/wireless/)

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

### Synaptic

☝ [Table of contents](#table-of-contents)

Graphical package manager

```bash
$ apt install synaptic
```

### [Flux](https://justgetflux.com/)

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

### [Chrome](https://www.google.com/chrome/)

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

Alternatives
- [Brave](https://brave.com/) - browser with real privacy

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

### [Dropbox](https://www.dropbox.com/install-linux)

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

### [Spotify](https://www.spotify.com/download/linux/)

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

### [Visual Studio Code](https://code.visualstudio.com/docs/setup/linux)

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

### [Telegram](https://telegram.org/dl/desktop/linux)

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

Related links
- [Changelog - Version history](https://desktop.telegram.org/changelog)
- [Wiki](https://github.com/telegramdesktop/tdesktop/wiki)
    - [Keyboard Shortcuts](https://github.com/telegramdesktop/tdesktop/wiki/Keyboard-Shortcuts)

### [Slack](https://slack.com/intl/en-us/downloads/linux)

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

### [VLC media player](https://www.videolan.org/vlc/download-ubuntu.html)

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

### [Foxit PDF Reader](https://www.foxitsoftware.com/pdf-reader/)

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

### [Zoom](https://support.zoom.us/hc/en-us/articles/204206269-Installing-or-updating-Zoom-on-Linux)

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

Related links
- Install [using the terminal](https://support.zoom.us/hc/en-us/articles/204206269-Installing-or-updating-Zoom-on-Linux#h_89c268b4-2a68-4e4c-882f-441e374b87cb)

### [Skype](https://www.skype.com/en/get-skype/download-skype-for-desktop/)

☝ [Table of contents](#table-of-contents)

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

### [TeamViewer](https://www.teamviewer.com/en/download/linux/)

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

### [OBS Studio](https://obsproject.com/wiki/install-instructions#linux)

☝ [Table of contents](#table-of-contents)

[GitHub](https://github.com/obsproject/obs-studio)

Install it

```bash
$ sudo add-apt-repository ppa:obsproject/obs-studio
$ sudo apt update
$ sudo apt install obs-studio
```

### [SimpleScreenRecorder](http://www.maartenbaert.be/simplescreenrecorder/)

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

### [Wireshark](https://www.wireshark.org/download.html)

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

### [BleachBit](https://www.bleachbit.org/)

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
- [Zettlr](https://www.zettlr.com/) - [github](https://github.com/Zettlr/Zettlr)
- [Zim](https://zim-wiki.org/) - A Desktop Wiki
- [Zotero](https://www.zotero.org/)
- [ZETTELKASTEN - The Archive](https://zettelkasten.de/the-archive/)

## Commands

### [git](https://git-scm.com/)

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

### xclip

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

### [htop](https://htop.dev/)

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

### speedtest

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

### [httpie](https://httpie.io/)

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

### tmux

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

### [tree](http://mama.indstate.edu/users/ice/tree/)

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

### Docker

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


### [iproute2](https://en.wikipedia.org/wiki/Iproute2)

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

### unrar

☝ [Table of contents](#table-of-contents)

Unarchiver for .rar files

Install it

```bash
$ sudo apt install unrar
```

### [ffmpeg](https://ffmpeg.org/)

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

### jq

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

### wrk

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

### [youtube-dl](https://ytdl-org.github.io/youtube-dl/)

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

### flameshot

☝ [Table of contents](#table-of-contents)

Powerful yet simple to use screenshot software

[GitHub](https://github.com/lupoDharkael/flameshot)

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

### [ksnip](https://github.com/ksnip/ksnip)

☝ [Table of contents](#table-of-contents)

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

### [ngrok](https://ngrok.com/)

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

### httpstat

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

### hwinfo

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

### [ufw](https://help.ubuntu.com/community/UFW)

☝ [Table of contents](#table-of-contents)

Uncomplicated Firewall

```bash
$ sudo apt install ufw
```

Related tools
- [Gufw](https://help.ubuntu.com/community/Gufw) - firewall powered by UFW

    Install it

    ```
    $ sudo apt install gufw
    ```

### opensnitch

☝ [Table of contents](#table-of-contents)

OpenSnitch is a GNU/Linux port of the Little Snitch application firewall

[GitHub](https://github.com/evilsocket/opensnitch)

### exiftool

☝ [Table of contents](#table-of-contents)

Meta information reader/writer

[GitHub](https://github.com/exiftool/exiftool)

Set date time on pictures

```bash
$ exiftool -AllDates="2015:09:22 12:00:00"
```

### [powertop](https://01.org/powertop)

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

### [AWS CLI](https://aws.amazon.com/cli/)

☝ [Table of contents](#table-of-contents)

[GitHub](https://github.com/aws/aws-cli)

Related links
- [Installing, updating, and uninstalling the AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-install.html)
- [Configuring the AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-configure.html)
- [open-guides/og-aws](https://github.com/open-guides/og-aws) - :books: Amazon Web Services — a practical guide

### [Carbon](https://carbon.now.sh/)

☝ [Table of contents](#table-of-contents)

Create and share beautiful images of your source code

[GitHub](https://github.com/carbon-app/carbon)

### [Project Jupyter](https://jupyter.org/)

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
