class Department
  include Mongoid::Document
  field :name, type: String
  has_many :sems
end
