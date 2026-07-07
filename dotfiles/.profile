# запуск .bashrc
if [ -n "$BASH_VERSION" ]; then
    if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
    fi
fi

if [ -d "$HOME/.local/bin" ] ; then
    case ":${PATH}:" in
        *:"$HOME/.local/bin":*)
            ;;
        *)
            PATH="$HOME/.local/bin:$PATH"
            ;;
    esac
fi

# переменные окружения
export XDG_CURRENT_DESKTOP=i3
export DESKTOP_SESSION=i3
export XDG_SESSION_TYPE=x11
export _JAVA_AWT_WM_NONREPARENTING=1

