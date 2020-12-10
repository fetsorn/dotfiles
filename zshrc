# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# unlimited history
export HISTFILESIZE=1000000000
export HISTSIZE=1000000000
# immediate append
setopt INC_APPEND_HISTORY
export HISTTIMEFORMAT="[%F %T] "
# add timestamp to history
setopt EXTENDED_HISTORY
# write duplicates to history but hide from search
setopt HIST_FIND_NO_DUPS

# color ls output
alias ls='ls -G'

# boilerplate for emacs-libvterm
vterm_printf(){
    if [ -n "$TMUX" ]; then
        # Tell tmux to pass the escape sequences through
        # (Source: http://permalink.gmane.org/gmane.comp.terminal-emulators.tmux.user/1324)
        printf "\ePtmux;\e\e]%s\007\e\\" "$1"
    elif [ "${TERM%%-*}" = "screen" ]; then
        # GNU screen (screen, screen-256color, screen-256color-bce)
        printf "\eP\e]%s\007\e\\" "$1"
    else
        printf "\e]%s\e\\" "$1"
    fi
}

alias blender="/Volumes/HD-PATU3/Applications/Blender.app/Contents/MacOS/Blender"
export PATH="$PATH:/Library/TeX/texbin"

# p10k boilerplate
source /usr/local/opt/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f "/Users/fetsorn/.ghcup/env" ] && source "/Users/fetsorn/.ghcup/env" # ghcup-env
export PATH="$PATH:/Users/fetsorn/.cabal/bin:/Users/fetsorn/.ghcup/bin:/Users/fetsorn/.local/bin"
