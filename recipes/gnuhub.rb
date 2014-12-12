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