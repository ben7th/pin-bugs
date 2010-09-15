class CreateAllTables < ActiveRecord::Migration
  def self.up
    create_table "bugs", :force => true do |t|
      t.string   "kind"
      t.string   "content"
      t.integer  "user_id"
      t.string   "user_ip"
      t.string   "attachment_file_name"
      t.string   "attachment_content_type"
      t.integer  "attachment_file_size"
      t.datetime "attachment_updated_at"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.boolean  "handled",                 :default => false
      t.boolean  "closed",                  :default => false
      t.string   "user_agent"
    end
    
    create_table "comments", :force => true do |t|
      t.text     "content"
      t.integer  "creator_id"
      t.integer  "markable_id"
      t.string   "markable_type"
      t.integer  "reply_to"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    create_table "entries", :force => true do |t|
      t.integer  "user_id"
      t.integer  "resource_id"
      t.string   "resource_type"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.datetime "deleted_at"
      t.integer  "host_id"
      t.string   "host_type"
      t.string   "from"
      t.boolean  "forbidden"
    end

    add_index "entries", ["resource_id", "resource_type"], :name => "index_resource_entries_on_resource_id_and_resource_type"
    add_index "entries", ["user_id"], :name => "index_resource_entries_on_user_id"

    create_table "favorites", :force => true do |t|
      t.integer  "favorable_id"
      t.string   "favorable_type"
      t.integer  "user_id"
      t.integer  "num"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    create_table "file_entries", :force => true do |t|
      t.string   "title"
      t.string   "content_file_name"
      t.string   "content_content_type"
      t.integer  "content_file_size"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.text     "subject"
      t.string   "detail"
    end
  end
end
