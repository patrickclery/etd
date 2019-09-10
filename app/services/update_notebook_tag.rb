module App
  class UpdateNotebookTag

    class << self
      def call(notebook_name:)
        "\##{notebook_name.gsub(' ','_')}".downcase
      end
    end
  end
end
