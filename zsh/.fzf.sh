############
# fzf config
############
# set fzf defaults
export FZF_DEFAULT_OPTS="
  --height=40%
  --min-height=25
  --info=inline
  --preview-window='right:60%'
  --layout=reverse
"

# fzf a context
function _fuzzy_k8s_context() {
    kubectl config get-contexts \
        | fzf --header-lines=1 --delimiter='\s+' --nth=2.. \
        | sed 's/^[\*[:blank:]]*//' \
        | awk '{print $1;}'
}

# switch context
function kctx() {
    local ctx
    ctx=$(_fuzzy_k8s_context)
    [[ -n "$ctx" ]] && kubectl config use-context "$ctx"
}

alias invfzf='inv $(inv --list | cut -d " " -f 3 | sed "/^$/d" | fzf --preview="inv -h={}")'
