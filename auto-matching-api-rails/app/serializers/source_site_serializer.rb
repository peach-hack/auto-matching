class SourceSiteSerializer < ActiveModel::Serializer
  attributes :id, :name, :url, :login_user, :login_password
end
