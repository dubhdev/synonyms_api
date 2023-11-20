class CreateSynonyms < ActiveRecord::Migration[7.1]
  def change
    create_table :synonyms, id: :uuid do |t|
      t.string :word, null: false
      t.string :synonym, null: false
      t.integer :status, default: 0
      t.datetime :discarded_at, index: true

      # t.index %i[word synonym], unique: true

      t.timestamps
    end
  end
end
