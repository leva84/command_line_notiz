# frozen_string_literal: true

require_relative 'lib/command'

arg1 = ARGV[0]
arg2 = ARGV[1]
arg3 = ARGV[2]
command = nil

if !arg2.nil? && !arg3.nil? && arg1 == 'register_command'
  Command.register_command(arg2, arg3)
else
  while command != 'exit'
    p '=================================================='
    p ' - Введите команду'
    p " - введите 'help' для просмотра доступных команд"
    p " - 'exit' для выхода"
    puts
    p '=================================================='
    puts

    print '>'
    command = STDIN.gets.chomp!

    Command.start_command(command)
    puts
  end
end
