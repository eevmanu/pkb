
## TODO

- Internet speed monitor script

    - Download latest [speedtest](https://github.com/sivel/speedtest-cli) script

        ```bash
        $ cd $HOME
        $ wget -O $HOME/bin/speedtest https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py
        $ curl -Lo $HOME/bin/speedtest https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py
        $ chmod +x $HOME/bin/speedtest
        ```

    - Add this **snippet** at final of 'speedtest' method

        ```python
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
        ```

    - Install needed packages

        ```bash
        $ sudo apt-get install libffi-dev
        $ pip install -U cffi
        $ pip install -U requests[security]
        $ pip install -U keen
        ```

    - Add **cronjob** to **crontab**

        ```
        $ crontab -e
        ...
        * * * * * /path/to/speedtest-cli --simple # each min
        */5 * * * * /path/to/speedtest-cli --simple # each 5 mins
        ...
        ```

    - Get `json` output

        ```
        $ speedtest --json --single
        ```

        - output example

            ```json
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

- [geekbench](https://www.geekbench.com/)

    ```bash
    # TODO
    $ wget http://cdn.geekbench.com/Geekbench-5.1.0-Linux.tar.gz
    ```

- glances
- traceroute
- mtr
- nethogs
- nload
- CBM - Monitoring Network Bandwidth and Speed in Linux
- iperf
- [iftop](https://linux.die.net/man/8/iftop)

- [FiraCode](https://github.com/tonsky/FiraCode) - Free monospaced font with programming ligatures


- Check which Chrome Extensions needs **Allow access to file URLs**

- Remember shortcuts to change workspaces and move windows between workspaces are diff between OSes

- [Xournal++](https://github.com/xournalpp/xournalpp) - handwriting notetaking software

- Switch `on/off` **camera** on linux

    ```bash
    # ON (default)
    $ sudo modprobe uvcvideo
    # OFF
    $ sudo modprobe -r uvcvideo
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

    - Directories used:

        ```bash
        $HOME/.var/app/com.uploadedlobster.peek/
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

    - Config file: `$HOME/.config/screenkey.json`

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

    - Directories used:

        ```bash
        $HOME/.var/app/org.audacityteam.Audacity/
        ```

- [TabNine](https://www.tabnine.com/)

    - [Welcome](https://www.tabnine.com/welcome/)

    - Directories used:

        ```bash
        $HOME/.config/TabNine/
        $HOME/.local/share/TabNine/
        ```

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

- multiple whatsapp locally, options:
    - [franz](https://github.com/meetfranz/franz)
    - [ferdi](https://github.com/getferdi/ferdi)
    - [altus](https://github.com/amanharwara/altus)
    - [ttth](https://github.com/yafp/ttth)
    - [ramboxapp](https://github.com/ramboxapp/community-edition)
    - [hamsket](https://github.com/TheGoddessInari/hamsket)

- Math equations
    - [GNU Octave](https://flathub.org/apps/details/org.octave.Octave)
    - [ZeGrapher](https://github.com/AdelKS/ZeGrapher)
    - [desmos - Graphing Calculator](https://www.desmos.com/calculator)
    - [GeoGebra - Graphing Calculator](https://www.geogebra.org/graphing)

- Personal finance
    - [GNU Cash](https://flathub.org/apps/details/org.gnucash.GnuCash)
    - [firefly-iii](https://github.com/firefly-iii/firefly-iii)

- GRPC - BloomRPC

- [Stacer](https://github.com/oguzhaninan/Stacer) - Linux System Optimizer and Monitoring

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

    <!-- TODO name this links -->
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

            ```bash
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

    - Instructions to install it

        ```bash
        $ cd $HOME
        $ wget \
            -O figma-linux \
            https://github.com/Figma-Linux/figma-linux/releases/download/v0.6.2/figma-linux-0.6.2.AppImage
        $ chmod a+x figma-linux
        $ mv figma-linux $HOME/bin
        ```

    <!-- TODO instructions to create desktop file -->

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

    <!-- TODO -->
    - https://www.cyberciti.biz/faq/linux-command-to-suspend-hibernate-laptop-netbook-pc/
    - https://www.zealfortechnology.com/2018/08/install-and-configure-realvnc-in-linux.html


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
                ```bash
                $ ./adb version
                Android Debug Bridge version 1.0.41
                Version 30.0.3-6597393
                Installed as {{ $HOME }}/platform-tools/adb
                ```

    - Install it via `snap` ([github repo](https://github.com/sisco311/scrcpy-snap))

        ```bash
        $ sudo snap install scrcpy
        ```

    - Verify port is not being used

        ```bash
        $ sudo ss -tulpn | grep :5555
        ```

    - How to use ([useful link](https://www.genymotion.com/blog/open-source-project-scrcpy-now-works-wirelessly/))

        ```bash
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

- [bpytop](https://github.com/aristocratos/bpytop)

    ```bash
    # Initial verification before install it
    $ python -V
    $ python -m pip -V
    $ pyenv versions
    $ pip list | grep bpytop
    $ pip freeze | grep bpytop

    # python3-dev is needed to compile psutil, which is dependency of bpytop
    $ apt install python3-dev

    $ pip install --upgrade bpytop
    ```

    - Directories used:

        ```bash
        $HOME/.config/bpytop/bpytop.conf
        $HOME/.config/bpytop/error.log
        $HOME/.config/bpytop/themes/
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

- [GIMP](https://www.gimp.org/)

    - [Glimpse](https://github.com/glimpse-editor/glimpse/) - GIMP alternative

    - Directories used:

        ```bash
        $HOME/.var/app/org.gimp.GIMP/
        ```

- [LibreOffice](https://www.libreoffice.org/)

    - [how do I change from inches to cm in page setup etc [closed]](https://ask.libreoffice.org/en/question/178466/how-do-i-change-from-inches-to-cm-in-page-setup-etc/)
    - [How to hide default print range/page break lines after clearing a print range?](https://ask.libreoffice.org/en/question/71003/how-to-hide-default-print-rangepage-break-lines-after-clearing-a-print-range/)
    - [How to enable the “Tabbed Ribbon” interface style in LibreOffice 6](https://www.reallinuxuser.com/how-to-enable-the-tabbed-ribbon-interface-style-in-libreoffice-6/)
        - View -> User Interface -> Tabbed
        - ... / View -> Menubar
    - [How to Enable ‘Dark Mode’ in LibreOffice](https://www.debugpoint.com/2020/01/how-to-enable-dark-mode-libreoffice/)
        - Tools -> Options -> Personalization -> Dark **Preinstalled Theme**
        - Tools -> Options -> Application Colors -> Document Background -> Dark Grey 1 / 2 and **Automatic** on other options


```
$ ls -la $HOME/bin/

    bashtop
    copyq
    figma-linux
    firefox-beta ->$HOME/.local/opt/firefox-beta/firefox
    firefox-dev ->$HOME/.local/opt/firefox-dev/firefox
    firefox-nightly ->$HOME/.local/opt/firefox-nightly/firefox
    googler
    htop
    ksnip
    marktext
    python -> /usr/bin/python3
    speedtest
    thinkorswim ->$HOME/.local/opt/thinkorswim/thinkorswim
    vnote
    youtube-dl

$ flatkpak --list

    Discord
    Dropbox
    OBS Studio
    Slack
    Spotify
    Peek
    Audacity
        Codecs
    Freedesktop Platform
        default
        Intel
        ffmpeg-full
        openh264
    GNU Image Manipulation Program
        Manual
    GNOME Application Platform version 3.36
    Pop Gtk theme
    KDE Application Platform
        QGnomePlatform
        QtSNI
        QGnomePlatform-decoration
    Telegram Desktop
    Zoom
```

- [krisp.ai](https://krisp.ai/)
    - [NoiseTorch](https://github.com/lawl/NoiseTorch)


- [KDEConnect](https://community.kde.org/KDEConnect) - control your phone remotely
- [espanso](https://github.com/federico-terzi/espanso) - Cross-platform Text Expander written in Rust

- Video editors
    - [shotcut](https://github.com/mltframework/shotcut) - cross-platform (Qt), open-source (GPLv3) video editor
    - [kdenlive](https://github.com/KDE/kdenlive) - Free and open source video editor, based on MLT Framework and KDE Frameworks 5

- [Albert](https://github.com/albertlauncher/albert)
    - Installation process

        ```bash
        $ curl https://build.opensuse.org/projects/home:manuelschneid3r/public_key | sudo apt-key add -

        $ echo 'deb http://download.opensuse.org/repositories/home:/manuelschneid3r/xUbuntu_20.04/ /' | sudo tee /etc/apt/sources.list.d/home:manuelschneid3r.list

        $ sudo wget \
            -O "/etc/apt/trusted.gpg.d/home:manuelschneid3r.asc" \
            -nv https://download.opensuse.org/repositories/home:manuelschneid3r/xUbuntu_20.04/Release.key

        $ sudo apt update
        $ sudo apt install albert
        ```

    - [Using it](https://albertlauncher.github.io/docs/using/)
    - [GPG Signature error for Ubuntu Repo - Solution](https://github.com/albertlauncher/albert/issues/865#issuecomment-572396128)


- [Keepassxc](https://keepassxc.org/) - [github](https://github.com/keepassxreboot/keepassxc) - cross-platform community-driven port of the Windows application “Keepass Password Safe”.

    - Installation Steps

        ```bash
        $ wget -O $HOME/bin/keepassxc https://github.com/keepassxreboot/keepassxc/releases/download/2.6.1/KeePassXC-2.6.1-x86_64.AppImage
        $ chmod +x $HOME/bin/keepassxc
        ```

    - `.desktop` file @ `$HOME/.local/share/applications/keepassxc.desktop`

        ```
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

    - Add `icon` files

        ```bash
        $ wget -O .icons/keepassxc.svg https://github.com/keepassxreboot/keepassxc/raw/develop/share/icons/application/scalable/apps/keepassxc.svg
        ```

    - Refresh configurations to detect new `.desktop` file

        ```bash
        $ update-desktop-database $HOME/.local/share/applications/
        ```

    - Resources
        - [How do I use the KeePassXC CLI tool with the AppImage?](https://keepassxc.org/docs/#faq-appsnap-appimage-cli)
        - [KeepassXC Question about CLI](https://www.reddit.com/r/KeePass/comments/a5tjx2/keepassxc_question_about_cli/)

- [Virtualbox](https://www.virtualbox.org/)
    - Installation steps [here](https://www.virtualbox.org/wiki/Linux_Downloads)
    - [Changelog](https://www.virtualbox.org/wiki/Changelog)
    - [Linux build instructions](https://www.virtualbox.org/wiki/Linux%20build%20instructions)
    - Extra packages when installed (6.1.10 <-> 6.1.14)
        ```
            libpython2-stdlib
            libpython2.7-minimal
            libpython2.7-stdlib
            libsdl1.2debian
            python-is-python2
            python2
            python2-minimal
            python2.7
            python2.7-minimal
        ```
    - Windows 10:
        - [Open Virtualization Format - OVA](https://developer.microsoft.com/en-us/windows/downloads/virtual-machines/)
        - [ISO](https://www.microsoft.com/en-us/software-download/windows10ISO)

- [vnstat](https://github.com/vergoh/vnstat) - a network traffic monitor for Linux and BSD
    - Install it
        ```bash
        $ sudo apt install vnstat vnstati
        ```
    - Configuration
        ```bash
        $ vnstat --iflist

        $ sudo vnstat --iface enp1s0f1
        $ sudo vnstat --update --iface enp1s0f1
        ```
    - Start Systemd Service
        ```bash
        $ sudo systemctl enable vnstat.service
        ```
    - Generate graphic about it
        ```bash
        $ vnstati -vs -i enp1s0f1 -o ~/summary.png
        ```
    - Database path -> `/var/lib/vnstat/vnstat.db`
    - Configuration file -> `/etc/vnstat.conf`
    - [How can you monitor total internet data usage across reboots?](https://askubuntu.com/questions/1459/how-can-you-monitor-total-internet-data-usage-across-reboots)
    - [Monitoring Network Bandwidth and Speed in Linux](https://itsfoss.com/network-speed-monitor-linux/)
    - [Ubuntu install vnstat console network traffic monitor](https://www.cyberciti.biz/faq/ubuntu-install-vnstat-console-network-traffic-monitor/)
    - [vnstat-dashboard](https://github.com/alexandermarston/vnstat-dashboard) - A responsive web UI to view network traffic statistics provided by vnStat (with support for version 2.x)
        - [fix](https://github.com/alexandermarston/vnstat-dashboard/issues/47#issuecomment-653746262)


- [Stoplight Studio](https://github.com/stoplightio/studio/)
    - Install it
        ```bash
        $ wget -O $HOME/bin/stoplight-studio https://github.com/stoplightio/studio/releases/download/v2.0.0/stoplight-studio-linux-x86_64.AppImage
        # 146M
        $ chmod u+x $HOME/bin/stoplight-studio
        ```

- Duckduckgo
    - [Search Syntax](https://help.duckduckgo.com/duckduckgo-help-pages/results/syntax/)
    - [URL Params](https://duckduckgo.com/params)
    - [!Bang lite](https://duckduckgo.com/bang_lite.html)
    - [All DuckDuckGo bang operators on one page (mosermichael.github.io)](https://news.ycombinator.com/item?id=24618447)
    - [ordered by date](https://www.reddit.com/r/duckduckgo/comments/3glmr1/ordered_by_date/)
    - [The ultimate guide to DuckDuckGo](https://brettterpstra.com/2019/03/07/the-ultimate-guide-to-duckduckgo/)

- [activitywatch](https://github.com/ActivityWatch/activitywatch) - Open-source time tracker
    - Download `zip` file

        ```bash
        $ wget https://github.com/ActivityWatch/activitywatch/releases/download/v0.9.2/activitywatch-v0.9.2-linux-x86_64.zip
        ```

    - Unzip in correct path `.local/opt/...`

        ```bash
        $ cp {{ zip file }} $HOME/.local/opt
        $ unzip {{ zip file }}
        ```

    - Copy `.desktop` to correct path `.local/share/applications/...`

        ```bash
        $ cp $HOME/.local/opt/activitywatch/aw-qt.desktop .local/share/applications/
        ```

    - Edit `.desktop` file with right binary path

        ```
        ...
        Exec={{ $HOME }}/.local/opt/activitywatch/aw-qt
        ...
        ```

    - Download logo file

        ```bash
        # could dowload in $HOME/.icons or $HOME/.local/share/icons
        $ wget -O $HOME/.icons/activitywatch.png https://github.com/ActivityWatch/media/raw/master/logo/logo.png
        # $ wget -O $HOME/.local/share/icons/activitywatch.png https://github.com/ActivityWatch/media/raw/master/logo/logo.png
        ```

    - Edit `.desktop` file with right icon path

        ```
        ...
        Icon=activitywatch
        ...
        ```

    - Add binary path to **Startup Applications**

- [calibre](https://github.com/kovidgoyal/calibre) - The official source code repository for the calibre ebook manager

    ```bash
    $ flatpak run --command=ebook-convert com.calibre_ebook.calibre file.pdf file.epub --enable-heuristics
    ```

- [ How To Completely Disable Tracker, GNOME's File Indexing And Search Tool ](https://www.linuxuprising.com/2019/07/how-to-completely-disable-tracker.html)
    - [ vancluever/gnome-tracker-disable.md ](https://gist.github.com/vancluever/d34b41eb77e6d077887c#non-invasive-disable-cheat-sheet) -  GNOME Tracker Disable

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

- [Flatseal](https://github.com/tchx84/flatseal) - Manage Flatpak permissions - [Flathub](https://flathub.org/apps/details/com.github.tchx84.Flatseal)

- [Meld](http://meldmerge.org/) - visual diff and merge tool targeted at developers. - [Giltab](https://gitlab.gnome.org/GNOME/meld) - [Flathub](https://flathub.org/apps/details/org.gnome.meld)
