## Linux: [Manjaro KDE](https://manjaro.org/downloads/official/kde/)

CPU: AMD Ryzen 5 3600

GPU: AMD Radeon RX 5600 XT 6 GB

RAM: 16 GB (2 x GeIL Super Luce 8 GB DDR4 3200MHz)

M2: ADATA XPG Spectrix S40G 512 GB

MB: ASUS TUF B450M-PRO Gaming

### BIOS

- Restore defaults.

- Clear Secure Boot keys.

- Change overclock mode from "Normal" to "ASUS Optimized".

- Set RAM to 3200Mhz.

### Installation

Partitions:

- 100 MB	FAT32	/boot/efi
- XXX GB	F2FS	/	(with LUKS encryption)

### Timeshift

You can create restore points with it, and that can be useful if you break something:

`$ sudo pacman -Syy --needed timeshift`

Then open and config it as you like.

You can also add this to automatically create restore points every time before you upgrade something with pacman (not recommended because it's slow):

`$ sudo pacman -Sy --needed timeshift-autosnap`

### Pacman tweaks

Set the stable branch and regenerate the mirrors list with the fastest ones:

`$ sudo pacman-mirrors --api --set-branch stable --fasttrack`

`$ sudo pacman -Syyuu`

### General

`$ sudo pacman -Syu --needed android-tools flatpak snapd git tree base-devel curl gawk gzip p7zip gnupg kgpg cronie wget aria2 tor torbrowser-launcher qbittorrent gimp audacity libreoffice-fresh libreoffice-fresh-es neofetch nano gparted ruby python go telegram-desktop vlc kdenlive code lutris isousb net-tools gufw`

### Virtualbox

If you'll use only the newest official kernel, you can install it this way:

`$ sudo pacman -Syu --needed linux57 linux57-headers linux57-virtualbox-host-modules virtualbox virtualbox-guest-iso`

If you'll use only LTS kernels, you can install it this way:

`$ sudo pacman -Syu --needed linux-lts linux-lts-headers linux-lts-virtualbox-host-modules virtualbox virtualbox-guest-iso`

But if you run other kernels or you like to compile your own, you'll probably like a more generalist aproach:

`$ sudo pacman -Syu --needed virtualbox-host-dkms virtualbox virtualbox-guest-iso`

### Bitwarden (standalone)

`$ sudo snap install bitwarden`

### Authy (standalone)

`$ sudo snap install authy --beta`

### Oh My Zsh

`$ sudo pacman -Syu --needed zsh`

[Install Oh My Zsh](https://github.com/robbyrussell/oh-my-zsh#basic-installation)

### Vim

`$ sudo pacman -Syu --needed vim`

`$ nano ~/.vimrc`

	set showmode
	set autoindent
	set tabstop=4
	set expandtab
	syntax on

### Exa

Replace `ls` command with `exa`:

`$ sudo pacman -Syu --needed exa`

`$ echo 'alias ls=exa' >> ~/.bashrc`

`$ echo 'alias ls=exa' >> ~/.zshrc`

### Preload

`$ sudo pacman -Syu --needed preload`

`$ sudo systemctl enable --now preload`

### ZRAM

- Enable ZRAM (you need to disable and delete any working swap you may have first):

`$ sudo pacman -Syu --needed systemd-swap`

`$ sudo nano /etc/systemd/swap.conf.d/99-enable-zram.conf`

	zswap_enabled=0
	zram_enabled=1
	swapfc_enabled=1

`$ sudo systemctl enable --now systemd-swap`

- Tweak swappiness to avoid running out of memory (only if you have a low amount of RAM):

`$ sudo nano /etc/sysctl.d/99-swappiness.conf`

	vm.vfs_cache_pressure=500
	vm.swappiness=100
	vm.dirty_background_ratio=1
	vm.dirty_ratio=50

`$ sudo sysctl --load /etc/sysctl.d/99-swappiness.conf`

### NetworkManager randomize

`$ sudo nano /etc/NetworkManager/conf.d/99-randomize-mac-address.conf`

	[device-mac-randomization]
	wifi.scan-rand-mac-address=yes
	
	[connection-mac-randomization]
	ethernet.cloned-mac-address=random
	wifi.cloned-mac-address=random

`$ sudo systemctl restart NetworkManager`

### DNS over TLS

`$ sudo nano /etc/systemd/resolved.conf.d/99-dns-over-tls.conf`

	[Resolve]
	DNS=1.1.1.1 1.0.0.1 2606:4700:4700::1111 2606:4700:4700::1001
	DNSSEC=yes
	DNSOverTLS=yes
	Domains=~.

`$ sudo nano /etc/NetworkManager/conf.d/99-dns-systemd-resolved.conf`

	[main]
	dns=systemd-resolved

`$ sudo systemctl enable --now systemd-resolved`

`$ sudo systemctl restart NetworkManager`

### Keybase

- Install Keybase:

`$ sudo pacman -Syu --needed keybase keybase-gui kbfs`

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

### Signal

`$ sudo pacman -Syu --needed signal-desktop`

Edit .desktop command like this:

`signal-desktop --start-in-tray`

### Steam tweaks

- Install Steam and gamemode:

`$ sudo pacman -Syu --needed steam gamemode`

- Enable Steam Play in Steam settings.

- Set launch options (per game) to:

`mesa_glthread=true RADV_PERFTEST=aco gamemoderun %command%`

In some Proton games can be useful to add `DXVK_ASYNC=1` too.

- Install [proton-ge-custom](https://github.com/GloriousEggroll/proton-ge-custom).

### nvm

`$ sudo pacman -Syu --needed nvm`

`$ echo 'source /usr/share/nvm/init-nvm.sh' >> ~/.bashrc`

`$ echo 'source /usr/share/nvm/init-nvm.sh' >> ~/.zshrc`

### [Hosty](https://astrolince.com/hosty)

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

### Standard Notes

`$ sudo snap install standard-notes`
