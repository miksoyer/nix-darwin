# dotfiles

### Features

---

- 使用nix-darwin管理所有系统配置，软件包及其配置
- 使用aerospace + jankyborders + sketchybar 定制桌面
- 毛玻璃wezterm + 毛玻璃vscode
- eza + bat + fzf 配置

### Installation

#### 1. 需要一个VPN
> ......

#### 2. install the command line tools(must)
> xcode-select --install

#### 3. clone the nix dotfile repository
> sudo git clone https://github.com/Fy-Apple/nix.git /etc/nix-darwin

#### 4. configure dir
> sudo chown $(id -nu):$(id -ng) /etc/nix-darwin
> sudo git config --global --add safe.directory /etc/nix-darwin

#### 5. install determined nix, choose no to avoid install nix for xxx
> curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install

#### 6. edit your hostname in settings ...Suggest that all names be the same
> sudo scutil --set HostName "HUAWEI-MateBook-Fold"
> sudo scutil --set LocalHostName "HUAWEI-MateBook-Fold"
> sudo scutil --set ComputerName "HUAWEI-MateBook-Fold"

#### 7. Installing nix-darwin
> sudo nix run nix-darwin/master#darwin-rebuild -- switch --impure


### Usage
- rebuild system
> sudo darwin-rebuild switch --impure --show-trace --flake /etc/nix-darwin#HUAWEI-MateBook-Fold
- choose theme
> `eza-theme`  `bat-theme`  `fzf-theme`
- choose bar
> `bar-theme`

