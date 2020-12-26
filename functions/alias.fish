alias watchdir "watch -d exa -magF"
alias .. "cd ../"
alias ... "cd ../../"
alias datef "date +'%d.%m.%y'"
alias python "python3"
alias pip "pip3"
alias rm "rm -i"
alias cp "cp -i"
alias mv "mv -i"
alias dc "docker-compose"
alias vi "nvim"
alias vim "nvim"
alias ls "exa -magF --color=auto --color-scale"
alias ll "ls -l --git"
alias tree "exa -T"

# Check for system (MACOS specific stuff)
if uname -s == "Darwin"
	alias locate_update "sudo /usr/libexec/locate.updatedb"

	function runbrewstuff -d "Update and Upgrade Brew Plugins"
		command echo "Update/Upgrade Brew Formulars..."
    ;and brew update and;
		;and brew upgrade --greedy
		;and rm -rf (brew --cache)
		;and brew cleanup
    ;and brew doctor
		;and echo "Done ;)"
  end

  function bc -d "Install brew caskroom"
    command brew "$1" "$2" --cask
  end
end

function ns -d "Start new default shell"
  command exec "$SHELL" -l
end

function npmls -d "List all globally installed npm packages"
  command npm list -g --depth=0;
end

function sc -d "List all available scripts for package.json and composer.json"
	if  test -e "$PWD/package.json"
	  command jq .scripts "package.json"
	else
	  command jq .scripts "composer.json"
  end
end

function fun -d "Go to directory $HOME/fun"
  command cd "$HOME/fun"
end

function builds -d "Go to directory $HOME/builds"
  command cd "$HOME/builds"
end

function gocmd -d "Go Language Helper"
  switch "$cmd"
    case -bench
      go test -v --bench . --benchmem -race
    case -c -clean
      go clean -x -r -cache -modcache
    case -mod
      go mod init "github.com/lukasjoc/$1"
    case "" -h
      echo "Usage: gocmd <option>"
      echo "Options:"
      echo "  -c or -clean    Clean cache and modcache"
      echo "  -b or -bench    Test and benchmark go code"
      echo "  -mod            Create mod init files"
      echo "  -h              Print this help message"
  end
end

function man --wraps man -d "Format and display manual pages"
  env \
		LESS_TERMCAP_mb="(printf '\e[1;31m')" \
		LESS_TERMCAP_md="(printf '\e[1;31m')" \
		LESS_TERMCAP_me="(printf '\e[0m')" \
		LESS_TERMCAP_se="(printf '\e[0m')" \
		LESS_TERMCAP_so="(printf '\e[1;44;33m')" \
		LESS_TERMCAP_ue="(printf '\e[0m')" \
		LESS_TERMCAP_us="(printf '\e[1;32m')"
  	command man $argv
end

