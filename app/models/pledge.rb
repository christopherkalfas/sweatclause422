class Pledge < ApplicationRecord
    belongs_to :challenge
    belongs_to :charity
    belongs_to :group
    belongs_to :user
end
