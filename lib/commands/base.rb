# frozen_string_literal: true

module Commands
  class Base
    attr_reader :registry

    def initialize(registry)
      @registry = registry
    end
  end
end
