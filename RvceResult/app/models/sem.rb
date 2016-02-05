class Sem
  include Mongoid::Document
   include Mongoid::Paperclip


  
  field :sname, type: String
  field :year, type: String
  has_mongoid_attached_file :result1
  do_not_validate_attachment_file_type :result1

  belongs_to :department
end
