#! /bin/sh
# build.sh
########################################################################

########################################################################
# BUILD WAR PACKAGE FROM RUBY SCRIPTS
#
# This shell script builds a war package that can be installed in a
# JBoss instance.
#
########################################################################

########################################################################
# RUNNING VARIOUS RUBY INSTALLERS
#
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

echo "Creating 'build_mbe_prilfe'"
BUILD_KEY="build_mbe_profile"
if ! rake build_mbe_profile
then
    echo "Installtion of build_mbe_profile failed"
    exit 4
fi

echo "Running Rake spec"
if ! rake ci:setup:rspec spec
then
    echo "Rake spec failed"
    exit 5
fi

echo "Creating WAR file via Warble"
if ! warble
then
    echo "Warble failed"
    exit 6
fi
#
########################################################################
