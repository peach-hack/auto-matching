class SourceSiteSerializer < ApplicationSerializer
  attributes :id, :title, :post_at, :area, :category
  link :profile
end
