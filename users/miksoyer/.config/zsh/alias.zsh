# =========================================================
#                        Alias
# =========================================================
# fastfetch
alias ff='fastfetch'		# 显示系统基本信息

# 文件安全操作
alias cp='cp -i'                    # 交互式复制
alias mv='mv -i'                    # 交互式移动
alias rm='rm -i'                    # 交互式删除
alias mkdir='mkdir -p'              # 自动创建父目录



# 快速操作
alias cl='clear && ls'              # 清屏并列出文件
alias cr='clear'
alias sr='cr && source ~/.zshrc'          # 重新加载配置


alias gonix='cd /etc/nix-darwin'

# 重建nix-darwin配置
alias rebuild='sudo darwin-rebuild switch --impure --show-trace --flake /etc/nix-darwin#HUAWEI-MateBook-Fold'
# 更新nix-darwin配置并重建
alias uprebuild='nix flake update --commit-lock-file --flake /etc/nix-darwin && rebuild'

alias get-appid='sh $HOME/.config/mybin/get-appid.sh'

