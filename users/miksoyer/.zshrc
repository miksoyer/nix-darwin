# !/bin/zsh
# 初始化zinit插件管理器
ZINIT_HOME="${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"
#zinit self-update
#zini update

# 插件下载
zinit light zsh-users/zsh-completions
autoload -U compinit; compinit
# zinit light Aloxaf/fzf-tab
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions


# zsh配置
HISTSIZE=6666		    # 内存中历史记录的大小
# HISTFILE=$HOME/.config/zsh/cache/zsh_history	# 保存在历史记录文件中的命令数
# SAVEHIST=$HISTSIZE	    # 历史记录文件的位置
HISTDUP=erase		    # 每当一个命令被输入，再次保存到历史记录时，所有该命令的旧条目将被删除
setopt APPEND_HISTORY	    # 将历史命令追加到历史文件中
setopt sharehistory	    # 共享历史记录
setopt HIST_FIND_NO_DUPS    # 不显示 先前找到的行的重复项，即使重复项不是 连续
setopt HIST_IGNORE_ALL_DUPS # 如果添加到历史记录列表中的新命令行重复了 较旧的命令，较旧的命令将从列表中删除
setopt HIST_IGNORE_DUPS	    # 忽略重复的历史记录条目
setopt HIST_IGNORE_SPACE    # 忽略以空格开头的命令，不将它们记录在历史记录中
setopt HIST_SAVE_NO_DUPS    # 保存历史记录时，不保存重复的命令
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# 导入其他配置
source $HOME/.config/zsh/alias.zsh || echo "oh my god, there is an error [file not exist] -> zsh/alias.zsh"
source $HOME/.config/zsh/bat.zsh || echo "oh my god, there is an error [file not exist] -> zsh/bat.zsh"
source $HOME/.config/zsh/clangd.zsh || echo "oh my god, there is an error [file not exist] -> zsh/clangd.zsh"
source $HOME/.config/zsh/eza.zsh || echo "oh my god, there is an error [file not exist] -> zsh/eza.zsh"
source $HOME/.config/zsh/fzf.zsh || echo "oh my god, there is an error [file not exist] -> zsh/fzf.zsh"
source $HOME/.config/zsh/zoxide.zsh || echo "oh my god, there is an error [file not exist] -> zsh/zoxide.zsh"

function yy() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

alias -g -- -h='-h 2>&1 | bat --language=help --style=plain'
alias -g -- --help='--help 2>&1 | bat --language=help --style=plain'


eval "$(starship init zsh)" || echo "~"

# 初始化 zoxide, 必须放在zoxide相关设置后最后导入
[[ "$SHELL" == */zsh ]] && source <(fzf --zsh) || echo ""

# 初始化 zoxide, 必须放在zoxide相关设置后最后导入
[[ "$SHELL" == */zsh ]] && eval "$(zoxide init --no-cmd zsh)" || echo ""

