function fish_prompt
        and set retc green; or set retc red
    tty|string match -q -r tty; and set tty tty; or set tty pts

        if not set -q __fish_git_prompt_show_informative_status
                set -g __fish_git_prompt_show_informative_status 1
        end
        if not set -q __fish_git_prompt_hide_untrackedfiles
                set -g __fish_git_prompt_hide_untrackedfiles 1
        end

        if not set -q __fish_git_prompt_color_branch
                set -g __fish_git_prompt_color_branch magenta --bold
        end
        if not set -q __fish_git_prompt_showupstream
                set -g __fish_git_prompt_showupstream "informative"
        end
        if not set -q __fish_git_prompt_char_upstream_ahead
                set -g __fish_git_prompt_char_upstream_ahead "↑"
        end
        if not set -q __fish_git_prompt_char_upstream_behind
                set -g __fish_git_prompt_char_upstream_behind "↓"
        end
        if not set -q __fish_git_prompt_char_upstream_prefix
                set -g __fish_git_prompt_char_upstream_prefix ""
        end

        if not set -q __fish_git_prompt_char_stagedstate
                set -g __fish_git_prompt_char_stagedstate "●"
        end
        if not set -q __fish_git_prompt_char_dirtystate
                set -g __fish_git_prompt_char_dirtystate "✚"
        end
        if not set -q __fish_git_prompt_char_untrackedfiles
                set -g __fish_git_prompt_char_untrackedfiles "…"
        end
        if not set -q __fish_git_prompt_char_conflictedstate
                set -g __fish_git_prompt_char_conflictedstate "✖"
        end
        if not set -q __fish_git_prompt_char_cleanstate
                set -g __fish_git_prompt_char_cleanstate "✔"
        end

        if not set -q __fish_git_prompt_color_dirtystate
                set -g __fish_git_prompt_color_dirtystate blue
        end
        if not set -q __fish_git_prompt_color_stagedstate
                set -g __fish_git_prompt_color_stagedstate yellow
        end
        if not set -q __fish_git_prompt_color_invalidstate
                set -g __fish_git_prompt_color_invalidstate red
        end
        if not set -q __fish_git_prompt_color_untrackedfiles
                set -g __fish_git_prompt_color_untrackedfiles $fish_color_normal
        end
        if not set -q __fish_git_prompt_color_cleanstate
                set -g __fish_git_prompt_color_cleanstate green --bold
        end

	
    set_color $retc
    echo -n '┬─'
    set_color -o green
    echo -n [
    if test $USER = root -o $USER = toor
        set_color -o red
    else
        set_color -o yellow
    end
    echo -n $USER
    set_color -o white
    echo -n @
    if [ -z "$SSH_CLIENT" ]
        set_color -o blue
    else
        set_color -o cyan
    end
    echo -n (hostname)
    set_color -o white
    #echo -n :(prompt_pwd)
    echo -n :(pwd|sed "s=$HOME=~=")
    set_color -o green
    echo -n ']'
    set_color normal
	
	echo -n ' '
    echo -n (__fish_vcs_prompt)

    if type -q acpi
                if [ (acpi -a 2> /dev/null | string match -r off) ]
                        echo -n '─['
                        set_color -o red
                        echo -n (acpi -b|cut -d' ' -f 4-)
                        set_color -o green
                        echo -n ']'
                end
        end
    echo
    set_color normal
    for job in (jobs)
        set_color $retc
        echo -n '│ '
        set_color brown
        echo $job
    end
    set_color normal
    set_color $retc
    echo -n '╰─> '
    set_color normal
end

