## Linux: [Manjaro KDE](https://manjaro.org/downloads/official/kde/)

### BIOS

- Change "Normal" to "ASUS Optimized".

- Set RAM to 3200Mhz.

### Pacman tweaks

`$ sudo pacman-mirrors --api --set-branch stable --fasttrack`

`$ sudo pacman -Syyuu`

### General

`$ sudo pacman -Syu --needed linux-lts linux-lts-headers android-tools flatpak snapd git tree vim base-devel curl gawk gzip p7zip gnupg kgpg cronie wget aria2 tor torbrowser-launcher steam brave qbittorrent virtualbox virtualbox-host-dkms virtualbox-guest-iso gimp audacity libreoffice-fresh-es exa gamemode neofetch nano gparted zsh ruby python go telegram-desktop vlc kdenlive`

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

`$ sudo nano ~/.vimrc`

    set showmode
    set autoindent
    set tabstop=4
    set expandtab
    syntax on

### NetworkManager

`$ sudo nano /etc/NetworkManager/conf.d/30-randomize-mac-address.conf`

    [device-mac-randomization]
    wifi.scan-rand-mac-address=yes
    
    [connection-mac-randomization]
    ethernet.cloned-mac-address=random
    wifi.cloned-mac-address=random

`$ sudo systemctl restart NetworkManager`

### DNSOverTLS

`$ sudo nano /etc/systemd/resolved.conf.d/90-dns-over-tls.conf`

    DNS=1.1.1.1 1.0.0.1 2606:4700:4700::1111 2606:4700:4700::1001
    DNSSEC=yes
    DNSOverTLS=yes

`$ sudo /etc/NetworkManager/conf.d/10-dns-systemd-resolved.conf`

    [main]
    dns=none
    systemd-resolved=false

`$ sudo systemctl enable --now systemd-resolved`

`$ sudo systemctl restart NetworkManager`

### Steam tweak

- Install gamemode:

`$ sudo pacman -Syu --needed gamemode`

- Enable Steam Play in Steam settings and enable all games with the last version.

- Set launch options per game to:

`mesa_glthread=true RADV_PERFTEST=aco gamemoderun %command%`

### Oh My Zsh

[Install](https://github.com/robbyrussell/oh-my-zsh#basic-installation)

[~/.zshrc](https://raw.githubusercontent.com/astrolince/configs/master/~/.zshrc)

### Keybase

- Install Keybase:

`$ sudo pacman -Syu --needed keybase keybase-gui`

- Import the public key:

`$ keybase pgp export | gpg --import`

- Import the private key:

`$ keybase pgp export -s | gpg --allow-secret-key-import --import`

### Git

`$ git config --global color.ui true`

`$ git config --global user.name "astrolince"`

`$ git config --global user.email "astro@astrolince.com"`

Restore keys to `~/.ssh`

`$ git config --global user.signingkey CC39C6D77BDF0053`

`$ git config --global commit.gpgsign true`

### Rust

`$ curl https://sh.rustup.rs -sSf | sh`

### nvm

[Install](https://github.com/nvm-sh/nvm#install--update-script)

### Hosty

`$ curl -L git.io/hosty | sh`

### Brave

- Extensions:

[Bitwarden](https://chrome.google.com/webstore/detail/bitwarden-free-password-m/nngceckbapebfimnlniiiahkandclblb)

[Decentraleyes](https://chrome.google.com/webstore/detail/decentraleyes/ldpochfccmkkmhdbclfhpagapcfdljkj)

[JSON Viewer](https://chrome.google.com/webstore/detail/json-viewer/gbmdgpbipfallnflgajpaliibnhdgobh)

[Privacy Settings](https://chrome.google.com/webstore/detail/privacy-settings/ijadljdlbkfhdoblhaedfgepliodmomj)

[Privacy Possum](https://chrome.google.com/webstore/detail/privacy-possum/ommfjecdpepadiafbnidoiggfpbnkfbj)

[uBlock Origin](https://chrome.google.com/webstore/detail/ublock-origin/cjpalhdlnbpafiamejdnhcphjbkeiagm)

### Standard Notes

[Download](https://standardnotes.org/extensions?downloaded=linux)
