Sequel.migration do
  change do
    create_table(:accounts) do
      primary_key :id, :type=>:Bignum
      column :email, "citext", :null=>false
      column :status, "integer", :default=>1, :null=>false
      column :password_hash, "text"
    end
    
    create_table(:sample_posts) do
      primary_key :id
      column :title, "text"
      column :body, "text"
    end
    
    create_table(:schema_migrations) do
      column :filename, "text", :null=>false
      
      primary_key [:filename]
    end
    
    create_table(:account_login_change_keys) do
      foreign_key :id, :accounts, :type=>"bigint", :null=>false, :key=>[:id]
      column :key, "text", :null=>false
      column :login, "text", :null=>false
      column :deadline, "timestamp without time zone", :null=>false
      
      primary_key [:id]
    end
    
    create_table(:account_password_reset_keys) do
      foreign_key :id, :accounts, :type=>"bigint", :null=>false, :key=>[:id]
      column :key, "text", :null=>false
      column :deadline, "timestamp without time zone", :null=>false
      column :email_last_sent, "timestamp without time zone", :default=>Sequel::CURRENT_TIMESTAMP, :null=>false
      
      primary_key [:id]
    end
    
    create_table(:account_remember_keys) do
      foreign_key :id, :accounts, :type=>"bigint", :null=>false, :key=>[:id]
      column :key, "text", :null=>false
      column :deadline, "timestamp without time zone", :null=>false
      
      primary_key [:id]
    end
    
    create_table(:account_verification_keys) do
      foreign_key :id, :accounts, :type=>"bigint", :null=>false, :key=>[:id]
      column :key, "text", :null=>false
      column :requested_at, "timestamp without time zone", :default=>Sequel::CURRENT_TIMESTAMP, :null=>false
      column :email_last_sent, "timestamp without time zone", :default=>Sequel::CURRENT_TIMESTAMP, :null=>false
      
      primary_key [:id]
    end
  end
end
              Sequel.migration do
                change do
                  self << "SET search_path TO \"$user\", public"
                  self << "INSERT INTO \"schema_migrations\" (\"filename\") VALUES ('20250513160713_sample_post.rb')"
self << "INSERT INTO \"schema_migrations\" (\"filename\") VALUES ('20250513161713_create_rodauth.rb')"
                end
              end
