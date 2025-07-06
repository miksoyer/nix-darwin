# disable sort when completing `git checkout`
zstyle ':completion:*:git-checkout:*' sort false
# set descriptions format to enable group support
# NOTE: don't use escape sequences (like '%F{red}%d%f') here, fzf-tab will ignore them
zstyle ':completion:*:descriptions' format '[%d]'
# set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# force zsh not to show completion menu, which allows fzf-tab to capture the unambiguous prefix
zstyle ':completion:*' menu no
# preview directory's content with eza when completing cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'
# custom fzf flags
# NOTE: fzf-tab does not follow FZF_DEFAULT_OPTS by default
zstyle ':fzf-tab:*' fzf-flags --color=fg:1,fg+:2 --bind=tab:accept
# To make fzf-tab follow FZF_DEFAULT_OPTS.
# NOTE: This may lead to unexpected behavior since some flags break this plugin. See Aloxaf/fzf-tab#455.
zstyle ':fzf-tab:*' use-fzf-default-opts yes
# switch group using `<` and `>`
zstyle ':fzf-tab:*' switch-group '<' '>'


# --- 补全 ---
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':fzf-tab:*' switch-group '<' '>'
zstyle ':completion:complete:*:options' sort false
FZF_TAB_GROUP_COLORS=(
    $'\033[92m' $'\033[95m' $'\033[33m' $'\033[35m' $'\033[31m' $'\033[38;5;27m' $'\033[36m' \
    $'\033[38;5;100m' $'\033[38;5;98m' $'\033[91m' $'\033[38;5;80m' $'\033[92m' \
    $'\033[38;5;214m' $'\033[38;5;165m' $'\033[38;5;124m' $'\033[38;5;120m'
)
zstyle ':fzf-tab:*' group-colors $FZF_TAB_GROUP_COLORS
palette() {
    local -a colors
    for i in {000..255}; do
        colors+=("%F{$i}$i%f")
    done
    print -cP $colors
}
printc() {
    local color="%F{$1}"
    echo -E ${(qqqq)${(%)color}}
}


# 预览包管理器的软件包信息
zstyle ':fzf-tab:complete:pacman:*' fzf-preview 'echo -e "\033[38;5;208mAPT introduction\033[0m" && (pacman -Qi $word || pacman -Si $word)'
zstyle ':fzf-tab:complete:paru:*' fzf-preview 'echo -e "\033[38;5;208mNala introduction\033[0m" && (paru -Qi $word || paru -Si $word)'
zstyle ':fzf-tab:complete:(pacman|paru):*' fzf-flags --preview-window=right:60%:wrap


# 查看tldr信息
zstyle ':fzf-tab:complete:tldr:argument-1' fzf-preview '(echo -e "\033[38;5;208mBrief Introduction\033[0m" && out=$(tldr --color "$word") 2>/dev/null && echo $out) || (out=$(MANWIDTH=$FZF_PREVIEW_COLUMNS man "$word") 2>/dev/null && echo $out) || (out=$(which "$word") && echo $out) || echo "${(P)word}"'
zstyle ':fzf-tab:complete:tldr:argument-reset' fzf-flags --preview-window=right:65%:wrap
# 命令名补全预览：显示命令的位置
zstyle ':fzf-tab:complete:-command-:*' fzf-preview '(echo -e "\033[38;5;208mBrief introduction\033[0m" && out=$(tldr --color "$word") 2>/dev/null && echo $out) || (out=(MANWIDTH=$FZF_PREVIEW_COLUMNS man "$word") 2>/dev/null && echo $out) || (out=$(which "$word") && echo $out) || echo "${(P)word}"'
zstyle ':fzf-tab:complete:tldr:argument-1' fzf-flags --preview-window=right:65%:wrap



# 预览要进入的目录
zstyle ':fzf-tab:complete:(cd|z):*' fzf-preview 'eza --icons=always --color=always --tree --level=2 $realpath'
zstyle ':fzf-tab:complete:(cd|z):*' fzf-flags --preview-window=right:wrap:60%

# 打印当前目录信息
zstyle ':fzf-tab:complete:(ls|eza):*' fzf-preview 'eza --color=always --long --git --no-filesize --icons=always --no-time --no-user --no-permissions $realpath'
zstyle ':fzf-tab:complete:(ls|eza):*' fzf-flags --preview-window=right:wrap:70%



# 预览kill和ps显示进程
#zstyle ':completion:*:*:*:*:processes' command "(date;ps -u $USER --no-header -o pid,user,cmd -w -w)"
#zstyle ':fzf-tab:complete:(kill|ps):argument-rest' fzf-preview \
#        'if [[ $group == "[process ID]" ]];then ps --pid=$word -o uid,pid,start,time,comm,%cpu,%mem -w -w;else echo -e "\033[38;5;160mPlease choose group[process ID]\033[0m"; fi'
#zstyle ':fzf-tab:complete:(kill|ps):argument-flags' fzf-flags --preview-window=down:3:wrap  --header=$'Processes list\n\n'


zstyle ':completion:*:*:(kill|ps):*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:(kill|ps):*' command 'date;ps -u $USER -o pid,%cpu,tty,cputime,cmd -w -w'
zstyle ':fzf-tab:complete:(kill|ps):*' fzf-preview \
        'if [[ $group == "[process ID]" ]];then ps --pid=$word -o uid,pid,start,time,comm,%cpu,%mem -w -w;else echo -e "\033[38;5;160mPlease choose group[process ID]\033[0m"; fi'
zstyle ':fzf-tab:complete:(kill|ps):*' fzf-flags --preview-window=down:3:wrap  --header=$'Processes list\n\n'



# 显示systemd的服务状态
zstyle ':fzf-tab:complete:systemctl-*:*' fzf-preview 'echo -e "\033[38;5;208mSystemctl Status Preview:\033[0m"; systemctl status $word | bat --style=numbers --color=always --paging=always --theme="OneHalfDark"'
zstyle 'fzf-tab:complete:systemctl-*-*:argument-reset' fzf-flags --preview-window=right:wrap

# export 命令补全预览：显示环境变,和变量的值,打印变量
zstyle ':fzf-tab:complete:(export|unset|echo):*' fzf-preview 'printenv $word || echo -e "\033[38;5;160mEnvironment variable not set\033[0m"'





# 实验性功能

# 在你的 .zshrc 文件中添加以下内容
zstyle ':fzf-tab:complete:(\\|*/|):c++:argument-rest' command 'c++ -o- -S $realpath | bat -l asm'

zstyle ':fzf-tab:complete:(\\|*/|):cc:argument-rest' command 'cc -o- -S $realpath | bat -lasm'
