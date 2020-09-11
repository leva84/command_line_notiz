# frozen_string_literal: true

class CommandLine
  attr_accessor :command

  def initialize(command)
    @command = command
  end

  def result
    IO.popen(@command.to_s) { |answer| answer.read.chomp }
  end
end
