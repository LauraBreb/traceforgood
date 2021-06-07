class RemoveCompanyDepartementFromUser < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :company_department, :string
  end
end
