class Result
  include Mongoid::Document
  field :usn, type: String
  field :department, type: String
  field :branch, type: String
  field :sem, type: String
  field :year, type: String
end
