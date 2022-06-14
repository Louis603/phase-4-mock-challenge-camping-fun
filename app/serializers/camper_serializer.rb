class CamperSerializer < ActiveModel::Serializer
  attributes :id, :name, :age, :created_at, :updated_at

  # has_many :signups
  has_many :activities

  # def activities_id
  #     object.activities
  # end
end
