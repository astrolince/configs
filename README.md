## Linux: [Fedora 31 Workstation](https://getfedora.org/en/workstation/)

### dnf tweaks

[/etc/dnf/dnf.conf](https://raw.githubusercontent.com/astrolince/configs/master/etc/dnf/dnf.conf)

### General

`$ sudo dnf install git tree vim fastboot adb flatpak curl gawk gzip p7zip p7zip-plugins gnupg2 cronie wget aria2 dnscrypt-proxy tor torbrowser-launcher transmission-gtk steam golang gimp audacity libreoffice gnome-boxes exa gamemode neofetch nano gparted seahorse seahorse-nautilus zsh ffsend alien openssl-devel readline-devel`

`$ flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo`

`$ flatpak install flathub org.telegram.desktop im.riot.Riot com.bitwarden.desktop org.kde.kdenlive com.uploadedlobster.peek org.videolan.VLC`

### Vim

[~/.vimrc](https://raw.githubusercontent.com/astrolince/configs/master/~/.vimrc)

### NetworkManager

[/etc/NetworkManager/conf.d/30-randomize-mac-address.conf](https://raw.githubusercontent.com/astrolince/configs/master/etc/NetworkManager/conf.d/30-randomize-mac-address.conf)

`$ sudo systemctl restart NetworkManager`

### dnscrypt-proxy

[/etc/dnscrypt-proxy/dnscrypt-proxy.toml](https://raw.githubusercontent.com/astrolince/configs/master/etc/dnscrypt-proxy/dnscrypt-proxy.toml)

Set DNS to 127.0.0.1 and disable IPv6 from GUI, reconnect to the network

### Oh My Zsh

[Install](https://github.com/robbyrussell/oh-my-zsh#basic-installation)

[~/.zshrc](https://raw.githubusercontent.com/astrolince/configs/master/~/.zshrc)

### Keybase

[Install](https://keybase.io/docs/the_app/install_linux)

Import the public key:

`$ keybase pgp export | gpg --import`

Import the private key:

`$ keybase pgp export -s | gpg --allow-secret-key-import --import`

Keep automatic startup disabled (crappy performance).

### Git

`$ git config --global color.ui true`

`$ git config --global user.name "astrolince"`

`$ git config --global user.email "astro@astrolince.com"`

Restore keys to `~/.ssh`

`$ git config --global user.signingkey CC39C6D77BDF0053`

`$ git config --global commit.gpgsign true`

### Bitcoin Core

[Download](https://bitcoincore.org/en/download/)

[~/.bitcoin/bitcoin.conf](https://raw.githubusercontent.com/astrolince/configs/master/~/.bitcoin/bitcoin.conf)

### Rust

`$ curl https://sh.rustup.rs -sSf | sh`

### nvm

[Install](https://github.com/nvm-sh/nvm#install--update-script)

### Hosty

`$ curl -L git.io/hosty | sh`

### Brave

[Install](https://brave-browser.readthedocs.io/en/latest/installing-brave.html#linux)

Disable "Use hardware acceleration when available" (disgusting performance).

Extensions:

[Bitwarden](https://chrome.google.com/webstore/detail/bitwarden-free-password-m/nngceckbapebfimnlniiiahkandclblb)

[Cookie AutoDelete](https://chrome.google.com/webstore/detail/cookie-autodelete/fhcgjolkccmbidfldomjliifgaodjagh)

[Decentraleyes](https://chrome.google.com/webstore/detail/decentraleyes/ldpochfccmkkmhdbclfhpagapcfdljkj)

[GNOME Shell integration](https://chrome.google.com/webstore/detail/gnome-shell-integration/gphhapmejobijbbhgpjhcjognlahblep)

[History AutoDelete](https://chrome.google.com/webstore/detail/history-autodelete/bhfakmaiadhflpjloimlagikhodjiefj)

[JSON Viewer](https://chrome.google.com/webstore/detail/json-viewer/gbmdgpbipfallnflgajpaliibnhdgobh)

[Privacy Settings](https://chrome.google.com/webstore/detail/privacy-settings/ijadljdlbkfhdoblhaedfgepliodmomj)

### VSCodium

[Install](https://github.com/VSCodium/vscodium/releases)

### Standard Notes

[Download](https://standardnotes.org/extensions?downloaded=linux)

### Nextcloud

Add it to GNOME Online Accounts

### GNOME Extensions

[Bitcoin Markets](https://extensions.gnome.org/extension/648/bitcoin-markets/)

[Caffeine](https://extensions.gnome.org/extension/517/caffeine/)

[Clipboard Indicator](https://extensions.gnome.org/extension/779/clipboard-indicator/)

[cpufreq](https://extensions.gnome.org/extension/1082/cpufreq/)

[Dash to Dock](https://extensions.gnome.org/extension/307/dash-to-dock/)

[Do Not Disturb](https://extensions.gnome.org/extension/1480/do-not-disturb/)

[GSConnect](https://extensions.gnome.org/extension/1319/gsconnect/)

[OpenWeather](https://extensions.gnome.org/extension/750/openweather/)

### gpa

Download the deb package from https://packages.ubuntu.com/disco/gpa, convert to rpm with:

`$ alien -r  -c -v  gpa*.deb`

and install it with:

`$ sudo rpm --install gpa*.rpm --nodeps --force`

### Wasabi Wallet

[Install](https://github.com/zkSNACKs/WalletWasabi/releases)
