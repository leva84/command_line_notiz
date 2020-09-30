class App
  attr_accessor :command

  def initialize
    @command = nil
  end

  def print_instruction
    <<~END
      ==================================================
      - Введите команду
      - введите 'help' для просмотра доступных команд
      - 'exit' для выхода
      ==================================================
    END
  end

  def print_result
    <<~END
      ==================================================
      #{print '>>'}
      #{@command = gets.chomp!}
      #{Command.new.start_command(@command)}
      ==================================================
    END
  end

  def loop_work
    while @command != 'exit'
      puts print_instruction
      puts print_result
    end
  end
end
