class SkillVacancy < ActiveRecord::Base
  belongs_to :vacancy
  belongs_to :skill
end
