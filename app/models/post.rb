class Post < ApplicationRecord
  include AlgoliaSearch

  belongs_to :user
  has_many :post_tags
  has_many :tags, through: :post_tags

  algoliasearch do
    attribute :id, :user_id, :title, :description, :created_at, :updated_at
    attribute :author do
      user.name
    end
    attribute :tags do
      tags.map(&:id)
    end
  end
end
