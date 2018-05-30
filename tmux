# Usage:
# - Prefix is set to Ctrl-a (make sure you remapped Caps Lock to Ctrl)
# - All prefixed with Ctrl-a
#   - Last used window: /
#   - Last used pane:   ;
#   - Vertical split:   v
#   - Horizontal split: s
#   - Previous window:  [
#   - Next window:      ]
#   - Choose session:   Ctrl-s
#   - Quick window:     Ctrl-q
# List of plugins
set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'tmux-plugins/tmux-sensible'
set -g @plugin 'tmux-plugins/tmux-online-status'
set -g @plugin 'tmux-plugins/tmux-sidebar'
set -g @plugin 'tmux-plugins/tmux-battery'
#
### LOOK & FEEL ###
set -g default-terminal "xterm-256color"

# set shell
#set -g default-shell /usr/local/bin/zsh

# default statusbar colors
set-option -g status-bg colour235
set-option -g status-fg colour179
set-option -g status-attr default

# default window title colors
set-window-option -g window-status-fg colour244
set-window-option -g window-status-bg default

# active window title colors
set-window-option -g window-status-current-fg colour166
set-window-option -g window-status-current-bg default
set-window-option -g window-status-current-attr bright

# pane border
set-option -g pane-border-fg colour235
set-option -g pane-active-border-fg colour240

# pane number display
set-option -g display-panes-active-colour colour33
set-option -g display-panes-colour colour166

# online status
set -g @online_icon "#[fg=green]✓"
set -g @offline_icon "#[fg=red]✗"

# status bar right contents
set -g status-right-length 90
set -g status-right "%a, %d %b at %R, #(uptime | cut -f 3-6 -d \" \" | cut -f 1 -d \",\"), #[fg=cyan]#{battery_percentage} #{battery_remain} #{online_status} #[fg=default]#(ifconfig | awk '$1 == \"inet\" { print $2 }'|tail -1) #[fg=cyan]#(dig +short myip.opendns.com @resolver1.opendns.com)"
set -g status-interval 15

# focus events enabled for terminals that support them
set -g focus-events on

# super useful when using "grouped sessions" and multi-monitor setup
setw -g aggressive-resize on

# Toggle mouse on with ^B m
bind m \
  set -g mouse on \;\
  display 'Mouse: ON'

# Toggle mouse off with ^B M
bind M \
  set -g mouse off \;\
  display 'Mouse: OFF'

set-option -g status-keys vi
set-option -g mode-keys vi

#no command delay
set -sg escape-time 0

#count windows and panes from 1
set -g base-index 1
setw -g pane-base-index 1

### KEYS ###

#using C-a as prefix
unbind C-b
set-option -g prefix C-a
bind C-a send-prefix

unbind /
bind / last-window

unbind %
bind s split-window -v
unbind '"'
bind v split-window -h

bind h select-pane -L
bind j select-pane -D
bind k select-pane -U
bind l select-pane -R

unbind {
bind { swap-pane -D
unbind }
bind } swap-pane -U

unbind r
bind r source-file ~/.tmux.conf; display "Reloaded"

bind Escape copy-mode
bind p paste-buffer

unbind [
bind [ previous-window
unbind ]
bind ] next-window

unbind o
bind o select-pane -t :.-

bind C-q command-prompt -p "Quick window command: " "new-window '%%'"

#bind -T vi-copy 'v' begin-selection
#bind -T vi-copy 'y' copy-selection

bind C-c run "tmux save-buffer - | pbcopy"
bind C-v run "tmux set-buffer \"$(pbpaste)\"; tmux paste-buffer"

bind C-s choose-session

# Initialize TMUX plugin manager (keep this line at the very bottom of tmux.conf)
run '~/.tmux/plugins/tpm/tpm'
