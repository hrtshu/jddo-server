module Mutations
  class CreateNote < BaseMutation
    field :note, Types::NoteType, null: true
    field :result, Boolean, null: true

    argument :note, Types::NoteInputType, required: true

    def resolve(**args)
      # TODO args[:note].idが存在する場合にエラーを吐く？
      note = Note.create(subject: args[:note].subject, body: args[:note].body)
      {
        note: note,
        result: note.errors.blank? # TODO その他エラーも適切にハンドル
      }
    end
  end
end
