if status is-interactive
    # Commands to run in interactive sessions can go here
end


function fish_prompt
    echo -n (basename $PWD) (fish_git_prompt) "><((°> "
end

zoxide init fish | source
thefuck --alias | source


# Function to create a new Python virtual environment
function mkvenv
    python3 -m venv $argv[1]
    source $argv[1]/bin/activate
end

# Function to quickly search and install a package using apt
function aptinstall
    sudo apt search $argv[1]; and sudo apt install $argv[1]
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

#alias cd z
alias ls lsd
alias ll "lsd -l"
alias cat batcat
abbr -a zz "z -"
abbr -a . pwd
abbr -a .. "z .."
abbr -a ... "z ./../../../"
alias vi nvim
alias update "sudo apt-get update & sudo apt-get upgrade"
alias install "sudo apt-get install"
