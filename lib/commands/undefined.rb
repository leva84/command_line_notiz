# frozen_string_literal: true

require 'commands/command'

class Undefined < Command
  def call
    puts 'such command is not registered'
  end
end
