class Skill < ActiveRecord::Base
  has_many :vacancies, through: :skill_vacancies
  has_many :skill_vacancies
  has_many :users, through: :skill_users
  has_many :skill_users

  validates :name, uniqueness: true

  accepts_nested_attributes_for :skill_vacancies
  accepts_nested_attributes_for :skill_users

end
