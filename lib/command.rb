# frozen_string_literal: true

class Command
  def initialize
    super
  end

  def self.hash_command
    hash_com = Hash.new

    ObjectSpace.each_object(Class).select do |klass|
      hash_com[klass.name_command] = klass if (klass < Command)
    end

    hash_com
  end

  def self.start_command(command)
    if hash_command.key?(command)
      hash_command[command].result_work
    elsif command == 'exit'
      p 'good by'
    else
      p 'there is no such command'
    end
  end

  def self.template_class_command(name_command, name_class_command)
    <<~END

      class #{name_class_command} < Command
        def initialize
          super
        end

        def self.name_command
          "#{name_command}"
        end

        def self.description
          # command work description
        end

        def self.result_work
          # command work result
        end
      end
    END
  end

  def self.register_command(name_command, name_class_command)
    system("echo '# frozen_string_literal: true' > lib/#{name_class_command.downcase}.rb")
    system("echo '#{template_class_command(name_command, name_class_command).chomp}' >> lib/#{name_class_command.downcase}.rb")
    system("echo \"require_relative '#{name_class_command.downcase}'\" >> lib/command.rb")
  end
end

require_relative 'about'
require_relative 'help'
require_relative 'employeelistcommand'
