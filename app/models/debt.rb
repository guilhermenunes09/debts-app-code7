class Debt
  include Mongoid::Document
  field :_id, type: String
  field :client, type: Integer
  field :reason, type: String
  field :when, type: Date
  field :amount, type: Float

  validates :client, presence: true, numericality: { only_integer: true }
  validates :amount, presence: true, numericality: { only_float: true, greater_than: 0 }
  validates :when, presence: true
  
  
end
