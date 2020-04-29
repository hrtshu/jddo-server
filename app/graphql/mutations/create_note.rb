module Mutations
  class CreateNote < BaseMutation
    field :note, Types::NoteType, null: true
    field :result, Boolean, null: true

    argument :subject, String, required: true
    argument :body, String, required: true

    def resolve(**args)
      note = Note.create(subject: args[:subject], body: args[:body])
      {
        note: note,
        result: note.errors.blank?
      }
    end
  end
end
