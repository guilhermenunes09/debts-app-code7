class Debt
  include Mongoid::Document
  field :client, type: Hash
  field :reason, type: String
  field :when, type: Date
  field :amount, type: Float

  # validates :amount, presence: true, numericality: { only_float: true, greater_than: 0 }
  # validates :when, presence: true
  
end
