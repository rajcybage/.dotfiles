echo "Installing Gem's bundler"
if ! gem install bundler
then
    echo "Gem Bundler install failed"
    exit 2
fi

echo "Install 'Gemfile' Bundle"
if ! bundle install
then
    echo "Installtion of Gemfile Bundle failed"
    exit 3
fi

echo "Creating WAR file via Warble"
if ! warble
then
    echo "Warble failed"
    exit 6
fi
#
########################################################################
