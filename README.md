## Linux: [Manjaro KDE](https://manjaro.org/downloads/official/kde/)

CPU: AMD Ryzen 5 3600

GPU: AMD Radeon RX 5600 XT 6 GB

RAM: 16 GB (2 x GeIL Super Luce 8 GB DDR4 3200MHz)

M2: ADATA XPG Spectrix S40G 512 GB

MB: ASUS TUF B450M-PRO Gaming

### BIOS

- Change "Normal" to "ASUS Optimized".

- Set RAM to 3200Mhz.

### Timeshift

You can create restore points with it, and that can be useful if you break something.

`$ sudo pacman -Syy --needed timeshift`

Then open and config it as you like.

You can also add this to automatically create restore points every time before you upgrade something with pacman:

`$ sudo pacman -Sy --needed timeshift-autosnap`

### Pacman tweaks

`$ sudo pacman-mirrors --api --set-branch stable --fasttrack`

`$ sudo pacman -Syyuu`

### General

`$ sudo pacman -Syu --needed linux-lts linux-lts-headers android-tools flatpak snapd git tree base-devel curl gawk gzip p7zip gnupg kgpg cronie wget aria2 tor torbrowser-launcher qbittorrent linux-lts-virtualbox-host-modules virtualbox virtualbox-guest-iso gimp audacity libreoffice-fresh libreoffice-fresh-es neofetch nano gparted ruby python go telegram-desktop vlc kdenlive code`

### Signal

`$ sudo pacman -Syu --needed signal-desktop`

Edit .desktop command like this:

`signal-desktop --start-in-tray`

### Preload

`$ sudo pacman -Syu --needed preload`

`$ sudo systemctl enable --now preload`

### ZRAM

- Enable ZRAM (you need to disable and delete any working swap you may have first):

`$ sudo pacman -Syu --needed systemd-swap`

`$ sudo nano /etc/systemd/swap.conf.d/90-enable-zram.conf`

    zswap_enabled=0
    zram_enabled=1
    swapfc_enabled=1

`$ sudo systemctl enable --now systemd-swap`

`$ swapon --show`

- Tweak swappiness to avoid running out of memory:

`$ sudo nano /etc/sysctl.d/90-swappiness.conf`

    vm.vfs_cache_pressure=500
    vm.swappiness=100
    vm.dirty_background_ratio=1
    vm.dirty_ratio=50

`$ sudo sysctl --load /etc/sysctl.d/90-swappiness.conf`

### Vim

`$ sudo pacman -Syu --needed vim`

`$ nano ~/.vimrc`

    set showmode
    set autoindent
    set tabstop=4
    set expandtab
    syntax on
    
### Oh My Zsh

`$ sudo pacman -Syu --needed zsh`

[Install Oh My Zsh](https://github.com/robbyrussell/oh-my-zsh#basic-installation)

### Exa

`$ sudo pacman -Syu --needed exa`

`$ echo 'alias ls=exa' >> ~/.bashrc`

`$ echo 'alias ls=exa' >> ~/.zshrc`

### NetworkManager randomize

`$ sudo nano /etc/NetworkManager/conf.d/30-randomize-mac-address.conf`

    [device-mac-randomization]
    wifi.scan-rand-mac-address=yes
    
    [connection-mac-randomization]
    ethernet.cloned-mac-address=random
    wifi.cloned-mac-address=random

`$ sudo systemctl restart NetworkManager`

### DNS over TLS

`$ sudo nano /etc/systemd/resolved.conf.d/90-dns-over-tls.conf`

    [Resolve]
    DNS=1.1.1.1 1.0.0.1 2606:4700:4700::1111 2606:4700:4700::1001
    DNSSEC=yes
    DNSOverTLS=yes

`$ sudo nano /etc/NetworkManager/conf.d/10-dns-systemd-resolved.conf`

    [main]
    dns=none
    systemd-resolved=false

`$ sudo systemctl enable --now systemd-resolved`

`$ sudo systemctl restart NetworkManager`

### Steam tweaks

- Install Steam and gamemode:

`$ sudo pacman -Syu --needed steam gamemode`

- Enable Steam Play in Steam settings and enable all Windows games with the last Proton version.

- Set launch options (per game) to:

`mesa_glthread=true RADV_PERFTEST=aco gamemoderun %command%`

### Keybase

- Install Keybase:

`$ sudo pacman -Syu --needed keybase keybase-gui`

- Import the public key:

`$ keybase pgp export | gpg --import`

- Import the private key:

`$ keybase pgp export -s | gpg --allow-secret-key-import --import`

### Git

`$ sudo pacman -Syu --needed git`

`$ git config --global color.ui true`

`$ git config --global user.name "astrolince"`

`$ git config --global user.email "astro@astrolince.com"`

`$ ssh-keygen -t rsa -b 4096 -C "astro@astrolince.com"`

`$ cat ~/.ssh/id_rsa.pub`

Paste to [https://github.com/settings/ssh](https://github.com/settings/ssh).

`$ echo 'export GPG_TTY=$(tty)' >> ~/.bashrc`

`$ echo 'export GPG_TTY=$(tty)' >> ~/.zshrc`

`$ git config --global user.signingkey CC39C6D77BDF0053`

`$ git config --global commit.gpgsign true`

### nvm

`$ sudo pacman -Syu --needed nvm`

`$ echo 'source /usr/share/nvm/init-nvm.sh' >> ~/.bashrc`

`$ echo 'source /usr/share/nvm/init-nvm.sh' >> ~/.zshrc`

### Hosty

`$ curl -L git.io/hosty | sh`

### Brave

- Install Brave:

`$ sudo pacman -Syu --needed brave`

- Extensions:

[Bitwarden](https://chrome.google.com/webstore/detail/bitwarden-free-password-m/nngceckbapebfimnlniiiahkandclblb)

[ClearURLs](https://chrome.google.com/webstore/detail/clearurls/lckanjgmijmafbedllaakclkaicjfmnk)

[Decentraleyes](https://chrome.google.com/webstore/detail/decentraleyes/ldpochfccmkkmhdbclfhpagapcfdljkj)

[JSON Viewer](https://chrome.google.com/webstore/detail/json-viewer/gbmdgpbipfallnflgajpaliibnhdgobh)

[Privacy Possum](https://chrome.google.com/webstore/detail/privacy-possum/ommfjecdpepadiafbnidoiggfpbnkfbj)

[Privacy Settings](https://chrome.google.com/webstore/detail/privacy-settings/ijadljdlbkfhdoblhaedfgepliodmomj)

[Terms of Service; Didn’t Read](https://chrome.google.com/webstore/detail/terms-of-service-didn%E2%80%99t-r/hjdoplcnndgiblooccencgcggcoihigg)

[uBlock Origin](https://chrome.google.com/webstore/detail/ublock-origin/cjpalhdlnbpafiamejdnhcphjbkeiagm)

### Bitwarden (standalone)

`$ sudo snap install bitwarden`

### Authy (standalone)

`$ sudo snap install authy --beta`

### Standard Notes

`$ sudo snap install standard-notes`
