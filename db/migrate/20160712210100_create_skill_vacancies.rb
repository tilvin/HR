class CreateSkillVacancies < ActiveRecord::Migration
  def change
    create_table :skill_vacancies do |t|
      t.integer :skill_id
      t.integer :vacancy_id

      t.timestamps null: false
    end
  end
end
