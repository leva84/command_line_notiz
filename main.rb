# frozen_string_literal: true

require_relative 'lib/command'
require_relative 'lib/about'
require_relative 'lib/help'
require_relative 'lib/command_registry'
require_relative 'lib/app'

puts App.new.loop_work
