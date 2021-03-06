# frozen_string_literal: true

Types::FlagConditionType = GraphQL::ObjectType.define do
  name 'FlagCondition'
  field :flags_enabled, types.Boolean
  field :min_weight, types.Int
  field :max_poster_rep, types.Int
  field :min_reason_count, types.Int
  field :user, Types::UserType do
    complexity ->(_ctx, _args, child_complexity) do
      (BASE * 25) + (child_complexity > 1 ? child_complexity : 1)
    end
  end
  field :sites, types[Types::SiteType] do
    complexity ->(_ctx, _args, child_complexity) do
      (BASE * 25) + (child_complexity > 1 ? child_complexity : 1)
    end
  end

  field :created_at, Types::DateTimeType
  field :updated_at, Types::DateTimeType
  field :id, types.ID
end
