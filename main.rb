require_relative 'lib/methods'

p " - Введите команду либо введите 'help' для просмотра доступных команд"
p " - 'exit' для выхода"
p " - Для добавления команды введите 'add'"

print ' > '
command = STDIN.gets.chomp!

if command == 'help'
  print_commands.each_with_index { |com, ind| p "#{ind + 1}  #{com.chomp}" }
elsif command == 'add'
  p ' - Введите команду, которую неоюходимо добавить в программу'
  p ' - Длинна команды должна быть более 1-го символа'
  p " - Либо 'Enter' для выхода"
  print ' > '
  str = STDIN.gets
  p recording_commands(str)
elsif command == 'exit'
  abort
else
  p result(command)
end
