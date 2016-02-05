class Subject
  include Mongoid::Document
  field :sem, type: String
  field :branch, type: String
  field :scode, type: String
  field :sname, type: String
end
