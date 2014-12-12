include_recipe 'homebrew'

homebrew_tap 'homebrew/dupes'
homebrew_tap 'homebrew/versions'
homebrew_tap 'homebrew/homebrew-php'
homebrew_tap 'homebrew/dupes'
homebrew_tap 'caskroom/cask'
homebrew_tap 'homebrew/binary'
homebrew_tap 'gnuhub/gnuhub'

script "install_PHP_CodeSniffer" do
  interpreter "zsh"
  code <<-EOH
  pear install PHP_CodeSniffer
  brew unlink php54
  brew link php54
  EOH
end

script "install_PHP_CodeSniffer" do
  interpreter "zsh"
  cwd "/tmp"
  code <<-EOH
  if [ ! -f /usr/local/bin/phpab ];then
  	wget http://download.sf.net/gnuhub/phpab-1.16.1.phar
  	mv phpab-1.16.1.phar /usr/local/bin/phpab
  	chmod +x  /usr/local/bin/phpab
  fi
  EOH
end
