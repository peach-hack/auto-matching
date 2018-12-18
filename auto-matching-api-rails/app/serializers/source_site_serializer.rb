class SourceSiteSerializer
  include FastJsonapi::ObjectSerializer

  attributes :id, :name, :url, :login_user, :login_password
end
