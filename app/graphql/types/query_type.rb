module Types
  class QueryType < Types::BaseObject
    field :note, NoteType, null: false do
      argument :id, ID, required: true
    end
    def note(id:)
      Note.find(id)
    end

    field :notes, [NoteType], null: false
    def notes
      Note.all
    end
  end
end
