class ShapeSerializer < ActiveModel::Serializer
  attributes :id, :label, :kind, :properties
end
