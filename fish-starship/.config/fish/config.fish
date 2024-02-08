if status is-interactive
    # Commands to run in interactive sessions can go here
end


#function fish_prompt
#    echo -n (basename $PWD) (fish_git_prompt) "><((°> "
#end

functions -e fish_right_prompt ;function fish_prompt --description 'Write out the prompt'
    set -l last_status $status

    set_color $fish_color_cwd
    #echo -n (prompt_pwd)
    echo -n $PWD
    set_color normal

    # __terlar_git_prompt
    #fish_hg_prompt
    echo (fish_git_prompt)

    #if not test $last_status -eq 0
    #    set_color $fish_color_error
    #end

    #echo -n '➤ '
    #echo -n (fish_git_prompt) '><((°> '
    echo -n '><((°> '
    #echo -n '><((°> fish_git_prompt
    set_color normal

end


function export
    if [ $argv ]
        set var (echo $argv | cut -f1 -d=)
        set val (echo $argv | cut -f2 -d=)
        set -g -x $var $val
    else
        echo 'export var=value'
    end
end

# Function to create a new Python virtual environment
function mkvenv
    python3 -m venv $argv[1]
    source $argv[1]/bin/activate
end


# Function to quickly search and install a package using apt
function aptinstall
    sudo apt search $argv[1]; and sudo apt install $argv[1]
end


function backup
    cp $argv[1] $argv[1].bak
end

function extract
    if test -f $argv[1]
        switch (string match -r '.*\.(tar\.gz|tar\.xz|tar\.bz2|tar|gz|bz2|zip|rar)$' $argv[1])
            case '*.tar.gz'
                tar xzf $argv[1]
            case '*.tar.xz'
                tar xJf $argv[1]
            case '*.tar.bz2'
                tar xjf $argv[1]
            case '*.tar'
                tar xf $argv[1]
            case '*.gz'
                gunzip $argv[1]
            case '*.bz2'
                bunzip2 $argv[1]
            case '*.zip'
                unzip $argv[1]
            case '*.rar'
                unrar x $argv[1]
            case '*'
                echo "Unsupported archive format: $argv[1]"
        end
    else
        echo "'$argv[1]' is not a valid file"
    end
end

function publicip
    curl -s ifconfig.me
end

function compress
    tar -czvf "$argv[1].tar.gz" "$argv[1]"
end

function organize_name
  bash ~/bash/util_organize_files_by_names.sh "$argv[1]"
end

function organize_size
  bash ~/bash/util_organize_files_by_sizes.sh "$argv[1]"
end

function organize_type
  bash ~/bash/util_organize_files_by_types.sh "$argv[1]"
end

function organize_revert
  bash ~/bash/util_organize_files_revert.sh "$argv[1]"
end

function gist
  bash ~/bash/upload_gist.sh "$argv[1]" "$argv[2]"
end

zoxide init fish | source
thefuck --alias | source

#alias cd z
alias cls clear
alias ls lsd
alias ll "lsd -la"
alias show batcat
abbr -a zz "z -"
abbr -a . pwd
abbr -a .. "z .."
abbr -a ... "z ./../../../"
alias vi nvim
alias update "sudo apt-get update & sudo apt-get upgrade"
alias install "sudo apt-get install"
# Display a random programming joke

starship init fish | source
