# configs

## General guidelines and philosophy

I'll try to keep this as simple as posible to increase mantainability and troubleshooting, and minimize unexpected behavior.

Also, if I can keep something in the userspace using flatpaks without affecting usability, I'll prefer that to reduce system clutterness and increase security.

## PC Master Race

CPU: AMD Ryzen 5 3600

GPU: AMD Radeon RX 5600 XT 6 GB

RAM: 16 GB (2 x GeIL Super Luce 8 GB DDR4 3200MHz)

M2: ADATA XPG Spectrix S40G 512 GB

MB: ASUS TUF B450M-PRO Gaming

### BIOS config

- Restore defaults.

- Clear Secure Boot keys.

- Change overclock mode from "Normal" to "ASUS Optimized".

- Set RAM to 3200Mhz.

- Customize fans speed to maximize silence.

### Specific for [Manjaro KDE](https://manjaro.org/downloads/official/kde/)

#### Pacman tweaks

Regenerate the mirrors list with the fastest ones:

`$ sudo pacman-mirrors --fasttrack`

#### Update system

`$ sudo pacman -Syyuu`

#### Install everything

`$ sudo pacman -Sy --needed android-tools flatpak snapd git tree base-devel bash curl gawk gzip p7zip gnupg cronie wget aria2 tor torsocks neofetch gimp audacity  nano gparted ruby python go code isousb net-tools gufw vim exa croc qemu virt-manager kgpg zsh dnscrypt-proxy keybase keybase-gui kbfs wine-staging retroarch lutris steam gamemode linux-latest linux-latest-headers linux-latest-virtualbox-host-modules virtualbox virtualbox-guest-iso nvm`

### Specific for [Fedora Workstation](https://getfedora.org/en/workstation/download/)

#### Update system

`$ sudo dnf update`

#### Install everything

`$ sudo dnf install android-tools flatpak snapd git tree @development-tools bash curl gawk gzip p7zip p7zip-plugins gnupg2 cronie wget aria2 tor torsocks neofetch`

### For all distros:

#### Flatpaks

`$ flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo`

`$ flatpak install flathub org.signal.Signal com.github.micahflee.torbrowser-launcher org.telegram.desktop org.libreoffice.LibreOffice`

`$ wget https://dl.strem.io/shell-linux/v4.4.116/Stremio+4.4.116.flatpak`

`$ flatpak install Stremio+4.4.116.flatpak`

#### Signal

`$ sudo nano /var/lib/flatpak/exports/share/applications/org.signal.Signal.desktop`

Add `--use-tray-icon` to the end of the Exec command.

#### Keybase

- Import the public key:

`$ keybase pgp export | gpg --import`

- Import the private key:

`$ keybase pgp export -s | gpg --allow-secret-key-import --import`

#### Git

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

#### Steam tweaks

- Enable Steam Play in Steam settings.

- Set launch options (per game) to:

` RADV_PERFTEST=aco gamemoderun %command%`

In some Proton games can be useful to add `mesa_glthread=true` and `DXVK_ASYNC=1`(the last one is related to anti-cheats false positives, so don't use it in online games to avoid bans).

- Install [proton-ge-custom](https://github.com/GloriousEggroll/proton-ge-custom).

#### nvm

`$ echo 'source /usr/share/nvm/init-nvm.sh' >> ~/.bashrc`

`$ echo 'source /usr/share/nvm/init-nvm.sh' >> ~/.zshrc`

#### [Hosty](https://astrolince.com/hosty/)

`$ curl -L git.io/hosty | sh`

#### Brave

- Extensions:

[Bitwarden](https://chrome.google.com/webstore/detail/bitwarden-free-password-m/nngceckbapebfimnlniiiahkandclblb)

[ClearURLs](https://chrome.google.com/webstore/detail/clearurls/lckanjgmijmafbedllaakclkaicjfmnk)

[Decentraleyes](https://chrome.google.com/webstore/detail/decentraleyes/ldpochfccmkkmhdbclfhpagapcfdljkj)

[JSON Viewer](https://chrome.google.com/webstore/detail/json-viewer/gbmdgpbipfallnflgajpaliibnhdgobh)

[Privacy Possum](https://chrome.google.com/webstore/detail/privacy-possum/ommfjecdpepadiafbnidoiggfpbnkfbj)

[Privacy Settings](https://chrome.google.com/webstore/detail/privacy-settings/ijadljdlbkfhdoblhaedfgepliodmomj)

[Terms of Service; Didn’t Read](https://chrome.google.com/webstore/detail/terms-of-service-didn%E2%80%99t-r/hjdoplcnndgiblooccencgcggcoihigg)

[uBlock Origin](https://chrome.google.com/webstore/detail/ublock-origin/cjpalhdlnbpafiamejdnhcphjbkeiagm)

#### Oh My Zsh

[Install Oh My Zsh](https://github.com/robbyrussell/oh-my-zsh#basic-installation)

#### Vim

`$ nano ~/.vimrc`

	set showmode
	set autoindent
	set tabstop=4
	set expandtab
	syntax on

#### Exa

Replace `ls` command with `exa`:

`$ echo 'alias ls=exa' >> ~/.bashrc`

`$ echo 'alias ls=exa' >> ~/.zshrc`

#### NetworkManager randomize

`$ sudo nano /etc/NetworkManager/conf.d/99-randomize-mac-address.conf`

	[device-mac-randomization]
	wifi.scan-rand-mac-address=yes
	
	[connection-mac-randomization]
	ethernet.cloned-mac-address=random
	wifi.cloned-mac-address=random

`$ sudo systemctl restart NetworkManager`

#### DNS over HTTPS

`$ sudo nano /etc/dnscrypt-proxy/dnscrypt-proxy.toml`

	listen_addresses = ['127.0.0.1:53', '[::1]:53']
	max_clients = 250

	ipv4_servers = true
	ipv6_servers = true

	dnscrypt_servers = true
	doh_servers = true

	require_dnssec = true
	require_nolog = true
	require_nofilter = true
	force_tcp = false

	timeout = 5000
	keepalive = 30

	blocked_query_response = 'refused'

	lb_strategy = 'p2'
	lb_estimator = true

	use_syslog = true

	cert_refresh_delay = 240

	dnscrypt_ephemeral_keys = true

	fallback_resolvers = ['1.1.1.1:53', '1.0.0.1:53', '9.9.9.9:53', '8.8.8.8:53']
	ignore_system_dns = true
	netprobe_timeout = 60
	netprobe_address = '1.1.1.1:53'

	log_files_max_size = 10
	log_files_max_age = 7
	log_files_max_backups = 1

	block_ipv6 = false
	block_unqualified = true
	block_undelegated = true
	reject_ttl = 600

	cache = true
	cache_size = 4096
	cache_min_ttl = 2400
	cache_max_ttl = 86400
	cache_neg_min_ttl = 60
	cache_neg_max_ttl = 600

	[sources]
	    [sources.'public-resolvers']
	    urls = ['https://raw.githubusercontent.com/DNSCrypt/dnscrypt-resolvers/master/v3/public-resolvers.md', 'https://download.dnscrypt.info/resolvers-list/v3/public-resolvers.md']
	    minisign_key = 'RWQf6LRCGA9i53mlYecO4IzT51TGPpvWucNSCh1CBM0QTaLn73Y7GFO3'
	    cache_file = 'public-resolvers.md'

`$ sudo systemctl enable --now dnscrypt-proxy`

Change your connections DNS to 127.0.0.1 for IPv4 and ::1 for IPv6.
