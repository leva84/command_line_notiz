# frozen_string_literal: true

class About < Command
  attr_accessor :registry

  def initialize(registry)
    @registry = registry
  end

  def description
    'описание программы и ее окружения'
  end

  def call
    current_path = File.dirname(__FILE__)
    path = current_path[0..current_path.size - 4]
    system('cat ' + path + '/README.md') { |answer| answer.readlines }
  end
end
