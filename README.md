# configs

## General guidelines and philosophy

I'll try to keep this as simple as posible to increase mantainability and troubleshooting, and minimize unexpected behavior.

Also, if I can keep something in the userspace using Flatpaks without affecting usability, I'll prefer that to reduce system clutterness and increase security.

## PC Master Race

CPU: AMD Ryzen 5 3600

GPU: AMD Radeon RX 5600 XT 6 GB

RAM: 32 GB (4 x GeIL Super Luce 8 GB DDR4 3200MHz)

M2: ADATA XPG Spectrix S40G 512 GB

MB: ASUS TUF B450M-PRO Gaming

### BIOS config

- Restore defaults.

- Clear Secure Boot keys.

- Set RAM to 3200Mhz.

- Enable virtualization and IOMMU.

- Disable CSM.

- Customize fans speed to maximize silence.

### Specific for [Fedora KDE](https://spins.fedoraproject.org/kde/)

#### DNF tweaks

`$ sudo nano /etc/dnf/dnf.conf`

	fastestmirror=True
	deltarpm=True

#### Update system

`$ sudo dnf update`

#### Add RPM Fusion repos

`$ sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm`

`$ sudo dnf groupupdate core`

`$ sudo dnf groupupdate multimedia --setop="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin`

`$ sudo dnf groupupdate sound-and-video`

#### Install from repos

`$ sudo dnf install @virtualization alacritty android-tools arc-theme aria2 audacity blender curl dnscrypt-proxy emacs exa firewall-config fish flatpak gamemode gawk gimp git gnupg2 gparted gzip kdenlive keepassxc kgpg krita libreoffice lutris nano neofetch neovim net-tools obs-studio p7zip p7zip-plugins qbittorrent qemu retroarch steam syncthing tor torsocks tree util-linux-user vim virt-manager vlc wget wine wine-mono winetricks`

#### [Install Brave](https://brave.com/linux/)

#### [Install Keybase](https://keybase.io/docs/the_app/install_linux)

#### [Install VSCodium](https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo)

### Specific for [Manjaro KDE](https://manjaro.org/downloads/official/kde/)

#### Pacman tweaks

Regenerate the mirrors list with the fastest ones:

`$ sudo pacman-mirrors --fasttrack`

#### Update system

`$ sudo pacman -Syyuu`

#### Install from official repos

`$ sudo pacman -Sy --needed alacritty android-tools aria2 audacity base-devel blender brave code curl dnscrypt-proxy dnsmasq ebtables edk2-ovmf emacs exa fish flatpak gamemode gawk gimp git gnupg go-ipfs gparted gufw gzip kbfs kdenlive keepassxc keybase keybase-gui kgpg krita libreoffice-still libreoffice-still-es libvirt linux-latest linux-latest-headers linux-lts linux-lts-headers lutris nano neofetch neovim net-tools obs-studio p7zip python-neovim qbittorrent qemu retroarch steam syncthing tor torsocks tree vim virt-manager vlc wget wine wine-gecko wine-mono winetricks xclip`

### For all distros:

#### Flatpaks

`$ flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo`

`$ flatpak install flathub com.discordapp.Discord com.github.micahflee.torbrowser-launcher com.github.vladimiry.ElectronMail com.leinardi.gst com.system76.Popsicle com.tutanota.Tutanota im.riot.Riot io.lbry.lbry-app net.jami.Jami org.jitsi.jitsi-meet org.signal.Signal org.telegram.desktop`

`$ wget https://dl.strem.io/shell-linux/v4.4.116/Stremio+4.4.116.flatpak`

`$ flatpak install Stremio+4.4.116.flatpak`

#### Signal

Edit app to add `--start-in-tray` or `--use-tray-icon` in the end of the Exec command.

#### Steam tweaks

- Enable Steam Play in Steam settings.

- Set launch options (per game) to:

`gamemoderun %command%`

In some OpenGL games can be useful to add `mesa_glthread=true` at the beginning, and in some Vulkan/DirectX games can be useful to add `RADV_PERFTEST=aco` and/or `DXVK_ASYNC=1`(this last one is related to anti-cheats false positives, so don't use it in online games to avoid bans).

- Try [proton-ge-custom](https://github.com/GloriousEggroll/proton-ge-custom).

#### Fish

	$ chsh -s `which fish`

	$ fish

	$ set -U fish_greeting

	$ fish_config

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

`$ git config --global user.signingkey CC39C6D77BDF0053`

`$ git config --global commit.gpgsign true`

#### Brave Extensions

[KeePassXC-Browser](https://chrome.google.com/webstore/detail/keepassxc-browser/oboonakemofpalcgghocfoadofidjkkk)

[ClearURLs](https://chrome.google.com/webstore/detail/clearurls/lckanjgmijmafbedllaakclkaicjfmnk)

[Decentraleyes](https://chrome.google.com/webstore/detail/decentraleyes/ldpochfccmkkmhdbclfhpagapcfdljkj)

[JSON Viewer](https://chrome.google.com/webstore/detail/json-viewer/gbmdgpbipfallnflgajpaliibnhdgobh)

[Privacy Settings](https://chrome.google.com/webstore/detail/privacy-settings/ijadljdlbkfhdoblhaedfgepliodmomj)

#### Vim

`$ nano ~/.vimrc`

	set showmode
	set autoindent
	set tabstop=4
	set expandtab
	syntax on

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

	listen_addresses = []
	max_clients = 250

	ipv4_servers = true
	ipv6_servers = true

	dnscrypt_servers = true
	doh_servers = true

	require_dnssec = true
	require_nolog = true
	require_nofilter = true
	disabled_server_names = []
	force_tcp = false

	timeout = 5000
	keepalive = 30

	lb_strategy = 'p2'
	lb_estimator = true

	use_syslog = true
	cert_refresh_delay = 240

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
 	    cache_file = '/var/cache/dnscrypt-proxy/public-resolvers.md'

`$ sudo systemctl enable --now dnscrypt-proxy.socket`

Change your connections DNS to 127.0.0.1 for IPv4 and ::1 for IPv6.

#### GNOME Extensions

[Arc Menu](https://extensions.gnome.org/extension/1228/arc-menu/)

[Bitcoin Markets](https://extensions.gnome.org/extension/648/bitcoin-markets/)

[Caffeine](https://extensions.gnome.org/extension/517/caffeine/)

[Clipboard Indicator](https://extensions.gnome.org/extension/779/clipboard-indicator/)

[Dash to Dock](https://extensions.gnome.org/extension/307/dash-to-dock/)

[GameMode](https://extensions.gnome.org/extension/1852/gamemode/)

[GSConnect](https://extensions.gnome.org/extension/1319/gsconnect/)

[Impatience](https://extensions.gnome.org/extension/277/impatience/)

[KStatusNotifierItem/AppIndicator Support](https://extensions.gnome.org/extension/615/appindicator-support/)

[OpenWeather](https://extensions.gnome.org/extension/750/openweather/)

[Places Status Indicator](https://extensions.gnome.org/extension/8/places-status-indicator/)

[Sound Input & Output Device Chooser](https://extensions.gnome.org/extension/906/sound-output-device-chooser/)
