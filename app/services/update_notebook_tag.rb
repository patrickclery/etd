module App
  class UpdateNotebookTag

    class << self
      # @param String Notebook name
      # @param String Tag name (defaults to slug of Notebook Name)
      def call(notebook_name:, tag_name: nil)
        "\##{notebook_name.gsub(' ', '_')}".downcase
      end
    end
  end
end
