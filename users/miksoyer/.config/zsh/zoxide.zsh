# ================================================================================================
#   filename = zoxide.zsh
#   package : zoxide 
# ================================================================================================

# 1. env ~
export _ZO_DATA_DIR="$HOME/.config/zoxide"    	# zoxide 数据目录
# export _ZO_ECHO=1	# 跳转时显示目录名, 先关闭，采用自定义内容在函数中
export _ZO_EXCLUDE_DIRS="$([ "$(uname)" = "Darwin" ] && echo "/Applications/*:/bin/*:/cores/*:/dev/*:/etc/*:/Library/*:/opt/*:/sbin/*:/System/*:/tmp/*:/Users/Shared/*:/usr/*:/var/*:/Volumes/*:$HOME/.cache/*:$HOME/.local/*" || echo "/bin/*:/boot/*:/dev/*:/etc/*:/lib/*:/lib64/*:/lost+found/*:/mnt/*:/opt/*:/proc/*:/root/*:/run/*:/sbin/*:/srv/*:/sys/*:/tmp/*:/usr/*:/var/*:/home/$USER/.local/*")"	# 在macOS和Linux上排除不需要记录的目录

# 设置 fzf 的自定义选项（可选）
#export _ZO_FZF_OPTS="--height 40% --layout=reverse --border"

# 限制数据库的最大条目数
export _ZO_MAXAGE=6666

# 添加目录前解析符号链接,用于存储实际路径
#export _ZO_RESOLVE_SYMLINKS=1


# ================================================================================================
# 2. alias ~
# ================================================================================================
alias work='__zoxide_z $HOME/workspace'

alias z='cd'	# z默认使用下方智能cd
alias zl='zoxide query -l | fzf'                  # 列出所有记录
alias zh='zoxide query -l | head -n 10'           # 显示常用目录
alias zs='zoxide query -s'                        # 按分数排序


# ================================================================================================
# 3. functions ~
# ================================================================================================
# 交互式目录选择器，替代默认zi
function zdi() {
    local preview_cmd="eza --color=always -F=always --group-directories-first --icons=always -l -h --git --git-repos --time-style=\"+%Y-%m-%d %H:%M\" --no-user --no-permissions"

    # 使用fzf交互选择
    while true; do
	local dir=$(eza -D | fzf \
	    --height 60% \
	    --preview="$preview_cmd {}" \
            --preview-window="right:55%" \
            --prompt="Select directory (Tab: toggle hidden) > " \
            --bind "tab:reload(eza -D -a)+change-preview($preview_cmd -a {})")

        # 处理选择结果
      	[[ ${#dir} != 0 ]] || break
        __zoxide_z "$dir"
    done
    
    echo "cd in \033[36m$(pwd)\033[0m"
    return 0
  }

# 智能cd,交互目录选择
function cd() {
    if [ $# -eq 0 ]; then
        zdi  # 无参数时调用zi
    elif [ -d "$1" ]; then
	builtin cd "$1"
    else
	__zoxide_z "$1" && echo "cd in \033[37m$(pwd)\033[0m"  # 仅在成功时打印
    fi
}

# 结合fzf交互式在历史目录跳转
function zd () {
    local dir
    dir=$(zoxide query -l | fzf \
        --height 60% \
        --preview="eza --color=always --group-directories-first --icons=always --classify=always -l --git --git-repos-no-status --time-style=\"+%Y-%m-%d %H:%M\" --no-user --no-permissions {}" \
        --preview-window="right:55%" \
        --prompt="Select directory > ")

    [ -n "$dir" ] && __zoxide_z "$dir"	# 直接cd文件夹得分不会提高
    
    echo "cd in \033[37m$(pwd)\033[0m"
}

# 显示统计信息
function z-show() {
    echo "\n\033[1;36m▶ Zoxide 目录统计\033[0m"
    echo "─────────────────────────────────────────────────────────────────────────────────────────"
    
    # 处理前20条数据
    echo "score    path                                   realpath"
    zoxide query -l -s | awk '{print $1, $2}' | xargs -n2 sh -c '
        if [ -L "$2" ]; then
            printf "%-8s \033[36m%-40s\033[0m → \033[33m%s\034[0m\n" "$1" "$2" "$(readlink -f "$2")"
        else
            printf "%-8s \033[36m%-40s\033[0m ---\n" "$1" "$2"
        fi
    ' _

    local record_num=$(zoxide query -l | rg -c '^')
    [ "$record_num" -gt 20 ] && echo "\n......"

    echo "\n=====================================================================================\n"
    echo "      ✅ Zoxide total [\033[1;36m$record_num\033[0m] directores tracked"
    echo "\n====================================================================================="
}

# 清空数据库
function z-clean() {
    echo "\n\033[1;33m▶ Cleaning old records...\033[0m"
    echo "─────────────────────────────────────────────────────────────────────────────────────────"
    
    builtin rm $_ZO_DATA_DIR/*
    
    echo "\n=====================================================================================\n"
    echo "	✅\033[1;32m  Zoxide database cleaned\033[0m"
    echo "\n====================================================================================="
}