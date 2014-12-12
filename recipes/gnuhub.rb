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

# 安装 gem
gems = [
  "bundler",
  "rest-client",
  "json",
  "xml-simple",
  "byebug",
  "pry",
  "pry-doc",
  "jenkins",
  # for kaipan api
  "ruby-hmac",
   #nanoc
  "nanoc",
  "adsf",
  "kramdown",
  "nokogiri",
  #mediawiki api
  "mediawiki-gateway",
  "rugged",
  "patron",
  "elasticsearch",
  # mediawiki-gateway: For better Unicode support, install the `unicode' or `activesupport' gem
  "unicode",
  "activesupport",
  "selenium-webdriver",
  "rickshaw",
  "cucumber",
  "aruba"
]

gems.each do |gem_name| 
  gem_package gem_name do
    gem_binary(Dir.home + "/.rbenv/shims/gem")
    action :install 
  end
end

script "install_python_packages" do
  interpreter "zsh"
  cwd "/tmp"
  code <<-EOH
  if [ ! -f /usr/local/bin/phpab ];then
  	pip install Pygments
  fi
  EOH
end
