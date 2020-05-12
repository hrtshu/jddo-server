module Mutations
  class UpdateNote < BaseMutation
    field :note, Types::NoteType, null: true
    field :result, Boolean, null: true

    argument :note, Types::NoteInputType, required: true

    def resolve(**args)
      if args[:note].id.nil?
        raise GraphQL::ExecutionError, "更新するノートのidが与えられていません2"
      end
      id = args[:note].id

      begin
        note = Note.find(id)
      rescue
        raise GraphQL::ExecutionError, "更新しようとしたid=#{id}のノートは存在しません"
      end

      mutation_arg = args[:note].to_kwargs
      mutation_arg.delete(:id)
      
      if mutation_arg.empty? || note.update(mutation_arg)
        { note: note }
      else
        { errors: note.errors.full_messages }
      end
    end
  end
end
