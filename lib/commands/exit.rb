# frozen_string_literal: true

module Commands
  class Exit < Base
    def description
      'выход из программы'
    end

    def call
      abort
    end
  end
end
