module Mutations
  class CreateNote < BaseMutation
    field :note, Types::NoteType, null: true
    field :result, Boolean, null: true

    argument :note, Types::NoteInputType, required: true

    def resolve(**args)
      note = Note.create(subject: args[:note].subject, body: args[:note].body)
      {
        note: note,
        result: note.errors.blank?
      }
    end
  end
end
