Sequel.migration do
  change do
    create_table(:sample_posts) do
      primary_key :id
      column :title, "text"
      column :body, "text"
    end
    
    create_table(:schema_migrations) do
      column :filename, "text", :null=>false
      
      primary_key [:filename]
    end
  end
end
Sequel.migration do
  change do
    self << "SET search_path TO \"$user\", public"
    self << "INSERT INTO \"schema_migrations\" (\"filename\") VALUES ('20250513160713_sample_post.rb')"
  end
end
