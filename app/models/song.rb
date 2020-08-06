class Song < ApplicationRecord
    validates :title, presence: true 
    validates :title, uniqueness: { scope: [:artist_name, :release_year] }
    validates :released, inclusion: { in: %w(true false) }
    with_options if: :released? do |r|
    r.validates :release_year, presence: true
    r.validates :release_year, numericality: { less_than_or_equal_to: Date.today.year }
    end 
    validates :artist_name, presence: true 

    def released? 
        released
    end 
end