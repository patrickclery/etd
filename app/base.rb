module App
  class Base
    attr_reader :evernote
    attr_accessor :consumer_key, :consumer_secret, :token, :sandbox

    def initialize(**options)
      @evernote = App::GetEvernoteClient.call(**options)
      self
    end

    def update_notebook(notebook_name:)
      App::UpdateNotebookTag(notebook_name: notebook_name)
    end
  end
end
