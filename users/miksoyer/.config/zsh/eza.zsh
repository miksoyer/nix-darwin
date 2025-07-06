# ================================================================================================
#   filename = eza.zsh
#   eza/ls 配置
# ================================================================================================

# 1. env ~
export EZA_CONFIG_DIR="$HOME/.config/eza"       # eza配置目录
# export LS_COLORS="di:35"	# 目录显示绿色   该环境变量支持的文件类型不多，且会被EZA_COLORS覆盖
# export EZA_COLORS="da=35"	# 示例:日期显示绿色，会覆盖现有颜色配置的环境变量


# ================================================================================================
# 2. alias ~
# ================================================================================================'
alias ls='eza --color=always --group-directories-first --icons --classify=always'  # 默认列表视图，目录优先并显示图标
alias la='ls -a'        # 显示隐藏文件
alias ll='ls -l --git --git-repos-no-status -b --header --time-style="+%Y-%m-%d %H:%M"'   # 长格式显示，包含git状态
alias lla='ll -a'       # 长格式显示所有文件
alias lt='ls -T --level=2'      # 树形显示2级
alias ltt='ls -T --level=3'	# 树形显示3级
alias lta='lt -a'       # 树形视图显示隐藏文件

alias lx='la -l --extended --git --git-repos -b'

alias ls-d='ls -D'      # 只显示目录
alias la-d='la -D'      # 显示隐藏目录
alias ll-d='ll -D'      # 完整显示目录
alias ls-f='ls -f'      # 只显示文件
alias la-f='la -f'      # 显示隐藏文件
alias ll-f='ll -f'      # 长格式显示文件
alias ls-s='ls --show-symlinks' # 只显示软链
alias ls-g='ls --git-ignore'    # 忽略gitignore


# ===============================================================================================
# 3. functions ~
# ===============================================================================================
eza-theme() {
    local theme_file theme_name
    local current_theme=$(readlink -f "$EZA_CONFIG_DIR/theme.yml" 2>/dev/null)

    # choose themes
    theme_file=$(fd -e yml . "$EZA_CONFIG_DIR/themes" | \
        fzf --height 64% \
            --preview="
                # 临时设置预览主题
                ln -sf {} '$EZA_CONFIG_DIR/theme.yml'
                eza --color=always --icons=always -F=always -l -h --time-style=\"+%Y-%m-%d %H:%M\" '$EZA_CONFIG_DIR/examples'
            " \
            --preview-window="right:55%" \
            --prompt="Select eza theme > ")

    # 用户取消选择时恢复原主题
    if [[ -z "$theme_file" ]]; then
        echo "No theme selected!"
        [[ -n "$current_theme" ]] && ln -sf "$current_theme" "$EZA_CONFIG_DIR/theme.yml"
        return 1
    fi


    local current_name=$(basename "$current_theme" .yml)
    local theme_name=$(basename "$theme_file" .yml)

    # 显示最终效果
    echo -e "\nPreview with new theme : $theme_name"
    eza --color=always --icons=always "$EZA_CONFIG_DIR/examples"

    echo "\n=====================================================================================\n"
    echo "		✅ Eza theme is changed form [\033[1;32m$current_name\033[0m] to [\033[1;36m$theme_name\033[0m]"
    echo "\n====================================================================================="
}


# 重置默认颜色方案
eza-default() {
    ln -sf "$EZA_CONFIG_DIR/themes/default.yml" "$EZA_CONFIG_DIR/theme.yml"


    echo -e "\nPreview with default theme : $theme_name \n"
    eza --color=always --icons=always -F=always -l --time-style="+%Y-%m-%d %H:%M" "$EZA_CONFIG_DIR/examples"

    echo "\n=====================================================================================\n"
    echo "		✅ Eza theme is reset to [\033[1;36mdefault\033[0m]"
    echo "\n====================================================================================="
}


# 显示当前配置
eza-show() {
    local current_theme=$(readlink -f "$EZA_CONFIG_DIR/theme.yml" 2>/dev/null)
    local current_name=$(basename "$current_theme" .yml)

    echo "\nCurrent eza theme : [\033[1;36m$current_name\033[0m]"

    eza --color=always --icons=always -F=always -l --time-style="+%Y-%m-%d %H:%M" "$EZA_CONFIG_DIR/examples"

    echo "\n=====================================================================================\n"
    echo "		✅ Current eza theme is [\033[1;36m$current_name\033[0m]"
    echo "\n====================================================================================="
}

