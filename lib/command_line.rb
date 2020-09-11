class CommandLine
  attr_accessor :command

  def initialize(command)
    @command = command
  end

  def result
    IO.popen("#{@command}") { |answer| answer.read.chomp }
  end
end