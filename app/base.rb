module App
  class Base
    attr_accessor :consumer_key, :consumer_secret, :token, :sandbox

    def update_notebook(notebook_name:)
      App::UpdateNotebookTag(notebook_name: notebook_name)
    end

    def client
      @client ||= App::GetEvernoteClient.call(consumer_key:    consumer_key,
                                              consumer_secret: consumer_secret,
                                              token:           token,
                                              sandbox:         sandbox)
    end

    def user_store
      @user_store ||= client.user_store
    end

    def note_store
      @note_store ||= client.note_store
    end

    def en_user
      user_store.getUser(auth_token)
    end

    def notebooks
      @notebooks ||= note_store.listNotebooks(auth_token)
    end

    def total_note_count
      filter = Evernote::EDAM::NoteStore::NoteFilter.new
      counts = note_store.findNoteCounts(auth_token, filter, false)
      notebooks.inject(0) do |total_count, notebook|
        total_count + (counts.notebookCounts[notebook.guid] || 0)
      end
    end
  end
end
