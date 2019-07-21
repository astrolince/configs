## Linux: [Manjaro KDE](https://manjaro.org/download/)

### General

`$ sudo pacman -Syyu tree vim android-tools aria2 dnscrypt-proxy tor go gimp audacity exa gamemode neofetch zsh telegram-desktop kdenlive peek riot-desktop flatpak keybase-gui gpa rust brave bitcoin-qt nodejs code libreoffice-fresh`

`$ flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo`

`$ flatpak install flathub com.bitwarden.desktop`

### Vim

[~/.vimrc](https://raw.githubusercontent.com/astrolince/configs/master/~/.vimrc)

### NetworkManager

[/etc/NetworkManager/conf.d/30-randomize-mac-address.conf](https://raw.githubusercontent.com/astrolince/configs/master/etc/NetworkManager/conf.d/30-randomize-mac-address.conf)

`$ sudo systemctl restart NetworkManager`

### dnscrypt-proxy

[/etc/dnscrypt-proxy/dnscrypt-proxy.toml](https://raw.githubusercontent.com/astrolince/configs/master/etc/dnscrypt-proxy/dnscrypt-proxy.toml)

`$ sudo systemctl enable dnscrypt-proxy.socket`

`$ sudo systemctl start dnscrypt-proxy.socket`

Set DNS to 127.0.0.1 and disable IPv6 from GUI, reconnect to the network

### Oh My Zsh

[Install](https://github.com/robbyrussell/oh-my-zsh#basic-installation)

[~/.zshrc](https://raw.githubusercontent.com/astrolince/configs/master/~/.zshrc)

### Keybase

Import the public key:

`$ keybase pgp export | gpg --import`

Import the private key:

`$ keybase pgp export -s | gpg --allow-secret-key-import --import`

### Git

`$ git config --global color.ui true`

`$ git config --global user.name "astrolince"`

`$ git config --global user.email "astro@astrolince.com"`

Restore keys to `~/.ssh`

`$ git config --global user.signingkey CC39C6D77BDF0053`

`$ git config --global commit.gpgsign true`

### Bitcoin Core

[~/.bitcoin/bitcoin.conf](https://raw.githubusercontent.com/astrolince/configs/master/~/.bitcoin/bitcoin.conf)

### Hosty

`$ curl -L git.io/hosty | sh`

### Brave

Extensions:

[Bitwarden](https://chrome.google.com/webstore/detail/bitwarden-free-password-m/nngceckbapebfimnlniiiahkandclblb)

[Cookie AutoDelete](https://chrome.google.com/webstore/detail/cookie-autodelete/fhcgjolkccmbidfldomjliifgaodjagh)

[Decentraleyes](https://chrome.google.com/webstore/detail/decentraleyes/ldpochfccmkkmhdbclfhpagapcfdljkj)

[JSON Viewer](https://chrome.google.com/webstore/detail/json-viewer/gbmdgpbipfallnflgajpaliibnhdgobh)

[Privacy Settings](https://chrome.google.com/webstore/detail/privacy-settings/ijadljdlbkfhdoblhaedfgepliodmomj)

### Steam

Launch options for games optimization

Native games:

`GAMEMODERUNEXEC="env DRI_PRIME=1 mesa_glthread=true" gamemoderun %command%`

Proton games:

`GAMEMODERUNEXEC="env DRI_PRIME=1 mesa_glthread=true PROTON_NO_ESYNC=1" gamemoderun %command%`

### Standard Notes

[Download](https://standardnotes.org/extensions?downloaded=linux)

### Wasabi Wallet

[Install](https://github.com/zkSNACKs/WalletWasabi/releases)

