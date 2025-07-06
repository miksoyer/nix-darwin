# --- fzf 配置文件 ---
# --- 默认查找为全家目录查找 ---
export FZF_DEFAULT_COMMAND='fd --hidden --follow --color=always --exclude .git --exclude .vscode --exclude build . "$HOME" "/etc" '
# --- 配置默认样式 ---
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
  --color=fg:-1,fg+:#eeeeee,bg:-1,bg+:#262626
  --color=hl:#b294bb,hl+:#5fd7ff,info:#c0eb98,marker:#d53d3d
  --color=prompt:#ee4d4d,spinner:#8abeb7,pointer:#ffeb66,header:#81e6e6
  --color=gutter:#333333,border:#fbe8f1,scrollbar:#b4aeb2,preview-scrollbar:#5d5d5d
  --color=label:#c5c8c6,query:#f0c674
  --border="rounded" --border-label="" --preview-window="border-rounded" --prompt=" 🔍"
  --marker="√" --pointer="➤" --separator="─" --scrollbar="▒"
  --preview-window=right:65% --height=60% --min-height=12
  --ansi
  --layout="reverse" --info="right"
  --bind "ctrl-u:preview-up"
  --bind "ctrl-d:preview-down"
'

# 设置 CTRL_T 以使用 fd 查找文件
export FZF_CTRL_T_COMMAND='fd --type f --color=always --exclude build'
preview="\
case \$(file --mime-type -Lb {}) in
  text/*) bat --style=numbers,grid,header --color=always --theme="CatppuccinMocha" {} ;;
  json/*) bat {} ;;
  image/*) ~/.config/zsh/img_preview.zsh {} ;;
  application/pdf) mupdf {} ;;
  application/x-tar|application/zip|application/x-7z-compressed|application/gzip|application/x-xz|\
  application/x-lzma|application/x-bzip2|application/x-lz4|application/vnd.google.snaappy|application/zstd|\
  application/x-rar ) ouch list {} --tree ;;
  application/json) jq -Cr . {} || less {} ;;
  *) echo 'Filetype not supported for preview' ;;
esac"
# 设置 CTRL_T 以配置 fzf 显示选项和预览
export FZF_CTRL_T_OPTS="--header 'CTRL+H: toggle to search for hidden files'
        --prompt 'Default> '
        --bind 'ctrl-h:change-prompt(Hidden > )+reload(fd --type f --hidden --color=always --exclude .git --exclude .vscode --exclude build)'
        --bind 'ctrl-t:change-prompt(Default> )+reload(fd --type f --color=always --exclude build)'
        --preview \"${preview}\"
"



# 设置 ALT_C以使用 fd 查找目录
export FZF_ALT_C_COMMAND='fd --type d --color=always --exclude build'
# 设置 ALT_C 以配置 fzf 显示选项、预览等
export FZF_ALT_C_OPTS="--preview 'eza --tree --level=3 --icons=always --color=always {} | head -200'
        --header 'CTRL+H: Toggle to search for hidden directories'
        --prompt 'Default> '
        --bind 'ctrl-h:change-prompt(Hidden > )+reload(fd --type d --hidden --color=always --exclude .git --exclude .vscode --exclude build)'
        --bind 'alt-c:change-prompt(Default> )+reload(fd --type d --color=always --exclude build)'
"

# 设置 CTRL_R 以设置复制命令和查看详细命令
export FZF_CTRL_R_OPTS="
  --preview 'echo {} | GREP_COLORS=\"ms=01;33\" grep --color=always .'
  --preview-window up:follow:hidden:wrap
  --bind 'ctrl-/:toggle-preview'
  --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'
  --color header:italic
  --header 'Press CTRL-Y to copy command into clipboard ,Press ctrl+/ to display the full command'
"


# 设置CTRL_G 以设置rg结合fzf通过文本内容实时查找文件名并实时预览
fzf_rg_search() {
# Switch between Ripgrep mode and fzf filtering mode (CTRL-T)
rm -f /tmp/rg-fzf-{r,f}
RG_PREFIX="rg --column --line-number --no-heading --color=always --smart-case -g '!*/build/*' -g '!bin/*' -g '!/boot/*' -g '!/dev/*' -g '!/etc/*' -g !'/lib/*' -g '!/lib64/*' -g '!/lost+found/*' -g !'/mnt/*' -g '!/opt/*' -g '!/proc/*' -g '!/run/*' -g '!/sbin/*' -g '!/srv/*' -g '!/sys/*' -g '!/tmp/*' -g '!/usr/*' -g '!/var/*' -g '!/home/$USER/.local/*' "
INITIAL_QUERY="${*:-}"
: | fzf --ansi --disabled --query "$INITIAL_QUERY" \
    --bind "start:reload:$RG_PREFIX {q}" \
    --bind "change:reload:sleep 0.1; $RG_PREFIX {q} || true" \
    --bind 'ctrl-t:transform:[[ ! $FZF_PROMPT =~ ripgrep ]] &&
      echo "rebind(change)+change-prompt(1. ripgrep> )+disable-search+transform-query:echo \{q} > /tmp/rg-fzf-f; cat /tmp/rg-fzf-r" ||
      echo "unbind(change)+change-prompt(2. fzf> )+enable-search+transform-query:echo \{q} > /tmp/rg-fzf-r; cat /tmp/rg-fzf-f"' \
    --color "hl:-1:underline,hl+:-1:underline:reverse" \
    --prompt '1. ripgrep> ' \
    --delimiter : \
    --header 'CTRL-T: Switch between ripgrep/fzf' \
    --preview 'bat --color=always {1} --highlight-line {2} --theme="OneHalfDark" --style=numbers,grid' \
    --preview-window 'right,60%,+{2}+3/3,~3' \
    --bind 'enter:become(nvim {1} +{2})'
}
# 绑定快捷键
zle -N fzf_rg_search
bindkey '^G' fzf_rg_search



alias bi='zsh ~/.config/zsh/bin/bi'

# Install (one or multiple) selected application(s)
# using "brew search" as source input
# mnemonic [B]rew [I]nstall [P]ackage
bip() {
  local inst=$(brew search "$@" | fzf -m)

  if [[ $inst ]]; then
    for prog in $(echo $inst);
    do; brew install $prog; done;
  fi
}

# Update (one or multiple) selected application(s)
bup() {
  local upd=$(brew leaves | fzf -m)

  if [[ $upd ]]; then
    brew update
    for prog in $(echo $upd);
    do; brew upgrade $prog; done;
  fi
}

# Delete (one or multiple) selected application(s)
bcp() {
  local uninst=$(brew leaves | fzf -m)

  if [[ $uninst ]]; then
    for prog in $(echo $uninst);
    do; brew uninstall $prog; done;
  fi
}


# docker
# Select a docker container to start and attach to
function dk-ath() {
  local cid
  cid=$(docker ps -a | sed 1d | fzf -1 -q "$1" | awk '{print $1}')

  [ -n "$cid" ] && docker start "$cid" && docker attach "$cid"
}
# Select a running docker container to stop
function dk-stop() {
  local cid
  cid=$(docker ps | sed 1d | fzf -q "$1" | awk '{print $1}')

  [ -n "$cid" ] && docker stop "$cid"
}
# Select a docker image or images to remove
function dk-rm() {
  docker images | sed 1d | fzf -q "$1" --no-sort -m --tac | awk '{ print $3 }' | xargs -r docker rmi
}


# process
# fkill - kill processes - list only the ones you can kill. Modified the earlier script.
fkill() {
    local pid
    if [ "$UID" != "0" ]; then
        pid=$(ps -f -u $UID | sed 1d | fzf -m | awk '{print $2}')
    else
        pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')
    fi

    if [ "x$pid" != "x" ]
    then
        echo $pid | xargs kill -${1:-9}
    fi
}

#
# git
#
# fgck - checkout git branch/tag, with a preview showing the commits between the tag/branch and HEAD
fgck_p() {
  local tags branches target
  branches=$(
    git --no-pager branch --all \
      --format="%(if)%(HEAD)%(then)%(else)%(if:equals=HEAD)%(refname:strip=3)%(then)%(else)%1B[0;34;1mbranch%09%1B[m%(refname:short)%(end)%(end)" \
    | sed '/^$/d') || return
  tags=$(
    git --no-pager tag | awk '{print "\x1b[35;1mtag\x1b[m\t" $1}') || return
  target=$(
    (echo "$branches"; echo "$tags") |
    fzf --no-hscroll --no-multi -n 2 \
        --ansi --preview="git --no-pager log -150 --pretty=format:%s '..{2}'") || return
  git checkout $(awk '{print $2}' <<<"$target" )
}

# fshow - git commit browser
fshow() {
  git log --graph --color=always \
      --format="%C(auto)%h%d %s %C(black)%C(bold)%cr" "$@" |
  fzf --ansi --no-sort --reverse --tiebreak=index --bind=ctrl-s:toggle-sort \
      --bind "ctrl-m:execute:
                (grep -o '[a-f0-9]\{7\}' | head -1 |
                xargs -I % sh -c 'git show --color=always % | less -R') << 'FZF-EOF'
                {}
FZF-EOF"
}

alias glNoGraph='git log --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr% C(auto)%an" "$@"'
_gitLogLineToHash="echo {} | grep -o '[a-f0-9]\{7\}' | head -1"
_viewGitLogLine="$_gitLogLineToHash | xargs -I % sh -c 'git show --color=always % | diff-so-fancy'"

# fcoc_preview - checkout git commit with previews
fcoc_preview() {
  local commit
  commit=$( glNoGraph |
    fzf --no-sort --reverse --tiebreak=index --no-multi \
        --ansi --preview="$_viewGitLogLine" ) &&
  git checkout $(echo "$commit" | sed "s/ .*//")
}

# fshow_preview - git commit browser with previews
fshow_preview() {
    glNoGraph |
        fzf --no-sort --reverse --tiebreak=index --no-multi \
            --ansi --preview="$_viewGitLogLine" \
                --header "enter to view, alt-y to copy hash" \
                --bind "enter:execute:$_viewGitLogLine   | less -R" \
                --bind "alt-y:execute:$_gitLogLineToHash | xclip"
}



















# 初始fzf并启用zsh的补全和键绑定
source <(fzf --zsh)
