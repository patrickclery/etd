module App
  class Base
    attr_accessor :consumer_key, :consumer_secret, :auth_token, :sandbox, :note_store_url

    def update_notebook(notebook_name:)
      App::UpdateNotebookTag(notebook_name: notebook_name)
    end

    def client
      @client ||= EvernoteOAuth::Client.new(consumer_key:    consumer_key,
                                            consumer_secret: consumer_secret,
                                            token:           auth_token,
                                            sandbox:         sandbox)
    end

    def user_store
      @user_store ||= client.user_store
    end

    def note_store
      @note_store ||= client.note_store(token:          auth_token,
                                        note_store_url: note_store_url)
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

    def note_count(notebook_name:)
      filter = Evernote::EDAM::NoteStore::NoteFilter.new
      counts = note_store.findNoteCounts(auth_token, filter, false)
      notebooks.inject(0) do |total_count, notebook|
        total_count + (counts.notebookCounts[notebook.guid] || 0)
      end
    end

    def note_count(tag_name:)
      filter = Evernote::EDAM::NoteStore::NoteFilter.new
      counts = note_store.findNoteCounts(auth_token, filter, false)
      notebooks.inject(0) do |total_count, notebook|
        total_count + (counts.notebookCounts[notebook.guid] || 0)
      end
    end
  end
end
