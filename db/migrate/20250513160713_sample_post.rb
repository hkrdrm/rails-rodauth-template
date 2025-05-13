# frozen_string_literal: true

Sequel.migration do
  change do
    create_table :sample_posts do
      primary_key :id
      String :title
      String :body
    end
  end
end
