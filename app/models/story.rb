class Story < ApplicationRecord
  validates :summary, presence: true
  validates :fix_version, presence: true
end
