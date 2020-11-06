# frozen_string_literal: true

require 'commands/base'

module Commands
  class Undefined < Base
    def call
      puts 'such command is not registered'
    end
  end
end
