#!/usr/bin/env rackup
# encoding: utf-8

# This file can be used to start Padrino,
# just execute it from the command line.

require File.expand_path("../config/boot.rb", __FILE__)

  module OmniAuth
    module Strategies
      #tell omniauth to load our strategy
      autoload :Forcedotcom, 'forcedotcom'
    end
  end


run Padrino.application


