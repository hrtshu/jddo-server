module Mutations
  class UpdateNote < BaseMutation
    field :note, Types::NoteType, null: true
    field :result, Boolean, null: true

    argument :note, Types::NoteInputType, required: true

    def resolve(**args)
      note = Note.find(args[:note].id)

      mutation_arg = args[:note].to_kwargs
      mutation_arg.delete(:id)
      note.update(mutation_arg)

      {
        note: note,
        result: note.errors.blank? # TODO その他エラーも適切にハンドル
      }
    end
  end
end
