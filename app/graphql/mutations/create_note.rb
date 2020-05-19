module Mutations
  class CreateNote < BaseMutation
    field :note, Types::NoteType, null: true
    field :errors, Boolean, null: true

    argument :note, Types::NoteInputType, required: true

    def resolve(**args)
      # TODO args[:note].idが存在する場合にエラーを吐く？
      if args[:note].subject.nil?
        raise GraphQL::ExecutionError, "作成するノートのsubjectが与えられていません"
      end
      if args[:note].body.nil?
        raise GraphQL::ExecutionError, "作成するノートのbodyが与えられていません"
      end

      note = Note.new
      note.subject = args[:note].subject
      note.body = args[:note].body
      
      if note.save
        { note: note }
      else
        { errors: note.errors.full_messages }
      end
    end
  end
end
