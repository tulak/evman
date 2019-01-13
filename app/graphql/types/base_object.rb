class Types::BaseObject < GraphQL::Schema::Object
  include Authorization::ControllerHelpers

  def self.authorized?(object, context)
    super && Authorization.dictator.authorized?(object, :read)
  end

  def current_user
    context[:current_user]
  end

  def current_team
    context[:current_team]
  end
end