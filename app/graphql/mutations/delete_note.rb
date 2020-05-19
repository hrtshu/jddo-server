module Mutations
  class DeleteNote < BaseMutation
    field :errors, Boolean, null: true

    argument :id, ID, required: true

    def resolve(**args)
      begin
        note = Note.find(args[:id])
      rescue
        raise GraphQL::ExecutionError, "削除しようとしたid=#{args[:id]}のノートは存在しません"
      end

      if note.destroy
        {}
      else
        { errors: note.errors.full_messages }
      end
    end
  end
end