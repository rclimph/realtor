class CreateMasterContracts < ActiveRecord::Migration
  def change
    create_table :master_contracts do |t|
      t.string :contract_label
      t.text :body

      t.timestamps
    end
  end
end
