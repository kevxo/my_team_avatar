class Search < ApplicationRecord
  validates :request, presence: true
  validates :action, presence: true

  validates_uniqueness_of :request, scope: %i[action params]
end
