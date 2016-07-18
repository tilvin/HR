class Vacancy < ActiveRecord::Base

  has_many :skills, through: :skill_vacancies
  has_many :skill_vacancies

  accepts_nested_attributes_for :skills, allow_destroy: true

  validates :name, presence: true
  validate :date_present, :on => :create

  scope :with_actual_date, -> { where("date_until >= ?", Date.current) }
  scope :with_suitable_skills, ->(skill_ids) { joins(:skills).where(skills: { id: skill_ids }).group(:id).having('COUNT("users.id")=?', skill_ids.count) }

  def date_present
    errors.add(:date_until, 'cant be older then today') unless date_until.present? && date_until >= Date.current
  end
end
