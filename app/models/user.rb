class User < ActiveRecord::Base

  has_many :skills, through: :skill_users
  has_many :skill_users

  validates :name, presence: true,
                     format: { with: /\A([А-Яа-я]+)\s([А-Яа-я]+)\s([А-Яа-я]+)\Z/ }
  validates :contact, presence: true, format: { with: (/\d+|\A[^@\s]+@([^@.\s]+\.)+[^@.\s]+\z/) }

  accepts_nested_attributes_for :skills, allow_destroy: true

  scope :searching, -> { where(status: true) }

  scope :match_skills, ->(skill_ids) { joins(:skills).where(skills: { id: skill_ids }).group(:id) }
  scope :with_suitable_skills, ->(skill_ids) { match_skills(skill_ids).having('COUNT("users.id")=?', skill_ids.count) }
  scope :with_not_fully_suitable_skills, ->(skill_ids) { match_skills(skill_ids).having('COUNT("users.id")<?', skill_ids.count) }

end
