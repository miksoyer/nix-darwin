# ===========================================================================
# 	filename = bat.zsh 
# 	bat/cat 配置
# ===========================================================================

# 1. env ~
export BAT_CONFIG_DIR="$HOME/.config/bat"		# bat配置目录
export BAT_CONFIG_PATH="$BAT_CONFIG_DIR/config"		# bat配置文件
export MANPAGER="sh -c 'sed -u -e \"s/\\x1B\[[0-9;]*m//g; s/.\\x08//g\" | bat -p -lman'"	# man使用bat输出
export BATDIFF_USE_DELTA=true		# batdiff 默认使用 git-delta 查看

# ===========================================================================
# 2. alias ~
# ===========================================================================
alias cat='bat --paging=never --color=always --style=-header,-grid,-numbers'	# 默认cat不分页只颜色输出
alias cat-l='bat --paging=never --color=always --style=full'	# l 完整style显示
alias cat-x='bat --paging=never --show-all'	# x 显示所有详细信息包括空格制表符
alias bat-l='bat --style=-header,-grid,-numbers'	# 分页颜色输出
alias bat-x='bat --show-all --number'		# bat show linenumber 和 不可见字符
alias bat-i='bat --plain --paging=never | head -n 10 | bat --file-name="$1" --style=numbers,header'	# 详细信息


# ===========================================================================
# 3. others ~
# ===========================================================================

# 交互式选择主题
bat-theme() {
    local theme
    theme=$(bat --list-themes | fzf --height 60% \
        --preview="bat --theme={} --color=always $BAT_CONFIG_DIR/example.rs" \
        --preview-window="right:60%")

    [[ -z "$theme" ]] && { echo "no theme selected! "; return; }

    # 保留上一次配置文件
    mkdir -p "$BAT_CONFIG_DIR"

    rg --passthru -q '^--theme=' "$BAT_CONFIG_PATH" \
        && sed -i.bak "s/^--theme=.*/--theme=\"$theme\"/" "$BAT_CONFIG_PATH" \
        || echo "--theme=\"$theme\"" >> "$BAT_CONFIG_PATH"

    bat --theme="$theme" "$BAT_CONFIG_DIR/example.rs"
    echo "=================================================================================\n"
    echo "		✅ Bat-theme is changed : \033[1;36m$theme\033[0m"
    echo "\n================================================================================="
}

# 重置为默认主题 (bat-default)
bat-default() {
    rg --passthru -q '^--theme=' "$BAT_CONFIG_PATH" \
        && sed -i.bak 's/^--theme=.*/--theme=default/' "$BAT_CONFIG_PATH"
    
    bat --theme="" "$BAT_CONFIG_DIR/example.rs"

    echo "=================================================================================\n"
    echo "		✅ \e[37mBat theme is set to default."
    echo "\n================================================================================="
}

# 显示当前主题 (bat-current)
bat-show() {
    local current_theme
    current_theme=$(rg '^--theme=' "$BAT_CONFIG_PATH" 2>/dev/null | cut -d'"' -f2)
    if [[ -n "$current_theme" ]]; then
	echo "Preview the current Theme: $current_theme \n"
	bat "$HOME/.config/bat/show.go"
	echo "=================================================================================\n"
    	echo "		✅ The current bat theme is [\e[31m$current_theme\e[0m]."
    	echo "\n================================================================================="
    else
	echo "=================================================================================\n"
        echo "The current Bat theme is \e[31mdefault"
	echo "\n================================================================================="
    fi
}


